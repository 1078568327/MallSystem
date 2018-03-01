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
    <title>订单列表</title>
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
                <dt>商品管理</dt>
                <!--当前链接则添加class:active-->
                <dd><a href="back/index">商品列表</a></dd>
                <dd><a href="back/toAddGoods">商品上架</a></dd>
                <dd><a href="back/bin">下架的商品</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>订单信息</dt>
                <dd><a href="back/orderList" class="active">订单列表</a></dd>
                <dd><a href="back/refundOrder">退款订单</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>会员管理</dt>
                <dd><a href="back/userList">会员列表</a></dd>
                <dd><a href="back/addUser">添加会员（详情）</a></dd>
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
            <h2 class="fl">订单列表</h2>
            <a class="fr top_rt_btn add_icon">添加商品</a>
        </div>
        <section class="mtb">
            <select class="select">
                <option>订单状态</option>
                <option>待付款</option>
                <option>待发货</option>
                <option>待评价</option>
            </select>
            <input type="text" class="textbox textbox_225" placeholder="输入订单编号或收件人姓名/电话..." style="height:38px;"/>
            <input type="button" value="查询" class="group_btn"/>
        </section>
        <table class="table" style="font-size:12px;">
            <tr>
                <th>订单编号</th>
                <th>收件人</th>
                <th>联系电话</th>
                <th>收件人地址</th>
                <th>订单金额</th>
                <th>配送方式</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${requestScope.orderList}" var="order">

                <tr>
                    <td class="center order-id">${order.id}</td>
                    <td style="text-align:center;">${order.address.consignee}</td>
                    <td style="text-align:center;">${order.address.mobileNo}</td>
                    <td>
                        <address>${order.address.province}${order.address.city}${order.address.district}${order.address.detail}</address>
                    </td>
                    <td class="center"><strong class="rmb_icon">${order.totalPrice}</strong></td>
                    <td class="center">快递</td>
                    <td class="center">
                        <a href="back/orderDetail?id=${order.id}" title="查看订单" class="link_icon query_order" target="_blank">&#118;</a>
                        <a href="javascript:void(0)" title="取消订单" class="link_icon del_order">&#100;</a>
                    </td>
                </tr>

            </c:forEach>

        </table>
        <aside class="paging">
            <a href="back/orderList?pageNum=1">第一页</a>
            <a href="back/orderList?pageNum=1">1</a>
            <a href="back/orderList?pageNum=2">2</a>
            <a href="back/orderList?pageNum=2">最后一页</a>
        </aside>
    </div>
</section>
<script src="js/amcharts.js" type="text/javascript"></script>
<script src="js/serial.js" type="text/javascript"></script>
<script src="js/pie.js" type="text/javascript"></script>
<script type="text/javascript">

    $(".del_order").click(function(){
        var oid = $(this).parent().siblings(".order-id").text();
        if(confirm("确认取消订单吗？")){
            window.location.href = "back/cancelOrder?id=" + oid;
        }else{

        }
    });

</script>

</body>
</html>
