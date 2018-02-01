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

$('.headr-right').click(function () {
    window.location.href = 'pri/goods/shoppingCart';
});

//全选
$('#check-all, #check-all-2').click(function(){
    var isChecked = $(this).prop("checked");
    if(isChecked === true){
        $('input[name=ckb-item]').prop('checked',true);
    }else{
        $('input[name=ckb-item]').prop('checked',false);
        // $('input[name=ckb-item]').removeAttr('checked');
    }

    var totalPrice = 0;
    $('input[name=ckb-item]:checked').each(function(){
        var price = $(this).siblings('.mid-dj').children('.item-price').text();
        var amount = $(this).siblings('.mid-sl').children('.item-amount').val();
        totalPrice += price * amount;
    });

    var s = totalPrice.toString();
    var i = s.indexOf('.');
    var len = s.length;
    if(i === -1){
        s += '.00';
    }else if(len-1-i === 1){
        s += '0';
    }
    $('#total-price').text(s);

});

var goodsId = '';
var itemList = new Array();
//删除单件商品
$('#sure-delete').click(function () {
    $('#sure-delete').attr('disabled',true);
    if(goodsId === undefined && goodsId === ''){
        alert('商品id错误');
        return;
    }
    var itemArray = new Array();
    itemArray.push(goodsId);
    var item = {
        itemList : itemArray
    };

    $.ajax({
        url:"pri/goods/delCartItems",
        type: "post",
        data:item,
        dataType:"json",
        success:function (data) {
            $('#sure-delete').attr('disabled',false);
            if(data.isDelete === true){
                var url = data.url;
                window.location.href = url;
            }
        },
        error:function (data) {
            $('#sure-delete').attr('disabled',false);
            alert('ajax请求失败');
        }
    });

});

//删除多件商品
$('#delete-all').click(function () {
    $('#delete-all').attr('disabled',true);
    if(goodsId === undefined && goodsId === ''){
        alert('商品id错误');
        return;
    }
    var item = {
        itemList : itemList
    };

    $.ajax({
        url:"pri/goods/delCartItems",
        type: "post",
        data:item,
        dataType:"json",
        success:function (data) {
            $('#sure-delete').attr('disabled',false);
            if(data.isDelete === true){
                var url = data.url;
                window.location.href = url;
            }
        },
        error:function (data) {
            $('#sure-delete').attr('disabled',false);
            alert('ajax请求失败');
        }
    });

});



//删除商品提示框
$('.del-item').click(function () {
    goodsId = $(this).children('input').val();
    $('#delete-prompt:eq(0)').css('display','block');
});

//取消弹框
$('#delete-prompt .del:eq(0)').click(function(){
    $('#delete-prompt:eq(0)').css('display','none');
})

//删除选定的多件商品
$('#del-all-selected').click(function () {
    $('input[name=ckb-item]:checked').each(function(){
        itemList.push($(this).val());
    });
    if(itemList.length === 0){
        alert('请选中要删除的商品');
        return;
    }
    $('#delete-selected-prompt:eq(0)').css('display','block');

});

//取消弹框
$('#delete-selected-prompt .del:eq(0)').click(function(){
    $('#delete-selected-prompt:eq(0)').css('display','none');
})

//移入收藏提示框
$('#collect').click(function () {
    $('#collect-prompt:eq(0)').css('display','block');
});

$('#collect-prompt .del:eq(0)').click(function(){
    $('#collect-prompt:eq(0)').css('display','none');
})

//成功提示框
function infoPrompt(){
    $('#info-prompt:eq(0)').css('display','block');
}

$('#info-prompt .del:eq(0)').click(function(){
    $('#info-prompt:eq(0)').css('display','none');
})

//购物车跳转
$('.headr-right').click(function () {
    window.location.href = 'pri/goods/shoppingCart';
});

//计算结算金额
$('input[name=ckb-item]').click(function () {
    var totalPrice = 0;
    $('input[name=ckb-item]:checked').each(function(){
        var price = $(this).siblings('.mid-dj').children('.item-price').text();
        var amount = $(this).siblings('.mid-sl').children('.item-amount').val();
        totalPrice += price * amount;
    });

    var s = totalPrice.toString();
    var i = s.indexOf('.');
    var len = s.length;
    if(i === -1){
        s += '.00';
    }else if(len-1-i === 1){
        s += '0';
    }
    $('#total-price').text(s);
});

//结算
$('#to-order').click(function () {
    $('#to-order').attr('disabled',true);
    var orderList = new Array();
    $('input[name=ckb-item]:checked').each(function(){
        orderList.push($(this).val());
    });
    if(orderList.length === 0){
        alert('请选择要结算的商品');
        $('#to-order').attr('disabled',false);
        return;
    }

    $.ajax({
        url:"pri/goods/submitCart",
        type: "post",
        data:{
            orderList : orderList
        },
        dataType:"json",
        success: function (data) {
            $('#to-order').attr('disabled',false);
            if(data.isSubmit === true){
                var url = data.url;
                window.location.href = url;
            }
        },
        error: function (data) {
            $('#to-order').attr('disabled',false);
            alert('ajax请求失败');
        }
    });
});