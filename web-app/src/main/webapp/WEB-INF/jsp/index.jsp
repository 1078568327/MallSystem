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
    <title>首页</title>
    <link type="text/css" rel="stylesheet" href="css/share.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
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

<!--banner图片-->
<div class="her-banner">

</div>
<!--banner图片结束-->
<!--主页内容-->
<div class="content">
    <div class="ban-boot clear">
        <div class="ban-zs" style="">
            <img src="images/banner/top-banner-small-1.jpg" width="100%">
            <a href="pub/goods/prodDetail?pId=d9c33e77-86d3-4452-856f-e542e8870b45" target="_blank" style="display: inline-block;position:absolute;width: 390px;height:196px;top:60px;"></a>
        </div>
        <div class="ban-zs">
            <img src="images/banner/top-banner-small-2.jpg" width="100%">
            <a href="pub/goods/prodDetail?pId=0c438235-aa44-4ba8-938b-66bf2306cb41" target="_blank" style="display: inline-block;position:absolute;width: 390px;height:196px;top:60px;"></a>
        </div>
        <div class="ban-zs">
            <img src="images/banner/top-banner-small-3.jpg" width="100%">
        </div>
    </div>
    <!--果园推荐开始-->
    <div class="recommand clear">
        <div class="rec-nav clear">
            <h2>果园推荐 <span>RECOMMAND</span></h2>
        </div>
        <div class="rec-cont clear">
            <div class="rec-left">
                <img src="images/public/rc-1.jpg">
            </div>
            <div class="rec-right">

                <c:forEach items="${requestScope.goodsList}" var="item">
                    <div class="rcr">
                        <div class="rcr-top">
                            <a href="pub/goods/prodDetail?pId=${item.id}" target="_blank">
                            <img src="${item.goodsImages}" width="100%" height="230">
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
    </div>

    <!--果园推荐结束-->
</div>
<!--每日新品特卖-->
<div class="rec-bottom clear">
    <div class="rbt-con">
        <div class="banner_1">
            <img src="images/banner/middle-banner-big-1.jpg"width="1424px">
            <img src="images/banner/middle-banner-big-2.jpg"width="1424px">
        </div>
    </div>
    <ul class="banner-bottom">

    </ul>
