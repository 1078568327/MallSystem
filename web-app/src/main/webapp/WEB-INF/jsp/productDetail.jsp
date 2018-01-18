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
    <title>商品详情</title>
    <link type="text/css" rel="stylesheet" href="css/share.css">
    <link rel="stylesheet" type="text/css" href="css/productDetail.css">
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
            <div class="hr-car">
                <i class="iconfont"style="font-size: 40px;margin-right: 10px">&#xe633;</i>
                您的购物车内暂时没有任何产品。
            </div>
        </div>
    </div>
</div>
<!--顶部导航结束-->

<!--banner图片-->
<div class="her-banner">

</div>

<!--主页内容-->
<div class="content">
    <div class="cont-top">
        <div class="cont-left">
            <div class="ctl-img" style="width: 400px;height: 400px;margin-left:80px">
                <img src="${goods.goodsImages}" style="margin-top: 0;width: 400px;height: 400px;">
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
            <div class="J_productTitle title g_minor">
                <span>${goods.goodsName}</span>
                <span id="productQrCode" class="webSiteQrCode">&nbsp;
                <div class="code">
                    <img src="images/qrCode%20(1).gif">
                    <p>扫描二微码</p>
                </div>
                </span>
            </div>
            <div class="pic">
                <span class="ppi">价格:</span>
                <span class="f-mallUnit">￥</span>
                <span class="pcc">${goods.goodsPrice}</span>
            </div>
            <div class="pict">
                <div class="f-proSatifySumWrap">
                    <div class="f-satifyDetail">
                        <span class="g_minor  salesVolume">评论：</span><span class="J_commNum">${goods.commentAmount}</span>条
                    </div>
                    <div class="J_pdDetailBorder f-pdDetailBorder"></div>
                    <div class="f-satifyDetail">
                        <span class="g_minor  salesVolume">收藏：</span>${goods.collectAmount}
                    </div>
                </div>
            </div>

            <div class="fk-pd5MallCartCount">
                <div class="f-cartbuyCountWrap">
                    <span class="f-propName g_minor" style="width:75px;min-width:75px;max-width: 75px;">购买数量：</span>
                    <input type="text"  value="1" class="g_itext cartBuyCount f-cartBuyCount">
                </div>
                <div class="f-buyCountBtn">
                    <div  class="f-countBtn mallJian"></div>
                    <div  class="f-countBtn disableMallJian"></div>
                </div>
            </div>
            <div class="fk-pd5MallActBtns">
                <div class="buttn" id="btn-add">
                    加入购物车
                </div>
                <div class="buttn butto" id="btn-buy">
                    立即购买
                </div>

            </div>

        </div>
    </div>

    <div class="cont-bot">
        <div class="hd">
            <ul style="margin-left: 80px;">
                <li class="active">
                    <div class="hd1 acti" >
                    </div>
                    产品详情
                </li>
                <li>
                    <div class="hd1">
                    </div>
                    产品评论(1)
                </li>
                <li>
                    <div class="hd1">
                    </div>
                    销售记录(0)
                </li>
            </ul>

        </div>
        <div class="bd">
            <div class="bd1"style="display: block">
                <c:forEach items="${detailImages}" var="image">
                    <img src="images/abroad/${image}">
                </c:forEach>
            </div>
            <div class="bd1">
                <img src="images/or-5.jpg">
                <img src="images/or-6.jpg">
            </div>
            <div class="bd1">
                <div class="sale">
                    <ul>
                        <li>买家</li>
                        <li>选项​​信息</li>
                        <li>数量</li>
                        <li>成交时间</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</div>
<!--主页内容结束-->

<!--弹框-->
<div class="popup">
    <div class="p-login">
        <div class="del">×</div>
        <div class="lg-cont">
            <div class="lhd">
                <ul>
                    <li class="active">登录</li>
                    <li>注册</li>
                </ul>
                <div class="lhdfoot">
                    <div class="lhdbottom"  >
                    </div>
                </div>

            </div>
            <div class="lbd">
                <div class="lbd1"style="display: block">
                    <div id="memberLoginAcct" class="J_memberLoginItem memberLoginDialogItem">
                        <input id="memberAcct" class="generateInput memberAcctInput" type="text" value="" placeholder="账号">
                    </div>
                    <div id="memberLoginPwd" class="J_memberLoginItem memberLoginDialogItem itemSpace">
                        <input id="memberPwd" class="generateInput memberPwdInput" type="password" placeholder="密码"}>
                    </div>
                    <div class="loginButton loginButton">
                        <div class="middle">登录</div>
                    </div>
                    <div class="bott"></div>
                </div>
                <div class="lbd1">
                    <div class="msv">
                        <div class="memberSignupItem">
                            <div class="itemMiddle">
                                <input type="text" placeholder="账号" >
                            </div>
                            <div class="itemRight">*</div>
                        </div>
                        <div class="memberSignupItem ">
                            <div class="itemMiddle">
                                <input type="password" id="memberSignupPwd" placeholder="密码" maxlength="50">
                            </div>
                            <div class="itemRight">*</div>
                        </div>
                        <div class="memberSignupItem">
                            <div class="itemMiddle">
                                <input type="password" id="memberSignupRepwd" placeholder="确认密码" maxlength="50">
                            </div>
                            <div class="itemRight">*</div>
                        </div>
                        <div class="memberSignupItem">
                            <div class="itemMiddle">
                                <input id="name" name="姓名" placeholder="姓名" class="userAddItem isCheckUAI" type="text" maxlength="50">
                            </div>
                            <div class="itemRight">*</div>
                        </div>
                        <div class="memberSignupItem">
                            <div class="itemMiddle">
                                <input id="email" name="邮箱" placeholder="邮箱" class="userAddItem" type="text" maxlength="50">
                            </div>
                            <div class="itemRight"></div>
                        </div>
                        <div class="memberSignupItem">
                            <div class="itemMiddle">
                                <input id="phone" name="电话" placeholder="电话" class="userAddItem" type="text" maxlength="50">
                            </div>
                            <div class="itemRight"></div>
                        </div>
                        <div class="memberSignupItem_remark">
                            <div class="itemMiddle">
                                <textarea id="memberSignupRemark" placeholder="留言" maxlength="200"></textarea>
                            </div>
                            <div class="itemRight"></div>
                        </div>
                        <div class="memberSignupItem_captcha">
                            <div class="itemMiddle" style="float:left;width: 150px;">
                                <input id="memberSignupCaptcha" type="text" maxlength="4" placeholder="验证码">
                            </div>
                            <div class="itemRightp">
                                <img alt="" id="memberSignupCaptchaImg" class="memberSignupCaptchaImg" onclick="Site.changeCaptchaImg(this)" title="看不清，换一张" src="images/validateCode.jpg">
                            </div>
                        </div>
                    </div>
                    <div class="loginButton loginButton">
                        <div class="middle">注册</div>
                    </div>
                    <div class="bott"></div>
                </div>
            </div>

        </div>
    </div>
</div>
<!--弹框结束-->



<input type="hidden" id="mobileNo" value="${requestScope.mobileNo}">
<input type="hidden" id="username" value="${requestScope.username}">

<script type="text/javascript" src="js/productDetail.js"></script>
</body>
</html>
<%@ include file="bottom.jsp"%>