<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>订单详情</title>
    <link rel="stylesheet" type="text/css" href="css/style2.css" />
    <script src="scripts/jquery.js"></script>
    <script src="scripts/jquery.mCustomScrollbar.concat.min.js"></script>
    <script>

        (function($){
            $(window).load(function(){

                $("a[rel='load-content']").click(function(e){
                    e.preventDefault();
                    var url=$(this).attr("href");
                    $.get(url,function(data){
                        $(".content .mCSB_container").append(data); //load new content inside .mCSB_container
                        //scroll-to appended content
                        $(".content").mCustomScrollbar("scrollTo","h2:last");
                    });
                });

                $(".content").delegate("a[href='top']","click",function(e){
                    e.preventDefault();
                    $(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
                });

            });
        })(jQuery);
    </script>
</head>
<body>
<!--header-->
<header>
    <h1><img src="images/public/admin_logo.png"/></h1>
    <ul class="rt_nav">
        <li><a href="http://www.deathghost.cn" target="_blank" class="website_icon">站点首页</a></li>
        <li><a href="#" class="clear_icon">清除缓存</a></li>
        <li><a href="#" class="admin_icon">qinxi</a></li>
        <li><a href="#" class="set_icon">账号设置</a></li>
        <li><a href="login.html" class="quit_icon">安全退出</a></li>
    </ul>
</header>
<!--aside nav-->
<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
    <h2><a href="index.html">起始页</a></h2>
    <ul>
        <li>
            <dl>
                <dt>订单列表</dt>
                <!--当前链接则添加class:active-->
                <dd><a href="back/index">商品列表</a></dd>
                <dd><a href="back/toAddGoods">商品上架</a></dd>
                <dd><a href="back/bin" class="active">下架的商品</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>订单信息</dt>
                <dd><a href="back/orderList" class="active">订单列表</a></dd>
                <dd><a href="order_detail.html">取消订单</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>会员管理</dt>
                <dd><a href="user_list.html">会员列表</a></dd>
                <dd><a href="user_detail.html">添加会员（详情）</a></dd>
                <dd><a href="user_rank.html">会员等级</a></dd>
                <dd><a href="adjust_funding.html">会员资金管理</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>基本设置</dt>
                <dd><a href="setting.html">站点基础设置</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>配送与支付设置</dt>
                <dd><a href="express_list.html">配送方式</a></dd>
                <dd><a href="pay_list.html">支付方式</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>在线统计</dt>
                <dd><a href="discharge_statistic.html">流量统计</a></dd>
                <dd><a href="sales_volume.html">销售额统计</a></dd>
            </dl>
        </li>
        <li>
            <p class="btm_infor">© 2018 qinxi 版权所有</p>
        </li>
    </ul>
</aside>

<style>
    .dataStatistic{width:400px;height:200px;border:1px solid #ccc;margin:0 auto;margin:10px;overflow:hidden}
    #cylindrical{width:400px;height:200px;margin-top:-15px}
    #line{width:400px;height:200px;margin-top:-15px}
    #pie{width:400px;height:200px;margin-top:-15px}
</style>
<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">订单详情示例</h2>
        </div>
        <table class="table" style="font-size:14px;">
            <tr>
                <td>收件人：${order.address.consignee}</td>
                <td>联系电话：${order.address.mobileNo}</td>
                <td>收件地址：${order.address.province}${order.address.city}${order.address.district}${order.address.detail}</td>
                <td>付款时间：<fmt:formatDate type="both" value="${order.createTime}" /></td>
            </tr>
            <tr>
                <td>下单时间：<fmt:formatDate type="both" value="${order.createTime}" /></td>
                <td>付款时间：<fmt:formatDate type="both" value="${order.createTime}" /></td>
                <td>确认时间：<fmt:formatDate type="both" value="${order.createTime}" /></td>
                <td>评价时间时间：---</td>
            </tr>
            <tr>
                <td>订单状态：<a>已付款，待发货</a></td>
                <td colspan="3">订单备注：<mark>帮我检查好呀~谢谢~</mark></td>
            </tr>
        </table>
        <table class="table" style="font-size:12px;">
            <tr>
                <td class="center"><img src="${order.goods.goodsImages}" width="50" height="50"/></td>
                <td>${order.goods.goodsName}</td>
                <td class="center">${order.id}</td>
                <td class="center"><strong class="rmb_icon">${order.goods.goodsPrice}</strong></td>
                <td class="center"><strong>${order.amount}</strong></td>
                <td class="center"><strong class="rmb_icon">${order.totalPrice}</strong></td>
                <td class="center">包</td>
            </tr>
        </table>
        <aside class="mtb" style="text-align:right;">
            <label>管理员操作：</label>
            <input type="text" class="textbox textbox_295" placeholder="管理员操作备注"/>
            <input type="button" value="打印订单" class="group_btn"/>
            <input type="button" value="确认订单" class="group_btn"/>
            <input type="button" value="付款" class="group_btn"/>
            <input type="button" value="配货" class="group_btn"/>
            <input type="button" value="发货" class="group_btn"/>
            <input type="button" value="确认收货" class="group_btn"/>
        </aside>
    </div>
</section>
<script src="js/amcharts.js" type="text/javascript"></script>
<script src="js/serial.js" type="text/javascript"></script>
<script src="js/pie.js" type="text/javascript"></script>
<script type="text/javascript">

    $(".query_order").click(function(){
        var oid = $(this).parent().siblings(".order-id").text();
        alert(oid);
        if(confirm("确认上架商品吗？")){
//            window.location.href = "back/upGoods?id=" + oid;
        }else{

        }
    });

    $(".del_order").click(function(){
        var oid = $(this).parent().siblings(".order-id").text();
        if(confirm("确认彻底删除商品吗？")){
//            window.location.href = "back/deleteGoods?id=" + oid;
        }else{

        }
    });

</script>

</body>
</html>
