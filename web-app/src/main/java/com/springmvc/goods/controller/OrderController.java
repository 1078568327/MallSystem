package com.springmvc.goods.controller;

import com.springmvc.goods.bean.ShoppingCart;
import com.springmvc.goods.service.OrderService;
import com.springmvc.goods.service.ShoppingCartService;
import com.springmvc.user.bean.ShippingAddress;
import com.springmvc.user.bean.User;
import com.springmvc.user.service.AddressService;
import com.springmvc.user.service.ShippingAddressService;
import com.springmvc.user.service.UserService;
import com.springmvc.util.token.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping(value = "pri/goods")
public class OrderController {

    @Autowired
    private ShoppingCartService shoppingCartService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private ShippingAddressService shippingAddressService;
    @Autowired
    private UserService userService;

    private static final String SESSION_USERNAME = "USERNAME";
    private static final String SESSION_MOBILENO = "MOBILENO";
    private static final String SESSION_PASSWORD = "PASSWORD";

    @RequestMapping(value = "/toOrder")
    public String toOrder(HttpServletRequest request, Model model){

        String token = TokenUtil.createToken(request);
        if(token != null && !"".equals(token)){
            model.addAttribute("token",token);
        }

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        model.addAttribute("username",username);
        model.addAttribute("mobileNo",mobileNo);

        //查询收货地址
        User u = new User();
        u.setMobileNo(mobileNo);
        User user = userService.query(u);

        if(user == null){
            return "";
        }

        ShippingAddress shipAddr = new ShippingAddress();
        shipAddr.setUser(user);
        List<ShippingAddress> shippingAddressList = shippingAddressService.getAll(shipAddr);
        model.addAttribute("shippingAddressList",shippingAddressList);

        //查询下单的商品
        ShoppingCart shoppingCart = new ShoppingCart();
        shoppingCart.setUser(user)
                .setIsBuy(1);
        List<ShoppingCart> shoppingCartList = shoppingCartService.getAll(shoppingCart);
        model.addAttribute("shoppingCartList",shoppingCartList);

        //计算总价钱
        BigDecimal totalPrice = new BigDecimal("0");
        if(shoppingCartList != null){
            for(ShoppingCart sc : shoppingCartList){
                BigDecimal price = sc.getGoods().getGoodsPrice();
                BigDecimal amount = new BigDecimal(sc.getAmount());
                totalPrice = totalPrice.add(price.multiply(amount));
            }
        }
        model.addAttribute("totalPrice",totalPrice.toString());


        return "order";
    }

}
