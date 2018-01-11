package com.springmvc.util.loginValidation;

import com.springmvc.user.bean.CookieBean;
import com.springmvc.user.service.CookieService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * 登录校验工具类
 */
public class LoginValidator {

    private static final String COOKIE_NAME = "MALL_SESSIONID";
    private static final String SESSION_USERNAME = "USERNAME";
    private static final String SESSION_MOBILENO = "MOBILENO";
    private static final String SESSION_PASSWORD = "PASSWORD";

    private LoginValidator(){}

    /**
     *通过验证返回true，否则返回false
     * @param request
     * @return
     */
    public static boolean loginCheck(HttpServletRequest request){

        //session验证
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        String password = (String) session.getAttribute(SESSION_PASSWORD);

        if(username != null && mobileNo != null && password != null){
            return true;
        }

        //cookie验证
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
            String sessionId = rs_cookie.getValue();
            CookieBean ckb = new CookieBean();
            ckb.setSessionId(sessionId);

            CookieService cookieService = new CookieService();
            CookieBean cookieBean = cookieService.query(ckb);
            if(cookieBean != null){
                Date deadTime = cookieBean.getDeadTime();
                Date nowTime = new Date();
                if(nowTime.getTime() - deadTime.getTime() < 0){
                    return true;
                }
            }
        }

        return false;
    }


}
