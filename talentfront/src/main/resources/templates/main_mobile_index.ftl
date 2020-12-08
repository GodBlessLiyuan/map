<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta name="screen-orientation" content="portrait">
    <meta name="x5-orientation" content="portrait">
    <link rel="icon" type="image/x-icon" href="./images/logo.png"/>
    <title>全球衢籍乡贤人才地图</title>
    <!-- Favicon icon -->

    <!-- 百度地图加载资源 -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
    <script type="text/javascript"
            src="https://api.map.baidu.com/api?v=2.0&ak=${baiduAK}"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
    <link href="./plugins/datatables/jquery.dataTables.min.css" rel="stylesheet">


    <link href="./css/bootstrap.css" rel="stylesheet"/>
    <link href="./css/style.css" rel="stylesheet"/>
    <link href="./css/main.css" rel="stylesheet"/>
    <link href="./css/mainmobile.css" rel="stylesheet">
   <#-- <link href="./css/preloader.css" rel="stylesheet">-->
    <!--toast-->
    <link href="css/toast.css" rel="stylesheet">


    <#--加载动画-->
    <#--<#if preloader >-->
        <#--<link href="./css/preloader.css" rel="stylesheet">-->
    <#--</#if>-->


</head>

<style>
    input:-webkit-autofill,
    input:-webkit-autofill:hover,
    input:-webkit-autofill:focus,
    input:-webkit-autofill:active {
        -webkit-transition-delay: 99999s;
        -webkit-transition: color 99999s ease-out, background-color 99999s ease-out;
    }
    ::-ms-clear, ::-ms-reveal{display: none;}

    html,body {
        height: 100%;
        padding: 0;
        margin: 0;
    }
    body{
        padding-right: 0px !important;
    }

    #personelBtn {
        margin-left: 5px !important;
        padding-left: 31px;
        background:url(./images/ico_personnel.png) no-repeat left 8px top 5px;
        vertical-align: middle;

        font-family: PingFangSC-Medium;
        font-size: 14px;
        color: #3698E9;
    }

    #showVideo{
        margin-left: 5px;
        padding-left: 31px;
        font-size: 14px;
        background:url(./images/ico_video.png) no-repeat left 8px top 6px;
        vertical-align: middle;

        font-family: PingFangSC-Medium;
        font-size: 14px;
        color: #3698E9;
    }

    #switchBtnMob {
        background: #FFFFFF;
        border: 0px solid #EEEEEE;
        box-shadow: 0 0 6px 0 #EEEEEE;
        border-radius: 4px;
        border-radius: 4px;
        margin-left: 5px;

        font-family: PingFangSC-Medium;
        font-size: 14px;
        color: #3698E9;
    }
    #arrowNext {
        background:url(./images/arrow_next@2x.png) no-repeat center;
        width: 20px;
        height: 20px;
    }



    .tabFont {
        font-family: PingFangSC-Medium;
        font-size: 14px;
        color: #1E88E5;
        text-align: center;
    }

    #videoModal {
        height: 360px;
        margin: 0 auto;
        margin-top: 100px;
    }

    .videoDivMobile {
        width:90%;
        /*height: 240px;*/
        height: auto;
        margin: 0 auto;
        text-align: center;

    }


    table { table-layout: fixed;}
    td { white-space: nowrap;overflow: hidden;text-overflow: ellipsis;}

    /*#preloader {*/
        /*position: fixed;*/
        /*top: 0;*/
        /*left: 0;*/
        /*width: 100%;*/
        /*height: 100%;*/
        /*background-color: #111111;*/
        /*z-index: 1000;*/
    /*}*/
    /*#preloader #preloader-inner {*/
        /*display: block;*/
        /*position: relative;*/
        /*border-radius: 50%;*/
        /*border: 3px solid transparent;*/
        /*animation: spin 2s linear infinite;*/
    /*}*/

    .talentEachRow {
        height: 106px;
        height: auto;
        border-bottom: 1px solid #eeeeee;
    }

    .verticalDiv {
        height: 12%;
    }
    .autoDiv {
        height: 60px;
    }


</style>

<body style="height: 100%;overflow-y: auto">

<!-- 预加载页面-->
<#--<#if preloader >-->
    <#--<div id="preloader" style="margin: 0 auto;background-color: #030303;height:100%;">-->
        <#---->
        <#--<div id="preloader-inner" style="text-align: center;margin: 0 auto;width:100%;position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);">-->
            <#--<video autoplay style="width: 100%;height: auto;">-->
                <#--<source src="./images/1_2_1.mp4" />-->
            <#--</video>-->
        <#--</div>-->

    <#--</div>-->
<#--<#else>-->
    <#--<div id="preloader">-->
        <#--<div class="loader">-->
            <#--<svg class="circular" viewBox="25 25 50 50">-->
                <#--<circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"/>-->
            <#--</svg>-->
        <#--</div>-->
    <#--</div>-->
<#--</#if>-->

<!-- 预加载页面-->
<div id="preloader">
    <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"/>
        </svg>
    </div>
</div>


