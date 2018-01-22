<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=basePath%>">
    <title>购物车</title>
    <link type="text/css" rel="stylesheet" href="css/share.css">
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/shoppingCart.css">
    <script type="text/javascript" src="scripts/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="scripts/jquery.SuperSlide.2.1.1.js"></script>
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
                <li><a href="pub/index" ><span>首页</span></a> </li>
                <li><a href="pub/hotProduct">蔬果热卖</a> </li>
                <li><a href="pub/allProduct"><span>全部产品</span></a> </li>
                <li><a href="pub/personal">个人中心</a></li>
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
<div class="cart-content w1200">
    <ul class="cart-tit-nav">
        <li class="current"><a href="#">全部商品</a></li>
        <div style="clear:both;"></div>
    </ul>
    <div class="cart-con-tit">
        <p class="p1">
            <input type="checkbox" value="" name="hobby"></input>
            <span>全选</span>
        </p>
        <p class="p2">商品信息</p>
        <p class="p4">数量</p>
        <p class="p5">单价（元）</p>
        <p class="p6">金额（元）</p>
        <p class="p7">操作</p>
    </div>

    <div class="cart-con-info">

        <div class="info-top">
            <input type="checkbox" value="" name="hobby"></input>
            <span>商家：果然新鲜专卖店</span>
        </div>

        <c:forEach items="${requestScope.list}" var="item">
            <div class="info-mid">
                <input type="checkbox" value="${item.id}" name="hobby" class="mid-ipt f-l"></input>
                <div class="mid-tu f-l">
                    <a href="#"><img src="${item.goods.goodsImages}" style="width:110px;height: 80px;"/></a>
                </div>
                <div class="mid-font f-l" style="width:220px;">
                    <a href="#">${item.goods.goodsName}</a>
                    <span>满赠</span>
                </div>

                <div class="mid-sl f-l">
                    <a href="JavaScript:;" class="sl-left">-</a>
                    <input type="text" value="${item.amount}" />
                    <a href="JavaScript:;" class="sl-right">+</a>
                </div>
                <p class="mid-dj f-l">¥ <span>${item.goods.goodsPrice}</span></p>
                <p class="mid-je f-l">¥ <span>${item.goods.goodsPrice * item.amount}</span></p>
                <div class="mid-chaozuo f-l">
                    <a href="#">移入收藏夹</a>
                    <a href="#">删除</a>
                </div>
                <div style="clear:both;"></div>
            </div>
        </c:forEach>

    </div>

    <!--分页-->
    <div class="paging">
        <div class="pag-left f-l">
            <a href="#" class="about left-r f-l"><</a>
            <ul class="left-m f-l">
                <li><a href="#">1</a></li>
                <li class="current"><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <div style="clear:both;"></div>
            </ul>
            <a href="#" class="about left-l f-l">></a>
            <div style="clear:both;"></div>
        </div>
        <div class="pag-right f-l">
            <div class="jump-page f-l">
                到第<input type="text" />页
            </div>
            <button class="f-l">确定</button>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>
    <div class="cart-con-footer">
        <div class="quanxuan f-l">
            <input type="checkbox" value="" name="hobby"></input>
            <span>全选</span>
            <a href="#">删除</a>
            <a href="#">加入收藏夹</a>
            <p>（此处始终在屏幕下方）</p>
        </div>
        <div class="jiesuan f-r">
            <div class="jshj f-l">
                <p>合计（不含运费）</p>
                <p class="jshj-p2">
                    ￥：<span>0</span>.00
                </p>
            </div>
            <a href="JavaScript:;" class="js-a1 f-l">结算</a>
            <div style="clear:both;"></div>
        </div>
        <div style="clear:both;"></div>
    </div>
</div>



<input type="hidden" id="mobileNo" value="${requestScope.mobileNo}">
<input type="hidden" id="username" value="${requestScope.username}">

<script type="text/javascript" src="js/shoppingCart.js"></script>
</body>
</html>
<%@ include file="bottom.jsp"%>