</div>
<div class="content">
    <div class="new-nav clear">
        <div class="nwn-con">
            <div style="text-align: center;">
                <span style="">
                    <span style="font-size: 31px;">
                        <font style="color: rgb(33, 33, 33);" color="#212121">
                        <font style="color: rgb(231, 231, 231);" color="#e7e7e7">
                            ———————
                        </font>
                            <b>&nbsp; 每日新品特卖 &nbsp;</b>
                        </font></span></span>
                <span style="font-size: 31px;">
                <font style="color: rgb(231, 231, 231);" color="#e7e7e7">
                    ———————
                </font>
            </span>
            </div>
            <div style="text-align: center;">
                <font color="#353535" style="">
                    <span style="font-size: 16px;">
                            <font style= color:#888888>
                                新鲜水果每一天，健康生活每一刻
                            </font>
                    </span>
                </font></div>

        </div>


    </div>
    <div class="new-con clear">
        <div class="nec-lift">
            <div class="fk-editor simpleText  ">
                <font color="#4b4b4b">
                    <span style="">
                        <span style="line-height: 29px;">
                            <span style="color: rgb(75, 75, 75); font-size: 16px;">
                                有机生鲜
                            </span>
                            <div style="color: rgb(75, 75, 75);">
                                <span style="font-size: 20px;">
                                    天然无污染水果
                                </span>
                            </div>
                        </span>
                    </span>
                    <div style="color: rgb(75, 75, 75);">
                        <span style="font-size: 20px;">
                            <br>
                        </span>
                    </div>
                    <div>
                        <font style="color: rgb(243, 151, 0);" color="#f39700">
                            <b>
                                <span style="font-size: 42px;">6.8</span>
                            </b><span style="font-size: 42px;">
                    <b>折</b>
                    <span style="font-size: 18px;">
                        <font style="color: rgb(53, 53, 53);" color="#353535">起</font>
                    </span></span></font></div>
                </font>
            </div>
            <div class="xiqing">
                <a  href="/col.jsp?id=105"style="color: white">查看详情 &gt;</a>
            </div>
        </div>
        <div class="nec-right" style="position: relative;">
            <img src="images/banner/middle-banner-small-1.jpg">
            <a href="pub/goods/prodDetail?pId=44d960ad-5698-4abb-b772-cb09860863e9" target="_blank" style="display: inline-block;width: 894px;height: 284px;top:0px;position:absolute;"></a>
        </div>

    </div>
    <div class="new-bottom clear">
        <div class="nw-b">
            <img src="images/banner/middle-banner-small-2.jpg">
            <a href="pub/goods/prodDetail?pId=d9c33e77-86d3-4452-856f-e542e8870b45" target="_blank" style="display: inline-block;width: 288px;height: 189px;top:0px;position:absolute;"></a>
        </div>
        <div class="nw-b">
            <img src="images/banner/middle-banner-small-3.jpg">
            <a href="pub/goods/prodDetail?pId=256818a5-7c0a-49b7-aa85-e45f4a2a79df" target="_blank" style="display: inline-block;width: 288px;height: 189px;top:0px;position:absolute;"></a>
        </div>
        <div class="nw-b">
            <img src="images/banner/middle-banner-small-4.jpg">
            <a href="pub/goods/prodDetail?pId=2b96ef7a-5320-4689-a3fd-56273d626eb7" target="_blank" style="display: inline-block;width: 288px;height: 189px;top:0px;position:absolute;"></a>
        </div>
        <div class="nw-b" style="margin:0">
            <img src="images/banner/middle-banner-small-5.jpg">
            <a href="pub/goods/prodDetail?pId=579afab0-27b7-47da-b7eb-8ebe012e73ab" target="_blank" style="display: inline-block;width: 288px;height: 189px;top:0px;position:absolute;"></a>
        </div>
    </div>
    <!--每日新品特卖结束-->
    <!--蔬果资讯-->
    <div class="fruits">
        <div class="fru-nav">
            <div class="fk-editorb ">
                <font style="color: rgb(103, 141, 30);" color="#678d1e">蔬果资讯</font>
            </div>
            <font style="color: rgb(53, 53, 53);float: right" color="#353535">更多资讯</font>
        </div>
        <div class="fru-lift">
            <div class="frl-nav">
                <ul>
                    <li>品种</li>
                    <li>地区</li>
                    <li>价格</li>
                    <span>时间</span>
                </ul>
            </div>
            <div class="txtMarquee-top">
                <div class="bd">
                    <ul class="infoList">

                        <li><p>苹果</p>
                            <p>河南省济源市</p>
                            <p >5.5/kg</p>
                            04-09
                        </li>
                        <li><p> 西瓜</p>
                            <p>	内蒙古鄂尔多斯</p>
                            <p >10/kg</p>
                            04-09
                        </li>
                        <li><p>葡萄</p>
                            <p>新疆乌鲁木齐</p>
                            <p >19/kg</p>
                            04-09
                        </li>
                        <li><p>车厘子</p><p>河南省郑州市</p><p>	58.5/kg</p> 04-09</li>
                        <li><p>菜心	</p><p>河南省新乡市</p><p>	5.5/kg</p>	04-09</li>
                        <li><p>西兰花</p>	<p>河南省信阳市</p><p>	3.5/kg</p>	04-09</li>
                        <li><p>苹果	</p><p>河南省济源市</p><p>	5.5/kg	</p>04-09</li>
                        <li><p>西瓜	</p><p>内蒙古鄂尔多斯</p><p>10/kg</p>	04-09</li>
                        <li><p>葡萄	</p><p>新疆乌鲁木齐	</p><p>19/kg</p>	04-09</li>
                        <li><p>菜心	</p><p>河南省新乡市</p><p>	5.5/kg	</p>04-09</li>
                        <li><p>西兰花</p><p>	河南省信阳市</p><p>	3.5/kg	</p>04-09</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="fru-right">
            <div id="slideBox" class="slideBox">
                <div class="hd">
                    <!--<ul><li>蜜橘首发</li>-->
                    <!--<li>智利车厘子</li>-->
                    <!--<li>进口青苹果</li>-->
                    <!--</ul>-->
                    <ul><li>1</li><li>2</li><li>3</li></ul>
                </div>
                <div class="bd">
                    <ul>
                        <li><a href="#" target="_blank"><img src="images/banner/bottom-banner-1.jpg" /></a></li>
                        <li><a href="#" target="_blank"><img src="images/banner/bottom-banner-2.jpg" /></a></li>
                        <li><a href="#" target="_blank"><img src="images/banner/bottom-banner-3.jpg" /></a></li>
                    </ul>
                </div>

            </div>

        </div>
    </div>
    <!--蔬果资讯结束-->
</div>
<!--主页内容结束-->
<!--底部-->
<div class="footer">
    <div class="ft-con">
        <div class="ft-top">
            <img src="images/public/fot-1.jpg">
        </div>
        <div class="ft-bo">
            <div class="ft-b">
                <h3>服务保障</h3>
                <p>正品保证</p>
                <p>7天无理由退换</p>
                <p>退货返运费</p>
                <p>7X15小时客户服务</p>

            </div>
            <div class="ft-b">
                <h3>支付方式</h3>
                <p>公司转账</p>
                <p>货到付款</p>
                <p>在线支付</p>
                <p>分期付款</p>

            </div>
            <div class="ft-b">
                <h3>商家服务</h3>
                <p>商家入驻</p>
                <p>培训中心</p>
                <p>广告服务</p>
                <p>服务市场</p>

            </div>
            <div class="ft-b">
                <h3>服务保障</h3>
                <p>免运费</p>
                <p>海外配送</p>
                <p>EMS</p>
                <p>211限时达</p>

            </div>

        </div>
        <div class="banq">
            <p>©2018 果然新鲜 版权所有</p>
        </div>

    </div>

</div>
<input type="hidden" id="mobileNo" value="${requestScope.mobileNo}">
<input type="hidden" id="username" value="${requestScope.username}">

<script type="text/javascript" src="js/index.js"></script>
</body>
</html>
