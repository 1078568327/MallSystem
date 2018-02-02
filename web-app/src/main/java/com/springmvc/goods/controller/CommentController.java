package com.springmvc.goods.controller;

import com.springmvc.goods.bean.AddComment;
import com.springmvc.goods.bean.Comment;
import com.springmvc.goods.bean.Goods;
import com.springmvc.goods.bean.Order;
import com.springmvc.goods.service.CommentService;
import com.springmvc.goods.service.GoodsService;
import com.springmvc.goods.service.OrderService;
import com.springmvc.user.bean.User;
import com.springmvc.user.service.UserService;
import com.springmvc.util.token.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "pri/goods")
public class CommentController {

    private static final String SESSION_USERNAME = "USERNAME";
    private static final String SESSION_MOBILENO = "MOBILENO";
    private static final String SESSION_PASSWORD = "PASSWORD";

    @Autowired
    private CommentService commentService;
    @Autowired
    private UserService userService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/toComment")
    public String toComment(String orderId, HttpServletRequest request, Model model){

        String token = TokenUtil.createToken(request);
        if(token != null && !"".equals(token)){
            model.addAttribute("token",token);
        }

        if(orderId == null || "".equals(orderId)){
            return null;
        }

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute(SESSION_USERNAME);
        String mobileNo = (String) session.getAttribute(SESSION_MOBILENO);
        model.addAttribute("username",username);
        model.addAttribute("mobileNo",mobileNo);

        //查询订单,获取商品信息
        Order o = new Order();
        o.setId(orderId);
        Order order = orderService.query(o);
        if(order == null){
            return null;
        }
        Goods goods = order.getGoods();
        if(goods == null){
            return null;
        }

        model.addAttribute("goodsName",goods.getGoodsName());
        model.addAttribute("goodsPrice",goods.getGoodsPrice());
        model.addAttribute("goodsImages",goods.getGoodsImages());
        model.addAttribute("orderId",orderId);

        //商品评论数量
        Comment comment = new Comment();
        comment.setGoods(goods);
        Integer commentAmount = commentService.getAmountOfComment(comment);
        model.addAttribute("commentAmount",commentAmount);

        //商品评分计算
        List<Comment> commentList = commentService.getAll(comment);
        if(commentList == null){
            return null;
        }
        double avgScore = 0.0;
        for(Comment c : commentList){
            double sum = c.getFitScore().doubleValue()
                            + c.getSellerScore().doubleValue()
                            + c.getLogisticsScore().doubleValue();
            avgScore += sum / 3;
        }
        int commentSize = commentList.size();
        if(commentSize != 0){
            avgScore = avgScore / commentSize;
        }

        DecimalFormat df = new DecimalFormat( "0.0 ");
        model.addAttribute("avgScore",df.format(avgScore));


        return "comment";
    }

    @RequestMapping(value = "/addComment")
    @ResponseBody
    public Map submitComment(@RequestBody AddComment addComment, HttpServletRequest request, Model model){

        Map<String,Object> map = new HashMap<>();

        //token验证
        String token = addComment.getToken();
        if(!TokenUtil.checkToken(token,request)){
            map.put("error_msg","token错误");
            return map;
        }

        //orderId验证
        String orderId = addComment.getOrderId();
        if(orderId == null || "".equals(orderId)){
            map.put("error_msg","订单id错误");
            return map;
        }

        Order o = new Order();
        o.setId(orderId);
        Order order = orderService.query(o);
        if(order == null){
            map.put("error_msg","订单不存在");
            return map;
        }
        if(order.getOrderStatus() == 3){
            map.put("error_msg","订单已评论");
            return map;
        }

        //获取用户对象
        User user = order.getUser();
        if(user == null){
            map.put("error_msg","用户不存在");
            return map;
        }

        //获取商品对象
        Goods goods = order.getGoods();
        if(goods == null){
            map.put("error_msg","商品不存在");
            return map;
        }

        //添加评论
        BigDecimal fitScore = new BigDecimal(addComment.getFitScore());
        BigDecimal sellerScore = new BigDecimal(addComment.getSellerScore());
        BigDecimal logisticsScore = new BigDecimal(addComment.getLogisticsScore());
        String goodsComment = addComment.getGoodsComment();
        String serviceComment = addComment.getServiceComment();

        Comment comment = new Comment();
        comment.setUser(user)
                .setGoods(goods)
                .setOrder(order)
                .setFitScore(fitScore)
                .setSellerScore(sellerScore)
                .setLogisticsScore(logisticsScore)
                .setGoodsComment(goodsComment)
                .setServiceComment(serviceComment)
                .setCreateTime(new Date());
        commentService.save(comment);

        //修改订单为已评论状态
        order.setOrderStatus(3);
        orderService.save(order);

        //设置返回参数
        map.put("isAdd",true);
        map.put("url","pri/usr/noCommentOrder");

        return map;
    }



}
