package com.springmvc.goods.controller;

import com.springmvc.goods.bean.CartRecord;
import com.springmvc.goods.bean.Goods;
import com.springmvc.goods.bean.ShoppingCart;
import com.springmvc.goods.bean.Stock;
import com.springmvc.goods.service.GoodsService;
import com.springmvc.goods.service.ShoppingCartService;
import com.springmvc.user.bean.User;
import com.springmvc.user.service.UserService;
import com.springmvc.util.page.Page;
import com.springmvc.util.page.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.math.BigDecimal;
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

    private static final String SESSION_USERNAME = "USERNAME";
    private static final String SESSION_MOBILENO = "MOBILENO";
    private static final String SESSION_PASSWORD = "PASSWORD";

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

    @RequestMapping(value = "/shoppingCart")
    public String shoppingCart(Integer pageNum, HttpServletRequest request, Model model){

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);

        if((username == null || "".equals(username)) && (mobileNo == null || "".equals(mobileNo))){
            return "";
        }

        model.addAttribute("username",username);
        model.addAttribute("mobileNo",mobileNo);

        //查询用户
        User u = new User();
        u.setUsername(username)
                .setMobileNo(mobileNo);
        User user = userService.query(u);
        if(user == null){
            return "";
        }

        //设置分页
        int currentPage = 1;
        if(pageNum != null){
            currentPage = pageNum;
        }
        Page page = PageUtil.createPage(null,8,currentPage,8);

        //查询购物车
        ShoppingCart shoppingCart = new ShoppingCart();
        shoppingCart.setUser(user)
                .setIsBuy(0)
                .setPage(page);
        List<ShoppingCart> list = shoppingCartService.queryByPage(shoppingCart); //分页查询

        List<ShoppingCart> list1 = shoppingCartService.getAll(shoppingCart);   //全部查询

        //计算总价钱
        BigDecimal totalPrice = new BigDecimal("0");
        if(list1 != null){
            for(ShoppingCart sc : list1){
                BigDecimal price = sc.getGoods().getGoodsPrice();
                BigDecimal amount = new BigDecimal(sc.getAmount().intValue());
                totalPrice = totalPrice.add(price.multiply(amount));
            }
        }

        int pageAmount = 1;
        if(list1.size() % 8 == 0){
            pageAmount = list1.size() / 8;
        }else{
            pageAmount = list1.size() / 8 + 1;
        }


        model.addAttribute("list",list);
        model.addAttribute("totalPrice",totalPrice.toString());
        model.addAttribute("pageAmount",pageAmount);
        model.addAttribute("currentPage",currentPage);

        return "shoppingCart";
    }

    @RequestMapping(value = "/delCartItems")
    @ResponseBody
    public Map delCartItems(HttpServletRequest request, @RequestParam(required = false, value = "itemList[]") List<String> itemList){

        HashMap<String,Object> map = new HashMap<>();

        if(itemList != null){
            for(String itemId : itemList){
                ShoppingCart shoppingCart = new ShoppingCart();
                shoppingCart.setIsBuy(0)
                        .setId(itemId);
                shoppingCartService.delete(shoppingCart);
            }
        }

        map.put("isDelete",true);
        map.put("url","pri/goods/shoppingCart");

        return map;
    }




}
