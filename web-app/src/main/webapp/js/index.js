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

//果园推荐开始
$('.rcr-top').mousemove(function(){
    $('.rcr-top').eq($(this).index('.rcr-top')).css('margin-left','0')

}).mouseout(function(){
    $('.rcr-top').eq($(this).index('.rcr-top')).css('margin-left','10px')

})

//每日新品特卖轮播
var banner=document.getElementsByClassName('banner_1')[0]
var site=['0px','-1424px']
var bon = document.getElementsByClassName('banner-bottom')[0]
var ali = bon.getElementsByTagName('li')
var len = site.length
var num  = 0
for(i=0;i<len;i++){
    bon.innerHTML += '<li>'+(i+1)+'</li>'
}
ali[0].className = 'active'
for(i=0;i<len;i++){
    ali[i].index = i
    ali[i].onmouseover = function () {
        num = this.index
        picshow()
    }
}
function picshow(){
    for(j=0;j<len;j++){
        ali[j].className = ''
    }
    ali[num].className ='active'
    banner.style.marginLeft = site[num]
}
var time = null
function pp() {
    time = setInterval(function () {
        num++
        if (num >= len) {

            num=0
        }
        picshow()
    }, 5000)
}
pp()
banner.onmouseover = function () {
    clearInterval(time)
}
banner.onmouseout = function () {
    clearInterval(time)
    pp()
}
//每日新品特卖轮播结束
$('.nw-b').mousemove(function(){
    $('.nw-b img').eq($(this).index('.nw-b')).css('margin-left','-8px')

}).mouseout(function(){
    $('.nw-b img').eq($(this).index('.nw-b')).css('margin-left','0px')

})

$(".txtMarquee-top").slide({mainCell:".bd ul",autoPlay:true,effect:"topMarquee",vis:5,interTime:50,trigger:"click"});
$(".slideBox").slide({mainCell:".bd ul",autoPlay:true,trigger:"click"});

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
