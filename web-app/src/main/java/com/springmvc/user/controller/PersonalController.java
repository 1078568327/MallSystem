package com.springmvc.user.controller;

import com.springmvc.user.bean.User;
import com.springmvc.user.service.UserService;
import com.springmvc.util.token.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/pri/usr")
public class PersonalController {

    @Autowired
    private UserService userService;

    private static final String SESSION_USERNAME = "USERNAME";
    private static final String SESSION_MOBILENO = "MOBILENO";
    private static final String SESSION_PASSWORD = "PASSWORD";

    @RequestMapping(value = "/personalInfo")
    public String personalInfo(HttpServletRequest request, Model model){

        if(request != null){
            if(model != null){
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
                if(queryUser != null){
                    model.addAttribute("username",queryUser.getUsername());
                    model.addAttribute("mobileNo", queryUser.getMobileNo());
                    model.addAttribute("gender", queryUser.getGender());
                    model.addAttribute("birthday", queryUser.getBirthday());
                    model.addAttribute("profilePicture",queryUser.getProfilePicture());
                    model.addAttribute("email",queryUser.getEmail());
                    model.addAttribute("memberExp",queryUser.getMemberExp());
                }

            }
        }

        return "personalInfo";
    }

    @RequestMapping(value = "/savePersonalInfo")
    @ResponseBody
    public Map savePersonalInfo(@RequestParam(value="profilePicture",required=false) MultipartFile profilePicture,
                                HttpServletRequest request){

        HashMap<String,Object> map = new HashMap<>();




        return map;
    }


}
