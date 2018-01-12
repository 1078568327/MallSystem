package com.springmvc.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class HomePageController {

    private static final String SESSION_USERNAME = "USERNAME";
    private static final String SESSION_MOBILENO = "MOBILENO";
    private static final String SESSION_PASSWORD = "PASSWORD";

    @RequestMapping(value = "/pub/index")
    public String index(HttpServletRequest request, Model model){

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);

        if(username != null && ! "".equals(username)){
            model.addAttribute("username",username);
        }

        if(mobileNo != null && ! "".equals(mobileNo)){
            model.addAttribute("mobileNo",mobileNo);
        }

        return "index";
    }

    @RequestMapping(value = "/pub/personal")
    public String personal(HttpServletRequest request, Model model){

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        boolean flag = false;   //标识用户是否登录

        if(username != null && ! "".equals(username) || mobileNo != null && ! "".equals(mobileNo)){
            flag = true;
        }

        if(flag){
            return "forward:/pri/usr/personalInfo";    //转发到个人中心的用户信息
        }

        return "personalFail";
    }


}
