package com.springmvc.backstage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/back")
public class BackHomeController {

    @RequestMapping(value = "/index")
    public String index(HttpServletRequest request, Model model) {

        return "back_index";
    }
}
