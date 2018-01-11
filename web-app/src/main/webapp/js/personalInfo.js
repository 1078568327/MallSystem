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


function ajaxUpload(){
    var formData = new FormData();
    formData.append('profilePicture',$("#profileImg")[0].files[0])    //第一个[0]是为了得到原生DOM元素，因为$('#excelfile3')得到的是一个jQuery对象;第二个[0]是取得第一个文件，因为选择文件时，我们可以多选。
    formData.append('username',$('input[name=username]').val())
    formData.append('mobileNo',$('input[name=mobileNo]').val())
    formData.append('gender',$('input[name=gender]:checked').val())
    formData.append('birthday',$('input[name=birthday]').val())
    formData.append('email',$('input[name=email]').val())
    formData.append('token',$('#token').val())
    $.ajax({
        type:"post",
        url:"personal/savePersonalInfo",
        async:false,
        contentType: false,    //这个一定要写
        processData: false, //这个也一定要写，不然会报错
        data:formData,
        dataType:'json',
        success:function(data){
            if(data.error_login != undefined && data.error_login != ''){
                alert(data.error_login)
                return
            }
            if(data.error_token != undefined && data.error_token != ''){
                alert(data.error_token)
                return
            }
            if(data.msg != undefined && data.msg != ''){
                alert(data.msg)
                window.location.href = 'personal'
            }

        },
        error:function(data){
            alert("ajax请求失败")
        }
    })
}

//性别绑定
var gender = $('#gender').val()
if(gender == '男'){
    $('#man').attr('checked',true)
}else if(gender == '女'){
    $('#woman').attr('checked',true)
}else if(gender == '保密'){
    $('#secret').attr('checked',true)
}

//头像实时显示
function showPreview(source) {
    var file = source.files[0];
    if(window.FileReader) {
        var fr = new FileReader();
        console.log(fr);
        var portrait = document.getElementById('portrait');
        fr.onloadend = function(e) {
            portrait.src = e.target.result;
        };
        fr.readAsDataURL(file);
        portrait.style.display = 'block';
    }
    var imgSrc = $("#portrait");
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


