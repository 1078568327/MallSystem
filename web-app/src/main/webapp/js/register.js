//顶部导航
var navarr=['20px','130px','240px','350px','460px','570px']
$('.headr-nav li').mouseover(function(){
    $('.headr-nav li a').eq($(this).index()).css('color','#4AB344')
    $('.spbottom:eq(0)').css('left',navarr[$(this).index()])
}).mouseout(function(){
    $('.headr-nav li a').eq($(this).index()).css('color','')
    $('.spbottom:eq(0)').css('left','20px')
})

//购物车
$('.headr-right:eq(0)').mouseover(function(){
    $(this).css('overflow','visible')
}).mouseout(function(){
    $(this).css('overflow','hidden')
})
//顶部导航结束

//登录状态栏开始
$(function(){
    var mobileNo = $("#mobileNo").val();
    var nickname = $("#nickname").val();
    if(nickname == "" && mobileNo == ""){
        $(".login").css("display","block");
        $("#user").text("");
        $(".logoff").css("display","none");
    }else if(nickname == "" && mobileNo != ""){
        $(".login").css("display","none");
        $("#user").text("用户："+mobileNo);
        $(".logoff").css("display","block");
    }else if(nickname != ""){
        $(".login").css("display","none");
        $("#user").text("您好，"+nickname);
        $(".logoff").css("display","block");
    }

})
//登录状态栏结束


$(function () {
    $("#btnSub").click(function(){
        $(this).attr("disabled",true);
        var mobileNo = $("input[name=mobileNo]").val();
        var password = $("input[name=password]").val();
        if(mobileNo == ""){
            $("#error-mobileNo span").text("手机号码不能为空");
            $("#error-mobileNo").css("display","block");
        }else if(mobileNo.length != 11){
            $("#error-mobileNo span").text("手机号码必须为11位");
            $("#error-mobileNo").css("display","block");
        }else{
            $("#error-mobileNo span").text("");
            $("#error-mobileNo").css("display","none");
        }
        if(password == ""){
            $("#error-pwd span").text("密码不能为空");
            $("#error-pwd").css("display","block");
        }else if(password.length < 6 || password.length > 16){
            $("#error-pwd span").text("密码长度错误");
            $("#error-pwd").css("display","block");
        }else{
            $("#error-pwd span").text("");
            $("#error-pwd").css("display","none");
        }

        var passwordAgain = $("input[name=passwordAgain]").val();
        if(password != passwordAgain){
            $("#error-pwd-2 span").text("两次输入密码不一致");
            $("#error-pwd-2").css("display","block");
        }else{
            $("#error-pwd-2 span").text("");
            $("#error-pwd-2").css("display","none");
        }
        if(mobileNo == "" || password == "" || mobileNo.length != 11 || password.length < 6 || password.length > 16 ||
            password != passwordAgain ){
            $("#btnSub").attr("disabled",false);
            return;
        }
        var flag = $("input[name=chk-agree]").is(":checked");
        if(!flag){
            alert("请阅读并同意《绿叶水果商城用户注册协议》");
            $("#btnSub").attr("disabled",false);
            return;
        }
        password = md5(password).toUpperCase();
        passwordAgain = md5(passwordAgain).toUpperCase();
        var imageCaptcha = $("input[name=imageCaptcha]").val();
        var captcha = $("input[name=captcha]").val();
        var token = $("#token").val();

        var register = {
            mobileNo : mobileNo,
            password : password,
            passwordAgain : passwordAgain,
            imageCaptcha : imageCaptcha,
            captcha : captcha,
            token : token
        };
        $.ajax({
            url:"register",
            type: "post",
            data:JSON.stringify(register),
            dataType:"json",
            contentType : "application/json;charset=utf-8",
            success:function(data) {
                $("#btnSub").attr("disabled",false);
                if(data.error_mobileNo != undefined && data.error_mobileNo != ""){
                    $("#error-mobileNo span").text(data.error_mobileNo);
                    $("#error-mobileNo").css("display","block");
                }else{
                    $("#error-mobileNo").css("display","none");
                    $("#error-mobileNo span").text("");
                }
                if(data.error_password != undefined && data.error_password != ""){
                    $("#error-pwd span").text(data.error_password);
                    $("#error-pwd").css("display","block");
                }else {
                    $("#error-pwd").css("display","none");
                    $("#error-pwd span").text("");
                }
                if(data.error_passwordAgain != undefined && data.error_passwordAgain != ""){
                    $("#error-pwd-2 span").text(data.error_passwordAgain);
                    $("#error-pwd-2").css("display","block");
                }else{
                    $("#error-pwd-2 span").text("");
                    $("#error-pwd-2").css("display","none");
                }
                if(data.error_register != undefined && data.error_register != ""){
                    $(".register-msg").text(data.error_register);
                    $(".register-msg").css("display","block");
                }else{
                    $(".register-msg").text("");
                    $(".register-msg").css("display","none");
                }
                if(data.error_imageCode != undefined && data.error_imageCode != ""){
                    $(".register-msg").text(data.error_imageCode);
                    $(".register-msg").css("display","block");
                }else{
                    $(".register-msg").text("");
                    $(".register-msg").css("display","none");
                }
                if(data.error_vCode != undefined && data.error_vCode != ""){
                    $(".register-msg").text(data.error_vCode);
                    $(".register-msg").css("display","block");
                }else{
                    $(".register-msg").text("");
                    $(".register-msg").css("display","none");
                }
                if(data.error_token != undefined && data.error_token != ""){
                    alert(data.error_token);
                }
                //跳转
                if(data.isRegister == true){
                    var url = data.url;
                    window.location.href = url;
                }

            },
            error:function (data) {
                $("#btnSub").attr("disabled",false);
                alert("ajax请求失败！");
            }
        });
    });
})

// 刷新图片
function changeImg() {
    var imgSrc = $(".image-code img");
    var url = imgSrc.attr("src");
    imgSrc.attr("src", changeUrl(url));
}

//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
function changeUrl(url) {
    var timestamp = (new Date()).valueOf();
    var index = url.indexOf("?");
    console.log(index);
    if (index > 0) {
        url = url.substring(0, url.indexOf("?"));
    }
    console.log(url);
    if ((url.indexOf("&") > 0)) {
        url = url + "×tamp=" + timestamp;
        console.log(url);
    } else {
        url = url + "?timestamp=" + timestamp;
        console.log(url);
    }
    return url;
}

function getCode(){
    $(".btn-getCode a").removeAttr("onclick");
    $(".btn-getCode a").text("已经发送验证码...");
    var token = $("#token").val();
    $.ajax({
        url:"register/getVCode",
        type: "post",
        data:{
            token : token
        },
        dataType:"json",
        // contentType : "application/json;charset=utf-8",
        success:function (data) {
            if(data.error_token != undefined && data.error_token != ""){
                alert(data.error_token);
            }
            if(data.vCode != undefined && data.vCode != ""){
                alert(data.vCode);
            }
            $(".btn-getCode a").text("获取短信验证码");
            $(".btn-getCode a").attr("onclick","getCode()");
        },
        error:function (data) {
            alert("ajax请求失败");
            $(".btn-getCode a").text("获取短信验证码");
            $(".btn-getCode a").attr("onclick","getCode()");
        }
    });

}