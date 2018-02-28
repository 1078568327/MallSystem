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
    <title>商品详情</title>
    <link rel="stylesheet" type="text/css" href="css/style2.css" />
    <script src="scripts/jquery.js"></script>
    <script src="scripts/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="scripts/ueditor.config.js"></script>
    <script src="scripts/ueditor.all.min.js"> </script>
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
                <dd><a href="back/index" class="active">商品列表</a></dd>
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
                <dd><a href="back/userList">会员列表</a></dd>
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
            <h2 class="fl">商品详情</h2>
            <a class="fr top_rt_btn">返回产品列表</a>
        </div>

        <section>
            <ul class="ulColumn2">
                <li>
                    <span class="item_name" style="width:120px;">商品名称：</span>
                    <input type="text" class="textbox textbox_295" placeholder="商品名称..." value="${requestScope.goods.goodsName}"/>
                </li>
                <li>
                    <span class="item_name" style="width:120px;">商品价格：</span>
                    <input type="text" class="textbox" placeholder="商品价格..." value="${requestScope.goods.goodsPrice}"/>
                </li>
                <li>
                    <span class="item_name" style="width:120px;">商品原来价格：</span>
                    <input type="text" class="textbox" placeholder="商品原来价格..." value="${requestScope.goods.originPrice}"/>
                </li>
                <li>
                    <span class="item_name" style="width:120px;">商品展示图片：</span>
                    <label class="uploadImg">
                        <input type="file"/>
                        <span>上传图片</span>
                    </label>
                    <img src="${requestScope.goods.goodsImages}" style="width:80px;height:80px;margin-bottom: 20px;"/>
                </li>
                <li>
                    <span class="item_name" style="width:120px;">推荐：</span>
                    <label class="single_selection"><input type="radio" name="jinkou"/>进口水果</label>
                    <label class="single_selection"><input type="radio" name="guochan"/>国产水果</label>
                    <label class="single_selection"><input type="radio" name="shucai"/>蔬菜</label>
                </li>
                <li id="detail-images">
                    <span class="item_name" style="width:120px;">商品详细图片：</span>
                    <label class="uploadImg">
                        <input type="file"/>
                        <span>上传图片</span>
                    </label>
                </li>
                <li>
                    <span class="item_name" style="width:120px;">产品详情：</span>
                    <input type="text" style="height: 200px;width:600px;" />
                </li>

                <li>
                    <span class="item_name" style="width:120px;"></span>
                    <input type="submit" class="link_btn" value="修改"/>
                </li>

            </ul>
        </section>

    </div>
</section>


<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }

    //类型绑定
    var goodsType = "${requestScope.goods.goodsType}";
    var type = 0;
    if(goodsType == '进口'){
        $('input[name=jinkou]').attr('checked',true);
        type = 1
    }else if(goodsType == '国产'){
        $('input[name=guochan]').attr('checked',true);
        type = 2
    }else if(goodsType == '蔬菜'){
        $('#input[name=shucai]').attr('checked',true);
        type = 3;
    }

    //
    var detailImages = "${requestScope.goods.detailImages}".split("|");
    var basePath = "";
    if(type === 1){
        basePath = "images/abroad/";
    }else if(type === 2){
        basePath = "images/domestic/";
    }else if(type === 3){
        basePath = "images/domestic/";
    }
    for(var image of detailImages) {
        var path = basePath + image;
        $("#detail-images").append("<img src=\"" + path + "\" style=\"width:60px;height:60px;margin: 0 5px 19px 0;\"/>");
    }

</script>

</body>
</html>
