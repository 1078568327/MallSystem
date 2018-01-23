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

//登录状态栏
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


$('.coll').mousemove(function(){
    $('.coll').eq($(this).index('.coll')).css('color','#4AB344')
}).mouseout(function(){
    $('.coll').eq($(this).index('.coll')).css('color','#666')
})
$('.coll:eq(1)').mouseover(function(){
    $(this).css({'overflow':'visible','border':'1px solid #D1D1D1'})
}).mouseout(function(){
    $(this).css({'overflow':'hidden','border':'1px solid #ffffff'})
})
$('.nt').mousemove(function(){
    $('.nt').eq($(this).index('.nt')).css('color','#4AB344')
}).mouseout(function(){
    $('.nt').eq($(this).index('.nt')).css('color','#666')
})

$('.webSiteQrCode:eq(0)').mouseover(function(){
    $(this).css('overflow','visible')
}).mouseout(function(){
    $(this).css('overflow','hidden')
})



var ainp =document.getElementsByClassName('f-countBtn')
var sel =document.getElementsByClassName('g_itext')[0]
ainp[0].onclick = function () {
    var num1=parseInt(sel.value)
    num1= num1 + 1
    ainp[1].disabled =false;
    ainp[1].style.cursor = 'auto';
    sel.value=num1
};
ainp[1].onclick = function () {
    var num1=parseInt(sel.value)
    num1= num1 - 1
    if(num1 < 1){
        num1 = 1;
        this.disabled = true;
        this.style.cursor ='not-allowed'
    }
    sel.value=num1
}

//切换菜单
$('.hd li').click(function(){
    $('.bd1').css('display','none')
    $('.hd li').removeClass('active')
    $('.hd1').removeClass('acti')
    $('.bd1 ').eq($(this).index()).css('display','block')
    $('.hd li').eq($(this).index()).addClass('active')
    $('.hd1').eq($(this).index()).addClass('acti')

})




//购物车弹窗
$('#btn-add').click(function () {
    var mobileNo = $("#mobileNo").val();
    var username = $("#username").val();
    $('#btn-add').attr('disabled',true);
    if(username === "" && mobileNo === ""){
        $('#login-prompt:eq(0)').css('display','block');
        $('#btn-add').attr('disabled',false);
        return;
    }

    var mobileNo = $('#mobileNo').val();
    var goodsId = $('#goodsId').val();
    var amount = $('#amount').val();
    var cartRecord = {
        mobileNo : mobileNo,
        goodsId : goodsId,
        amount : amount
    };

    $.ajax({
        url:"pri/goods/addCart",
        type: "post",
        data:JSON.stringify(cartRecord),
        dataType:"json",
        contentType : "application/json;charset=utf-8",
        success : function (data) {
            $('#btn-add').attr('disabled',false);
            if(data.error_msg !== undefined && data.error_msg !== ""){
                alert(data.error_msg);
                return;
            }
            if(data.isAdd === true){
                $('#cart-prompt:eq(0)').css('display','block');
            }
            $('#total').text(data.total);
        },
        error : function (data) {
            $('#btn-add').attr('disabled',false);
            alert("ajax请求失败！");
        }
    });

});

$('#login-prompt .del:eq(0)').click(function(){
    $('#login-prompt:eq(0)').css('display','none');
})

$('#cart-prompt .del:eq(0)').click(function(){
    $('#cart-prompt:eq(0)').css('display','none');
})

$('#to-cart').click(function () {
    window.location.href = 'pri/goods/shoppingCart';
});

$('.headr-right').click(function () {
    window.location.href = 'pri/goods/shoppingCart';
});