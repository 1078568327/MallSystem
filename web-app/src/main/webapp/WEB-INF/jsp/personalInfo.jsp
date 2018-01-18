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
    <title>个人中心</title>
    <link type="text/css" rel="stylesheet" href="css/share.css">
    <link rel="stylesheet" type="text/css" href="css/personalInfo.css">
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
            <div class="hr-car">
                <i class="iconfont"style="font-size: 40px;margin-right: 10px">&#xe633;</i>
                您的购物车内暂时没有任何产品。
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
            <li class="per-li2 current-li"><a href="pri/usr/personalInfo">个人资料<span>></span></a></li>
            <li class="per-li1"><a href="#">消息中心<span>></span></a></li>
            <li class="per-li3"><a href="#">我的订单<span>></span></a></li>
            <li class="per-li4"><a href="pri/usr/toChangePsw">密码修改<span>></span></a></li>
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
                <h3>个人资料</h3>
            </div>
            <div class="data-con" id="uploadForm">
                <div class="dt1">
                    <p class="f-l">当前头像：</p>
                    <div class="touxiang f-l">
                        <div class="tu f-l">
                            <a href="#">
                                <img src="images/user/${requestScope.profilePicture}" id="portrait"/>
                                <input type="file" name="profilePicture" id="profileImg" class="img1" onchange="showPreview(this)" />
                            </a>
                        </div>
                        <a href="JavaScript:;" class="sc f-l" shangchuang="">上传头像</a>
                        <div style="clear:both;"></div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">用户称：</p>
                    <input type="text" name="username" value="${requestScope.username}" />
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">手机号：</p>
                    <input type="text" name="mobileNo" value="${requestScope.mobileNo}" readonly="true">
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1 dt2">
                    <p class="dt-p f-l">性别：</p>
                    <input type="hidden" id="gender" value="${requestScope.gender}">
                    <input type="radio" name="gender" id="man" value="男"></input><span>男</span>
                    <input type="radio" name="gender" id="woman" value="女"></input><span>女</span>
                    <input type="radio" name="gender" id="secret" value="保密"></input><span>保密</span>
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1" >
                    <p class="dt-p f-l">出生日期：</p>
                    <input type="date" name="birthday" value="${requestScope.birthday}" style="height: auto;margin-top:12px;"/>
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">邮箱：</p>
                    <input type="text" name="email" value="${requestScope.email}" />
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1 dt4">
                    <p class="dt-p f-l">会员等级：</p>
                    <span style="margin-top: 14px;display: inline-block;">${requestScope.memberExp}</span>
                    <div style="clear:both;"></div>
                </div>
                <input type="hidden" id="token" name="token" value="${requestScope.token}">
                <button class="btn-pst" onclick="ajaxUpload()">保存</button>
            </div>
        </div>
    </div>
    <div style="clear:both;"></div>
</div>
<input type="hidden" id="mobileNo" value="${requestScope.mobileNo}">
<input type="hidden" id="username" value="${requestScope.username}">

<script type="text/javascript" src="js/personalInfo.js"></script>
</body>
</html>
<%@ include file="bottom.jsp"%>
