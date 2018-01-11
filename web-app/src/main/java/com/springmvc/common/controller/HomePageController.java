package com.springmvc.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@Controller
public class HomePageController {

    @RequestMapping(value = "/pub/index")
    public String index(String usn, String mbNo, HttpServletRequest request, Model model){

        if(usn != null && ! "".equals(usn)){
            model.addAttribute("username",usn);
        }

        if(mbNo != null && ! "".equals(mbNo)){
            model.addAttribute("mobileNo",mbNo);
        }

        Cookie[] cookies = request.getCookies();

        return "index";
    }

}
