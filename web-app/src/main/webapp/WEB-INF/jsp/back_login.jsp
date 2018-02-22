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
    <title>商城后台管理系统登录</title>
    <link rel="stylesheet" type="text/css" href="css/style2.css" />
    <style>
        body{height:100%;background:#16a085;overflow:hidden;}
        canvas{z-index:-1;position:absolute;}
    </style>
    <script type="text/javascript" src="scripts/jquery.js"></script>
    <script type="text/javascript" src="scripts/jquery-3.1.1.min.js"></script>
    <script src="js/verificationNumbers.js"></script>
    <script src="js/Particleground.js"></script>
    <script>
        $(document).ready(function() {
            //粒子背景特效
            $('body').particleground({
                dotColor: '#5cbdaa',
                lineColor: '#5cbdaa'
            });
            //验证码
            createCode();
            //测试提交，对接程序删除即可
            $(".submit_btn").click(function(){
                $(this).attr("disable",true);
                var account = $("#account").val();
                var psw = $("#psw").val();
                if(account === "" || psw === ""){
                    $(".submit_btn").attr("disable",false);
                    return;
                }
                $.ajax({
                    url:"back/usr/login",
                    type: "post",
                    data:{
                        adminAccount : account,
                        password : psw
                    },
                    dataType:"json",
                    // contentType : "application/json;charset=utf-8",
                    success : function (data) {
                        $("#btn-login").attr("disable",false);
                        if(data.error_login !== "" && data.error_login !== undefined){
                            alert(data.error_login);
                            return;
                        }
                        if(data.isLogin === true) {
                            window.location.href = "back/index";
                        }
                    },
                    error : function (data) {
                        $("#btn-login").attr("disable",false);
                        alert("ajax请求失败");
                    }
                });
            });
        });
    </script>
</head>
<body>
<dl class="admin_login">
    <dt>
        <strong>商城后台管理系统</strong>
        <em>Management System</em>
    </dt>
    <dd class="user_icon">
        <input type="text" placeholder="账号" id="account" class="login_txtbx" style="width: 300px;height: 42px;"/>
    </dd>
    <dd class="pwd_icon">
        <input type="password" placeholder="密码" id="psw" class="login_txtbx" style="width: 300px;height: 42px;"/>
    </dd>
    <dd class="val_icon">
        <div class="checkcode">
            <input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx" style="width:126px;height:42px;">
            <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
        </div>
        <input type="button" value="验证码核验" class="ver_btn" onClick="validate();">
    </dd>
    <dd>
        <input type="button" value="立即登陆" class="submit_btn" id="btn-login"/>
    </dd>
    <dd>
        <p>©2018 qinxi版权所有</p>
        <%--<p>陕B2-20080224-1</p>--%>
    </dd>
</dl>

</body>

</html>
