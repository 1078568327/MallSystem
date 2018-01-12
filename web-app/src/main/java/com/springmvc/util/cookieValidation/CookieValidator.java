package com.springmvc.util.cookieValidation;

import com.springmvc.user.bean.CookieBean;
import com.springmvc.user.service.CookieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Component
public class CookieValidator {

    @Autowired
    private CookieService cks;

    private static CookieService cookieService;

    private static final String COOKIE_NAME = "MALL_SESSIONID";
    private static final String SESSION_USERNAME = "USERNAME";
    private static final String SESSION_MOBILENO = "MOBILENO";
    private static final String SESSION_PASSWORD = "PASSWORD";

    private CookieValidator(){}

    @PostConstruct      //@PostConstruct标明的方法将在servlet执行构造函数后调用，即在Spring实例化CookieValidator并完成依赖注入后执行
    public void init(){
        cookieService = cks;
    }

    /**
     * 验证cookie，若有效则保存到session中，并返回true，否则返回false
     * @param request
     * @return
     */
    public static boolean checkCookie(HttpServletRequest request){

        if(request != null){
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
                        //保存用户信息到session
                        HttpSession session = request.getSession();
                        if(session != null){
                            session.setAttribute(SESSION_USERNAME,cookieBean.getUser().getUsername());
                            session.setAttribute(SESSION_MOBILENO,cookieBean.getUser().getMobileNo());
                        }

                        return true;
                    }
                }
            }
        }

        return false;
    }

}
