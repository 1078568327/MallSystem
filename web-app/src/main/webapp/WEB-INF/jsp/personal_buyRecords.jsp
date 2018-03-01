<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>管理收货地址</title>
    <link type="text/css" rel="stylesheet" href="css/share.css">
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/personal_buyRecord.css">
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

<!--内容开始-->
<div class="personal w1200" style="margin:0 auto;width: 1210px;">
    <div class="personal-left f-l" style="float: left;">
        <div class="personal-l-tit">
            <h3>个人中心</h3>
        </div>
        <ul>
            <li class="per-li2"><a href="pri/usr/personalInfo">个人资料<span>></span></a></li>
            <li class="per-li1"><a href="#">消息中心<span>></span></a></li>
            <li class="per-li3"><a href="pri/usr/myOrder">我的订单<span>></span></a></li>
            <li class="per-li4"><a href="pri/usr/toChangePsw">密码修改<span>></span></a></li>
            <li class="per-li5"><a href="pri/usr/shoppingCart">购物车<span>></span></a></li>
            <li class="per-li6"><a href="pri/usr/shippingAddress">管理收货地址<span>></span></a></li>
            <li class="per-li7"><a href="#">店铺收藏<span>></span></a></li>
            <li class="per-li8 current-li"><a href="pri/usr/toBuyRecords">购买记录<span>></span></a></li>
            <li class="per-li9"><a href="#">浏览记录<span>></span></a></li>
            <li class="per-li10"><a href="#">会员中心<span>></span></a></li>
        </ul>
    </div>
    <div class="purchase-records f-r">
        <div class="pr-tit">
            <P class="pr-p1">宝贝</P>
            <P class="pr-p2">单价(元)</P>
            <P class="pr-p3">数量</P>
            <P class="pr-p4">实付款(元)</P>
            <P class="pr-p5">交易状态</P>
            <P class="pr-p6">交易操作</P>
        </div>

        <c:forEach items="${requestScope.orderList}" var="order">

            <div class="pr-info">
                <div class="pr-tit2">
                    <input type="checkbox" value="" name="hobby"></input>
                    <p class="pr-p1">
                        <fmt:formatDate pattern="yyyy年MM月dd日" value="${order.createTime}" />
                    </p>
                    <p class="pr-p2" style="margin-left: 15px;width: 120px;">订单号：${order.orderNum}</p>
                    <p class="pr-a1"><a href="javascript:">生鲜专卖店</a></p>
                    <a class="pr-a2" href="javascript:">删除</a>
                </div>
                <div class="pr-con">
                    <div class="pr-con-tu f-l">
                        <a href="javascript:"><img src="${order.goods.goodsImages}" style="width: 80px;height: 80px;" /></a>
                    </div>
                    <a class="pr-con-bt f-l" href="javascript:">${order.goods.goodsName}</a>
                    <div class="pr-con-sz1 f-l">
                        <span>${order.goods.originPrice}</span>
                        <p>${order.goods.goodsPrice}</p>
                    </div>
                    <p class="pr-con-sl f-l">1</p>
                    <div class="pr-con-yf f-l">
                        <p>${order.goods.goodsPrice}</p>
                        <span>(含运费：0.00 )</span>
                    </div>
                    <div class="pr-con-jiaoyi f-l">
                        <a href="javascript:">交易成功</a>
                        <a href="javascript:">订单详情</a>
                    </div>
                    <div class="pr-con-pj f-l">
                        <a href="javascript:">评价</a>
                        <a href="javascript:">再次购买</a>
                    </div>

                    <div style="clear:both;"></div>
                </div>
            </div>

        </c:forEach>

        <!--分页-->
        <div class="paging">
            <div class="pag-left f-l">
                <a href="#" class="about left-r f-l"><</a>
                <ul class="left-m f-l">
                    <c:forEach var="i" begin="1" end="${requestScope.pageAmount}">

                        <c:choose>
                            <c:when test="${i == requestScope.currentPage}">
                                <li class="current" style="border-left: 1px solid #ffffff;"><a href="pri/usr/toBuyRecords?pageNum=${i}">${i}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li style="border-left: 1px solid #ffffff;"><a href="pri/usr/toBuyRecords?pageNum=${i}">${i}</a></li>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
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
    </div>
    <div style="clear:both;"></div>
</div>


<input type="hidden" id="token" value="${requestScope.token}">
<input type="hidden" id="mobileNo" value="${requestScope.mobileNo}">
<input type="hidden" id="username" value="${requestScope.username}">

<script type="text/javascript" src="js/personal_buyRecord.js"></script>
</body>
</html>
<%@ include file="bottom.jsp"%>