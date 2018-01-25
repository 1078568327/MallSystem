package com.springmvc.user.controller;

import com.springmvc.user.bean.*;
import com.springmvc.user.service.AddressService;
import com.springmvc.user.service.ShippingAddressService;
import com.springmvc.user.service.UserService;
import com.springmvc.util.md5.MD5Util;
import com.springmvc.util.token.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/pri/usr")
public class PersonalController {

    @Autowired
    private UserService userService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private ShippingAddressService shippingAddressService;

    private static final String SESSION_USERNAME = "USERNAME";
    private static final String SESSION_MOBILENO = "MOBILENO";
    private static final String SESSION_PASSWORD = "PASSWORD";

    @RequestMapping(value = "/personalInfo")
    public String personalInfo(HttpServletRequest request, Model model){

        //生成token
        String token = TokenUtil.createToken(request);
        if(token != null && ! "".equals(token)){
            model.addAttribute("token",token);
        }

        //用户信息
        HttpSession session = request.getSession();
        String sessUsername = null;
        String sessMobileNo = null;
        if(session != null){
            sessUsername = (String) session.getAttribute(SESSION_USERNAME);
            sessMobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        }

        //数据库get个人资料
        User user = new User();
        user.setUsername(sessUsername)
                .setMobileNo(sessMobileNo);
        User queryUser = userService.query(user);
        String birthday = null;
        if(queryUser.getBirthday() != null){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            birthday = sdf.format(queryUser.getBirthday());
        }
        if(queryUser != null){
            model.addAttribute("username",queryUser.getUsername());
            model.addAttribute("mobileNo", queryUser.getMobileNo());
            model.addAttribute("gender", queryUser.getGender());
            model.addAttribute("birthday", birthday);
            model.addAttribute("profilePicture",queryUser.getProfilePicture());
            model.addAttribute("email",queryUser.getEmail());
            model.addAttribute("memberExp",queryUser.getMemberExp());
        }

        return "personalInfo";
    }

    @RequestMapping(value = "/savePersonalInfo")
    @ResponseBody
    public Map savePersonalInfo(@RequestParam(value="profilePicture",required=false) MultipartFile profilePicture,
                                PersonalInfo personalInfo,
                                HttpServletRequest request) throws IOException, ParseException {

        HashMap<String,Object> map = new HashMap<>();

        String username = personalInfo.getUsername();
        String mobileNo = personalInfo.getMobileNo();
        String gender = personalInfo.getGender();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String btd = personalInfo.getBirthday();
        Date birthday = null;
        if(btd != null && ! "".equals(btd)){
            birthday = sdf.parse(personalInfo.getBirthday());
        }

        String email = personalInfo.getEmail();
        String token = personalInfo.getToken();

        //验证token
        if(! TokenUtil.checkToken(token,request)){
            map.put("error_token","token丢失，请刷新页面");
            return map;
        }

        //设置更新对象
        HttpSession session = request.getSession();
        String sessMobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        User user = new User();
        user.setMobileNo(sessMobileNo);

        User queryUser = userService.query(user);
        if(queryUser == null){
            map.put("error_login","服务端错误，请重新登录");
            return map;
        }
        queryUser.setUsername(username)
                .setGender(gender)
                .setEmail(email)
                .setBirthday(birthday);

        //头像
        if (profilePicture != null) {
            if(!profilePicture.isEmpty()){
                // 文件保存路径
                String filePath = request.getSession().getServletContext().getRealPath("") + "images/user/";
                String fileName = (String) session.getAttribute(SESSION_MOBILENO) + "."
                        + profilePicture.getOriginalFilename().split("\\.")[1];
                filePath += fileName;
                // 转存文件
                profilePicture.transferTo(new File(filePath));

                queryUser.setProfilePicture(fileName);
            }
        }

        //更新个人信息
        userService.save(queryUser);
        map.put("msg","成功修改");

        return map;
    }

    @RequestMapping(value = "/toChangePsw")
    public String toChangePsw(HttpServletRequest request, Model model){

        String token = TokenUtil.createToken(request);
        if(token != null && ! "".equals(token)){
            model.addAttribute("token",token);
        }

        HttpSession session = request.getSession();
        if(session != null){
            String username = (String) session.getAttribute(SESSION_USERNAME);
            String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
            model.addAttribute("username",username);
            model.addAttribute("mobileNo",mobileNo);
        }

        return "changePsw";
    }

