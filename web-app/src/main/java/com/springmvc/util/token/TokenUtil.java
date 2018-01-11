package com.springmvc.util.token;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.UUID;

/**
 * token工具类
 */
public class TokenUtil {

    private static final String COOKIE_SESSION = "MALL_TOKEN";

    /**
     * 生成token并存入session
     * @return token
     */
    public static String createToken(HttpServletRequest request){

        String token = UUID.randomUUID().toString().replaceAll("-","");
        if(request != null){
            HttpSession session = request.getSession();
            session.setAttribute(COOKIE_SESSION,token);
        }

        return token;
    }

    /**
     * 校验token值是否正确，正确返回true，错误返回false
     * @param token
     * @param request
     * @return
     */
    public static boolean checkToken(String token, HttpServletRequest request){

        if(token != null && request != null){
            HttpSession session = request.getSession();
            String sesToken = (String)session.getAttribute(COOKIE_SESSION);

            if(sesToken != null){
                if(sesToken.equals(token)){
                    return true;
                }
            }
        }

        return false;
    }


}
