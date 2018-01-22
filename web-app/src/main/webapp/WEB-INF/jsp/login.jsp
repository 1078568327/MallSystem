<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>登录</title>
    <link type="text/css" rel="stylesheet" href="css/share.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <script type="text/javascript" src="scripts/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="scripts/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="scripts/md5.min.js"></script>
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
                <li><a href="pub/index" style="color: #4AB344"><span style="color: #4AB344">首页</span></a> </li>
                <li><a href="pub/hotProduct">蔬果热卖</a> </li>
                <li><a href="pub/allProduct">全部产品</a> </li>
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

<div class="login-box">
    <div class="login-form">
        <ul>
            <li class="login-title">
                <strong>登录</strong>
                <span>还没有注册？<a href="pub/usr/toRegister">&nbsp;30秒注册</a></span>
            </li>
            <li class="login-msg">
                <div class="login-error" style="display: none;"></div>
            </li>
            <li class="login-name">
                <div class="l-input">
                    <input type="text" name="mobileNo" placeholder="请输入手机号" onfocus="this.placeholder=''" onblur="this.placeholder='请输入手机号'">
                </div>
                <div id="name-error" class="error-box" style="display: none;">
                    <div class="l-error"></div>
                    <span style="color: red;"></span>
                </div>
            </li>
            <li class="login-pwd">
                <div class="l-input">
                    <input type="password" name="password" placeholder="密码" onfocus="this.placeholder=''" onblur="this.placeholder='密码'">
                </div>
                <div id="pwd-error" class="error-box" style="display: none;">
                    <div class="l-error2"></div>
                    <span style="color: red;"></span>
                </div>
            </li>
            <li class="login-check">
                <input type="checkbox" name="isRemember" id="remember-me" style="vertical-align:middle;" value="1">
                <label for="remember-me" style="color: grey;position: relative;top: 3px;color: #656565;">记住我7天</label>
                <a href="#">忘记密码？</a>
            </li>
            <li class="login-btn">
                <div class="input-login">
                    <input id="btnSub" type="image" src="images/public/btn_dl.png" border="0">
                </div>
            </li>
            <input type="hidden" id="token" value="${requestScope.token}">
        </ul>
    </div>
</div>
<input type="hidden" id="username" value="${requestScope.username}">
<input type="hidden" id="mobileNo" value="${requestScope.mobileNo}">

<script type="text/javascript" src="js/login.js"></script>
</body>
</html>
<%@ include file="bottom.jsp"%>