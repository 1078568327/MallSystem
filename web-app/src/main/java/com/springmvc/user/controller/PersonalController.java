package com.springmvc.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("pri/usr")
public class PersonalController {

    @RequestMapping(value = "/personalInfo")
    public String personalInfo(){

        return "personalInfo";
    }


}