    @RequestMapping(value = "/changePsw")
    @ResponseBody
    public Map changePws(@RequestBody @Valid ChangePassword changePassword, BindingResult result, HttpServletRequest request){

        Map<String,Object> map = new HashMap<>();
        if(result.hasErrors()){
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError : errors){
                map.put("error_"+fieldError.getField(),fieldError.getDefaultMessage());
            }
        }

        //参数不合格返回
        if(!map.isEmpty()){
            return map;
        }

        String inputOldPassword = changePassword.getOldPassword();
        String inputNewPassword = changePassword.getNewPassword();
        String inputPasswordAgain = changePassword.getPasswordAgain();
        String inputToken = changePassword.getToken();

        //token验证
        if(! TokenUtil.checkToken(inputToken,request)){
            map.put("error_token","token错误，请刷新页面");
            return map;
        }

        //两次密码确认
        if(! inputNewPassword.equals(inputPasswordAgain)){
            map.put("error_passwordAgain","token错误，请刷新页面");
            return map;
        }

        //修改密码
        User user = new User();
        user.setUsername(changePassword.getUsername())
                .setMobileNo(changePassword.getMobileNo());
        User queryUser = userService.query(user);
        if(queryUser == null){
            map.put("error_msg","用户错误，请重新操作");
        }

        String password = MD5Util.encrypt(queryUser.getPassword(),inputToken);
        if(! inputOldPassword.equals(password)){
            map.put("error_oldPassword","密码错误");
            return map;
        }
        queryUser.setPassword(inputNewPassword);
        userService.save(queryUser);

        //设置参数
        map.put("isChange",true);
        map.put("url","pri/usr/toChangePsw");

        return map;
    }

    @RequestMapping(value = "/updateAddr")
    @ResponseBody
    public Map updateAddr(@RequestBody UpdateAddress updateAddress, HttpServletRequest request){

        Map<String,Object> map = new HashMap<>();
        String token = updateAddress.getToken();
        //token验证
        if(!TokenUtil.checkToken(token,request)){
            map.put("error_msg","token错误");
            return map;
        }

        String addressId = updateAddress.getAddressId();
        String city = updateAddress.getCity();
        String district = updateAddress.getDistrict();
        String detail = updateAddress.getDetail();
        String postcode = updateAddress.getPostcode();
        String consignee = updateAddress.getConsignee();
        String mobileNo = updateAddress.getMobileNo();

        if(addressId == null || "".equals(addressId)){
            map.put("error_msg","地址id不能为空");
            return map;
        }

        Address addr = new Address();
        addr.setId(addressId);
        Address address = addressService.query(addr);
        if(address == null){
            map.put("error_msg","地址id错误，不存在该地址");
        }
        address.setCity(city)
                .setDistrict(district)
                .setDetail(detail)
                .setPostcode(postcode)
                .setConsignee(consignee)
                .setMobileNo(mobileNo);
        addressService.save(address);

        map.put("isUpdate",true);

        return map;
    }

    @RequestMapping(value = "/addAddr")
    @ResponseBody
    public Map addAddr(@RequestBody AddAddress addAddress, HttpServletRequest request){

        Map<String,Object> map = new HashMap<>();
        String token = addAddress.getToken();
        //token验证
        if(!TokenUtil.checkToken(token,request)){
            map.put("error_msg","token错误");
            return map;
        }

        String city = addAddress.getCity();
        String district = addAddress.getDistrict();
        String detail = addAddress.getDetail();
        String postcode = addAddress.getPostcode();
        String consignee = addAddress.getConsignee();
        String mobileNo = addAddress.getMobileNo();

        //查询用户
        HttpSession session = request.getSession();
        String sessMobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        if(sessMobileNo == null || "".equals(sessMobileNo)){
            map.put("error_msg","无法获取用户名，请重新登录");
            return map;
        }

        User u = new User();
        u.setMobileNo(sessMobileNo);
        User user = userService.query(u);
        if(user == null){
            map.put("error_msg","不存在此用户，请重新登录");
            return map;
        }

        //保存地址表
        Address address = new Address();
        address.setUserId(user.getId())
                .setProvince("广东省")
                .setCity(city)
                .setDistrict(district)
                .setDetail(detail)
                .setPostcode(postcode)
                .setConsignee(consignee)
                .setMobileNo(mobileNo)
                .setCreateTime(new Date())
                .setId(UUID.randomUUID().toString());
        addressService.save(address);

        //保存到地址管理表
        ShippingAddress shippingAddress = new ShippingAddress();
        shippingAddress.setUser(user)
                .setAddress(address);
        shippingAddressService.save(shippingAddress);
        map.put("addressId",address.getId());

        map.put("isAdd",true);

        return map;
    }


}
