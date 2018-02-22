package com.springmvc.backstage.controller;


import com.springmvc.backstage.bean.Admin;
import com.springmvc.backstage.service.AdminService;
import com.springmvc.user.service.CookieService;
import com.springmvc.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/back/usr")
public class BackUserController {

    @Autowired
    private UserService userService;
    @Autowired
    private CookieService cookieService;
    @Autowired
    private AdminService adminService;

    private static final String COOKIE_NAME = "BACK_MALL_SESSIONID";
    private static final String SESSION_ACCOUNT = "ADMIN_ACCOUNT";
    private static final String SESSION_PASSWORD = "ADMIN_PASSWORD";

    @RequestMapping(value = "/toIndex")
    public String toIndex(HttpServletRequest request, Model mode) {

        return "back_login";
    }

    @RequestMapping(value = "/login")
    @ResponseBody
    public Map login(String adminAccount, String password, HttpServletRequest request) {

        Map<String,Object> map = new HashMap<>();
        if(adminAccount == null || "".equals(adminAccount)){
            map.put("error_login","账户不能为空");
            return map;
        }
        if (password == null || "".equals(password)) {
            map.put("error_login", "密码不能为空");
            return map;
        }

        Admin paramAdmin = new Admin();
        paramAdmin.setAccount(adminAccount);
        Admin resultAdmin = adminService.query(paramAdmin);
        if (resultAdmin == null) {
            map.put("error_login", "不存在用户");
            return map;
        }

        String realAccount = resultAdmin.getAccount();
        String realPassword = resultAdmin.getPassword();
        if(!password.equals(realPassword)){
            map.put("error_login", "密码不正确");
            return map;
        }

        //密码正确
        HttpSession session = request.getSession();
        session.setAttribute(SESSION_ACCOUNT, realAccount);
        session.setAttribute(SESSION_PASSWORD, realPassword);

        map.put("isLogin", true);

        return map;
    }
}
