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
    <link rel="stylesheet" type="text/css" href="css/shippingAddress.css">
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
            <li class="per-li5"><a href="#">购物车<span>></span></a></li>
            <li class="per-li6 current-li"><a href="pri/usr/shippingAddress">管理收货地址<span>></span></a></li>
            <li class="per-li7"><a href="#">店铺收藏<span>></span></a></li>
            <li class="per-li8"><a href="#">购买记录<span>></span></a></li>
            <li class="per-li9"><a href="#">浏览记录<span>></span></a></li>
            <li class="per-li10"><a href="#">会员中心<span>></span></a></li>
        </ul>
    </div>
    <div class="management f-r">
        <div class="tanchuang-con">
            <div class="tc-title">
                <h3>我的收货地址</h3>
            </div>
            <font class="xinxi">请认真填写以下信息！</font>
            <ul class="tc-con2">
                <li class="tc-li1">
                    <p class="l-p">所在地区<span>*</span></p>
                    <div class="xl-dz">
                        <div class="dz-left f-l">
                            <p id="add-city"></p>
                            <ul style="overflow: scroll;height: 300px;">
                                <li><a href="javascript:void(0)">广州市</a></li>
                                <li><a href="javascript:void(0)">深圳市</a></li>
                                <li><a href="javascript:void(0)">珠海市</a></li>
                                <li><a href="javascript:void(0)">汕头市</a></li>
                                <li><a href="javascript:void(0)">佛山市</a></li>
                                <li><a href="javascript:void(0)">韶关市</a></li>
                                <li><a href="javascript:void(0)">湛江市</a></li>
                                <li><a href="javascript:void(0)">肇庆市</a></li>
                                <li><a href="javascript:void(0)">江门市</a></li>
                                <li><a href="javascript:void(0)">茂名市</a></li>
                                <li><a href="javascript:void(0)">惠州市</a></li>
                                <li><a href="javascript:void(0)">梅州市</a></li>
                                <li><a href="javascript:void(0)">汕尾市</a></li>
                                <li><a href="javascript:void(0)">河源市</a></li>
                                <li><a href="javascript:void(0)">阳江市</a></li>
                                <li><a href="javascript:void(0)">清远市</a></li>
                                <li><a href="javascript:void(0)">东莞市</a></li>
                                <li><a href="javascript:void(0)">中山市</a></li>
                                <li><a href="javascript:void(0)">潮州市</a></li>
                                <li><a href="javascript:void(0)">揭阳市</a></li>
                                <li><a href="javascript:void(0)">云浮市</a></li>
                                <li><a href="javascript:void(0)">增城市</a></li>
                                <li><a href="javascript:void(0)">从化市</a></li>
                                <li><a href="javascript:void(0)">南雄市</a></li>
                                <li><a href="javascript:void(0)">乐昌市</a></li>
                                <li><a href="javascript:void(0)">英德市</a></li>
                                <li><a href="javascript:void(0)">连州市</a></li>
                                <li><a href="javascript:void(0)">台山市</a></li>
                                <li><a href="javascript:void(0)">开平市</a></li>
                                <li><a href="javascript:void(0)">鹤山市</a></li>
                                <li><a href="javascript:void(0)">恩平市</a></li>
                                <li><a href="javascript:void(0)">廉江市</a></li>
                                <li><a href="javascript:void(0)">雷州市</a></li>
                                <li><a href="javascript:void(0)">吴川市</a></li>
                                <li><a href="javascript:void(0)">高州市</a></li>
                                <li><a href="javascript:void(0)">化州市</a></li>
                                <li><a href="javascript:void(0)">信宜市</a></li>
                                <li><a href="javascript:void(0)">高要市</a></li>
                                <li><a href="javascript:void(0)">四会市</a></li>
                                <li><a href="javascript:void(0)">兴宁市</a></li>
                                <li><a href="javascript:void(0)">陆丰市</a></li>
                                <li><a href="javascript:void(0)">阳春市</a></li>
                                <li><a href="javascript:void(0)">普宁市</a></li>
                                <li><a href="javascript:void(0)">罗定市</a></li>
                            </ul>
                        </div>
                        <div class="dz-right f-l">
                            <input type="text" id="add-district" placeholder="请填写区名或者县名" style="height: 33px;" />
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <div style="clear:both;"></div>
                </li>
                <li class="tc-li1">
                    <p class="l-p">详细地址<span>*</span></p>
                    <textarea class="textarea1" placeholder="请如实填写您的详细信息，如街道名称、门牌号、楼层号和房间号。"></textarea>
                    <div style="clear:both;"></div>
                </li>
                <li class="tc-li1">
                    <p class="l-p">邮政编码<span></span></p>
                    <input type="text" />
                    <div style="clear:both;"></div>
                </li>
                <li class="tc-li1">
                    <p class="l-p">收货人姓名<span>*</span></p>
                    <input type="text" />
                    <div style="clear:both;"></div>
                </li>
                <li class="tc-li1">
                    <p class="l-p">联系电话<span>*</span></p>
                    <input type="text" />
                    <div style="clear:both;"></div>
                </li>
            </ul>
            <button class="btn-pst2">保存</button>
        </div>
        <div class="man-info">
            <font>您已经保存三个地址！</font>
            <div class="man-if-con">
                <div class="man-tit">
                    <p class="p1">收货人</p>
                    <p class="p2">所在地区</p>
                    <p class="p3">详细地址</p>
                    <p class="p4">邮编</p>
                    <p class="p5">电话/手机</p>
                    <p class="p6">操作</p>
                </div>
                <ul class="man-ul1">
                    <li>
                        <p class="p1">赵珍珍</p>
                        <p class="p2">重庆 重庆市 南岸区</p>
                        <p class="p3">南坪左岸阳光c2-10-3</p>
                        <p class="p4">563000</p>
                        <p class="p5">18983945092</p>
                        <p class="p6">
                            <a href="#">修改</a> |
                            <a href="#">删除</a>
                        </p>
                        <p class="p7"><a href="#">&nbsp; 默认地址</a></p>
                        <div style="clear:both;"></div>
                    </li>
                    <li>
                        <p class="p1">赵珍珍</p>
                        <p class="p2">重庆 重庆市 南岸区 南坪街道</p>
                        <p class="p3">南岸区南坪福红路19号乙单元7-2</p>
                        <p class="p4">000000</p>
                        <p class="p5">18983945092</p>
                        <p class="p6">
                            <a href="#">修改</a> |
                            <a href="#">删除</a> |&nbsp;
                            <a href="#">设为默认地址</a>
                        </p>
                        <div style="clear:both;"></div>
                    </li>
                    <li>
                        <p class="p1">赵珍珍</p>
                        <p class="p2">浙江省 杭州市 余杭区崇贤街道</p>
                        <p class="p3">崇贤镇大安工业区彩诗纺织有限公司</p>
                        <p class="p4">311108</p>
                        <p class="p5">18983945092</p>
                        <p class="p6">
                            <a href="#">修改</a> |
                            <a href="#">删除</a> |&nbsp;
                            <a href="#">设为默认地址</a>
                        </p>
                        <div style="clear:both;"></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div style="clear:both;"></div>
</div>

<input type="hidden" id="token" value="${requestScope.token}">
<input type="hidden" id="mobileNo" value="${requestScope.mobileNo}">
<input type="hidden" id="username" value="${requestScope.username}">

<script type="text/javascript" src="js/shippingAddress.js"></script>
</body>
</html>
<%@ include file="bottom.jsp"%>