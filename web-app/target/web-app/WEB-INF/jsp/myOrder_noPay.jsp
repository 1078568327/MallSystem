<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>待付款订单</title>
    <link type="text/css" rel="stylesheet" href="css/share.css">
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/myOrder_noPay.css">
    <script type="text/javascript" src="scripts/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="scripts/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="scripts/jquery-3.1.1.min.js"></script>
</head>
<body>
<header id="header">
    <ul class="header-left">
        <li class="address">送至 ： <span>广州</span></li>
        <li class="icon">◇</li>
    </ul>
    <ul class="header-right">
        <li class="login">
            <a href="pub/usr/toLogin" class="hello">亲，请登录&nbsp;</a>
            <a href="pub/usr/toRegister" class="red">免费注册</a>
        </li>
        <li class="logoff" style="display:none;">
            <a href="pub/personal" id="user"></a>
            <a href="pub/usr/exit" style="margin-left: 10px;">退出账号</a>
        </li>
        <li class="separator"></li>
        <li><a href="#">我的订单</a></li>
        <li class="separator"></li>
        <li><a href="#">会员中心</a></li>
        <li class="separator"></li>
        <li><a href="#">客户服务</a></li>
        <li class="separator"></li>
        <li class="website-navigation">
            <span>网站导航</span>
            <span class="icon2">◇</span>
        </li>
        <li class="separator"></li>
    </ul>
</header>
<div class="clear"></div>

<!--顶部导航-->
<div class="headr">
    <div class="heard-con">
        <img src="images/public/logo.jpg" style="margin-top: 7px;float: left;position: absolute">
        <div class="headr-nav">
            <ul>
                <li><a href="pub/index"><span>首页</span></a> </li>
                <li><a href="pub/hotProduct">蔬果热卖</a> </li>
                <li><a href="pub/allProduct">全部产品</a> </li>
                <li><a href="pub/personal" style="color: #4AB344"><span style="color: #4AB344">个人中心</span></a></li>
                <li><a href="#">最新资讯</a></li>
                <li><a href="#">联系我们</a> </li>
            </ul>
            <div class="sptopfoot">
                <div class="spbottom"  >
                </div>
            </div>
        </div>
        <div class="headr-right">
            <i class="iconfont" style="font-size: 16px;margin-right: 10px">&#xe7d5;</i>
            我的购物车 ∨
            <i id="total" style="color: red;position: absolute;top: -8px;left:140px;"></i>
            <div class="hr-car" style="overflow: scroll;height: 150px;">
                <i class="iconfont cart-null" style="display:inline-block;font-size: 40px;margin-right: 10px;height: 50px;">&#xe633;</i>
                <i class="cart-null" style="display:inline-block;height: 50px;">您的购物车内暂时没有任何产品。</i>
            </div>
        </div>
    </div>
</div>
<!--顶部导航结束-->


<!--内容开始-->
<div class="personal w1200" style="margin:0 auto;width: 1210px;">
    <div class="personal-left f-l" style="float: left;">
        <div class="personal-l-tit">
            <h3>个人中心</h3>
        </div>
        <ul>
            <li class="per-li2"><a href="pri/usr/personalInfo">个人资料<span>></span></a></li>
            <li class="per-li1"><a href="#">消息中心<span>></span></a></li>
            <li class="per-li3 current-li"><a href="pri/usr/myOrder">我的订单<span>></span></a></li>
            <li class="per-li4"><a href="pri/usr/toChangePsw">密码修改<span>></span></a></li>
            <li class="per-li5"><a href="#">购物车<span>></span></a></li>
            <li class="per-li6"><a href="#">管理收货地址<span>></span></a></li>
            <li class="per-li7"><a href="#">店铺收藏<span>></span></a></li>
            <li class="per-li8"><a href="#">购买记录<span>></span></a></li>
            <li class="per-li9"><a href="#">浏览记录<span>></span></a></li>
            <li class="per-li10"><a href="#">会员中心<span>></span></a></li>
        </ul>
    </div>
    <div class="order-right f-r">
        <div class="order-hd">
            <dl class="f-l">
                <dt>
                    <a href="javascript:void(0)"><img src="images/user/${requestScope.profilePicture}" style="width: 68px;height: 68px;" /></a>
                </dt>
                <dd>
                    <h3><a href="javascript:void(0)">${requestScope.username}</a></h3>
                    <p>${requestScope.mobileNo}</p>
                </dd>
                <div style="clear:both;"></div>
            </dl>
            <div class="ord-dai f-l">
                <p><a href="pri/usr/myOrder">待收货</a><span>${requestScope.waitForGoods}</span></p>
                <p><a href="pri/usr/noCommentOrder">待评价</a><span>${requestScope.waitForComment}</span></p>
                <p><a href="pri/usr/noPayOrder" style="color: green">待付款</a><span>${requestScope.waitForPay}</span></p>
                <p><a href="pri/usr/toCancelOrder">已取消订单</a><span>${requestScope.cancelOrder}</span></p>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div class="order-md">
            <div class="md-tit">
                <h3>我的订单</h3>
            </div>
            <div class="md-hd">
                <p class="md-p2" style="margin-left: 140px;">商品信息</p>
                <p class="md-p3">数量</p>
                <p class="md-p4">单价（元）</p>
                <p class="md-p5">金额（元）</p>
                <p class="md-p6">操作</p>
            </div>
            <div class="md-info">
                <div class="dai">
                    <span style="margin-left: 15px;color: red;font-size: 16px;"><strong>待付款</strong></span>
                </div>

                <c:forEach items="${requestScope.orderList}" var="item">

                    <div class="dai-con">
                        <dl class="dl1" style="width: 420px;">
                            <dt>
                                <a href="#" class="f-l"><img src="${item.goods.goodsImages}" style="width:110px;height: 80px;" /></a>
                                <div style="clear:both;"></div>
                            </dt>
                            <dd style="width: 210px;margin-top: 10px;">
                                <a href="#"><p>${item.goods.goodsName}</p></a>
                            </dd>
                            <div style="clear:both;"></div>
                        </dl>
                        <div class="dai-right f-l">
                            <P class="d-r-p1" style="position: relative;top:-23px;">${item.amount}</P>
                            <p class="d-r-p2">¥ ${item.goods.goodsPrice}</p>
                            <p class="d-r-p3">¥ ${item.totalPrice}</p>
                            <p class="d-r-p4">
                                <a href="javascript:void(0)">去付款</a><br/>
                                <a href="javascript:void(0)">&nbsp;</a><br/>
                                <a href="pri/usr/deleteCancelOrder?token=${requestScope.token}&orderId=${item.id}">删除订单</a>
                            </p>
                        </div>
                        <div style="clear:both;"></div>
                    </div>

                </c:forEach>

            </div>
        </div>

    </div>
    <div style="clear:both;"></div>
</div>

<input type="hidden" id="token" value="${requestScope.token}">
<input type="hidden" id="mobileNo" value="${requestScope.mobileNo}">
<input type="hidden" id="username" value="${requestScope.username}">

<script type="text/javascript" src="js/myOrder_noPay.js"></script>
</body>
</html>
<%@ include file="bottom.jsp"%>