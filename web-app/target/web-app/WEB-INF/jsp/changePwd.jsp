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
    <title>修改密码</title>
    <link type="text/css" rel="stylesheet" href="css/share.css">
    <link rel="stylesheet" type="text/css" href="css/changePwd.css">
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
                <li><a href="#">蔬果热卖</a> </li>
                <li><a href="#">全部产品</a> </li>
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
            <div class="hr-car">
                <i class="iconfont"style="font-size: 40px;margin-right: 10px">&#xe633;</i>
                您的购物车内暂时没有任何产品。
            </div>
        </div>
    </div>
</div>
<!--顶部导航结束-->

<div class="personal w1200" style="margin:0 auto;width: 1210px;margin-bottom: 80px;">
    <div class="personal-left f-l" style="float: left;">
        <div class="personal-l-tit">
            <h3>个人中心</h3>
        </div>
        <ul>
            <li class="per-li2"><a href="pri/usr/personalInfo">个人资料<span>></span></a></li>
            <li class="per-li1"><a href="#">消息中心<span>></span></a></li>
            <li class="per-li3"><a href="#">我的订单<span>></span></a></li>
            <li class="per-li4 current-li"><a href="pri/usr/changePwd">密码修改<span>></span></a></li>
            <li class="per-li5"><a href="#">购物车<span>></span></a></li>
            <li class="per-li6"><a href="#">管理收货地址<span>></span></a></li>
            <li class="per-li7"><a href="#">店铺收藏<span>></span></a></li>
            <li class="per-li8"><a href="#">购买记录<span>></span></a></li>
            <li class="per-li9"><a href="#">浏览记录<span>></span></a></li>
            <li class="per-li10"><a href="#">会员中心<span>></span></a></li>
        </ul>
    </div>
    <div class="personal-r f-r" style="float: left;width: 960px;margin-left: 15px;margin-bottom: 50px;">
        <div class="personal-right">
            <div class="personal-r-tit">
                <h3>修改密码</h3>
            </div>
            <!--内容开始-->
            <div class="password-con" style="margin-bottom: 18px;">
                <div style="margin:0 0 18px 180px; color: red;">*token错误，请刷新页面</div>
                <div class="psw">
                    <p class="psw-p1">用户名</p>
                    <input type="text" readonly="true" />
                    <span class="dui"></span>
                </div>
                <div class="psw psw2">
                    <p class="psw-p1">手机号</p>
                    <input type="text" readonly="true" />
                    <%--<button>获取短信验证码</button>--%>
                </div>
                <div class="psw">
                    <p class="psw-p1">原来密码</p>
                    <input type="text" placeholder="请输入原来的密码" />
                    <span class="cuo" style="color: red;">*密码错误</span>
                </div>
                <div class="psw">
                    <p class="psw-p1">新的密码</p>
                    <input type="text" placeholder="请输入新密码" />
                    <span class="cuo" style="color: red;">*密码由6-16的字母、数字、符号组成</span>
                </div>
                <div class="psw">
                    <p class="psw-p1">确认密码</p>
                    <input type="text" placeholder="请再次确认密码" />
                    <span class="cuo" style="color: red;">*密码不一致，请重新输入</span>
                </div>
                <input type="hidden" id="token" value="${requestScope.token}">
                <button class="psw-btn">修改密码</button>
            </div>
        </div>
    </div>
    <div style="clear:both;"></div>
</div>

<input type="hidden" id="mobileNo" value="${requestScope.mobileNo}">
<input type="hidden" id="username" value="${requestScope.username}">

<script type="text/javascript" src="js/changePwd.js"></script>
</body>
</html>
<%@ include file="bottom.jsp"%>