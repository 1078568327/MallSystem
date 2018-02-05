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
    <title>管理收货地址</title>
    <link type="text/css" rel="stylesheet" href="css/share.css">
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/personal_shoppingCart.css">
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
            <li class="per-li3"><a href="pri/usr/myOrder">我的订单<span>></span></a></li>
            <li class="per-li4"><a href="pri/usr/toChangePsw">密码修改<span>></span></a></li>
            <li class="per-li5 current-li"><a href="pri/usr/shoppingCart">购物车<span>></span></a></li>
            <li class="per-li6"><a href="pri/usr/shippingAddress">管理收货地址<span>></span></a></li>
            <li class="per-li7"><a href="#">店铺收藏<span>></span></a></li>
            <li class="per-li8"><a href="#">购买记录<span>></span></a></li>
            <li class="per-li9"><a href="#">浏览记录<span>></span></a></li>
            <li class="per-li10"><a href="#">会员中心<span>></span></a></li>
        </ul>
    </div>
    <div class="management f-r">
        <div class="tanchuang-con">
            <div class="tc-title">
                <h3>我的购物车</h3>
            </div>
            <div class="cart-content w1200" style="width: 961px;">
                <ul class="cart-tit-nav" style="width: 961px;">
                    <li class="current"><a href="#">全部商品</a></li>
                    <div style="clear:both;"></div>
                </ul>
                <div class="cart-con-tit">
                    <p class="p1">
                        <input type="checkbox" value="" name="hobby" id="check-all"></input>
                        <span>全选</span>
                    </p>
                    <p class="p2">商品信息</p>
                    <p class="p4">数量</p>
                    <p class="p5">单价（元）</p>
                    <p class="p6">金额（元）</p>
                    <p class="p7">操作</p>
                </div>

                <div class="cart-con-info" style="width: 961px;">

                    <div class="info-top">
                        <input type="checkbox" value="" name=""></input>
                        <span>商家：果然新鲜专卖店</span>
                    </div>

                    <c:forEach items="${requestScope.list}" var="item">
                        <div class="info-mid">
                            <input type="checkbox" value="${item.id}" name="ckb-item" class="mid-ipt f-l" checked></input>
                            <div class="mid-tu f-l">
                                <a href="#"><img src="${item.goods.goodsImages}" style="width:110px;height: 80px;"/></a>
                            </div>
                            <div class="mid-font f-l" style="width:220px;">
                                <a href="#"><br/>${item.goods.goodsName}</a>
                                <span>满赠</span>
                            </div>

                            <div class="mid-sl f-l">
                                <a href="JavaScript:;" class="sl-left">-</a>
                                <input type="text" value="${item.amount}" class="item-amount" />
                                <a href="JavaScript:;" class="sl-right">+</a>
                            </div>
                            <p class="mid-dj f-l">¥ <span class="item-price">${item.goods.goodsPrice}</span></p>
                            <p class="mid-je f-l">¥ <span>${item.goods.goodsPrice * item.amount}</span></p>
                            <div class="mid-chaozuo f-l">
                                <a href="javascript:" id="collect">移入收藏夹</a>
                                <a href="javascript:" class="del-item">删除<input type="hidden" value="${item.id}"/></a>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                    </c:forEach>

                </div>

                <!--分页-->
                <%--<div class="paging">
                    <div class="pag-left f-l">
                        <a href="#" class="about left-r f-l"><</a>
                        <ul class="left-m f-l">
                            <c:forEach var="i" begin="1" end="${requestScope.pageAmount}">

                                <c:choose>
                                    <c:when test="${i == requestScope.currentPage}">
                                        <li class="current" style="border-left: 1px solid #ffffff;"><a href="pri/goods/shoppingCart?pageNum=${i}">${i}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li style="border-left: 1px solid #ffffff;"><a href="pri/goods/shoppingCart?pageNum=${i}">${i}</a></li>
                                    </c:otherwise>
                                </c:choose>

                            </c:forEach>
                            <div style="clear:both;"></div>
                        </ul>
                        <a href="#" class="about left-l f-l" style="border-left: 1px solid #ffffff;">></a>
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
                </div>--%>
                <div class="cart-con-footer">
                    <div class="quanxuan f-l">
                        <input type="checkbox" value="" name="hobby" id="check-all-2"></input>
                        <span>全选</span>
                        <a href="javascript:" id="del-all-selected">删除</a>
                        <a href="javascropt:">加入收藏夹</a>
                        <p>（此处始终在屏幕下方）</p>
                    </div>
                    <div class="jiesuan f-r">
                        <div class="jshj f-l">
                            <p>合计（不含运费）</p>
                            <p class="jshj-p2">
                                ￥：<span id="total-price">${requestScope.totalPrice}</span>
                            </p>
                        </div>
                        <a href="JavaScript:;" class="js-a1 f-l" id="to-order">结算</a>
                        <div style="clear:both;"></div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
            </div>
        </div>

    </div>

    <div style="clear:both;"></div>
