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
    <title>会员详情页面</title>
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
                <dd><a href="back/orderList">订单列表</a></dd>
                <dd><a href="back/refundOrder">退款订单</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>会员管理</dt>
                <dd><a href="back/userList" class="active">会员列表</a></dd>
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
            <h2 class="fl">会员详情</h2>
            <a href="adjust_funding.html" class="fr top_rt_btn money_icon">资金管理</a>
        </div>
        <ul class="ulColumn2">
            <li>
                <span class="item_name" style="width:120px;">上传头像：</span>
                <label class="uploadImg">
                    <input type="file"/>
                    <span>上传头像</span>
                </label>
            </li>
            <li>
                <span class="item_name" style="width:120px;">会员名称：</span>
                <input type="text" class="textbox textbox_225" value="${user.username}" placeholder="会员账号..."/>
            </li>
            <li>
                <span class="item_name" style="width:120px;">登陆密码：</span>
                <input type="text" class="textbox textbox_225" value="${user.password}" placeholder="会员密码..." style="width:280px;" />
            </li>
            <li>
                <span class="item_name" style="width:120px;">会员等级：</span>
                <select class="select">
                    <option>会员等级</option>
                    <option selected="selected">普通会员</option>
                    <option>高级会员</option>
                </select>
            </li>
            <li>
                <span class="item_name" style="width:120px;">电子邮箱：</span>
                <input type="email" class="textbox textbox_225" value="${user.email}" placeholder="电子邮件地址..."/>
            </li>
            <li>
                <span class="item_name" style="width:120px;">手机号码：</span>
                <input type="tel" class="textbox textbox_225" value="${user.mobileNo}" placeholder="手机号码..."/>
            </li>
            <li>
                <span class="item_name" style="width:120px;">收货地址：</span>
                <input class="select" type="text" value="${address.province}" />
                <input class="select" type="text" value="${address.city}" />
                <input class="select" type="text" value="${address.district}" />
            </li>
            <li>
                <span class="item_name" style="width:120px;">详细地址：</span>
                <input type="text" class="textbox textbox_295" value="${address.detail}" placeholder="详细地址..."/>
            </li>
            <li>
                <span class="item_name" style="width:120px;"></span>
                <input type="submit" class="link_btn" value="更新/保存"/>
            </li>
        </ul>
    </div>
</section>
<script src="js/amcharts.js" type="text/javascript"></script>
<script src="js/serial.js" type="text/javascript"></script>
<script src="js/pie.js" type="text/javascript"></script>
<script type="text/javascript">
    $(".del").click(function(){
        var gid = $(this).siblings("input[type=hidden]").val();
        if(confirm("确认下架商品吗？")){
            window.location.href = "back/downGoods?id=" + gid;
        }else{

        }
    });
</script>

</body>
</html>
