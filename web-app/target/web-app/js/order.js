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

//购物车跳转
$('.headr-right').click(function () {
    window.location.href = 'pri/goods/shoppingCart';
});





/*确认订单（新增地址） js*/
$(".pay-xdz-btn").click(function(event) {
    $("[xgdz1]").show();
    $('#btn-add-address').unbind('click').click(function () {
        $('#btn-add-address').attr('disabled',true);
        var city = $('#add-city').text();
        var district = $('#add-district').val();
        var detail = $('#add-detail').val();
        var postcode = $('#add-postcode').val();
        var consignee = $('#add-consignee').val();
        var mobileNo = $('#add-mobileNo').val();
        var token = $('#token').val();
        var addressInfo = {
            city : city,
            district : district,
            detail : detail,
            postcode : postcode,
            consignee : consignee,
            mobileNo : mobileNo,
            token : token
        };

        $.ajax({
            url:"pri/usr/addAddr",
            type: "post",
            data:JSON.stringify(addressInfo),
            dataType:"json",
            contentType : "application/json;charset=utf-8",
            success: function (data) {
                $('#btn-add-address').attr('disabled',false);
                if(data.msg !== undefined && data.msg !== ''){
                    alert(data.msg);
                }
                if(data.isAdd === true){
                    var text = '<li>\n' +
                        '                            <input type="hidden" value="'+data.addressId+'">\n' +
                        '                            <h3><span class="sp1">'+city+'</span><span class="sp2">'+district+'</span>\n' +
                        '                                （<span class="sp3">'+consignee+'</span> 收）\n' +
                        '                            </h3>\n' +
                        '                            <p><span class="sp1">'+detail+'</span>\n' +
                        '                                <span class="sp2">'+mobileNo+'</span>\n' +
                        '                                <span class="sp4" style="display: none;">'+postcode+'</span>\n' +
                        '                            </p>\n' +
                        '                            <a href="JavaScript:;" xiugai="">修改</a>\n' +
                        '                        </li>';
                    $('#address-box').append(text);
                    $("[xgdz1]").hide();
                    
                    $('#add-city').text('');
                    $('#add-district').val('');
                    $('#add-detail').val('');
                    $('#add-postcode').val('');
                    $('#add-consignee').val('');
                    $('#add-mobileNo').val('');
                }
            },
            error: function (data) {
                $('#btn-add-address').attr('disabled',false);
                alert('ajax请求错误');
            }
        });
    });
});
$("[dz-guan]").click(function(event) {
    $("[xgdz1]").hide();
});
/*修改地址*/
$(document).on('click','[xiugai]',function () {
    $("[xgdz2]").show();
    var dz1 = $(this).siblings("h3").children('.sp1').text();  /*重庆*/
    var dz2 = $(this).siblings("h3").children('.sp2').text();  /*巴南区*/
    var dz3 = $(this).siblings("h3").children('.sp3').text();  /*赵珍珍*/
    var dz4 = $(this).siblings("p").children('.sp1').text();  /*详细地址*/
    var dz5 = $(this).siblings("p").children('.sp2').text();  /*电话*/
    var dz6 = $(this).siblings("p").children('.sp4').text();  /*邮编*/
    $("[xgdz2] .dz-left p").text(dz1);
    $("[xgdz2] .dz-right input").val(dz2);
    $("[xgdz2] .tc-con2 li .textarea1").val(dz4);
    $("[xgdz2] .tc-con2 li .shxm").val(dz3);
    $("[xgdz2] .tc-con2 li .lxdh").val(dz5);
    $("[xgdz2] .tc-con2 li #postcode").val(dz6);

    var $updateAddr = $(this);
    $('#btn-update-address').unbind('click').click(function () {
        $('#btn-update-address').attr('disabled',true);
        var addrId = $updateAddr.siblings('input').val();
        var city = $("[xgdz2] .dz-left p").text();
        var district = $("[xgdz2] .dz-right input").val();
        var detail = $("[xgdz2] .tc-con2 li .textarea1").val();
        var postcode = $("#postcode").val();
        var consignee = $("[xgdz2] .tc-con2 li .shxm").val();
        var mobileNo = $("[xgdz2] .tc-con2 li .lxdh").val();
        var token = $("#token").val();
        var addressInfo = {
            addressId : addrId,
            city : city,
            district : district,
            detail : detail,
            postcode : postcode,
            consignee : consignee,
            mobileNo : mobileNo,
            token : token
        };

        $.ajax({
            url:"pri/usr/updateAddr",
            type: "post",
            data:JSON.stringify(addressInfo),
            dataType:"json",
            contentType : "application/json;charset=utf-8",
            success: function (data) {
                $('#btn-update-address').attr('disabled',false);
                if(data.error_msg !== undefined && data.error_msg !== ''){
                    alert(data.error_msg);
                }
                if(data.isUpdate === true){
                    $("[xgdz2]").hide();
                    $updateAddr.siblings("h3").children('.sp1').text(city);
                    $updateAddr.siblings("h3").children('.sp2').text(district);
                    $updateAddr.siblings("h3").children('.sp3').text(consignee);
                    $updateAddr.siblings("p").children('.sp1').text(detail);
                    $updateAddr.siblings("p").children('.sp2').text(mobileNo);
                    $updateAddr.siblings("p").children('.sp4').text(postcode);
                }
            },
            error: function (data) {
                $('#btn-update-address').attr('disabled',false);
                alert('ajax请求失败');
            }
        });

    });
});
$("[dz-guan]").click(function(event) {
    $("[xgdz2]").hide();
});

/*左边 js*/
$(".dz-left p").click(function(event) {
    $(".dz-left ul").toggle();
});
$(".dz-left li").click(function(event) {
    $(this).addClass('current').siblings().removeClass("current");
    $(".dz-left p").text($(this).text());
    $(".dz-left ul").hide();
});
/*右边 js*/
/*$(".dz-right p").click(function(event) {
    $(".dz-right ul").toggle();
});
$(".dz-right li").click(function(event) {
    $(this).addClass('current').siblings().removeClass("current");
    $(".dz-right p").text($(this).text());
    $(".dz-right ul").hide();
});*/

/*确认订单 地址切换*/
/*$(".pay-dz div li").click(function(event) {
    $(this).addClass('current').siblings().removeClass("current");
});*/

/*确认订单 地址切换*/
$(document).on('click','#address-box li',function () {
    $(this).addClass('current').siblings().removeClass("current");
});
