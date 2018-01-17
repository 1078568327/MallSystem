package com.springmvc.common.controller;

import com.springmvc.goods.bean.Goods;
import com.springmvc.goods.service.GoodsService;
import com.springmvc.util.page.Page;
import com.springmvc.util.page.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class HomePageController {

    private static final String SESSION_USERNAME = "USERNAME";
    private static final String SESSION_MOBILENO = "MOBILENO";
    private static final String SESSION_PASSWORD = "PASSWORD";

    @Autowired
    private GoodsService goodsService;

    @RequestMapping(value = "/pub/index")
    public String index(HttpServletRequest request, Model model){

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);

        if(username != null && ! "".equals(username)){
            model.addAttribute("username",username);
        }

        if(mobileNo != null && ! "".equals(mobileNo)){
            model.addAttribute("mobileNo",mobileNo);
        }

        //设置商品显示
        Page page = PageUtil.createPage(null,6,1,6);
        Goods goods = new Goods();
        goods.setPage(page);
        List<Goods> goodsList = goodsService.queryByPage(goods);
        model.addAttribute("goodsList",goodsList);

        return "index";
    }

    @RequestMapping(value = "/pub/personal")
    public String personal(HttpServletRequest request, Model model){

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        boolean flag = false;   //标识用户是否登录

        if(username != null && ! "".equals(username) || mobileNo != null && ! "".equals(mobileNo)){
            flag = true;
        }

        if(flag){
            return "forward:/pri/usr/personalInfo";    //转发到个人中心的用户信息
        }

        return "personalFail";
    }

    @RequestMapping(value = "/pub/allProduct")
    public String allProduct(Integer pageNum, HttpServletRequest request, Model model){

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);

        if(username != null && ! "".equals(username)){
            model.addAttribute("username",username);
        }

        if(mobileNo != null && ! "".equals(mobileNo)){
            model.addAttribute("mobileNo",mobileNo);
        }

        //设置商品显示
        int currentPage = 1;
        if(pageNum != null && pageNum != 0){
            currentPage = pageNum;
        }
        Page page = PageUtil.createPage(null,12,currentPage,12);
        Goods goods = new Goods();
        goods.setPage(page);
        List<Goods> goodsList = goodsService.queryByPage(goods);
        model.addAttribute("goodsList",goodsList);

        return "allProduct";
    }


}
