//顶部导航
var navarr=['20px','130px','240px','350px','460px','570px']
$('.headr-nav li').mouseover(function(){
    $('.headr-nav li a').eq($(this).index()).css('color','#4AB344')
    $('.spbottom:eq(0)').css('left',navarr[$(this).index()])
}).mouseout(function(){
    $('.headr-nav li a').eq($(this).index()).css('color','')
    $('.spbottom:eq(0)').css('left','20px')
})

var flag = false;
//购物车
$('.headr-right:eq(0)').mouseover(function(){
    $(this).css('overflow','visible');
    var mobileNo = $('#mobileNo').val();
    if(mobileNo === undefined && mobileNo === ""){
        return;
    }
    if(flag === true){
        return;
    }

    $.ajax({
        url:"pri/goods/queryCart",
        type: "post",
        data:{
            mobileNo : mobileNo
        },
        dataType:"json",
        // contentType : "application/json;charset=utf-8",
        success : function (data) {

            flag = true;
            if(data.list !== undefined && data.list != ""){
                $('.cart-null').css('display','none');
                var items = data.list;
                $.each(items, function(i, n){
                    var box = '<i style="display:inline-block;height: 40px;width:300px;border-top: 1px solid; border-bottom: 1px solid;text-align: left; color: grey;">'
                        + items[i].goods.goodsName + '<span>&nbsp;&nbsp;&nbsp;&nbsp; x'+ items[i].amount +'</span></i>';
                    $('.hr-car').append(box);
                });
                $('#total').text(data.list.length);
            }
        },
        error : function (data) {
            alert("ajax请求失败");
        }
    });
}).mouseout(function(){
    $(this).css('overflow','hidden')
})
//顶部导航结束

//登录状态栏开始
$(function(){
    var mobileNo = $("#mobileNo").val();
    var username = $("#username").val();
    if(username == "" && mobileNo == ""){
        $(".login").css("display","block");
        $("#user").text("");
        $(".logoff").css("display","none");
    }else if(username == "" && mobileNo != ""){
        $(".login").css("display","none");
        $("#user").text("用户："+mobileNo);
        $(".logoff").css("display","block");
    }else if(username != ""){
        $(".login").css("display","none");
        $("#user").text("您好，"+username);
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
            $("#name-error span").text("手机号码不能为空");
            $("#name-error").css("display","block");
        }else{
            $("#name-error span").text("");
            $("#name-error").css("display","none");
        }
        if(password == ""){
            $("#pwd-error span").text("密码不能为空");
            $("#pwd-error").css("display","block");
        }else{
            $("#pwd-error span").text("");
            $("#pwd-error").css("display","none");
        }
        if(mobileNo == "" || password == ""){
            $("#btnSub").attr("disabled",false);
            return;
        }
        var token = $("#token").val();
        password = md5(md5(password).toUpperCase()+token).toUpperCase();
        var flag = $("input[name=isRemember]").is(":checked");
        var isRemember;
        if(flag){
            isRemember = 1;
        }else{
            isRemember = 0;
        }
        var login = {
            mobileNo : mobileNo,
            password : password,
            isRemember : isRemember,
            token : token
        };
        $.ajax({
            url:"pub/usr/login",
            type: "post",
            data:JSON.stringify(login),
            dataType:"json",
            contentType : "application/json;charset=utf-8",
            success:function(data) {
                $("#btnSub").attr("disabled",false);
                if(data.error_mobileNo != undefined && data.error_mobileNo != ""){
                    $("#name-error span").text(data.error_mobileNo);
                    $("#name-error").css("display","block");
                }else{
                    $("#name-error").css("display","none");
                    $("#name-error span").text("");
                }
                if(data.error_password != undefined && data.error_password != ""){
                    $("#pwd-error span").text(data.error_password);
                    $("#pwd-error").css("display","block");
                }else {
                    $("#pwd-error").css("display","none");
                    $("#pwd-error span").text("");
                }
                if(data.error_login != undefined && data.error_login != ""){
                    $(".login-error").text(data.error_login);
                    $(".login-error").css("display","block");
                }else{
                    $(".login-error").css("display","none");
                    $(".login-error").text("");
                }
                //跳转
                if(data.isLogin == true){
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

