package com.springmvc.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/usr")
public class UserController {

    @RequestMapping(value = "/toRegister")
    public String toRegister(){

        return "register";
    }

    @RequestMapping(value = "/toLogin")
    public String toLogin(){

        return "login";
    }

}