</div>

<!--删除弹框-->
<div class="popup" id="delete-prompt">
    <div class="p-login">
        <div class="del">×</div>
        <div class="lg-cont">
            <div class="lhd">
                <ul>
                    <li class="active" style="width:80px;margin-left: 25px;font-size: 16px;font-weight: 500;">删除提示</li>
                </ul>

            </div>
            <div class="lbd">
                <div class="lbd1"style="display: block">
                    <div style="height: 55px;margin-top: 25px;margin-left: 35px;">亲，确定删除商品吗？</div>
                    <div class="loginButton loginButton">
                        <div class="middle" style="margin-left: 15px;" id="sure-delete">确认删除</div>
                    </div>
                    <div class="bott"></div>
                </div>
            </div>

        </div>
    </div>
</div>

<!--删除选中弹框-->
<div class="popup" id="delete-selected-prompt">
    <div class="p-login">
        <div class="del">×</div>
        <div class="lg-cont">
            <div class="lhd">
                <ul>
                    <li class="active" style="width:80px;margin-left: 25px;font-size: 16px;font-weight: 500;">删除提示</li>
                </ul>

            </div>
            <div class="lbd">
                <div class="lbd1"style="display: block">
                    <div style="height: 55px;margin-top: 25px;margin-left: 35px;">亲，确定删除选中的所有商品吗？</div>
                    <div class="loginButton loginButton">
                        <div class="middle" style="margin-left: 15px;" id="delete-all">确认删除</div>
                    </div>
                    <div class="bott"></div>
                </div>
            </div>

        </div>
    </div>
</div>

<!--收藏弹框-->
<div class="popup" id="collect-prompt">
    <div class="p-login">
        <div class="del">×</div>
        <div class="lg-cont">
            <div class="lhd">
                <ul>
                    <li class="active" style="width:100px;margin-left: 25px;font-size: 16px;font-weight: 500;">收藏商品提示</li>
                </ul>

            </div>
            <div class="lbd">
                <div class="lbd1"style="display: block">
                    <div style="height: 55px;margin-top: 25px;margin-left: 35px;">亲，确定收藏该商品吗？</div>
                    <div class="loginButton loginButton">
                        <div class="middle" style="margin-left: 15px;">确认收藏</div>
                    </div>
                    <div class="bott"></div>
                </div>
            </div>

        </div>
    </div>
</div>

<!--成功弹框-->
<div class="popup" id="info-prompt">
    <div class="p-login">
        <div class="del">×</div>
        <div class="lg-cont">
            <div class="lhd">
                <ul>
                    <li class="active" style="width:80px;margin-left: 25px;font-size: 16px;font-weight: 500;">收藏商品提示</li>
                </ul>

            </div>
            <div class="lbd">
                <div class="lbd1"style="display: block">
                    <div style="height: 55px;margin-top: 25px;margin-left: 35px;">亲，操作成功^_^</div>
                    <div class="loginButton loginButton">
                        <div class="middle" style="margin-left: 15px;">好的</div>
                    </div>
                    <div class="bott"></div>
                </div>
            </div>

        </div>
    </div>
</div>

<input type="hidden" id="mobileNo" value="${requestScope.mobileNo}">
<input type="hidden" id="username" value="${requestScope.username}">

<script type="text/javascript" src="js/personal_shoppingCart.js"></script>
</body>
</html>
<%@ include file="bottom.jsp"%>