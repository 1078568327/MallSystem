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
    <title>商品评价</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/star-rating.css">
    <link type="text/css" rel="stylesheet" href="css/share.css">
    <link rel="stylesheet" type="text/css" href="css/comment.css">
    <script type="text/javascript" src="scripts/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="scripts/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="scripts/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/star-rating.js"></script>
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
                <li><a href="pub/personal" style=""><span style="">个人中心</span></a></li>
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

<!--主页内容-->
<div class="content">
    <div class="cont-top" style="height: 530px;">
        <div class="cont-left">
            <div class="ctl-img" style="width: 400px;height: 400px;margin-left:80px">
                <img src="${requestScope.goodsImages}" style="margin-top: 0;width: 398px;height: 398px;">
            </div>
            <div class="collect" style="width: 380px;margin-left: 80px;">
                <div class="coll">
                    <i class="iconfont">&#xe641;</i>
                    收藏
                </div>
                <div class="coll">
                    <i class="iconfont">&#xe617;</i>
                    分享
                    <div class="share">

                    </div>
                </div>
            </div>
            <div class="next" style="width: 380px;margin-left: 80px;">
                <div class="nt">
                    上一个
                </div>
                <div class="nt ntp">
                    下一个
                </div>
            </div>


        </div>
        <div class="cont-right">

            <dl class="eva-info1">
                <%--<dt><a href="#"><img src="images/want-evaluate-tu.gif" /></a></dt>--%>
                <dd>
                    <h3><a href="javascript:void(0)">${requestScope.goodsName}</a></h3>
                    <ul>
                        <li>
                            <span>价格</span><p class="p1">¥ ${requestScope.goodsPrice} 元</p>
                        </li>
                        <li>
                            <span>配送</span><p>快递:  0.00</p>
                        </li>
                        <li>
                            <span>评价</span><p>${requestScope.avgScore}分 (累计评价 ${requestScope.commentAmount} )</p>
                        </li>
                        <li>
                            <span>订单号</span><p id="order-id">${requestScope.orderId}</p>
                        </li>
                    </ul>
                </dd>
                <div style="clear:both;"></div>
            </dl>

        </div>
    </div>

    <div class="evaluate w1200" style="margin-top:0;">
        <div class="eva-info3">

            <div class="eva-if3-l f-l" style="float:left;position:relative;top: -80px;">
                <dl class="if3-l-dl1">
                    <dt style="font-weight: bold">商品评价</dt>
                    <dd><textarea id="goods-comment"></textarea></dd>
                    <div style="clear:both;"></div>
                </dl>
                <dl class="if3-l-dl2">
                    <dt style="font-weight: bold">服务评价</dt>
                    <dd><textarea id="service-comment"></textarea></dd>
                    <div style="clear:both;"></div>
                </dl>
                <dl class="if3-l-dl3">
                    <dt style="font-weight: bold">晒图片</dt>
                    <dd>
                        <a href="JavaScript:;">
                            <img src="images/public/dl3-tu1.gif" />
                            <input type="file" class="img1" />
                        </a>
                        <a href="JavaScript:;">
                            <img src="images/public/dl3-tu2.gif" />
                            <input type="file" class="img1" />
                        </a>
                        <p>上传图片     0/5</p>
                        <div style="clear:both;"></div>
                    </dd>
                    <div style="clear:both;"></div>
                </dl>
                <button class="eva-btn" id="btn-comment">提交评价</button>
            </div>

            <div class="eva-if3-r f-l" style="float:left;margin-top:-80px;">
                <ul>
                    <li>
                        <p class="p1"><span>*</span> 描述相符</p>
                        <form style="display:inline-block;">
                            <input id="fit-score" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" >
                        </form>
                    </li>
                    <li>
                        <p class="p1"><span>*</span> 卖家服务</p>
                        <form style="display:inline-block;">
                            <input id="seller-score" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" >
                        </form>
                    </li>
                    <li>
                        <p class="p1"><span>*</span> 物流服务</p>
                        <form style="display:inline-block;">
                            <input id="logistics-score" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" >
                        </form>
                    </li>
                </ul>
                <p class="eva-fen">2分-4分为一般</p>
            </div>
            <div style="clear:both;"></div>

        </div>
    </div>


</div>
<!--主页内容结束-->



<input type="hidden" id="token" value="${requestScope.token}">
<input type="hidden" id="mobileNo" value="${requestScope.mobileNo}">
<input type="hidden" id="username" value="${requestScope.username}">

<script type="text/javascript" src="js/comment.js"></script>
</body>
</html>
<%@ include file="bottom.jsp"%>