<#--地图模块-->
<div id="mapContent" class="mapcontainerMobile" style="height: 88%;background-color: #EFEFEF;">

    <!--按钮组 要求和地图背景同色 -->
    <div class="btngroupMobile" id="twoBtn" style="vertical-align: middle;">
        <div style="margin-top: 15px;">
            <button id="personelBtn" type="button" class="btn btnCom" style="width: 70px;background-color: #FFFFFF;border-radius: 4px;border-radius: 4px;margin-left: 5px;outline: none"
                    onclick="javascrtpt:window.location.href='talent'">人员
            </button>
        </div>

        <div style="margin-top: 10px;">
            <button id="showVideo" type="button" class="btn btnCom" style="width: 70px;background-color: #FFFFFF;border-radius: 4px;border-radius: 4px;outline: none"  data-toggle="modal"
                    data-target="#videoModal" data-whatever="@getbootstrap">视频
            </button>
        </div>

        <div style="margin-top: 10px;">
            <input id="switchBtnMob" class="btn btn-default btnCom" style="width:70px;outline: none" type="button" value="全球">
        </div>


    </div>


    <div id="world" class="worldmapMobile" style="" >
        <div id="worldcontainer" style="height: 100%"></div>
    </div>

    <div id="china" class="worldmapMobile">
        <div id="chinacontainer" style="height: 100%"></div>
    </div>


</div>

<#--知名乡贤人才列表-->
<div id="infoContent" class="infoContentMobile"  <#--style="height: auto;"-->>

    <div id="togDiv" style="width: 100%;height: 56px;/*border-bottom: 1px solid #DDDDDD;*/" >
        <div class="switchDiv" style="position: relative;top: 50%;left: 50%;transform: translate(-50%,-50%);">
            <!--知名乡贤人才标题-->
            <div id="iconDiv" class="wellkonwn" style="margin: 0 auto;">
                <div style="width:150px;height: 28px; margin: 0px auto;background:url(./images/arrowToUp.png) no-repeat center;"> </div>
            </div>
            <!--下划线-->
            <#--<div id="divlineMobile" class="divlineMobile" >-->
                <#--点击查看∨-->
            <#--</div>-->
            <div style="font-family: PingFangSC-Semibold;font-size: 18px;color: #3698E9;letter-spacing: 0;text-align: center;font-weight: bolder">
                知名乡贤人才
            </div>
        </div>

    </div>

    <!--知名乡贤人才列表：-->
    <div class="famousListMobile" id="famousListMob" style="display: none;background-color: #FFFFFF;border-top: 1px solid #eeeeee">
        <div class="container" id="famousRowsListDiv">
            <#--第一行数据-->

            <#--<div class="row talentEachRow" >-->
                <#--<div class="col-xs-3">-->
                    <#--<div style="height: 100%;">-->
                        <#--<img src="./images/zss.jpg" style="width: 72px;height: 72px;border-radius: 36px;position: relative;top: 50%;left: 50%;transform: translate(-50%,-50%);">-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="col-xs-7">-->
                    <#--<div style="">-->
                        <#--<span class="nameDetails">郑树森</span><br>-->
                        <#--<div class="postionDetails omitPostionDetails">中国工程院院士、树兰杭医院院长中国工程院院士、树兰杭州医院院长树兰杭医院院长-->
                            <#--中国工程院院士、树兰杭州医院院长树兰杭医院院长中国工程院院士、树兰杭州医院院长</div>-->
                    <#--</div>-->
                <#--</div>-->
                <#--<div class="col-xs-2" style="text-align: center;">-->
                        <#--<div >-->
                            <#--<button id="arrowNext" type="button" class="btn" style="background-color: #FFFFFF;"  data-toggle="modal"-->
                                    <#--data-target="#famousDetailsModal" data-whatever="@getbootstrap">-->
                            <#--</button>-->
                        <#--</div>-->

                <#--</div>-->
            <#--</div>-->
            <#---->

        </div>

    </div>

</div>


<!--知名乡贤详情页 轮播图页面 -->
<div class="modal fade" id="famousDetailsModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg" role="document" >
        <div class="modal-content" style="height: auto;width: 90%;margin: 10px auto;border-radius: 8px;overflow-y: hidden;">
            <div class="modal-header" style="border-bottom:0px">
                <button id="aModalX" type="button" class="close" data-dismiss="modal"
                        aria-label="Close"
                        style="background:url(./images/ico_close.png) no-repeat center;margin-right: 10px;margin-top: 10px;">
                </button>
            </div>

            <div class="modal-body">

                <#-- 人才详情页主题信息-->
                <div class="" id="famousListDivMobile">
                    <#-- 人才详情文字信息-->
                    <div id="basicInfoDiv">

                    </div>

                    <#--轮播图-->
                    <div id="lunBoDiv" style="margin-bottom: 30px;">

                        <#--<div class="carouselDivMobile">-->
                        <#--<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">-->
                        <#--<!-- Indicators &ndash;&gt;-->
                        <#--<ol class="carousel-indicators">-->
                        <#--<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>-->
                        <#--<li data-target="#carousel-example-generic" data-slide-to="1"></li>-->
                        <#--<li data-target="#carousel-example-generic" data-slide-to="2"></li>-->
                        <#--</ol>-->

                        <#--<!-- Wrapper for slides &ndash;&gt;-->
                        <#--<div class="carousel-inner" role="listbox">-->
                        <#--<div class="item active">-->
                        <#--<img src="./images/zss.jpg" alt="...">-->
                        <#--</div>-->
                        <#--<div class="item">-->
                        <#--<img src="./images/zss.jpg" alt="...">-->
                        <#--</div>-->
                        <#--<div class="item">-->
                        <#--<img src="./images/zss.jpg" alt="...">-->
                        <#--</div>-->
                        <#--</div>-->

                        <#--<!-- Controls &ndash;&gt;-->
                        <#--<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">-->
                        <#--<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>-->
                        <#--<span class="sr-only">Previous</span>-->
                        <#--</a>-->
                        <#--<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">-->
                        <#--<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>-->
                        <#--<span class="sr-only">Next</span>-->
                        <#--</a>-->
                        <#--</div>-->
                        <#--</div>-->

                    </div>

                </div>

            </div>

        </div>
    </div>
