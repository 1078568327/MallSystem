package com.springmvc.util.loginValidation;

import com.springmvc.user.bean.CookieBean;
import com.springmvc.user.service.CookieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * 登录校验工具类
 */
@Component
public class LoginValidator {

    @Autowired
    private CookieService cks;

    private static CookieService cookieService;

    private static final String COOKIE_NAME = "MALL_SESSIONID";
    private static final String SESSION_USERNAME = "USERNAME";
    private static final String SESSION_MOBILENO = "MOBILENO";
    private static final String SESSION_PASSWORD = "PASSWORD";

    private LoginValidator(){}

    @PostConstruct      //@PostConstruct标明的方法将在servlet执行构造函数后调用，即在Spring实例化LoginValidator并完成依赖注入后执行
    public void init(){
        cookieService = cks;
    }

    /**
     *通过验证返回true，否则返回false
     * @param request
     * @return
     */
    public static boolean loginCheck(HttpServletRequest request){

        if(request != null){
            //session验证
            HttpSession session = request.getSession();
            String username = null;
            String mobileNo = null;
            String password = null;

            if(session != null){
                username = (String) session.getAttribute(SESSION_USERNAME);
                mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
                password = (String) session.getAttribute(SESSION_PASSWORD);
            }

            if(username != null && ! "".equals(username) || mobileNo != null && ! "".equals(mobileNo)
                    || password != null && ! "".equals(password)){
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

                CookieBean cookieBean = cookieService.query(ckb);
                if(cookieBean != null){
                    Date deadTime = cookieBean.getDeadTime();
                    Date nowTime = new Date();
                    if(nowTime.getTime() - deadTime.getTime() < 0){
                        return true;
                    }
                }
            }
        }

        return false;
    }


}
