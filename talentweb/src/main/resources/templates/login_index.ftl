<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="icon" type="image/x-icon" href="./images/logo.png"/>
    <title>全球衢籍乡贤人才地图后台管理系统</title>
    <!-- Favicon icon -->
    <link href="./css/style.css" rel="stylesheet"/>
    <link href="./css/bootstrap.css" rel="stylesheet"/>
    <link href="./css/talent.css" rel="stylesheet"/>
    <!--toast-->
    <link href="./css/toast.css" rel="stylesheet"/>
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <style>

        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        input:-webkit-autofill,
        input:-webkit-autofill:hover,
        input:-webkit-autofill:focus,
        input:-webkit-autofill:active {
            -webkit-transition-delay: 99999s;
            -webkit-transition: color 99999s ease-out, background-color 99999s ease-out;
        }
        body {
            background: url(./images/login_bg@2x.jpg) no-repeat;
            background-size: cover;
            overflow-y: hidden;
        }

        #logPhone {
            padding-left: 30px;
            background: url(./images/ico_phone@1x.png) no-repeat 0 center;
        }

        #logPwd {
            padding-left: 30px;
            background: url(./images/ico_code@1x.png) no-repeat 0 center;
        }

        #checkCode {
            padding-left: 30px;
            background: url(./images/ico_vcode@1x.png) no-repeat 0 center;
        }

        #userLog {
            font-family: PingFangSC-Semibold;
            font-size: 18px;
            font-weight: bolder;
            color: #0266B2;
            text-align: center;
        }


    </style>
</head>



<body class="h-100">

<#include "freemarker/base/toast.ftl"/>

<!--*******************
    Preloader start 预加载区域
********************-->
<div id="preloader">
    <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"></circle>
        </svg>
    </div>
</div>

<div style="height: 100%;">

    <#--顶部标题-->
    <div class="topTitle" style="height: 20%;margin-top: 3%;">
        <div class="bigTitle">
            全球衢籍乡贤人才地图
        </div>
        <div class="smTitle" style="margin-top: 10px;">
            活力新衢州 美丽大花园
        </div>
    </div>

    <#--登录主体-->
    <div style="width: 100%;height: 60%;">
        <div class="logcontainer" style="width: 400px;">
            <div class="card-body pt-5" style="text-align: center">
                <h4 id="userLog">后台管理系统登录</h4>
                <br>

                <form class="mt-8 mb-8 login-input" method="post" action="entry" novalidate>
                    <div class="form-group">
                        <div id="logPhone" style="background-color: #FFFFFF">
                            <input type="text" class="form-control input-control" placeholder="手机号" name="phone"
                                   style="display: block;height:38px;line-height: 38px;font-size: 14px;"
                                   required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <div id="logPwd">
                            <input type="password" class="form-control input-control" placeholder="密码" name="password"
                                   style="display:block;height:38px;line-height: 38px;font-size: 14px;"
                                   required="required">
                        </div>
                    </div>
                    <div class="form-group">
                        <div id="checkCode" style="float: left;background-color: #FFFFFF">
                            <input type="text" class="form-control input-control" placeholder="验证码" name="checkCode"
                                   style="float: left;background-color: #FFFFFF;display:block;height:38px;line-height: 38px;font-size: 14px;"
                                   required="required">
                        </div>
                        <div style="float: right">
                            <img id="img" src="" onclick="javascript:changeImg()"/>
                        </div>
                    </div>

                    <button class="btn login-form__btn submit w-100"
                            style="background: #3698E9;border-radius: 4px;border-radius: 4px;margin-top: 20px;">立即登录
                    </button>
                </form>

            </div>
        </div>
    </div>

    <#--版权信息-->
    <div style="width: 100%;height: 20%;">
        <div class="copyright" style="padding-top: 3%;">
            衢州砖助科技提供技术服务
        </div>
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