</div>

<!-- 手机端视频模态框-->
<div class="modal fade" id="videoModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" style="display: none;width:95%;height: auto; " aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header" style="padding:10px 20px;border-bottom: none;">
                <span style="font-family: PingFangSC-Medium;font-size: 16px;color: #333333;">视频</span>
                <button id="aModalX" type="button" class="close" data-dismiss="modal"
                        aria-label="Close"
                        style="background:url(./images/ico_close.png) no-repeat center;margin-top: 3px;">
                </button>
            </div>
            <div class="modal-body" style="">
                <#--视频部分-->
                <#--<div class="videoDivMobile" id="videoDiv">-->

                <#--</div>-->
                <div class="videoDivMobile" id="videoDiv" >

                </div>
            </div>

        </div>
    </div>
</div>

<!--**********************************
    Scripts
***********************************-->

<script src="plugins/common/common.min.js"></script>
<#--<#if preloader >-->
    <#--<script src="js/main.min.js"></script>-->
<#--<#else>-->
    <#--<script src="js/custom.min.js"></script>-->
<#--</#if>-->
<#--动画冲突 删除custom.min.js-->
<script src="js/mobile/custom.min.js"></script>

<script src="js/styleSwitcher.js"></script>

<script src="js/mapComm.js"></script>
<script src="js/famous.js"></script>

<script src="./plugins/jquery/jquery.min.js"></script>
<script src="./js/bootstrap.js"></script>

<script src="./plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="./js/jquery.preloader.js"></script>

