<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="icon" type="image/x-icon" href="./images/logo.png"/>
    <title>全球衢籍乡贤人才地图</title>
    <!-- Favicon icon -->
    <script src="./js/jquery-1.10.2.min.js"></script>
    <link href="./css/bootstrap.css" rel="stylesheet" />
    <link href="./css/style.css" rel="stylesheet" />

    <link href="./css/talent.css" rel="stylesheet"/>
    <!--toast-->
    <link href="./css/toast.css" rel="stylesheet" />
    <script src="plugins/common/common.min.js"></script>
    <script src="js/login.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>

</head>

<style>
    input:-webkit-autofill,
    input:-webkit-autofill:hover,
    input:-webkit-autofill:focus,
    input:-webkit-autofill:active {
        -webkit-transition-delay: 99999s;
        -webkit-transition: color 99999s ease-out, background-color 99999s ease-out;
    }

    html ,body {
        width: 100%;
    }


    #logPhone {
        padding-left: 30px;
        background:url(./images/ico_phone@1x.png) no-repeat 0 center;

        z-index: 100;

    }
    #logPwd {
        padding-left: 30px;
        background:url(./images/ico_code@1x.png) no-repeat 0 center;
    }
    #checkCode {
        width:60%;
        padding-left: 30px;
        background:url(./images/ico_vcode@1x.png) no-repeat 0 center;
    }

    #vertifyImg {
        width: 40%;
    }


</style>

<body class="h-100">

<#include "freemarker/base/toast.ftl"/>


<div style="height: 100%;">

    <#--顶部标题-->
    <div class="topTitle" style="height: 20%;margin-top: 5%;">
        <div class="bigTitle">
            全球衢籍乡贤人才地图
        </div>
        <div class="smTitle" style="margin-top: 20px;">
            活力新衢州 美丽大花园
        </div>
    </div>


    <#--登录主体-->
    <div class="login-form-bg" style="margin: 0 auto;">
        <div class="container" >
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content " style="text-align: center;">
                        <div class="card login-form mb-0 div_center pcWid mobWid" style=";text-align: center;padding:20px auto;margin: auto;">
                            <div class="card-body pt-5 top_move" style="" >
                                <h4 id="userLog" style="font-family: PingFangSC-Semibold;font-size: 18px;color: #0266B2;text-align: center;font-weight: bolder;">用户登录</h4>
                                <br>
                                <form class="mt-8 mb-8 login-input" method="post" action="entry" novalidate>
                                    <#--手机号输入框-->
                                    <div class="form-group">
                                        <div id="logPhone" style="height: 38px;line-height: 38px;">
                                            <input type="text"  class="form-control input-control" placeholder="手机号" name="phone"
                                                   style="display: block;height:38px;line-height: 38px;font-size: 14px;"
                                                   required="required" autocomplete="off">
                                        </div>
                                    </div>
                                    <#--密码输入框-->
                                    <div class="form-group">
                                        <div id="logPwd" style="height: 38px;">
                                            <input  type="password" class="form-control " placeholder="密码" name="password"
                                                    style="display:block;height:38px;line-height: 38px;font-size: 14px;"
                                                    required="required">
                                        </div>
                                    </div>
                                    <#--验证码-->
                                    <div class="form-group">
                                        <div id="checkCode" style="float: left;background-color: #FFFFFF" >
                                            <input type="text" class="form-control"  placeholder="验证码" name="checkCode"
                                                   style="float: left;background-color: #FFFFFF;display:block;height:38px;line-height: 38px;font-size: 14px;"
                                                   required="required" >
                                        </div>
                                        <div id="vertifyImg" style="float: right">
                                            <img id="img" src="" onclick="javascript:changeImg()" style="width: 60px;height: 36px;"/>
                                        </div>
                                    </div>
                                    <#--登录button-->
                                    <button class="btn login-form__btn submit w-100"
                                            style="background: #3698E9;border-radius: 4px;color: #FFFFFF;letter-spacing: 2px;
                            border-radius: 4px;margin-top: 20px;">立即登录
                                    </button>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <#--版权信息-->
    <div style="width: 100%;height: 30%;">
        <#--<div class="copyright" style="padding-top: 10%;text-align: center">-->
        <div class="copyright" style="position: relative;top: 50%;left: 50%;transform: translate(-50%,-50%);">
            衢州砖助科技提供技术服务
        </div>
    </div>

</div>

<!--*******************
    Preloader start 预加载区域
********************-->
<div id="preloader">
    <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"/>
        </svg>
    </div>
</div>

<!--**********************************
    Scripts
***********************************-->
<script>
    /**
     * 更换验证码内容
     */
    function changeImg() {
        var img = document.getElementById("img");
        img.src = "checkCode?date=" + Date.parse(new Date());
    }

    changeImg();

    /**
     * 提示语
     */
    <#if msg??>
    toast('${msg}');
    </#if>

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





