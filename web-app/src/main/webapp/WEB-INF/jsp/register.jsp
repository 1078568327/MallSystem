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
    <title>注册</title>
    <link type="text/css" rel="stylesheet" href="css/share.css">
    <link rel="stylesheet" type="text/css" href="css/register.css">
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
                <li><a href="javascript:void(0)">最新资讯</a></li>
                <li><a href="pub/contactUs">联系我们</a> </li>
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

<div id="main">
    <div class="register-form">
        <ul>
            <li class="register-title">
                <div class="reg-title">新用户注册</div>
                <div class="reg-login">我已经注册，现在<a href="pub/usr/toLogin">&nbsp;登录</a></div>
            </li>
            <li class="error-register" style="width: 600px;height: 35px;">
                <div id="register-msg" style="color: red;font-size:15px;position:relative;left:250px;top:8px;display:none;"></div>
            </li>
            <li class="mobile-no">
                <div class="mb-no-title"><span style="color: red;">*</span>&nbsp;手机：</div>
                <input type="text" name="mobileNo" placeholder="请输入手机号" onfocus="this.placeholder=''" onblur="this.placeholder='请输入手机号'">
                <div class="error-box" id="error-mobileNo" style="display: none;">
                    <div class="l-error"></div>
                    <span style="color: red;">手机号码必须是11位的,请确认</span>
                </div>
            </li>
            <li class="set-pwd">
                <div class="pwd-title"><span style="color: red;">*</span>&nbsp;设置密码：</div>
                <input type="password" name="password" placeholder="6~16个字符，包括字母、数字、特殊符号，区分大小写" onfocus="this.placeholder=''" onblur="this.placeholder='6~16个字符，包括字母、数字、特殊符号，区分大'">
                <div class="error-box" id="error-pwd" style="display: none;">
                    <div class="l-error"></div>
                    <span style="color: red;">密码长度错误,请确认</span>
                </div>
            </li>
            <li class="sure-pwd">
                <div class="pwd-title"><span style="color: red;">*</span>&nbsp;确认密码：</div>
                <input type="password" name="passwordAgain" placeholder="再次输入密码" onfocus="this.placeholder=''" onblur="this.placeholder='再次输入密码'">
                <div class="error-box" id="error-pwd-2" style="display: none;">
                    <div class="l-error"></div>
                    <span style="color: red;">两次输入密码不一致,请确认</span>
                </div>
            </li>
            <li class="image-code">
                <div class="img-code-title"><span style="color: red;">*</span>&nbsp;图形验证码：</div>
                <input type="text" name="imageCaptcha" placeholder="请输入图形验证码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入图形验证码'">
                <img src="pub/usr/register/getImageCode">
                <a href="javascript:void(0)" onclick="changeImg()" class="refcode" style="float:left;margin:25px 0 0 10px;text-decoration: underline;">看不清，换一张</a>
            </li>
            <li class="code">
                <div class="code-title"><span style="color: red;">*</span>&nbsp;验证码：</div>
                <input type="text" name="captcha" placeholder="请输入验证码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入验证码'">
                <div class="btn-getCode">
                    <a href="javascript:void(0)" onclick="getCode()">获取短信验证码</a>
                </div>
            </li>
            <li class="btn-agree">
                <input id="btnSub" type="image" name="agree" src="images/public/transparent.png">
                <div class="check-box">
                    <input type="checkbox" name="chk-agree" id="chkre" checked="checked" style="position: relative;top: 4px;">
                    <span style="font-size: 12px;position: relative;top: 2px;">我已阅读并同意<a href="#" style="color: blue;">《绿叶水果商城用户注册协议》</a></span>
                </div>
            </li>
            <input type="hidden" id="token" value="${requestScope.token}">
        </ul>
    </div>
</div>
<input type="hidden" id="mobileNo" value="${requestScope.mobileNo}">
<input type="hidden" id="username" value="${requestScope.username}">

<script type="text/javascript" src="js/register.js"></script>
</body>
</html>
<%@ include file="bottom.jsp"%>
