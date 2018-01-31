package com.springmvc.goods.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.springmvc.alipay.config.AlipayConfig;
import com.springmvc.goods.bean.Goods;
import com.springmvc.goods.bean.Order;
import com.springmvc.goods.bean.ShoppingCart;
import com.springmvc.goods.service.OrderService;
import com.springmvc.goods.service.ShoppingCartService;
import com.springmvc.user.bean.Address;
import com.springmvc.user.bean.ShippingAddress;
import com.springmvc.user.bean.User;
import com.springmvc.user.service.AddressService;
import com.springmvc.user.service.ShippingAddressService;
import com.springmvc.user.service.UserService;
import com.springmvc.util.token.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;

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

    @RequestMapping(value = "/submitOrder")
    @ResponseBody
    public Map submitOrder(String addressId, String token, HttpServletRequest request){

        Map<String,Object> map = new HashMap<>();

        if(!TokenUtil.checkToken(token,request)){
            map.put("error_msg","token错误，刷新页面重试");
            return map;
        }

        if(addressId == null || "".equals(addressId)){
            map.put("error_msg","收货地址id错误");
            return map;
        }

        //查询收货地址,用户信息
        Address addr = new Address();
        addr.setId(addressId);
        ShippingAddress shipAddr = new ShippingAddress();
        shipAddr.setAddress(addr);

        ShippingAddress shippingAddress = shippingAddressService.query(shipAddr);
        if(shippingAddress == null){
            map.put("error_msg","不存在收货地址");
            return map;
        }

        Address address = shippingAddress.getAddress();
        User user = shippingAddress.getUser();

        //
        ShoppingCart shoppingCart = new ShoppingCart();
        shoppingCart.setUser(user)
                .setIsBuy(1);
        List<ShoppingCart> shoppingCartList = shoppingCartService.getAll(shoppingCart);
        List<String> outOfStockList = new ArrayList<>();

        //设置订单序号
        Order o = new Order();
        o.setUser(user);
        Order od = orderService.getOrderNum(o);
        int orderNum = 1;
        if(od != null){
            if(od.getOrderNum() >= 1){
                orderNum = od.getOrderNum() + 1;
            }
        }

        //循环生成订单
        if(shoppingCartList != null){
            for(ShoppingCart sc : shoppingCartList){

                //同步生成订单
                Order order = new Order();
                order.setUser(user)
                        .setAddress(address)
                        .setAmount(sc.getAmount())
                        .setCreateTime(new Date())
                        .setGoods(sc.getGoods())
                        .setTotalPrice(sc.getGoods().getGoodsPrice().multiply(new BigDecimal(sc.getAmount())))
                        .setOrderStatus(0)
                        .setOrderNum(orderNum);

                if(!orderService.createOrder(order)){
                    outOfStockList.add(sc.getGoods().getGoodsName());
                }
            }

            //记录下单失败的商品
            if(outOfStockList != null){
                map.put("outOfStockList",outOfStockList);
            }
            //设置成功标识
            map.put("isSubmit",true);
            map.put("url","pri/goods/toPayType?orderNum=" + orderNum);
        }


        return map;
    }

    @RequestMapping(value = "/toPayType")
    public String toPayType(Integer orderNum, HttpServletRequest request, Model model){

        if(orderNum != null){
            model.addAttribute("orderNum",orderNum);
        }

        String token = TokenUtil.createToken(request);
        if(token != null && !"".equals(token)){
            model.addAttribute("token",token);
        }

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        model.addAttribute("username",username);
        model.addAttribute("mobileNo",mobileNo);

        return "selectPayType";
    }

    @RequestMapping(value = "/pay")
    public String pay(Integer orderNum, String token, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {

        //token验证
        if(!TokenUtil.checkToken(token,request)){
            return null;
        }

        //订单号验证
        if(orderNum == null){
            return null;
        }

        //查询用户信息
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        User u = new User();
        u.setUsername(username)
                .setMobileNo(mobileNo);
        User user = userService.query(u);
        if(user == null){
            return null;
        }

        //订单支付
        Order order = new Order();
        order.setUser(user)
                .setOrderStatus(1)
                .setOrderNum(orderNum);
        orderService.updateOrderStatus(order);

        //查询购物车,计算总价钱
        ShoppingCart sc = new ShoppingCart();
        sc.setUser(user)
                .setIsBuy(1);
        List<ShoppingCart> list1 = shoppingCartService.getAll(sc);   //全部查询

        BigDecimal totalPrice = new BigDecimal("0");
        if(list1 != null){
            for(ShoppingCart s : list1){
                BigDecimal price = s.getGoods().getGoodsPrice();
                BigDecimal amount = new BigDecimal(s.getAmount().intValue());
                totalPrice = totalPrice.add(price.multiply(amount));
            }
        }

        //清空购物车相关的记录
        ShoppingCart shoppingCart = new ShoppingCart();
        shoppingCart.setUser(user)
                .setIsBuy(1);
        shoppingCartService.deleteRecord(shoppingCart);

        //调用支付宝接口
        AlipayClient alipayClient = new DefaultAlipayClient("https://openapi.alipaydev.com/gateway.do", AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", "utf-8", AlipayConfig.alipay_public_key, "RSA2"); //获得初始化的AlipayClient
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();//创建API对应的request
        alipayRequest.setReturnUrl("http://domain.com/CallBack/return_url.jsp");
        alipayRequest.setNotifyUrl("http://domain.com/CallBack/notify_url.jsp");//在公共参数中设置回跳和通知地址
        alipayRequest.setBizContent("{" +
                "    \"out_trade_no\":\""+ orderNum +"\"," +
                "    \"product_code\":\"FAST_INSTANT_TRADE_PAY\"," +
                "    \"total_amount\":"+ totalPrice.toString() +"," +
                "    \"subject\":\"订单号"+ orderNum +"\"," +
                "    \"body\":\"订单号"+ orderNum +"\"," +
                "    \"passback_params\":\"merchantBizType%3d3C%26merchantBizNo%3d2016010101111\"," +
                "    \"extend_params\":{" +
                "    \"sys_service_provider_id\":\"2088511833207846\"" +
                "    }"+
                "  }");//填充业务参数
        String form="";
        try {
            form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=" + "utf-8");
        response.getWriter().write(form);//直接将完整的表单html输出到页面
        response.getWriter().flush();
        response.getWriter().close();


        return null;
    }

}
