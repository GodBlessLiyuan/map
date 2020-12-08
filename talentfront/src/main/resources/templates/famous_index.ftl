<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="icon" type="image/x-icon" href="./images/logo.png"/>
    <title>全球衢籍乡贤人才地图首页</title>
    <link href="./css/bootstrap.css" rel="stylesheet"/>
    <link href="./css/style.css" rel="stylesheet"/>
    <link href="./css/famous.css" rel="stylesheet"/>
    <link href="./css/common.css" rel="stylesheet"/>
    <link href="css/talent.css" rel="stylesheet">
    <link href="./css/main.css" rel="stylesheet"/>

    <!--toast-->
    <link href="css/toast.css" rel="stylesheet">

    <style>
        a:hover{
            cursor:pointer
        }

        #famousTopHeader {
            background: url(./images/bg_top.jpg) no-repeat;
            background-size: cover;
        }

    </style>
</head>

<style>
</style>
<!--**********************************
    Content body start
***********************************-->
<body style="background: #FFFFFF;overflow-y: auto;">
<div class="topHeader" id="famousTopHeader">
    <#include "freemarker/base/header.ftl"/>
    <#include "freemarker/base/toast.ftl"/>
</div>

<!--面包屑-->
<div class="breadcrumbDiv" style="height: 60px;padding-left: 18%;">
    <ul class="breadcrumb" style="vertical-align: middle;background-color: #F1F3F8">
        <li><a onClick="backClick()" class="active" style="color: #3698e9;">< 返回首页</a></li>
        <#--<li class="active"><a href="">乡贤人才详情</a></li>-->
    </ul>
</div>

<div id="famousDetail" class="famousfont" >
    <div class="famous" style="margin-top: 67.9px;">
        知名乡贤
        <br>
        <hr class="boldline" style="display: block;margin: 10px auto;">
    </div>
   <#-- <hr class="boldline">-->

    <div class="famousPerImg" style="margin-bottom: 10px;">

       <!-- 注意：乡贤头像，如果头像图片地址为空的话 ，显示默认的头像-->
        <#if res.data.avatar?? >
            <img src="${res.data.avatar}" class="borderImg" style="width:100%;height: 100%;">
        <#else>
            <img src="./images/default.jpg" class="borderImg" style="width:100%;height: 100%;">
        </#if>

    </div>

    <!--知名乡贤名字-->
    <div class="famName" style="margin-bottom: 20px;">
        ${res.data.name}
    </div>

    <div style="text-align: center;font-family: PingFangSC-Regular;font-size: 14px;color: #333333;margin-bottom: 20px;">
        ${res.data.town}
    </div>

    <!--知名乡贤职位-->
    <div class="unitPosition" style="margin-bottom: 20px;">
        ${res.data.position}
    </div>

    <div class="socialWork" style="margin-bottom: 31px;">
        ${res.data.socialWork}
    </div>
</div>

<!--轮播图区域-->
<div class="carouselImg" style="margin-bottom: 116px;" >
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel"  data-interval="3000">
        <!-- Indicators -->
        <ol class="carousel-indicators" >
            <#if res.data.pics?? && (res.data.pics?size >0)>
                <#list res.data.pics as pic>
                    <li data-target="#carousel-example-generic" data-slide-to="${pic_index}"></li>
<#--                    <li data-target="#carousel-example-generic" ></li>-->
                </#list>
            </#if>
        </ol>

        <!-- Wrapper for slides -->

        <div class="carousel-inner" role="listbox" id="picsDivCarousel">

            <#if res.data.pics?? && (res.data.pics?size >0)>
                <#list res.data.pics as pic>
                    <div class="item " style="width: 750px;height: 360px;margin: 0 auto;">
                        <img src="${pic}" style="height: 100%;width:100%;">
                    </div>
                </#list>
            </#if>
        </div>

        <#--如果为空的话 就不需要生成左右箭头-->
        <#if res.data.pics?? && (res.data.pics?size >0)>
            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </#if>

    </div>

</div>

<div class="bottomDiv" style="margin-bottom: 0px;background: #1D2226;">
    <!--查看更多  暂时放这里-->
    <div class="copyright">
        衢州砖助科技提供技术服务
    </div>
</div>


<!--**********************************
    Scripts
***********************************-->
<script src="plugins/common/common.min.js"></script>
<script src="js/custom.min.js"></script>
<script src="js/settings.js"></script>
<script src="js/gleek.js"></script>
<script src="js/styleSwitcher.js"></script>

<script src="./plugins/jquery/jquery.min.js"></script>
<script src="./plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="./js/bootstrap.js"></script>

<script type="text/javascript">

    /**
     * 修改前台：修改密码后清空模态框数据
     */
    $('#updatePwdModal').on('hide.bs.modal', function (event) {
        $("#oldPassword").val(null);
        $("#newPassword").val(null);
        $("#confirm").val(null);
    });

    function back_common() {
        history.pushState(null, null, document.URL);
    }

    //禁用浏览器返回
    function fobidden_back() {
        //防止页面后退
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate',back_common)
    }

    fobidden_back();
    /**
     * 返回
     */
    function backClick() {
        window.location.href='./main'
    }

    $(function () {
        /*第一个li标签添加active*/
        $("ol li:eq(0)").addClass("active");

        $("#picsDivCarousel div:first").addClass("active");


    });

    /**
     * toast提示框：仅提示，一定时间后自动消失，不获取焦点
     */
    function toast(message) {
        $('#m-toast-inner-text').text(message);
        $('#m-toast-pop').fadeIn();
        setTimeout(function () {
            $('#m-toast-pop').fadeOut();
        }, 2000);//2秒后消失
    }


</script>
</body>
</html>