<script type="text/javascript">

    history.pushState("","",null);
    /**
     *  根据屏幕大小 选择竖直还是水平
     */
    var width = window.screen.width;
    var height = window.screen.height;

    if(width > height){
        $("#infoContent").addClass("autoDiv");
    }else {
        $("#infoContent").addClass("verticalDiv");
    }


    /**
     * 全局变量，控制是搜索还是人员进入的模态框
     */
    // var searchStaff=0;
    /**
     *  地图初始化
     */
    var domChina = document.getElementById("chinacontainer");
    var myChartChina = echarts.init(domChina);

    var domWorld = document.getElementById("worldcontainer");
    var myChartWorld = echarts.init(domWorld);


    /**
     * 功能：监控div的大小变化相当于window.resize 函数
     */
    (function($, h, c) {
        var a = $([]),
            e = $.resize = $.extend($.resize, {}),
            i,
            k = "setTimeout",
            j = "resize",
            d = j + "-special-event",
            b = "delay",
            f = "throttleWindow";
        e[b] = 250;
        e[f] = true;
        $.event.special[j] = {
            setup: function() {
                if (!e[f] && this[k]) {
                    return false;
                }
                var l = $(this);
                a = a.add(l);
                $.data(this, d, {
                    w: l.width(),
                    h: l.height()
                });
                if (a.length === 1) {
                    g();
                }
            },
            teardown: function() {
                if (!e[f] && this[k]) {
                    return false;
                }
                var l = $(this);
                a = a.not(l);
                l.removeData(d);
                if (!a.length) {
                    clearTimeout(i);
                }
            },
            add: function(l) {
                if (!e[f] && this[k]) {
                    return false;
                }
                var n;
                function m(s, o, p) {
                    var q = $(this),
                        r = $.data(this, d);
                    r.w = o !== c ? o: q.width();
                    r.h = p !== c ? p: q.height();
                    n.apply(this, arguments);
                }
                if ($.isFunction(l)) {
                    n = l;
                    return m;
                } else {
                    n = l.handler;
                    l.handler = m;
                }
            }
        };
        function g() {
            i = h[k](function() {
                    a.each(function() {
                        var n = $(this),
                            m = n.width(),
                            l = n.height(),
                            o = $.data(this, d);
                        if (m !== o.w || l !== o.h) {
                            n.trigger(j, [o.w = m, o.h = l]);
                        }
                    });
                    g();
                },
                e[b]);
        }
    })(jQuery, this);

    /**
     * 过滤：刷选出符合某一特定类型的人才 返回人信息点集合
     */
    var filterData = function (data, type) {
        var typeList = [];
        for (let i = 0; i < data.length; i++) {
            if (data[i].value[2].type == type) {
                typeList.push(
                    data[i]);
            }
        }
        return typeList;
    };

    var famousDetailsId = -1;
    function setFamousDetailsModel(id){
        famousDetailsId = id;
    }

    /**
     * 页面加载事件：默认显示世界人才地图
     */
    $("#china").hide();

    $(document).ready(function () {

        /**
         *  实现全球和全国的地图切换
         */
        $("#switchBtnMob").click(function () {

            if ($(this).val() == "全球") {
                $("#china").show();
                $("#world").hide();
                $(this).val("全国");
                myChartChina.resize();// 重新初始化地图
            } else {
                $("#world").show();
                $("#china").hide();
                $(this).val("全球");
                myChartWorld.resize();// 重新初始化地图
            }
        });

        /**
         *  视频模态框关闭 暂停 视频
         */
        $("#videoModal").on("hidden.bs.modal",function(){
            var myVideo=document.getElementById("videoId");
            myVideo.pause();

        });

        /**
         *  知名乡贤
         */
        $("#togDiv").bind("click",function () {
            if($("#mapContent").is(":visible")){
                $("#mapContent").hide();
               /* $("#famousListMob").show();*/
                $("#famousListMob").slideDown(1000);
                $("#iconDiv div").remove();
                $("#iconDiv").append(' <div style="width:150px;height: 28px; margin: 5px auto;background:url(./images/arrowToDown.png) no-repeat center;"> </div>');


            }else {
                $("#mapContent").show();
                $("#famousListMob").hide();
                $("#iconDiv div").remove();
                $("#iconDiv").append(' <div style="width:150px;height: 28px; margin: 5px auto;background:url(./images/arrowToUp.png) no-repeat center;"> </div>');
            /*    $("#famousListMob").slideUp(1000);*/

            }
        });

        /**
         *  监控地图窗口的大小 实现重新初始化地图canvas
         */
        $("#mapContent").resize(function(){
            myChartWorld.resize();
        });

        /**
         * 世界地图初始化
         */
        $.ajax({
            type: 'POST',
            url: 'talentInfo/queryMap',
            dataType: 'JSON',
            success: function (res) {

                /**
                 * 地图属性：设置地图的各种属性值
                 */
                optionWorld = {
                     backgroundColor: '#404B58',
                    // backgroundColor: '#f5f5f5',
                    title: {
                        /* text: '全球衢籍人才地图',*/
                        x: 'center',
                        textStyle: {
                            color: '#666666'
                        }
                    },
                    tooltip: {
                        trigger: 'item',
                        // 弹窗显示内容
                        formatter: function (params) {
                            var tipHtml = '';
                            tipHtml = '<div style="background:rgba(22,80,158,0.8);border:1px solid rgba(7,166,255,0.7)">'
                                + '<div style="width:100%;height:40px;line-height:30px;border-bottom:2px solid rgba(7,166,255,0.7);padding:0 20px">' + '<i style="display:inline-block;width:8px;height:8px;background:#16d6ff;border-radius:40px;">' + '</i>'
                                + '<span style="margin-left:10px;color:#fff;font-size:16px;">' + params.name + '</span>' + '</div>'
                                + '<div style="padding:20px">'


                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '原籍地：' + '<span style="color:#f4e925;margin:0 6px;">' + params.value[2].town + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '现所在地：' + '<span style="color:#f4e925;margin:0 6px;">' + params.value[2].local + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '现工作单位：' + '<span style="color:#f4e925;margin:0 6px;">' + params.value[2].unit + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '职务：' + '<span style="color:#11ee7d;margin:0 6px;">' + params.value[2].posi + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '人才性质：' + '<span style="color:#f48225;margin:0 6px;">' + params.value[2].type + '</span>' + '</p>'

                                + '</div>' + '</div>';

                            return tipHtml;
                        }
                    },
                    // legend: {
                    //     // orient: 'horizontal',
                    //     orient: 'vertical',
                    //     x: '10px',
                    //     y: '10px',
                    //    data: res.data.types,/*隐藏的话 将其数据源置空即可*/
                    //    data: [],
                    //     textStyle: {
                    //         color: '#ffffff',
                    //         fontSize: 14  // 修改字体大小
                    //     }
                    // },
                    // 控制左上角的圆形按钮的颜色
                    color: ['#FFD300', '#C23531', '#01C7FF', '#CD1BF6', '#FE8503', '#009933'],

                    geo: {
                        map: 'world',
                        roam:true,
                        zoom: 7,
                      /*  center: [113.83531246, 34.0267395887],*/ /*中国地图中心点*/
                        center: [102.83531246, 34.0267395887], /*中国地图在中心，并且将其放大*/
                        nameMap: {

                            'Singapore Rep.':'新加坡',
                            'Dominican Rep.':'多米尼加',
                            'Palestine':'巴勒斯坦',
                            'Bahamas':'巴哈马',
                            'Timor-Leste':'东帝汶',
                            'Afghanistan':'阿富汗',
                            'Guinea-Bissau':'几内亚比绍',
                            "Côte d'Ivoire":'科特迪瓦',
                            'Siachen Glacier':'锡亚琴冰川',
                            "Br. Indian Ocean Ter.":'英属印度洋领土',
                            'Angola':'安哥拉',
                            'Albania':'阿尔巴尼亚',
                            'United Arab Emirates':'阿联酋',
                            'Argentina':'阿根廷',
                            'Armenia':'亚美尼亚',
                            'French Southern and Antarctic Lands':'法属南半球和南极领地',
                            'Australia':'澳大利亚',
                            'Austria':'奥地利',
                            'Azerbaijan':'阿塞拜疆',
                            'Burundi':'布隆迪',
                            'Belgium':'比利时',
                            'Benin':'贝宁',
                            'Burkina Faso':'布基纳法索',
                            'Bangladesh':'孟加拉国',
                            'Bulgaria':'保加利亚',
                            'The Bahamas':'巴哈马',
                            'Bosnia and Herz.':'波斯尼亚和黑塞哥维那',
                            'Belarus':'白俄罗斯',
                            'Belize':'伯利兹',
                            'Bermuda':'百慕大',
                            'Bolivia':'玻利维亚',
                            'Brazil':'巴西',
                            'Brunei':'文莱',
                            'Bhutan':'不丹',
                            'Botswana':'博茨瓦纳',
                            'Central African Rep.':'中非',
                            'Canada':'加拿大',
                            'Switzerland':'瑞士',
                            'Chile':'智利',
                            'China':'中国',
                            'Ivory Coast':'象牙海岸',
                            'Cameroon':'喀麦隆',
                            'Dem. Rep. Congo':'刚果民主共和国',
                            'Congo':'刚果',
                            'Colombia':'哥伦比亚',
                            'Costa Rica':'哥斯达黎加',
                            'Cuba':'古巴',
                            'N. Cyprus':'北塞浦路斯',
                            'Cyprus':'塞浦路斯',
                            'Czech Rep.':'捷克',
                            'Germany':'德国',
                            'Djibouti':'吉布提',
                            'Denmark':'丹麦',
                            'Algeria':'阿尔及利亚',
                            'Ecuador':'厄瓜多尔',
                            'Egypt':'埃及',
                            'Eritrea':'厄立特里亚',
                            'Spain':'西班牙',
                            'Estonia':'爱沙尼亚',
                            'Ethiopia':'埃塞俄比亚',
                            'Finland':'芬兰',
                            'Fiji':'斐济',
                            'Falkland Islands':'福克兰群岛',
                            'France':'法国',
                            'Gabon':'加蓬',
                            'United Kingdom':'英国',
                            'Georgia':'格鲁吉亚',
                            'Ghana':'加纳',
                            'Guinea':'几内亚',
                            'Gambia':'冈比亚',
                            'Guinea Bissau':'几内亚比绍',
                            'Eq. Guinea':'赤道几内亚',
                            'Greece':'希腊',
                            'Greenland':'格陵兰',
                            'Guatemala':'危地马拉',
                            'French Guiana':'法属圭亚那',
                            'Guyana':'圭亚那',
                            'Honduras':'洪都拉斯',
                            'Croatia':'克罗地亚',
                            'Haiti':'海地',
                            'Hungary':'匈牙利',
                            'Indonesia':'印度尼西亚',
                            'India':'印度',
                            'Ireland':'爱尔兰',
                            'Iran':'伊朗',
                            'Iraq':'伊拉克',
                            'Iceland':'冰岛',
                            'Israel':'以色列',
                            'Italy':'意大利',
                            'Jamaica':'牙买加',
                            'Jordan':'约旦',
                            'Japan':'日本',
                            'Kazakhstan':'哈萨克斯坦',
                            'Kenya':'肯尼亚',
                            'Kyrgyzstan':'吉尔吉斯斯坦',
                            'Cambodia':'柬埔寨',
                            'Korea':'韩国',
                            'Kosovo':'科索沃',
                            'Kuwait':'科威特',
                            'Lao PDR':'老挝',
                            'Lebanon':'黎巴嫩',
                            'Liberia':'利比里亚',
                            'Libya':'利比亚',
                            'Sri Lanka':'斯里兰卡',
                            'Lesotho':'莱索托',
                            'Lithuania':'立陶宛',
                            'Luxembourg':'卢森堡',
                            'Latvia':'拉脱维亚',
                            'Morocco':'摩洛哥',
                            'Moldova':'摩尔多瓦',
                            'Madagascar':'马达加斯加',
                            'Mexico':'墨西哥',
                            'Macedonia':'马其顿',
                            'Mali':'马里',
                            'Myanmar':'缅甸',
                            'Montenegro':'黑山',
                            'Mongolia':'蒙古',
                            'Mozambique':'莫桑比克',
                            'Mauritania':'毛里塔尼亚',
                            'Malawi':'马拉维',
                            'Malaysia':'马来西亚',
                            'Namibia':'纳米比亚',
                            'New Caledonia':'新喀里多尼亚',
                            'Niger':'尼日尔',
                            'Nigeria':'尼日利亚',
                            'Nicaragua':'尼加拉瓜',
                            'Netherlands':'荷兰',
                            'Norway':'挪威',
                            'Nepal':'尼泊尔',
                            'New Zealand':'新西兰',
                            'Oman':'阿曼',
                            'Pakistan':'巴基斯坦',
                            'Panama':'巴拿马',
                            'Peru':'秘鲁',
                            'Philippines':'菲律宾',
                            'Papua New Guinea':'巴布亚新几内亚',
                            'Poland':'波兰',
                            'Puerto Rico':'波多黎各',
                            'Dem. Rep. Korea':'朝鲜',
                            'Portugal':'葡萄牙',
                            'Paraguay':'巴拉圭',
                            'Qatar':'卡塔尔',
                            'Romania':'罗马尼亚',
                            'Russia':'俄罗斯',
                            'Rwanda':'卢旺达',
                            'W. Sahara':'西撒哈拉',
                            'Saudi Arabia':'沙特阿拉伯',
                            'Sudan':'苏丹',
                            'S. Sudan':'南苏丹',
                            'Senegal':'塞内加尔',
                            'Solomon Is.':'所罗门群岛',
                            'Sierra Leone':'塞拉利昂',
                            'El Salvador':'萨尔瓦多',
                            'Somaliland':'索马里兰',
                            'Somalia':'索马里',
                            'Serbia':'塞尔维亚',
                            'Suriname':'苏里南',
                            'Slovakia':'斯洛伐克',
                            'Slovenia':'斯洛文尼亚',
                            'Sweden':'瑞典',
                            'Swaziland':'斯威士兰',
                            'Syria':'叙利亚',
                            'Chad':'乍得',
                            'Togo':'多哥',
                            'Thailand':'泰国',
                            'Tajikistan':'塔吉克斯坦',
                            'Turkmenistan':'土库曼斯坦',
                            'East Timor':'东帝汶',
                            'Trinidad and Tobago':'特里尼达和多巴哥',
                            'Tunisia':'突尼斯',
                            'Turkey':'土耳其',
                            'Tanzania':'坦桑尼亚',
                            'Uganda':'乌干达',
                            'Ukraine':'乌克兰',
                            'Uruguay':'乌拉圭',
                            'United States':'美国',
                            'Uzbekistan':'乌兹别克斯坦',
                            'Venezuela':'委内瑞拉',
                            'Vietnam':'越南',
                            'Vanuatu':'瓦努阿图',
                            'West Bank':'西岸',
                            'Yemen':'也门',
                            'South Africa':'南非',
                            'Zambia':'赞比亚',
                            'Zimbabwe':'津巴布韦'
                        },
                        itemStyle: {

                            // 原来世界地图 出现国家区域的地方的颜色
                            areaColor: '#323C48',
                            borderColor: '#1C1C1C'
                        },
                        emphasis: {
                            itemStyle: {
                                areaColor: '#2a333d'
                            },

                            /*原来的实现方式*/
                            /*  label: {
                                  show: false
                              }*/

                            /**
                             *  此种实现方式是：鼠标放上去的时候才显示国家名字
                             *  lable标签：放在emphasis里面：鼠标悬停的时候才显示国家名字或者省份名字
                             *  lable标签：放在emphasis外面 及与emphasis是兄弟关系 一直显示国家名字
                             */
                            label: {
                                color:'#fff',
                                normal: {
                                    show: false, // 是否显示对应地名
                                    textStyle: { //字体颜色
                                        color: '#000000'
                                    }
                                },
                                emphasis: {
                                    show: true,
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            }

                        }
                    },

                    series: [
                        // 第一组数据
                        {
                            name: res.data.types[0],
                            type: 'scatter',
                            /* center: [113.83531246, 34.0267395887],*/
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[0]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第二组数据
                        {
                            name: res.data.types[1],
                            type: 'scatter',
                            /*   center: [113.83531246, 34.0267395887],*/
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[1]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第三组数据
                        {
                            name: res.data.types[2],
                            type: 'scatter',
                            /*  center: [113.83531246, 34.0267395887],*/
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[2]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第四组数据
                        {
                            name: res.data.types[3],
                            type: 'scatter',
                            /*center: [113.83531246, 34.0267395887],*/
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[3]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第五组数据
                        {
                            name: res.data.types[4],
                            type: 'scatter',
                            /*  center: [113.83531246, 34.0267395887],*/
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[4]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第六组数据
                        {
                            name: res.data.types[5],
                            type: 'scatter',

                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[5]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        }
                    ]

                }

                if (optionWorld && typeof optionWorld === "object") {
                    myChartWorld.setOption(optionWorld, true);
                }


            }
        });

        /**
         * 中国地图初始化
         */
        $.ajax({
            type: 'POST',
            url: 'talentInfo/queryMap?china=1',
            dataType: 'JSON',
            success: function (res) {

                optionChina = {

                    // 原来地图的背景颜色 没有国家的地方
                    /* backgroundColor: '#404a59',*/

                    backgroundColor: '#404B58',
                    // backgroundColor: '#f5f5f5',

                    title: {
                        /* text: '全球衢籍人才地图',*/
                        x: 'center',
                        textStyle: {
                            color: '#666666'
                        }
                    },
                    tooltip: {
                        trigger: 'item',
                        // 弹窗显示内容
                        formatter: function (params) {
                            var tipHtml = '';
                            tipHtml = '<div style="background:rgba(22,80,158,0.8);border:1px solid rgba(7,166,255,0.7)">'
                                + '<div style="width:100%;height:40px;line-height:30px;border-bottom:2px solid rgba(7,166,255,0.7);padding:0 20px">' + '<i style="display:inline-block;width:8px;height:8px;background:#16d6ff;border-radius:40px;">' + '</i>'
                                + '<span style="margin-left:10px;color:#fff;font-size:16px;">' + params.name + '</span>' + '</div>'
                                + '<div style="padding:20px">'


                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '原籍地：' + '<span style="color:#f4e925;margin:0 6px;">' + params.value[2].town + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '现所在地：' + '<span style="color:#f4e925;margin:0 6px;">' + params.value[2].local + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '现工作单位：' + '<span style="color:#f4e925;margin:0 6px;">' + params.value[2].unit + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '职务：' + '<span style="color:#11ee7d;margin:0 6px;">' + params.value[2].posi + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '人才性质：' + '<span style="color:#f48225;margin:0 6px;">' + params.value[2].type + '</span>' + '</p>'

                                + '</div>' + '</div>';

                            return tipHtml;
                        }
                    },
                    // legend: {
                    //    /* orient: 'horizontal',*/
                    //     orient: 'vertical',  //垂直显示
                    //     x: '10px',
                    //     y: '10px',
                    //     data: res.data.types,
                    //     textStyle: {
                    //         color: '#ffffff',
                    //         fontSize: 14  // 修改字体大小
                    //     }
                    // },

                    // 控制左上角的圆形按钮的颜色
                    color: ['#FFD300', '#C23531', '#01C7FF', '#CD1BF6', '#FE8503', '#009933'],

                    geo: {
                        map: 'china',
                        roam: true,
                        zoom: 1.5,
                        /*  center: [113.83531246, 34.0267395887],*/
                        itemStyle: {
                            areaColor: '#323C48',
                            borderColor: '#1c1c1c'
                        },
                        emphasis: {
                            itemStyle: {
                                areaColor: '#2a333d'
                            },
                            label: {
                                show: false
                            }
                        },

                        /*显示省份的名字  放在此处是一直显示省份名字*/
                        label: {
                            /* show: false*/
                            /*  show:true*/  // 此时是 鼠标放上去显示省份的名字
                            normal: {
                                show: true, // 是否显示对应地名
                                textStyle: { //字体颜色
                                    /* color: '#ff0b07'*/
                                    color: '#000000'
                                }
                            },
                            emphasis: {
                                show: false,
                                textStyle: {
                                    color: '#fff'
                                }
                            }
                        }


                    },

                    series: [
                        // 第一组数据
                        {
                            name: res.data.types[0],
                            type: 'scatter',
                            /* center: [113.83531246, 34.0267395887],*/
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[0]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第二组数据
                        {
                            name: res.data.types[1],
                            type: 'scatter',
                            /*   center: [113.83531246, 34.0267395887],*/
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[1]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第三组数据
                        {
                            name: res.data.types[2],
                            type: 'scatter',
                            /*  center: [113.83531246, 34.0267395887],*/
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[2]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第四组数据
                        {
                            name: res.data.types[3],
                            type: 'scatter',
                            /*center: [113.83531246, 34.0267395887],*/
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[3]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第五组数据
                        {
                            name: res.data.types[4],
                            type: 'scatter',
                            /*  center: [113.83531246, 34.0267395887],*/
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[4]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第六组数据
                        {
                            name: res.data.types[5],
                            type: 'scatter',

                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[5]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        }
                    ]
                }

                if (optionChina && typeof optionChina === "object") {
                    myChartChina.setOption(optionChina, true);
                }


            }
        });


        /**
         * 视频查询
         */
        $.ajax({
            type: 'GET',
            url: 'configVideo/queryVideo',
            dataType: 'JSON',
            async: false,
            success: function (result) {
                var videoHtml = "";


                videoHtml += '<video id="videoId" controls="controls" webkit-playsinline="true" style="width: 100%;height: auto;margin-bottom: 44px;"  preload="none">';
                videoHtml += '<source  src="';
                /*  注意：result.data 本身就是个字符串 所以不用再加引号，注意这里取值和
                       和freemarker 中的$ 取值没有关系*/
                videoHtml += result.data;
                videoHtml += '"/>';

                videoHtml += '</video>';

                $('#videoDiv').append(videoHtml);

            }
        });

        /**
         * 知名乡贤人才信息:竖直列表
         */
        $.ajax({
            type: 'GET',
            url: 'talentInfo/findFamous?time=' + Date.parse(new Date()),
            dataType: 'JSON',
            async: false,
            success: function (result) {
                let data = result.data;
                // console.log(data);
                $("#famousRowsListDiv div").remove(); // 防止重复添加 拼接前先清空

                for(let i = 0; i<data.length; i++){
                    let id = data[i].id;
                    let imgAddress = data[i].avatar;

                    let eachFamousRowDiv = "";
                    eachFamousRowDiv += '<div class="row talentEachRow">'; // div0标记开始
                    eachFamousRowDiv += '<div class="col-xs-3">';  // div1标记开始

                    eachFamousRowDiv += ' <div style="padding-top: 17px;">'; // div2标记开始

                    /*原来的 地址 判断一下 如果为空的话 将设置为默认的图片：*/
                    if (imgAddress == undefined) {
                        eachFamousRowDiv += '<img src="./images/default.jpg" style="width: 72px;height: 72px;border-radius: 36px;">';
                    } else {
                        eachFamousRowDiv += '<img style="width: 72px;height: 72px;border-radius: 36px;" src=" ';
                        eachFamousRowDiv += data[i].avatar;
                        eachFamousRowDiv += '">';
                    }

                    eachFamousRowDiv += '</div>';  // div2标记结束
                    eachFamousRowDiv += '</div>'; // div1 结束

                    eachFamousRowDiv += ' <div class="col-xs-6" style="">';
                    eachFamousRowDiv += '<div style="padding-top: 20px;">';
                    eachFamousRowDiv += '<span class="nameDetails">';
                    eachFamousRowDiv +=  data[i].name;
                    eachFamousRowDiv += '</span><br>';
                    eachFamousRowDiv += '<div class="postionDetails omitPostionDetails">';
                    eachFamousRowDiv += data[i].position;
                    eachFamousRowDiv += '</div>';
                    eachFamousRowDiv += '</div>';
                    eachFamousRowDiv += '</div>';

                    eachFamousRowDiv += '<div class="col-xs-2" style="text-align: center;line-height: 106px;">';
                    eachFamousRowDiv += ' <button id="arrowNext" type="button" class="btn" style="background-color: #FFFFFF;outline:none;" ';
                    eachFamousRowDiv += 'data-id="';
                    eachFamousRowDiv += id;
                    eachFamousRowDiv += '" onclick="javascript:setFamousDetailsModel(';
                    eachFamousRowDiv += id;
                    eachFamousRowDiv += ')"';
                    eachFamousRowDiv +='  data-toggle="modal" data-target="#famousDetailsModal" data-whatever="@getbootstrap">';
                    eachFamousRowDiv += '</button>';
                    eachFamousRowDiv += '</div>';

                    eachFamousRowDiv += '</div>';

                    $('#famousRowsListDiv').append(eachFamousRowDiv);
                }

            }
        });


        /**
         * 知名乡贤详情页：轮播图页面
         */
        $('#famousDetailsModal').on('show.bs.modal', function (event) {

            // 模态框弹出禁止 body滚动条
            $(document.body).css({"overflow-y":"hidden"});

            $.ajax({
                type: 'GET',
                url: 'talentInfo/famousDetail?tfId=' + famousDetailsId,
                dataType: 'JSON',
                async: false,
                success: function (result) {

                    $("#basicInfoDiv div").remove(); // 防止重复添加 拼接前先清空
                    let imgAvatar = result.data.avatar;
                    let basicInfoDivHtml = "";

                    // 头像信息
                    basicInfoDivHtml  += '<div style="width: 80px;height: 80px;margin: 0 auto;">';
                    if (imgAvatar == undefined) {
                        basicInfoDivHtml  += '<img src="./images/default.jpg"  style="width:100%;height: 100%;border-radius: 40px;">';
                    } else {
                        basicInfoDivHtml  += '<img style="width:100%;height: 100%;border-radius: 40px;" src=" ';
                        basicInfoDivHtml  += imgAvatar;
                        basicInfoDivHtml  += '">';
                    }
                    basicInfoDivHtml  += '</div>';

                    // 名字信息
                    basicInfoDivHtml  += '<div class="nameDetails" style="height: 22px;margin: 10px auto;">';
                    basicInfoDivHtml  += result.data.name;
                    basicInfoDivHtml  += '</div>';

                    // 职位信息: 如果为空 不显示改div 修正空隙过大
                    // if(result.data.position != ""){
                    //     basicInfoDiv += '<div class="postionDetails" style="margin: 10px auto;text-align: left;width: 67.5%;text-indent: 2em;">';
                    //     basicInfoDiv += result.data.position;
                    //     basicInfoDiv += '</div>';
                    // }

                    // 社会兼职 做判空处理 如果没有值 则不显示该div
                    if(result.data.position != "" || result.data.socialWork != "" ){
                        basicInfoDivHtml  += ' <div class="socialWorkMobile" style="width: 67.5%;height: 140px;overflow-y: auto;overflow-x: hidden;font-size: 14px;">';

                        basicInfoDivHtml  += result.data.position;
                        basicInfoDivHtml  += '<br>';
                        basicInfoDivHtml  += '&nbsp;&nbsp;&nbsp;&nbsp;';

                        basicInfoDivHtml  += result.data.socialWork;
                        basicInfoDivHtml  += '</div>';
                    }

                    $('#basicInfoDiv').append(basicInfoDivHtml); // 基本信息拼接完成

                    /*拼接轮播图页面*/
                    $("#lunBoDiv div").remove();
                    if(result.data.pics.length > 0 ){

                        let lunBoDivHtml = "";
                        lunBoDivHtml += '<div class="carouselDivMobile" style="width: 72%; height:auto;">';
                        lunBoDivHtml += '<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" >';

                        /*Indicators*/
                        lunBoDivHtml += '<ol class="carousel-indicators" style="bottom: -15px;">';
                        lunBoDivHtml += '<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>'; // 第一个默认active
                        // 循环生成 1 2 3 ...
                        for(let i = 1; i<result.data.pics.length; i++){
                            lunBoDivHtml += '<li data-target="#carousel-example-generic" data-slide-to="';
                            lunBoDivHtml += i;
                            lunBoDivHtml += '"></li>';
                        }
                        lunBoDivHtml += '</ol>';


                        /**
                         *  Wrapper for slides 图片信息
                         *  第一个图片：设置为active状态 剩下的图片循环生成
                         */
                        lunBoDivHtml += '<div class="carousel-inner" role="listbox">';
                        lunBoDivHtml += '<div class="item active">';
                        lunBoDivHtml += '<img  src="';
                        lunBoDivHtml += result.data.pics[0];
                        lunBoDivHtml += '" alt="...">';
                        lunBoDivHtml += '</div>';

                        for(let i = 1; i<result.data.pics.length; i++) {
                            lunBoDivHtml += '<div class="item">';
                            lunBoDivHtml += '<img  src="';
                            lunBoDivHtml += result.data.pics[i];
                            lunBoDivHtml += '" alt="...">';
                            lunBoDivHtml += '</div>';
                        }
                        lunBoDivHtml += '</div>'; //  Wrapper for slides end
                        /*Controls*/
                        lunBoDivHtml += '<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">';
                        lunBoDivHtml += '<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>';
                        lunBoDivHtml += '<span class="sr-only">Previous</span>';
                        lunBoDivHtml += '</a>';

                        lunBoDivHtml += '<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">';
                        lunBoDivHtml += '<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>';
                        lunBoDivHtml += '<span class="sr-only">Next</span>';
                        lunBoDivHtml += '</a>';
                        lunBoDivHtml += '</div>';
                        lunBoDivHtml += '</div>';

                        $('#lunBoDiv').append(lunBoDivHtml);

                        // 解决轮播图不能自动轮播
                        $('#carousel-example-generic').carousel({
                            interval: 2000
                        });
                    }
                }
            });


        });

        /**
         * 轮播图关闭 触发body 滚动条
         */
        $('#famousDetailsModal').on('hide.bs.modal', function (event) {
            $(document.body).css({"overflow-y":"auto"});
        });

    });

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

</script>


</body>
</html>
