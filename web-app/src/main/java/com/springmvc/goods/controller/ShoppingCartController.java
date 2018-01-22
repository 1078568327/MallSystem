package com.springmvc.goods.controller;

import com.springmvc.goods.bean.CartRecord;
import com.springmvc.goods.bean.Goods;
import com.springmvc.goods.bean.ShoppingCart;
import com.springmvc.goods.bean.Stock;
import com.springmvc.goods.service.GoodsService;
import com.springmvc.goods.service.ShoppingCartService;
import com.springmvc.user.bean.User;
import com.springmvc.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.*;

@Controller
@RequestMapping(value = "pri/goods")
public class ShoppingCartController {

    @Autowired
    private ShoppingCartService shoppingCartService;
    @Autowired
    private UserService userService;
    @Autowired
    private GoodsService goodsService;

    @RequestMapping(value = "/addCart")
    @ResponseBody
    public Map addCart(@RequestBody @Valid CartRecord cartRecord, BindingResult result, HttpServletRequest request){

        HashMap<String,Object> map = new HashMap<>();

        if(result.hasErrors()){
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError : errors){
                map.put("error_msg",fieldError.getDefaultMessage());
            }
        }

        //参数不合格返回
        if(!map.isEmpty()){
            return map;
        }

        String mobileNo = cartRecord.getMobileNo();
        String goodsId = cartRecord.getGoodsId();
        int amount = cartRecord.getAmount();

        User user = new User();
        user.setMobileNo(mobileNo);
        User queryUser = userService.query(user);
        if(queryUser == null){
            map.put("error_msg","用户不存在，请重新登录");
            return map;
        }

        Goods goods = new Goods();
        goods.setId(goodsId);
        Goods queryGoods = goodsService.query(goods);
        if(queryGoods == null){
            map.put("error_msg","商品不存在，请购买其他商品");
            return map;
        }

        ShoppingCart shoppingCart = new ShoppingCart();
        shoppingCart.setUser(queryUser)
                .setGoods(queryGoods)
                .setAmount(amount)
                .setCreateTime(new Date())
                .setIsBuy(0);

        shoppingCartService.save(shoppingCart);

        ShoppingCart sc = new ShoppingCart();
        sc.setUser(queryUser)
                .setIsBuy(0);
        int total = shoppingCartService.getTotalNumber(sc);
        map.put("total",total);

        //添加成功参数
        map.put("isAdd",true);

        return map;

    }

    @RequestMapping(value = "/queryCart")
    @ResponseBody
    public Map queryCart(HttpServletRequest request, String mobileNo){

        HashMap<String,Object> map = new HashMap<>();

        User user = new User();
        user.setMobileNo(mobileNo);
        User queryUser = userService.query(user);
        if(queryUser == null){
            map.put("error_msg","用户不存在，请重新登录");
            return map;
        }

        ShoppingCart shoppingCart = new ShoppingCart();
        shoppingCart.setUser(queryUser)
                .setIsBuy(0);
        List<ShoppingCart> list = shoppingCartService.getAll(shoppingCart);

        //解决懒加载导致json转换失败问题
        List<ShoppingCart> cartList = new ArrayList<>();
        for(ShoppingCart sc : list){
            User u = sc.getUser();
            Goods g = sc.getGoods();
            ShoppingCart s = new ShoppingCart();
            s.setUser(u)
                    .setGoods(g)
                    .setAmount(sc.getAmount())
                    .setCreateTime(sc.getCreateTime())
                    .setIsBuy(sc.getIsBuy());
            cartList.add(s);
        }

        map.put("list",cartList);

        return map;
    }



}
