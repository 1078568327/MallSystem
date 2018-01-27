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
    <title>确认订单</title>
    <link type="text/css" rel="stylesheet" href="css/share.css">
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/order.css">
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
                <li><a href="pub/index" ><span>首页</span></a> </li>
                <li><a href="pub/hotProduct">蔬果热卖</a> </li>
                <li><a href="pub/allProduct"><span>全部产品</span></a> </li>
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

<!--内容开始-->
<div class="payment-interface w1200">
    <div class="pay-info">
        <div class="info-tit">
            <h3>选择收货地址</h3>
        </div>
        <ul class="pay-dz">
            <div id="address-box">
                <c:forEach items="${requestScope.shippingAddressList}" var="shippingAddress">

                    <c:choose>
                        <c:when test="${shippingAddress.isDefault == 1}">
                            <li class="current">
                                <input type="hidden" value="${shippingAddress.address.id}">
                                <h3><span class="sp1">${shippingAddress.address.city}</span><span class="sp2">${shippingAddress.address.district}</span>
                                    （<span class="sp3">${shippingAddress.address.consignee}</span> 收）
                                </h3>
                                <p><span class="sp1">${shippingAddress.address.detail}</span>
                                    <span class="sp2">${shippingAddress.address.mobileNo}</span>
                                    <span class="sp4" style="display: none;">${shippingAddress.address.postcode}</span>
                                </p>
                                <a href="JavaScript:;" xiugai="">修改</a>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li>
                                <input type="hidden" value="${shippingAddress.address.id}">
                                <h3><span class="sp1">${shippingAddress.address.city}</span><span class="sp2">${shippingAddress.address.district}</span>
                                    （<span class="sp3">${shippingAddress.address.consignee}</span> 收）
                                </h3>
                                <p><span class="sp1">${shippingAddress.address.detail}</span>
                                    <span class="sp2">${shippingAddress.address.mobileNo}</span>
                                    <span class="sp4" style="display: none;">${shippingAddress.address.postcode}</span>
                                </p>
                                <a href="JavaScript:;" xiugai="">修改</a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>
            </div>

            <div style="clear:both;"></div>
        </ul>
        <P class="pay-xgdz">&nbsp;</P>
        <button class="pay-xdz-btn">使用新地址</button>
    </div>
    <div class="pay-info">
        <div class="info-tit" style="border-bottom:0;">
            <h3>订单信息</h3>
        </div>
    </div>
    <div class="cart-con-info">
        <div class="cart-con-tit" style="margin:20px 0 5px;">
            <p class="p1" style="width:420px;">
                <input type="checkbox" value="" name="hobby"></input>
                <span>商家：果然新鲜专卖店</span>
            </p>
            <p class="p4" style="width:130px;">数量</p>
            <p class="p8" style="width:75px;">运费</p>
            <p class="p5">单价（元）</p>
            <p class="p6" style="width:173px;">金额（元）</p>
            <p class="p7">配送方式</p>
        </div>
        <div class="info-mid">

            <c:forEach items="${requestScope.shoppingCartList}" var="shoppingCart">

                <input type="hidden" value="${shoppingCart.goods.id}">
                <div class="mid-tu f-l">
                    <a href="#"><img src="${shoppingCart.goods.goodsImages}" style="width:110px;height: 80px;" /></a>
                </div>
                <div class="mid-font f-l" style="margin-right:40px; width:220px;" >
                    <a href="javascript:"><br/>${shoppingCart.goods.goodsName}</a>
                </div>
                <div class="mid-sl f-l" style="margin:10px 54px 0px 0px;">
                    <a href="JavaScript:;" class="sl-left">-</a>
                    <input type="text" value="${shoppingCart.amount}" />
                    <a href="JavaScript:;" class="sl-right">+</a>
                </div>
                <p class="mid-yunfei f-l" style="margin-left: 10px;">¥ 0.00</p>
                <p class="mid-dj f-l">¥ ${shoppingCart.goods.goodsPrice}</p>
                <p class="mid-je f-l" style="margin:10px 40px 0px 0px;">¥ ${shoppingCart.goods.goodsPrice * shoppingCart.amount}</p>
                <div class="mid-chaozuo f-l">
                    <select>
                        <option>送货上门</option>
                        <option>快递包邮</option>
                    </select>
                </div>
                <div style="clear:both;"></div>

            </c:forEach>

        </div>
        <div class="info-heji">
            <p class="f-r">店铺合计(含运费)：<span>¥${requestScope.totalPrice}</span></p>
            <h3 class="f-r"></h3>
        </div>
        <div class="info-tijiao">
            <p class="p1">实付款：<span>¥${requestScope.totalPrice}</span></p>
            <button class="btn" id="btn-submit">提交订单</button>
        </div>
    </div>
</div>


