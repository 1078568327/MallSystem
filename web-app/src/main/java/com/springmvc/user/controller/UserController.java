package com.springmvc.user.controller;

import com.springmvc.user.bean.CookieBean;
import com.springmvc.user.bean.Login;
import com.springmvc.user.bean.Register;
import com.springmvc.user.bean.User;
import com.springmvc.user.service.CookieService;
import com.springmvc.user.service.UserService;
import com.springmvc.util.formatValidation.FormatValidator;
import com.springmvc.util.md5.MD5Util;
import com.springmvc.util.token.TokenUtil;
import com.springmvc.util.vertificationCode.ImageCodeGenerator;
import com.springmvc.util.vertificationCode.VCodeGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/pub/usr")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private CookieService cookieService;

    private static final String COOKIE_NAME = "MALL_SESSIONID";
    private static final int COOKIE_DAY = 7;
    private static final int VCODE_AMOUNT = 6;
    private static final String SESSION_USERNAME = "USERNAME";
    private static final String SESSION_MOBILENO = "MOBILENO";
    private static final String SESSION_PASSWORD = "PASSWORD";

    @RequestMapping(value = "/toRegister")
    public String toRegister(HttpServletRequest request, Model model){

        String token = TokenUtil.createToken(request);
        model.addAttribute("token",token);

        return "register";
    }

    @RequestMapping(value = "/register")
    @ResponseBody
    public Map register(@RequestBody @Valid Register register, BindingResult result, HttpServletRequest request){

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

        String registerToken = register.getToken();
        String registerMobileNo = register.getMobileNo();
        String registerImageCode = register.getImageCaptcha();
        String registerCaptcha = register.getCaptcha();
        String registerPassword = register.getPassword();

        //token验证
        if(!TokenUtil.checkToken(registerToken,request)){
            map.put("error_register","token参数错误，请刷新页面");
            return map;
        }

        //验证手机号码格式
        if(!FormatValidator.isChinaMobileNo(registerMobileNo)){
            map.put("error_mobileNo","手机号码格式不对");
            return map;
        }

        //验证码验证
        HttpSession session = request.getSession();
        String imageCode = (String)session.getAttribute("imageCode");

        if(!registerImageCode.equalsIgnoreCase(imageCode)){
            map.put("error_imageCode","图形验证码错误");
            return map;
        }

        String vCode = (String)session.getAttribute("vCode");
        if(!registerCaptcha.equalsIgnoreCase(vCode)){
            map.put("error_vCode","短信验证码错误");
            return map;
        }

        //注册
        User user = new User();
        user.setMobileNo(registerMobileNo);
        if(userService.query(user) != null){
            map.put("error_register","该手机号码已经注册");
            return map;
        }

        user.setPassword(registerPassword);
        userService.save(user);

        //设置参数
        map.put("isRegister",true);
        map.put("url","pub/usr/toLogin");

        return map;
    }

    @RequestMapping("/register/getImageCode")
    public String getImageCode(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 设置响应的类型格式为图片格式
        response.setContentType("image/jpeg");
        //禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        HttpSession session = request.getSession();

        ImageCodeGenerator imgCode = new ImageCodeGenerator(80,28,4,120);
        session.setAttribute("imageCode", imgCode.getCode());  //图形验证码存放到session中
        imgCode.write(response.getOutputStream());

        return null;
    }

    @RequestMapping("/register/getVCode")
    @ResponseBody
    public Map getVCode(String token, HttpServletRequest request){

        HashMap<String,Object> map = new HashMap<>();
        HttpSession session = request.getSession();

        //token验证
        if(!TokenUtil.checkToken(token,request)){
            map.put("error_register","token参数错误，请刷新页面");
            return map;
        }

        String vCode = VCodeGenerator.getVCode(VCODE_AMOUNT);
        session.setAttribute("vCode",vCode);
        map.put("vCode",vCode);

        //调用短信发送接口


        return map;
    }

    @RequestMapping(value = "/toLogin")
    public String toLogin(HttpServletRequest request, Model model){

        String token = TokenUtil.createToken(request);
        model.addAttribute("token",token);

        return "login";
    }

    @RequestMapping("/login")
    @ResponseBody
    public Map login(@RequestBody @Valid Login login, BindingResult result, HttpServletRequest request, HttpServletResponse response){

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

        String loginMobileNo = login.getMobileNo();
        String loginPassword = login.getPassword();
        Integer loginIsRemember = login.getIsRemember();
        String loginToken = login.getToken();

        //token验证
        if(!TokenUtil.checkToken(loginToken,request)){
            map.put("error_login","token参数错误，请刷新页面");
            return map;
        }

        //查询用户是否注册
        User user = new User();
        user.setMobileNo(loginMobileNo);
        User queryUser = userService.query(user);
        if(queryUser == null){
            map.put("error_login","该账户未注册，请去注册");
            return map;
        }

        //核对密码
        String password = MD5Util.encrypt(queryUser.getPassword(),login.getToken());
        if(! loginPassword.equals(password)){
            map.put("error_login","账号或密码错误！");
            return map;
        }

        //密码正确
        HttpSession session = request.getSession();
        session.setAttribute(SESSION_USERNAME,queryUser.getUsername());
        session.setAttribute(SESSION_MOBILENO,loginMobileNo);
        session.setAttribute(SESSION_PASSWORD,loginPassword);

        if(loginIsRemember == 1){
            //设置创建时间和失效时间
            Calendar calendar = Calendar.getInstance();  //创建时间
            Date createTime = new Date();
            calendar.setTime(createTime);
            calendar.add(Calendar.DATE,COOKIE_DAY);  //7天
            Date deadTime = calendar.getTime();

            //保存cookie到数据库
            CookieBean cookieBean = new CookieBean();
            cookieBean.setUser(queryUser)
                    .setSessionId(session.getId())
                    .setCreateTime(createTime)
                    .setDeadTime(deadTime);
            cookieService.save(cookieBean);

            //设置浏览器cookie
            Cookie cookie = new Cookie(COOKIE_NAME,session.getId());
            cookie.setPath(request.getContextPath());
            cookie.setMaxAge(60*60*24*COOKIE_DAY);   //7天
            response.addCookie(cookie);  //浏览器添加cookie
        }

        //设置参数
        map.put("isLogin",true);
        map.put("url","pub/index");

        return map;
    }

    @RequestMapping(value = "/exit")
    public String exit(HttpServletRequest request, HttpServletResponse response){

        //使session无效，下次getSession()是新的session
        request.getSession().invalidate();

        //删除浏览器cookie
        Cookie[] cookies = request.getCookies();
        Cookie rs_cookie = null;
        if(cookies != null){
            for(Cookie cookie : cookies){
                if(COOKIE_NAME.equals(cookie.getName())){
                    rs_cookie = cookie;
                    break;
                }
            }
        }

        if(rs_cookie != null){
            rs_cookie.setMaxAge(0);  //设置生存时间为0，即删除
            rs_cookie.setPath(request.getContextPath());  //注意这里要上cookie路径，tomcat从浏览器获得的cookie对象默认是没有路径值的
            response.addCookie(rs_cookie);  //添加cookie
        }

        return "redirect:/pub/usr/toLogin";
    }



}
