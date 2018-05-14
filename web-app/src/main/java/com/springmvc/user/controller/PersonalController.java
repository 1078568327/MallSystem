package com.springmvc.user.controller;

import com.springmvc.goods.bean.Order;
import com.springmvc.goods.bean.ShoppingCart;
import com.springmvc.goods.service.OrderService;
import com.springmvc.goods.service.ShoppingCartService;
import com.springmvc.user.bean.*;
import com.springmvc.user.service.AddressService;
import com.springmvc.user.service.ShippingAddressService;
import com.springmvc.user.service.UserService;
import com.springmvc.util.md5.MD5Util;
import com.springmvc.util.page.Page;
import com.springmvc.util.page.PageUtil;
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
import java.math.BigDecimal;
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
    @Autowired
    private OrderService orderService;
    @Autowired
    private ShoppingCartService shoppingCartService;

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

    @RequestMapping(value = "/myOrder")
    public String myOrder(HttpServletRequest request, Model model){

        String token = TokenUtil.createToken(request);
        if(token != null && !"".equals(token)){
            model.addAttribute("token",token);
        }

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        model.addAttribute("username",username);
        model.addAttribute("mobileNo",mobileNo);

        //查询待收货的订单
        User u = new User();
        u.setMobileNo(mobileNo)
                .setUsername(username);
        User user = userService.query(u);
        if(user == null){
            return null;
        }
        model.addAttribute("profilePicture",user.getProfilePicture());

        Order order = new Order();
        order.setUser(user)
                .setOrderStatus(1);
        List<Order> orderList = orderService.getAll(order);
        if(orderList != null){
            model.addAttribute("orderList",orderList);
            model.addAttribute("waitForGoods",orderList.size());
        }

        //查询其他订单状态的数量
        order.setOrderStatus(2);
        int waitForComment = orderService.getAmountOfOrderStatus(order);
        order.setOrderStatus(0);
        int waitForPay = orderService.getAmountOfOrderStatus(order);
        order.setOrderStatus(4);
        int cancelOrder = orderService.getAmountOfOrderStatus(order);

        model.addAttribute("waitForComment",waitForComment);
        model.addAttribute("waitForPay",waitForPay);
        model.addAttribute("cancelOrder",cancelOrder);


        return "orderManagement";
    }

    @RequestMapping(value = "/confirmGoods")
    public String confirmGoods(String orderId, String token, HttpServletRequest request, Model model){

        //token验证
        if(!TokenUtil.checkToken(token,request)){
            return null;
        }

        if(orderId == null || "".equals(orderId)){
            return null;
        }

        //确认订单
        Order o = new Order();
        o.setId(orderId);
        Order order = orderService.query(o);
        if(order == null){
            return null;
        }
        order.setOrderStatus(2);
        orderService.save(order);

        return "redirect:/pri/usr/myOrder";
    }

    @RequestMapping(value = "/cancelOrder")
    public String cancelOrder(String orderId, String token, HttpServletRequest request, Model model){

        //token验证
        if(!TokenUtil.checkToken(token,request)){
            return null;
        }

        if(orderId == null || "".equals(orderId)){
            return null;
        }

        //取消订单
        Order o = new Order();
        o.setId(orderId);
        Order order = orderService.query(o);
        if(order == null){
            return null;
        }
        order.setOrderStatus(4);
        orderService.save(order);

        return "redirect:/pri/usr/myOrder";
    }

    @RequestMapping(value = "/noCommentOrder")
    public String noCommentOrder(HttpServletRequest request, Model model){

        String token = TokenUtil.createToken(request);
        if(token != null && !"".equals(token)){
            model.addAttribute("token",token);
        }

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        model.addAttribute("username",username);
        model.addAttribute("mobileNo",mobileNo);

        //查询待收货的订单
        User u = new User();
        u.setMobileNo(mobileNo)
                .setUsername(username);
        User user = userService.query(u);
        if(user == null){
            return null;
        }
        model.addAttribute("profilePicture",user.getProfilePicture());

        Order order = new Order();
        order.setUser(user)
                .setOrderStatus(2);
        List<Order> orderList = orderService.getAll(order);
        if(orderList != null){
            model.addAttribute("orderList",orderList);
            model.addAttribute("waitForComment",orderList.size());
        }

        //查询其他订单状态的数量
        order.setOrderStatus(1);
        int waitForGoods = orderService.getAmountOfOrderStatus(order);
        order.setOrderStatus(0);
        int waitForPay = orderService.getAmountOfOrderStatus(order);
        order.setOrderStatus(4);
        int cancelOrder = orderService.getAmountOfOrderStatus(order);

        model.addAttribute("waitForGoods",waitForGoods);
        model.addAttribute("waitForPay",waitForPay);
        model.addAttribute("cancelOrder",cancelOrder);

        return "myOrder_noComment";
    }

    @RequestMapping(value = "/noPayOrder")
    public String noPayOrder(HttpServletRequest request, Model model){

        String token = TokenUtil.createToken(request);
        if(token != null && !"".equals(token)){
            model.addAttribute("token",token);
        }

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        model.addAttribute("username",username);
        model.addAttribute("mobileNo",mobileNo);

        //查询待收货的订单
        User u = new User();
        u.setMobileNo(mobileNo)
                .setUsername(username);
        User user = userService.query(u);
        if(user == null){
            return null;
        }
        model.addAttribute("profilePicture",user.getProfilePicture());

        Order order = new Order();
        order.setUser(user)
                .setOrderStatus(0);
        List<Order> orderList = orderService.getAll(order);
        if(orderList != null){
            model.addAttribute("orderList",orderList);
            model.addAttribute("waitForPay",orderList.size());
        }

        //查询其他订单状态的数量
        order.setOrderStatus(2);
        int waitForComment = orderService.getAmountOfOrderStatus(order);
        order.setOrderStatus(1);
        int waitForGoods = orderService.getAmountOfOrderStatus(order);
        order.setOrderStatus(4);
        int cancelOrder = orderService.getAmountOfOrderStatus(order);

        model.addAttribute("waitForComment",waitForComment);
        model.addAttribute("waitForGoods",waitForGoods);
        model.addAttribute("cancelOrder",cancelOrder);

        return "myOrder_noPay";
    }

    @RequestMapping(value = "/toCancelOrder")
    public String toCancelOrder(HttpServletRequest request, Model model){

        String token = TokenUtil.createToken(request);
        if(token != null && !"".equals(token)){
            model.addAttribute("token",token);
        }

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        model.addAttribute("username",username);
        model.addAttribute("mobileNo",mobileNo);

        //查询待收货的订单
        User u = new User();
        u.setMobileNo(mobileNo)
                .setUsername(username);
        User user = userService.query(u);
        if(user == null){
            return null;
        }
        model.addAttribute("profilePicture",user.getProfilePicture());

        Order order = new Order();
        order.setUser(user)
                .setOrderStatus(4);
        List<Order> orderList = orderService.getAll(order);
        if(orderList != null){
            model.addAttribute("orderList",orderList);
            model.addAttribute("cancelOrder",orderList.size());
        }

        //查询其他订单状态的数量
        order.setOrderStatus(2);
        int waitForComment = orderService.getAmountOfOrderStatus(order);
        order.setOrderStatus(1);
        int waitForGoods = orderService.getAmountOfOrderStatus(order);
        order.setOrderStatus(0);
        int waitForPay = orderService.getAmountOfOrderStatus(order);

        model.addAttribute("waitForComment",waitForComment);
        model.addAttribute("waitForGoods",waitForGoods);
        model.addAttribute("waitForPay",waitForPay);

        return "myOrder_cancelOrder";
    }

    @RequestMapping(value = "/deleteCancelOrder")
    public String deleteCancelOrder(String orderId, String token, HttpServletRequest request, Model model){

        //token验证
        if(!TokenUtil.checkToken(token,request)){
            return null;
        }

        if(orderId == null || "".equals(orderId)){
            return null;
        }

        //取消订单
        Order o = new Order();
        o.setId(orderId);
        orderService.delete(o);

        return "redirect:/pri/usr/toCancelOrder";
    }

    @RequestMapping(value = "/shippingAddress")
    public String shippingAddress(HttpServletRequest request, Model model){

        String token = TokenUtil.createToken(request);
        if(token != null && !"".equals(token)){
            model.addAttribute("token",token);
        }

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        model.addAttribute("username",username);
        model.addAttribute("mobileNo",mobileNo);

        //查询收货地址
        User u = new User();
        u.setMobileNo(mobileNo)
                .setUsername(username);
        User user = userService.query(u);
        if(user == null){
            return null;
        }

        ShippingAddress shippingAddress = new ShippingAddress();
        shippingAddress.setUser(user);
        List<ShippingAddress> shippingAddressList = shippingAddressService.getAll(shippingAddress);
        if(shippingAddressList == null){
            return null;
        }
        model.addAttribute("shippingAddressList",shippingAddressList);
        model.addAttribute("addressAmount",shippingAddressList.size());

        return "shippingAddress";
    }

    @RequestMapping(value = "/delAddr")
    @ResponseBody
    public Map delAddr(String addressId, String token, HttpServletRequest request){

        Map<String,Object> map = new HashMap<>();

        if(!TokenUtil.checkToken(token,request)){
            map.put("error_msg","token错误，刷新页面重试");
            return map;
        }

        if(addressId == null || "".equals(addressId)){
            map.put("error_msg","收货地址id错误");
            return map;
        }

        //删除收货地址表的记录
        Address address = new Address();
        address.setId(addressId);

        ShippingAddress shipAddr = new ShippingAddress();
        shipAddr.setAddress(address);
        ShippingAddress shippingAddress = shippingAddressService.query(shipAddr);
        if(shippingAddress != null){
            shippingAddressService.delete(shippingAddress);
        }

        //删除地址表的记录
        addressService.delete(address);

        map.put("isDelete",true);

        return map;
    }

    @RequestMapping(value = "/setDefaultAddr")
    @ResponseBody
    public Map setDefaultAddr(String addressId, String token, HttpServletRequest request){

        Map<String,Object> map = new HashMap<>();

        if(!TokenUtil.checkToken(token,request)){
            map.put("error_msg","token错误，刷新页面重试");
            return map;
        }

        if(addressId == null || "".equals(addressId)){
            map.put("error_msg","收货地址id错误");
            return map;
        }

        //设置默认地址
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        User u = new User();
        u.setMobileNo(mobileNo)
                .setUsername(username);
        User user = userService.query(u);
        if(user == null){
            return null;
        }

        ShippingAddress shipAddr = new ShippingAddress();
        shipAddr.setUser(user);
        List<ShippingAddress> shippingAddressList = shippingAddressService.getAll(shipAddr);
        if(shippingAddressList == null){
            return null;
        }

        ShippingAddress preShippingAddress = shippingAddressList.get(0);  //修改原来的默认地址
        preShippingAddress.setIsDefault(0);
        shippingAddressService.save(preShippingAddress);

        Address address = new Address();  //设置新的默认地址
        address.setId(addressId);
        shipAddr.setAddress(address);
        ShippingAddress shippingAddress = shippingAddressService.query(shipAddr);
        if(shippingAddress == null){
            return null;
        }
        shippingAddress.setIsDefault(1);
        shippingAddressService.save(shippingAddress);

        //
        map.put("isSet",true);

        return map;
    }

    @RequestMapping(value = "/shoppingCart")
    public String shoppingCart(HttpServletRequest request, Model model){

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);

        model.addAttribute("username",username);
        model.addAttribute("mobileNo",mobileNo);

        //查询用户
        User u = new User();
        u.setUsername(username)
                .setMobileNo(mobileNo);
        User user = userService.query(u);
        if(user == null){
            return "";
        }

        //查询购物车
        ShoppingCart shoppingCart = new ShoppingCart();
        shoppingCart.setUser(user)
                .setIsBuy(0);

        List<ShoppingCart> list1 = shoppingCartService.getAll(shoppingCart);   //全部查询

        //计算总价钱
        BigDecimal totalPrice = new BigDecimal("0");
        if(list1 != null){
            for(ShoppingCart sc : list1){
                BigDecimal price = sc.getGoods().getGoodsPrice();
                BigDecimal amount = new BigDecimal(sc.getAmount().intValue());
                totalPrice = totalPrice.add(price.multiply(amount));
            }
        }

        model.addAttribute("list",list1);
        model.addAttribute("totalPrice",totalPrice.toString());

        return "personal_shoppingCart";
    }

    @RequestMapping(value = "/toBuyRecords")
    public String toBuyRecords(Integer pageNum, HttpServletRequest request, Model model){

        String token = TokenUtil.createToken(request);
        if(token != null && !"".equals(token)){
            model.addAttribute("token",token);
        }

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);

        model.addAttribute("username",username);
        model.addAttribute("mobileNo",mobileNo);

        //查询所有订单
        User u = new User();
        u.setMobileNo(mobileNo);
        User user = userService.query(u);
        if(user == null){
            return null;
        }

        int currentPage = 1;
        if(pageNum != null && pageNum > 1){
            currentPage = pageNum;
        }
        Page page = PageUtil.createPage(null,8,currentPage,8);
        Order order = new Order();
        order.setUser(user)
                .setPage(page);
        List<Order> orderList = orderService.queryByPage(order);
        model.addAttribute("orderList",orderList);
        model.addAttribute("currentPage",currentPage);

        List<Order> allOrderList = orderService.getAll(order);
        int pageAmount = 1;
        if(allOrderList != null){
            if(allOrderList.size() % 8 == 0){
                pageAmount = allOrderList.size() / 8;
            }else{
                pageAmount = allOrderList.size() / 8 + 1;
            }
            model.addAttribute("pageAmount",pageAmount);
        }


        return "personal_buyRecords";
    }

    @RequestMapping(value = "/toAllOrder")
    public String toAllOrder(HttpServletRequest request, Model model){

        String token = TokenUtil.createToken(request);
        if(token != null && !"".equals(token)){
            model.addAttribute("token",token);
        }

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        model.addAttribute("username",username);
        model.addAttribute("mobileNo",mobileNo);

        //查询待收货的订单
        User u = new User();
        u.setMobileNo(mobileNo)
                .setUsername(username);
        User user = userService.query(u);
        if(user == null){
            return null;
        }
        model.addAttribute("profilePicture",user.getProfilePicture());

        Order order = new Order();
        order.setUser(user);
        List<Order> orderList = orderService.getAll(order);
        if(orderList != null){
            model.addAttribute("orderList",orderList);
        }

        //查询其他订单状态的数量
        order.setOrderStatus(2);
        int waitForComment = orderService.getAmountOfOrderStatus(order);
        order.setOrderStatus(1);
        int waitForGoods = orderService.getAmountOfOrderStatus(order);
        order.setOrderStatus(0);
        int waitForPay = orderService.getAmountOfOrderStatus(order);
        order.setOrderStatus(4);
        int cancelOrder = orderService.getAmountOfOrderStatus(order);

        model.addAttribute("waitForComment",waitForComment);
        model.addAttribute("waitForGoods",waitForGoods);
        model.addAttribute("waitForPay",waitForPay);
        model.addAttribute("cancelOrder", cancelOrder);

        return "myOrder_allOrder";
    }


}
