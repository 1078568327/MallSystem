package com.springmvc.backstage.controller;

import com.springmvc.goods.bean.Goods;
import com.springmvc.goods.bean.Order;
import com.springmvc.goods.service.GoodsService;
import com.springmvc.goods.service.OrderService;
import com.springmvc.util.page.Page;
import com.springmvc.util.page.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/back")
public class BackHomeController {

    private static final String SESSION_ACCOUNT = "ADMIN_ACCOUNT";
    private static final String SESSION_PASSWORD = "ADMIN_PASSWORD";

    @Autowired
    private GoodsService goodsService;
    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/index")
    public String index(Integer pageNum, HttpServletRequest request, Model model) {

        int currentPage = 1;
        if(pageNum != null){
            currentPage = pageNum;
        }
        Page page = PageUtil.createPage(null,12,currentPage,12);
        Goods goods = new Goods();
        goods.setPage(page);
        goods.setIsSale(1);

        List<Goods> goodsList = goodsService.queryByPage(goods);
        model.addAttribute("goodsList",goodsList);
        model.addAttribute("currentPage", currentPage);

        return "back_index";
    }

    @RequestMapping(value = "/toAddGoods")
    public String toaddGoods(HttpServletRequest request, Model model) {

        return "back_toAddGoods";
    }

    @RequestMapping(value = "/bin")
    public String bin(Integer pageNum, HttpServletRequest request, Model model) {

        int currentPage = 1;
        if(pageNum != null){
            currentPage = pageNum;
        }
        Page page = PageUtil.createPage(null,12,currentPage,12);
        Goods goods = new Goods();
        goods.setPage(page);
        goods.setIsSale(0);

        List<Goods> goodsList = goodsService.queryByPage(goods);
        model.addAttribute("goodsList",goodsList);
        model.addAttribute("currentPage", currentPage);

        return "back_bin";
    }

    @RequestMapping(value = "/goodsDetail")
    public String goodsDetail(String id, HttpServletRequest request, Model model) {

        if (id == null || "".equals(id)) {
            return null;
        }

        Goods g = new Goods();
        g.setId(id);
        Goods goods = goodsService.query(g);
        if (goods == null) {
            return null;
        }
        model.addAttribute("goods", goods);

        return "back_goodsDetail";
    }

    @RequestMapping(value = "/downGoods")
    public String offGoods(String id, HttpServletRequest request, Model model) {

        if(id == null || "".equals(id)){
            return null;
        }

        Goods g = new Goods();
        g.setId(id);
        Goods goods = goodsService.query(g);
        if (goods == null) {
            return null;
        }
        goods.setIsSale(0);
        goodsService.save(goods);

        return "forward:index";
    }

    @RequestMapping(value = "/upGoods")
    public String upGoods(String id, HttpServletRequest request, Model model) {

        if(id == null || "".equals(id)){
            return null;
        }

        Goods g = new Goods();
        g.setId(id);
        Goods goods = goodsService.query(g);
        if (goods == null) {
            return null;
        }
        goods.setIsSale(1);
        goodsService.save(goods);

        return "forward:bin";
    }

    @RequestMapping(value = "/deleteGoods")
    public String deleteGoods(String id, HttpServletRequest request, Model model) {

        if(id == null || "".equals(id)){
            return null;
        }

        Goods g = new Goods();
        g.setId(id);
        goodsService.delete(g);

        return "forward:bin";
    }

    @RequestMapping(value = "/orderList")
    public String orderList(Integer pageNum, HttpServletRequest request, Model model) {

        int currentPage = 1;
        if(pageNum != null){
            currentPage = pageNum;
        }
        Page page = PageUtil.createPage(null,12,currentPage,12);
        Order order = new Order();
        order.setPage(page);
        order.setOrderStatus(1);

        List<Order> orderList = orderService.queryByPage(order);
        model.addAttribute("orderList",orderList);
        model.addAttribute("currentPage", currentPage);

        return "back_orderList";
    }

    @RequestMapping(value = "/orderDetail")
    public String orderDetail(String id, HttpServletRequest request, Model model) {

        if(id == null || "".equals(id)){
            return null;
        }

        Order o = new Order();
        o.setId(id);
        Order order = orderService.query(o);
        if (order == null) {
            return null;
        }

        model.addAttribute("order", order);

        return "back_orderDetail";
    }

    @RequestMapping(value = "/cancelOrder")
    public String cancelDetail(String id, HttpServletRequest request, Model model) {

        if(id == null || "".equals(id)){
            return null;
        }

        Order o = new Order();
        o.setId(id);
        Order order = orderService.query(o);
        if (order == null) {
            return null;
        }
        order.setOrderStatus(4);
        orderService.save(order);

        return "forward:orderList";
    }


}
