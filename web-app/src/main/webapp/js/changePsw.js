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

$(function(){
    $('#btn-submit').click(function(){
        $(this).attr("disabled",true);
        var mobileNo = $("input[name=mobileNo]").val();
        var username = $("input[name=username]").val();
        var oldPassword = $('input[name=oldPassword]').val();
        var newPassword = $('input[name=newPassword]').val();
        var passwordAgain = $('input[name=passwordAgain]').val();
        var token = $('#token').val();

        if(oldPassword === '' || oldPassword === undefined ){
            $('#error-oldPsw').text('原来的密码不能为空');
            $('#error-oldPsw').css('display','inline-block');
        }else{
            $('#error-oldPsw').text('');
            $('#error-oldPsw').css('display','none');
        }

        if(newPassword === '' || newPassword === undefined){
            $('#error-newPsw').text('新的密码不能为空');
            $('#error-newPsw').css('display','inline-block');
        }else{
            $('#error-newPsw').text('');
            $('#error-newPsw').css('display','none');
        }

        if(passwordAgain === '' || passwordAgain === undefined){
            $('#error-pswAgain').text('两次输入密码不一致');
            $('#error-pswAgain').css('display','inline-block');
        }else{
            $('#error-pswAgain').text('');
            $('#error-pswAgain').css('display','none');
        }

        if(oldPassword === '' || oldPassword === undefined || newPassword === '' ||
            newPassword === undefined || passwordAgain === '' || passwordAgain === undefined){
            $('#btn-submit').attr('disabled',false);
            return;
        }

        oldPassword = md5(md5(oldPassword).toUpperCase()+token).toUpperCase();
        newPassword = md5(newPassword).toUpperCase();
        passwordAgain = md5(passwordAgain).toUpperCase();

        var inputDate = {
            username : username,
            mobileNo : mobileNo,
            oldPassword : oldPassword,
            newPassword : newPassword,
            passwordAgain : passwordAgain,
            token : token
        };

        $.ajax({
            url:"pri/usr/changePsw",
            type: "post",
            data:JSON.stringify(inputDate),
            dataType:"json",
            contentType : "application/json;charset=utf-8",
            success : function (data) {
                $('#btn-submit').attr('disabled',false);
                if(data.error_oldPassword !== undefined && data.error_oldPassword !== ''){
                    $('#error-oldPsw').text(data.error_oldPassword);
                    $('#error-oldPsw').css('display','inline-block');
                }else{
                    $('#error-oldPsw').text('');
                    $('#error-oldPsw').css('display','none');
                }

                if(data.error_newPassword !== undefined && data.error_newPassword !== ''){
                    $('#error-newPsw').text(data.error_newPassword);
                    $('#error-newPsw').css('display','inline-block');
                }else{
                    $('#error-newPsw').text('');
                    $('#error-newPsw').css('display','none');
                }

                if(data.error_passwordAgain !== undefined && data.error_passwordAgain !== ''){
                    $('#error-pswAgain').text(data.error_passwordAgain);
                    $('#error-pswAgain').css('display','inline-block');
                }else{
                    $('#error-pswAgain').text('');
                    $('#error-pswAgain').css('display','none');
                }

                if(data.error_msg !== undefined && data.error_msg !== ''){
                    $('#message').text(data.error_msg);
                    $('#message').css('display','block');
                }else{
                    $('#message').text('');
                    $('#message').css('display','none');
                }

                //跳转
                if(data.isChange == true){
                    alert("密码修改成功");
                    var url = data.url;
                    window.location.href = url;
                }
            },
            error : function (data) {
                $('#btn-submit').attr('disabled',false);
                alert("ajax请求失败！");
            }
        });

    })

})

$('.headr-right').click(function () {
    window.location.href = 'pri/goods/shoppingCart';
});