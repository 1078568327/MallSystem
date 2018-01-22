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
    <title>蔬菜热卖</title>
    <link type="text/css" rel="stylesheet" href="css/share.css">
    <link rel="stylesheet" type="text/css" href="css/hotProduct.css">
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
                <li><a href="pub/hotProduct" style="color: #4AB344"><span style="color: #4AB344">蔬果热卖</span></a> </li>
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

<!--banner图片-->
<div class="her-banner">

</div>


<div class="content">
    <!--产品推荐开始-->
    <div class="recommand clear">
        <div class="rec-cont clear">
            <div class="rec-left">
                <div class="classily">
                    <div class="cltop">
                        <p>产品分类</p>
                    </div>
                    <div class="cltcon">
                        <p><a href="pub/goods/hotProd/classifyProd?type=0">进口水果</a> </p>
                        <p><a href="pub/goods/hotProd/classifyProd?type=1">国产水果</a></p>
                        <p style="border-bottom:0px dashed #999999;"><a href="pub/goods/hotProd/classifyProd?type=2">新鲜时蔬</a></p>
                    </div>

                </div>
                <div class="service">
                    <div class="cltop">
                        <p>在线客服</p>
                    </div>
                    <div class="sercon">
                        <div class="qqs">
                            <p><a hidefocus="true" href="#">
                                <span class="serOnline-img0 qqImg0">&nbsp;</span>软软的蜜桃
                            </a>
                            </p>
                            <P><a hidefocus="true" href="#">
                                <span class="serOnline-img0 qqImg0">&nbsp;</span>小芒果
                            </a>
                            </P>
                        </div>
                        <div class="tims">
                            <div class="marBL-10">
                                <span class="worktime-header-img">&nbsp;</span>
                                <span class="serWorkTimeText"><b>工作时间</b></span>
                            </div>
                            <div class="serOnline-list-v "><span>周一至周五 ：8:30-17:30</span></div>
                            <div class="serOnline-list-v lastData"><span>周六至周日 ：9:00-17:00</span></div>
                        </div>
                    </div>

                </div>

            </div>

            <div class="rec-right">
                <div class="bd">
                    <div class="bd1"  style="display: block">

                        <c:forEach items="${requestScope.goodsList}" var="item">
                            <div class="rcr">
                                <div class="rcr-top">
                                    <a href="pub/goods/prodDetail?pId=${item.id}" target="_blank">
                                        <img src="${item.goodsImages}" width="100%">
                                    </a>
                                </div>
                                <div class="rcr-bot">
                                    <div class="rb-top">
                                            ${item.goodsName}
                                    </div>
                                    <div class="second_P">
                                        <span class="fk-prop">￥</span>
                                        <span class="fk-prop-price">${item.goodsPrice}
                                            <span class="fk-prop-p"></span>
                                        </span>
                                        <span class="second_Marketprice">￥${item.originPrice}</span>
                                    </div>
                                    <div class="buy">
                                        <a class="second_mallBuy" href="pub/goods/prodDetail?pId=${item.id}" target="_blank">
                                            <span style="color: white;">购买</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>

                <div class="hd">
                    <div class="net">上一页</div>
                    <ul>
                        <li><a href="pub/goods/hotProd/page?pageNum=1&type=${requestScope.type}" class="active">1</a></li>
                        <li><a href="pub/goods/hotProd/page?pageNum=2&type=${requestScope.type}">2</a></li>
                        <li><a href="pub/goods/hotProd/page?pageNum=3&type=${requestScope.type}">3</a></li>
                    </ul>
                    <div class="next"> 下一页</div>
                </div>
            </div>


        </div>
    </div>

    <!--产品推荐结束-->
</div>


<input type="hidden" id="mobileNo" value="${requestScope.mobileNo}">
<input type="hidden" id="username" value="${requestScope.username}">

<script type="text/javascript" src="js/hotProduct.js"></script>
</body>
</html>
<%@ include file="bottom.jsp"%>