<!--确认订单（新增地址）-->
<div class="confirmation-tanchuang" xgdz1="">
    <div class="tanchuang-bg" style="position: fixed;"></div>
    <div class="tanchuang-con" style="position: fixed; top:60px;">
        <div class="tc-title">
            <h3>新增地址</h3>
            <a href="JavaScript:;" dz-guan=""><img src="images/public/close-select-city.gif" /></a>
            <div style="clear:both;"></div>
        </div>
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
                        <%--<ul>
                            <li class="current"><a href="#">乌鲁木齐</a></li>
                            <li><a href="javascript:void(0)">昌吉</a></li>
                            <li><a href="javascript:void(0)">巴音</a></li>
                            <li><a href="javascript:void(0)">郭楞</a></li>
                            <li><a href="javascript:void(0)">伊犁</a></li>
                            <li><a href="javascript:void(0)">阿克苏</a></li>
                            <li><a href="javascript:void(0)">喀什</a></li>
                            <li><a href="javascript:void(0)">哈密</a></li>
                            <li><a href="javascript:void(0)">克拉玛依</a></li>
                            <li><a href="javascript:void(0)">博尔塔拉</a></li>
                            <li><a href="javascript:void(0)">吐鲁番</a></li>
                            <li><a href="javascript:void(0)">和田</a></li>
                            <li><a href="javascript:void(0)">石河子</a></li>
                            <li><a href="javascript:void(0)">克孜勒苏</a></li>
                            <li><a href="javascript:void(0)">阿拉尔</a></li>
                            <li><a href="javascript:void(0)">五家渠</a></li>
                            <li><a href="javascript:void(0)">图木舒克</a></li>
                            <li><a href="javascript:void(0)">库尔勒</a></li>
                            <div style="clear:both;"></div>
                        </ul>--%>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">详细地址<span>*</span></p>
                <textarea id="add-detail" class="textarea1" placeholder="请如实填写您的详细信息，如街道名称、门牌号、楼层号和房间号。"></textarea>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">邮政编码<span></span></p>
                <input type="text" id="add-postcode" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">收货人姓名<span>*</span></p>
                <input type="text" id="add-consignee"/>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">联系电话<span>*</span></p>
                <input type="text" id="add-mobileNo" />
                <div style="clear:both;"></div>
            </li>
        </ul>
        <button class="btn-pst2" id="btn-add-address">保存</button>
    </div>
</div>

<!--修改地址-->
<div class="confirmation-tanchuang" xgdz2="">
    <div class="tanchuang-bg" style="position: fixed;"></div>
    <div class="tanchuang-con" style="position: fixed; top:60px;">
        <div class="tc-title">
            <h3>修改地址</h3>
            <a href="JavaScript:;" dz-guan=""><img src="images/public/close-select-city.gif" /></a>
            <div style="clear:both;"></div>
        </div>
        <ul class="tc-con2">
            <li class="tc-li1">
                <p class="l-p">所在地区<span>*</span></p>
                <div class="xl-dz">
                    <div class="dz-left f-l">
                        <p></p>
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
                        <input type="text" placeholder="请填写区名或者县名" style="height: 33px;" />
                        <%--<ul>
                            <li class="current"><a href="javascript:void(0)">乌鲁木齐</a></li>
                            <li><a href="javascript:void(0)">昌吉</a></li>
                            <li><a href="javascript:void(0)">巴音</a></li>
                            <li><a href="javascript:void(0)">郭楞</a></li>
                            <li><a href="javascript:void(0)">伊犁</a></li>
                            <li><a href="javascript:void(0)">阿克苏</a></li>
                            <li><a href="javascript:void(0)">喀什</a></li>
                            <li><a href="javascript:void(0)">哈密</a></li>
                            <li><a href="javascript:void(0)">克拉玛依</a></li>
                            <li><a href="javascript:void(0)">博尔塔拉</a></li>
                            <li><a href="javascript:void(0)">吐鲁番</a></li>
                            <li><a href="javascript:void(0)">和田</a></li>
                            <li><a href="javascript:void(0)">石河子</a></li>
                            <li><a href="javascript:void(0)">克孜勒苏</a></li>
                            <li><a href="javascript:void(0)">阿拉尔</a></li>
                            <li><a href="javascript:void(0)">五家渠</a></li>
                            <li><a href="javascript:void(0)">图木舒克</a></li>
                            <li><a href="javascript:void(0)">库尔勒</a></li>
                            <div style="clear:both;"></div>
                        </ul>--%>
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
                <input type="text" id="postcode"/>
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">收货人姓名<span>*</span></p>
                <input type="text" class="shxm" />
                <div style="clear:both;"></div>
            </li>
            <li class="tc-li1">
                <p class="l-p">联系电话<span>*</span></p>
                <input type="text" class="lxdh" />
                <div style="clear:both;"></div>
            </li>
        </ul>
        <button class="btn-pst2" id="btn-update-address">保存</button>
    </div>
</div>

<input type="hidden" id="token" value="${requestScope.token}">
<input type="hidden" id="mobileNo" value="${requestScope.mobileNo}">
<input type="hidden" id="username" value="${requestScope.username}">

<script type="text/javascript" src="js/order.js"></script>
</body>
</html>
<%@ include file="bottom.jsp"%>