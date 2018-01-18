package com.springmvc.goods.controller;

import com.springmvc.goods.bean.Goods;
import com.springmvc.goods.service.GoodsService;
import com.springmvc.util.page.Page;
import com.springmvc.util.page.PageUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/pub/goods")
public class GoodsController {

    private static final String SESSION_USERNAME = "USERNAME";
    private static final String SESSION_MOBILENO = "MOBILENO";
    private static final String SESSION_PASSWORD = "PASSWORD";

    @Autowired
    private GoodsService goodsService;

    @RequestMapping(value = "/prodDetail")
    public String prodDetail(String pId, HttpServletRequest request, Model model){

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);

        if(username != null && ! "".equals(username)){
            model.addAttribute("username",username);
        }

        if(mobileNo != null && ! "".equals(mobileNo)){
            model.addAttribute("mobileNo",mobileNo);
        }

        if(pId != null && ! "".equals(pId)){
            Goods goods = new Goods();
            goods.setIsSale(1)
                    .setId(pId);
            Goods result = goodsService.query(goods);
            if(result != null){
                model.addAttribute("goods",result);
                String[] detailImages = StringUtils.split(result.getDetailImages(),"|");
                model.addAttribute("detailImages",detailImages);
            }
        }

        return "productDetail";
    }

    @RequestMapping(value = "/allProd/page")
    public String page(Integer pageNum, Integer type, HttpServletRequest request, Model model){

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
        if(pageNum != null){
            currentPage = pageNum;
        }
        Page page = PageUtil.createPage(null,12,currentPage,12);
        Goods goods = new Goods();
        goods.setPage(page);
        goods.setIsSale(1);

        if(type != null){
            if(type == 0){
                goods.setGoodsType("进口");
            }else if(type == 1){
                goods.setGoodsType("国产");
            }else if(type == 2){
                goods.setGoodsType("蔬菜");
            }
        }

        List<Goods> goodsList = goodsService.queryByPage(goods);
        model.addAttribute("goodsList",goodsList);
        model.addAttribute("type",type);

        return "allProduct";
    }

    @RequestMapping(value = "/allProd/classifyProd")
    public String classifyProd(Integer type, HttpServletRequest request, Model model){

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);

        if(username != null && ! "".equals(username)){
            model.addAttribute("username",username);
        }

        if(mobileNo != null && ! "".equals(mobileNo)){
            model.addAttribute("mobileNo",mobileNo);
        }

        Goods goods = new Goods();
        goods.setIsSale(1);
        Page page = PageUtil.createPage(null,12,1,12);
        goods.setPage(page);
        if(type != null){

            if(type == 0){
                goods.setGoodsType("进口");
            }else if(type == 1){
                goods.setGoodsType("国产");
            }else if(type == 2){
                goods.setGoodsType("蔬菜");
            }
        }

        List<Goods> goodsList = goodsService.queryByPage(goods);
        model.addAttribute("goodsList",goodsList);
        model.addAttribute("type",type);

        return "allProduct";
    }

    @RequestMapping(value = "/hotProd/page")
    public String hotPage(Integer pageNum, Integer type, HttpServletRequest request, Model model){

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
        if(pageNum != null){
            currentPage = pageNum;
        }
        Page page = PageUtil.createPage(null,12,currentPage,12);
        Goods goods = new Goods();
        goods.setPage(page);
        goods.setIsSale(1);

        if(type != null){
            if(type == 0){
                goods.setGoodsType("进口");
            }else if(type == 1){
                goods.setGoodsType("国产");
            }else if(type == 2){
                goods.setGoodsType("蔬菜");
            }
        }

        List<Goods> goodsList = goodsService.hotProdByPage(goods);
        model.addAttribute("goodsList",goodsList);
        model.addAttribute("type",type);

        return "hotProduct";
    }

    @RequestMapping(value = "/hotProd/classifyProd")
    public String classifyHotProd(Integer type, HttpServletRequest request, Model model){

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);

        if(username != null && ! "".equals(username)){
            model.addAttribute("username",username);
        }

        if(mobileNo != null && ! "".equals(mobileNo)){
            model.addAttribute("mobileNo",mobileNo);
        }

        Goods goods = new Goods();
        goods.setIsSale(1);
        Page page = PageUtil.createPage(null,12,1,12);
        goods.setPage(page);
        if(type != null){

            if(type == 0){
                goods.setGoodsType("进口");
            }else if(type == 1){
                goods.setGoodsType("国产");
            }else if(type == 2){
                goods.setGoodsType("蔬菜");
            }
        }

        List<Goods> goodsList = goodsService.hotProdByPage(goods);
        model.addAttribute("goodsList",goodsList);
        model.addAttribute("type",type);

        return "hotProduct";
    }

}
