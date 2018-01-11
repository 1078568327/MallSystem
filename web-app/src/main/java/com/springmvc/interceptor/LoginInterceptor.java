package com.springmvc.interceptor;

import com.springmvc.util.loginValidation.LoginValidator;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //登录校验
        if(request != null){
            if(LoginValidator.loginCheck(request)){
                return true;
            }

            //跳转到登录界面
            if(response != null){
//            request.getRequestDispatcher("/pub/usr/toLogin").forward(request,response);
                String url = request.getContextPath() + "/pub/usr/toLogin";
                response.sendRedirect(url);
            }
        }

        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
