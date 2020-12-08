<!DOCTYPE html>
<html lang="en">

<head>
<#--    <base href="${basePath}"/>-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="icon" type="image/x-icon" href="./images/logo.png"  />
    <title>全球衢籍乡贤人才地图后台管理系统</title>
    <!-- Favicon icon -->


    <!-- Chartist -->
    <link rel="stylesheet" href="./plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
    <link href="./css/bootstrap.css" rel="stylesheet">
    <link href="./css/headInfo.css" rel="stylesheet">
    <link href="./css/style.css" rel="stylesheet">
    <link href="./css/talent.css" rel="stylesheet">
    <link href="./css/video.css" rel="stylesheet">

    <!-- Pignose Calender -->
    <link href="./plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!--toast-->
    <link href="css/toast.css" rel="stylesheet">
    <#--<link href="./css/talent.css" rel="stylesheet">-->
    <script src="./js/jquery-3.4.1.min.js"></script>
    <script src="./js/bootstrap.js"></script>

</head>
<style>
    .video {
        width: 740px;
        height: 470px;
        margin: 0px auto;
    }
    video {
        width: 100%;
        height: 100%;
    }

</style>

<body >
<#include "freemarker/base/loader.ftl"/>
<div id="main-wrapper">
    <#include "freemarker/base/nav_header.ftl"/>
    <#include "freemarker/base/header.ftl"/>
    <#include "freemarker/base/dashboard.ftl"/>
    <#include "freemarker/base/toast.ftl"/>

    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">

                            <#--添加视频页面的标题及横线-->
                            <div>
                                <label class="label-control"><span>视频配置</span></label>
                            </div>
                            <hr>

                            <div class="video">
                                <video id="video" controls autoplay>
                                    <source src=""/>
                                </video>
                            </div>

                            <div id="btnReplace" style="width: 100%; margin: 20px auto;">
                                <button type="button" class="btn mb-1 btn-primary" id="video_edit"
                                        onclick="javascript:editVideo()">
                                </button>

                                <input id="video_upload" type="file" accept="video/*" style="display: none"
                                       onchange="uploadVideo(this)"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--**********************************
        Content body end
    ***********************************-->


    <!--**********************************
        Footer start
    ***********************************-->
    <#include "freemarker/base/footer.ftl"/>
    <!--**********************************
        Footer end
    ***********************************-->
</div>

<!--**********************************
    Scripts
***********************************-->

<script>
    /**
     * 页面加载事件：一进入页面即向后台发起请求
     */
    window.onload = function () {
        //查询视频
        query();

        //当前用户操作权限判断
        authorityJudge();
    }

    /**
     * 当前用户操作权限判断
     */
    function authorityJudge() {

        //权限判断：上传/更换视频
        var video_upload = ${userAuthority.video_upload};
        if (video_upload == 1) {
            $("#video_edit").hide();
        }
    }

    /**
     * 查询：向后台发起请求
     */
    function query() {
        $.ajax({
            type: 'GET',
            url: 'configVideo/queryVideo',
            dataType: 'JSON',
            success: function (result) {
                if (result.status === 1005) {
                    toast("登录超时，请重新登录！");
                    window.location.href = 'login';
                } else if (result.status === 1001) {
                    toast("请上传视频")
                    document.getElementById("video_edit").innerHTML = "上传视频";
                } else if (result.status === 1000) {
                    document.getElementById("video").src = result.data;
                    document.getElementById("video_edit").innerHTML = "更换视频";
                } else {
                    toast("查询视频出错")
                }
            }
        });
    }


    /**
     * 上传/更新视频：触发调用input框，只是从本地选择视频，还不是真正的上传到后台
     */
    function editVideo() {
        $('#video_upload').trigger("click");
    }

    /**
     * 上传/更新视频：选择好视频后，真正地上传视频到后台
     */
    function uploadVideo(obj) {
        //视频文件
        var reqData = new FormData();
        var file = $('#video_upload')[0].files[0];
        reqData.append("file", file);

        if (file == null) {
            toast("请选择要上传/更换的视频")
        }else {
            $('#preloader').fadeTo('fast', 0.4);
            $.ajax({
                type: 'post',
                url: 'configVideo/editVideo',
                dataType: 'json',
                data: reqData,
                contentType: false,
                processData: false,
                success: function (result) {
                    $('#preloader').hide();
                    if (result.status === 1005) {
                        toast("登录超时，请重新登录！");
                        window.location.href = 'login';
                    }else if (result.status == 1000) {
                        toast("上传/更换视频成功");
                        query();
                    } else {
                        toast("上传/更换视频失败");
                    }
                }
            });
        }
    }

    /**
     * toast提示框：仅提示，一定时间后自动消失，不获取焦点
     */
    function toast(message){
        $('#m-toast-inner-text').text(message);
        $('#m-toast-pop').fadeIn();
        setTimeout(function() {
            $('#m-toast-pop').fadeOut();
        }, 2000);//2秒后消失
    }

    /**
     * 修改前台：修改密码后清空模态框数据
     */
    $('#updatePwdModal').on('hide.bs.modal', function (event) {
        $("#oldPassword").val(null);
        $("#newPassword").val(null);
        $("#confirm").val(null);
    });

</script>

<script src="plugins/common/common.min.js"></script>
<script src="js/custom.min.js"></script>

<script src="./js/dashboard/dashboard-1.js"></script>

</body>

</html>