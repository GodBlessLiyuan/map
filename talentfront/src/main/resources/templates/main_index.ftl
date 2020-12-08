<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
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
    <link href="./css/common.css" rel="stylesheet"/>
    <#--加载动画-->

   <#if preloader >
    <link href="./css/preloader.css" rel="stylesheet">
   </#if>

    <!--toast-->
    <link href="css/toast.css" rel="stylesheet">



<style>
    input:-webkit-autofill,
    input:-webkit-autofill:hover,
    input:-webkit-autofill:focus,
    input:-webkit-autofill:active {
        -webkit-transition-delay: 99999s;
        -webkit-transition: color 99999s ease-out, background-color 99999s ease-out;
    }

    ::-ms-clear, ::-ms-reveal {
        display: none;
    }

    body {
        margin: 0;
        padding-right: 0px !important;
    }

    #searchGeneralInput {
        padding-left: 30px;
        background: url(./images/ico_research.png) no-repeat left 8px top 6px;
        vertical-align: middle;
        z-index: 50;
    }

    #bgBlue {
        background: url(./images/bg_blue.png) no-repeat;
        background-size: cover;
    }

    #fullscreenBtn {
        margin-left: 5px !important;
        padding-left: 31px;
        background: url(./images/ico_screenf.png) no-repeat left 8px top 6px;
        vertical-align: middle;
    }

    #personelBtn {
        margin-left: 5px !important;
        padding-left: 31px;
        background: url(./images/ico_personnel.png) no-repeat left 8px top 5px;
        vertical-align: middle;

        font-family: PingFangSC-Medium;
        font-size: 14px;
        color: #3698E9;
    }

    #showVideo {
        margin-left: 5px;
        padding-left: 31px;
        font-size: 14px;
        background: url(./images/ico_video.png) no-repeat left 8px top 6px;
        vertical-align: middle;

        font-family: PingFangSC-Medium;
        font-size: 14px;
        color: #3698E9;
    }

    /*退出全屏*/
    #exitFull {
        text-align: right;
        background: url(./images/ico_screen.png) no-repeat left;
        width: 90px;
        height: 36px;

        float: right;
        margin-top: -843px;

        padding-right: 5px;
        font-family: PingFangSC-Medium;
        font-size: 14px;
        color: #43ACF5;
        line-height: 36px;
        text-align: right;

    }

    .tabFont {
        font-family: PingFangSC-Medium;
        font-size: 14px;
        color: #1E88E5;
        text-align: center;
    }

    .eachHoverDiv {
        /* display: none;*/
    }


    table {
        table-layout: fixed;
    }

    td {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    #topHeader {
        background: url(./images/bg_top.jpg) no-repeat;
        background-size: cover;
    }

</style>
</head>


<body>

<#if preloader >
    <div id="preloader" style="margin: 0 auto;background-color: #030303">
        <div id="preloader-inner" style="text-align: center;margin: 0 auto;height: 100%;">
<#--            <img src="./images/preloader.gif" style="width: auto;height: 100%;">


            <audio controls="controls" autoplay="autoplay" style="display:none;">
              <source src="./images/yisell_sound_2010071920061310642_88016.mp3" type="audio/mpeg">
            </audio>-->

            <#--后期如需要声音：将其替换成视频格式就行 自动播放即可-->
                       <video autoplay style="width: auto;height: 100%;">
                            <source src="./images/1_2_1.mp4" />
                        </video>

        </div>
    </div>
<#else>
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"/>
            </svg>
        </div>
    </div>
</#if>


<div id="topHeader" class="topHeader">
    <#include "freemarker/base/header.ftl"/>
    <#include "freemarker/base/toast.ftl"/>
</div>

<!--蓝色背景框-->
<div id="bgBlue" style="height: 500px;">

</div>

<#--地图模块-->
<div id="mapContent" class="mapcontainer topMove" style="z-index: 997;">

    <!--按钮组-->
    <div class="fourBtn" id="fourBtn" style="vertical-align: middle;">

        <div class="btn-group " role="group" aria-label="..."
             style="float:right;vertical-align: middle;padding-top: 5px;">

            <#--当前的搜索框和输入框-->
            <input type="text" id="searchGeneralInput"
                   style="background-color: #FFFFFF;outline: none;height: 36px;padding-top: 0px;" placeholder="可输入姓名">

            <div id="searchGeneralBtn" class="btn btn-primary" style="padding-left: 0px;text-align: center;
                    margin-left: -47px;z-index: 400;border:none; "
                 data-toggle="modal"
                 data-target="#searchModal" data-whatever="@getbootstrap" onclick="searchClick()"> 搜索
            </div>

            <button id="fullscreenBtn" type="button" class="btn btnCom"
                    style="width: 70px;background-color: #FFFFFF;margin-left:5px;border-radius: 4px;border-radius: 4px;"
                    onclick="showFull()">全屏
            </button>

            <button id="personelBtn" type="button" class="btn btnCom"
                    style="width: 70px;background-color: #FFFFFF;border-radius: 4px;border-radius: 4px;margin-left: 5px;"
                    data-toggle="modal"
                    data-target="#searchModal" data-whatever="@getbootstrap" style="">人员
            </button>

            <button id="showVideo" type="button" class="btn btnCom"
                    style="width: 70px;background-color: #FFFFFF;border-radius: 4px;border-radius: 4px;"
                    data-toggle="modal"
                    data-target="#videoModal" data-whatever="@getbootstrap">视频
            </button>

            <input id="switchBtn" class="btn btn-default btnCom" type="button" value="全球">
        </div>
    </div>


    <div id="world" class="worldmapSmall">
        <div id="worldcontainer" style="height: 100%"></div>
    </div>
    <div id="china" class="worldmapSmall">
        <div id="chinacontainer" style="height: 100%"></div>
    </div>


<#--    <div id="exitFull" style="margin-right: 30px;" onclick="delFull()" class="exitFull">
        退出全屏
    </div>-->

    <#--退出全屏悬浮button-->
    <button id="exitFull" style="margin-right: 30px;padding-left: 10px;border: 1px solid #EEEEEE;box-shadow: 0 0 6px 0 #EEEEEE;border-radius: 4px;"
            onclick="delFull()" class="exitFull">退出全屏</button>
</div>

<#--知名乡贤人才列表-->
<div id="infoContent" class="infoContent" style="margin-top: 30px;">
    <!--知名乡贤人才标题-->
    <div class="wellkonwn" style="margin-top: 20px;margin-bottom: 20px;">
        <div style="width:150px;height: 28px; margin: 0 auto;background:url(./images/famous.png) no-repeat ;background-size: cover"></div>
    </div>
    <!--下划线-->
    <div class="divline">
    </div>
    <!--知名乡贤人才列表：-->
    <div class="famousList" id="famousList" style="margin-bottom: 50px;margin-top: 20px;/*padding-left: 9%;*/">

    </div>

    <div id="seeMoreDiv" style="width:100%;height: 40px;line-height:40px;margin-top: 740px;">
        <div class="morebtn" id="morebtn" onclick="clickfindMore();">
            查看更多>
        </div>
    </div>

</div>

<!-- 一般乡贤-->
<div class="modal fade bs-example-modal-lg" id="searchModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-lg" role="document" style="max-width: 1100px">
        <div class="modal-content" style="/*height: 610px;*/width: 1100px;height: auto; ">
            <div class="modal-header" style="border-bottom:0px">
                <ul class="nav nav-pills" id="talentTab">
                    <li role="presentation" class="active"><a href="#menu2" onclick="generalTabClick()"><h5
                                    class="modal-title tabFont">乡贤人才</h5></a>
                    </li>
                </ul>
                <button id="aModalX" type="button" class="close" data-dismiss="modal"
                        aria-label="Close" onclick="closeModalClick()"
                        style="background:url(./images/ico_close.png) no-repeat center;margin-right: 10px;margin-top: 10px;">
                </button>
            </div>
            <div class="tab-content">
                <div id="menu2" class="container tab-pane active">
                    <div class="modal-body">
                        <div class="basic-form">
                            <form class="form-inline" style="width: 100%" id="search">
                                <div class="form-group ">
                                    <span>姓名&nbsp;&nbsp;</span>
                                    <input id="generalName" type="text" class="name-input"
                                           placeholder="请输入">
                                </div>
                                <div class="form-group">
                                    <span>原籍地&nbsp;&nbsp;</span>
                                    <input id="generalTown" type="text"
                                           class="address-input"
                                           placeholder="请输入">
                                </div>
                                <div class="form-group">
                                    <span>现所在地&nbsp;&nbsp;</span>
                                    <input id="generalLocation" type="text"
                                           class="address-input"
                                           placeholder="请输入">
                                </div>
                                <div class="form-group">
                                    <span>现工作单位&nbsp;&nbsp;</span>
                                    <input id="generalUnit" type="text" class="address-input"
                                           placeholder="请输入">
                                </div>
                                <div class="form-group">
                                    <span for="recipient-name" class="col-form-label">人才性质&nbsp;&nbsp;</span>
                                    <select id="generalType" class="select-input">
                                        <option value='0' selected='selected'>请选择</option>
                                    </select>
                                </div>
                                <div class="form-group" style="padding-left: 10px">
                                    <button type="button" class="btn btn-outline-info button3-control" id="focusQuery"
                                            style="font-size: 14px;line-height: 1px;"
                                            onclick="queryGeneralClick();">查询
                                    </button>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-outline-light button3-control" id="focusReset"
                                            style="font-size: 14px;line-height: 1px;"
                                            onclick="resetGeneralClick()">重置
                                    </button>
                                </div>
                            </form>
                        </div>

                        <div class="table-responsive" style="width: 100%">
                            <table id="generalTab"
                                   class="table table-striped table-bordered zero-configuration"
                                   style="table-layout: fixed; text-align: center; vertical-align: middle">
                                <thead>
                                <tr>

                                    <#--<th style="width: 25px">ID</th>-->
                                    <#--<th style="width: 50px">姓名</th>-->
                                    <#--<th style="width: 110px">现所在地</th>-->
                                    <#--<th style="width: 110px">现工作单位</th>-->
                                    <#--<th style="width: 110px">行业领域</th>-->
                                    <#--<th style="width: 110px">人才性质</th>-->
                                    <#---->

                                    <th style="width: 25px">ID</th>
                                    <th style="width: 50px">姓名</th>
                                    <th style="width: 110px">原籍地</th>
                                    <th style="width: 110px">现所在地</th>
                                    <th style="width: 110px">现工作单位</th>
                                    <th style="width: 110px">人才性质</th>
                                    <th style="width: 110px">移动电话</th>



                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- 视频查看-->
<div class="modal fade" id="videoModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header" style="padding:30px 54px;border-bottom: none;">
                <span style="font-family: PingFangSC-Medium;font-size: 16px;color: #333333;">视频</span>
                <button id="aModalX" type="button" class="close" data-dismiss="modal"
                        aria-label="Close" onclick="closeModalClick()"
                        style="background:url(./images/ico_close.png) no-repeat center;margin-top: 3px;">
                </button>
            </div>
            <#--视频部分-->
            <div class="videoDiv" id="videoDiv">

            </div>

        </div>
    </div>
</div>


<!--**********************************
    Scripts
***********************************-->

<script src="plugins/common/common.min.js"></script>
<#if preloader >
    <script src="js/main.min.js"></script>
<#else>
    <script src="js/custom.min.js"></script>
</#if>
<#--动画冲突 删除custom.min.js-->
<#--<script src="js/custom.min.js"></script>-->

<script src="js/styleSwitcher.js"></script>

<script src="js/mapComm.js"></script>
<script src="js/famous.js"></script>

<script src="./plugins/jquery/jquery.min.js"></script>
<script src="./js/bootstrap.js"></script>

<script src="./plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="./js/jquery.preloader.js"></script>

<script type="text/javascript">

    /**
     * 修改前台：修改密码后清空模态框数据
     */
    $('#updatePwdModal').on('hide.bs.modal', function (event) {
        $("#oldPassword").val(null);
        $("#newPassword").val(null);
        $("#confirm").val(null);
    });


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

    var searchName;
    /**
     * 功能：监控div的大小变化相当于window.resize 函数
     */
    (function ($, h, c) {
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
            setup: function () {
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
            teardown: function () {
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
            add: function (l) {
                if (!e[f] && this[k]) {
                    return false;
                }
                var n;

                function m(s, o, p) {
                    var q = $(this),
                        r = $.data(this, d);
                    r.w = o !== c ? o : q.width();
                    r.h = p !== c ? p : q.height();
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
            i = h[k](function () {
                    a.each(function () {
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


    /**
     * 全屏功能：添加隐藏相关的样式
     */
    function showFull() {
        myChartWorld.resize();
        myChartWorld.resize();

        $("#topHeader").addClass("gone");
        $("#bgBlue").addClass("gone");
        $("#infoContent").addClass("gone");
        $("#bottomDiv").addClass("gone");

        $("#fourBtn").addClass("gone");
        /*移除样式：*/

        $("#mapContent").removeClass("topMove");

        $("#fourBtn").addClass("gone");

        $("#exitFull").show();

        $("#mapContent").addClass(" fullScreenCondition");

        $("#world").removeClass("worldmapSmall");
        $("#world").addClass("worldmapLarge");

        $("#china").removeClass("chinamapSmall");
        $("#china").addClass("chinamapLarge");


    }

    /**
     * 退出全屏：还原原来的样式
     */
    function delFull() {
        $("#topHeader").removeClass("gone");
        $("#bgBlue").removeClass("gone");
        $("#infoContent").removeClass("gone");
        $("#bottomDiv").removeClass("gone");

        $("#fourBtn").removeClass("gone");
        /*移除样式：*/

        $("#mapContent").addClass(" topMove");
        $("#exitScreenBtn").removeClass("gone");
        $("#mapContent").removeClass("fullScreenCondition");

        $("#world").addClass("worldmapSmall");
        $("#world").removeClass("worldmapLarge");

        $("#china").addClass("chinamapSmall");
        $("#china").removeClass("chinamapLarge");

        $("#exitFull").hide();
    }


    /**
     * 一般人才查询
     */
    function queryGeneralClick() {
        if ($.fn.dataTable.isDataTable('#generalTab')) {
            $('#generalTab').DataTable().destroy();
        }



        // var reqData = new FormData();
        let name = $('#generalName').val().toString();
        let location = $('#generalLocation').val();
        let town = $('#generalTown').val();
        // let phone = $('#generalPhone').val();
        let unit = $('#generalUnit').val();
        let type = $('#generalType').val();
        $('#generalTab').DataTable({
            "processing": false,
            "serverSide": true,
            "searching": false, // 禁用全文搜索
            "ordering": false, // 禁用排序
            "ajax": "talentInfo/findGeneral?name=" + encodeURIComponent(name) + "&natureId=" + type + "&location=" + encodeURIComponent(location) + "&workUnit=" + encodeURIComponent(unit)
                + "&town=" + encodeURIComponent(town),
            "fnDrawCallback": function () {
                let startIndex = this.api().context[0]._iDisplayStart;
                this.api().column(0).nodes().each(function (cell, i) {
                    cell.innerHTML = startIndex + i + 1;
                });
            },
            "columns": [
                {"data": null, "targets": 0},
                {
                    "data": "name",
                    "render": function (data) {
                        console.log("当前的名字：" + data);
                        return table_alert(data);
                    }
                },
                {
                    "data": "town",
                    "render": function (data) {
                        return table_alert(data);
                    }
                },
                {
                    "data": "local",
                    "render": function (data) {
                        return table_alert(data);
                    }
                },
                {
                    "data": "unit",
                    "render": function (data) {
                        return table_alert(data);
                    }
                },
                {
                    "data": "nature",
                    "render": function (data) {
                        return table_alert(data);
                    }
                },
                {
                    "data": "phone",
                    "render": function (data) {
                        return table_alert(data);
                    }
                }

            ],
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "无符合条件的用户信息",
                "sInfo": "共 _TOTAL_ 条 第 _PAGE_ / _PAGES_ 页",
                "sInfoEmpty": "",
                "sInfoFiltered": "(数据表中共 _MAX_ 条记录)",
                "sProcessing": "正在加载中...",
                "sSearch": "全文搜索：",
                "oPaginate": {
                    "sFirst": "第一页",
                    "sPrevious": " 上页 ",
                    "sNext": " 下页 ",
                    "sLast": " 最后一页 "
                }
            },
            "bLengthChange": false, //开关，是否显示每页显示多少条数据的下拉框
            "aLengthMenu": [[5, 10, 25, 50], [5, 10, 25, 50]],//设置每页显示数据条数的下拉选项
            'iDisplayLength': 10, //每页初始显示5条记录
            'bFilter': false,  //是否使用内置的过滤功能（是否去掉搜索框）
            "bInfo": true, //开关，是否显示表格的一些信息(当前显示XX-XX条数据，共XX条)
            "bPaginate": true, //开关，是否显示分页器
            "bSort": false, //是否可排序 
            "bAutoWidth": false,
        });
        $('#generalTab').DataTable.aLengthMenu;
    }

    /**
     * 一般人才查询 初始进来
     */
    function generalTabClick() {
        resetFocusClick();
        if ($.fn.dataTable.isDataTable('#generalTab')) {
            $('#generalTab').DataTable().destroy();
        }
        $('#talentTab a[href="#menu2"]').tab('show');
        $('#generalTab').DataTable({
            "processing": false,
            "serverSide": true,
            "searching": false, // 禁用全文搜索
            "ordering": false, // 禁用排序
            "ajax": "talentInfo/findGeneral",
            "fnDrawCallback": function () {
                let startIndex = this.api().context[0]._iDisplayStart;
                this.api().column(0).nodes().each(function (cell, i) {
                    cell.innerHTML = startIndex + i + 1;
                });
            },
            "columns": [
                {"data": null, "targets": 0},
                {
                    "data": "name",
                    "render": function (data) {
                        console.log("当前的名字：" + data);
                        return table_alert(data);
                    }
                },
                {
                    "data": "town",
                    "render": function (data) {
                        return table_alert(data);
                    }
                },
                {
                    "data": "local",
                    "render": function (data) {
                        return table_alert(data);
                    }
                },
                {
                    "data": "unit",
                    "render": function (data) {
                        return table_alert(data);
                    }
                },
                {
                    "data": "nature",
                    "render": function (data) {
                        return table_alert(data);
                    }
                },
                {
                    "data": "phone",
                    "render": function (data) {
                        return table_alert(data);
                    }
                }
            ],
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "无符合条件的用户信息",
                "sInfo": "共 _TOTAL_ 条 第 _PAGE_ / _PAGES_ 页",
                "sInfoEmpty": "",
                "sInfoFiltered": "(数据表中共 _MAX_ 条记录)",
                "sProcessing": "正在加载中...",
                "sSearch": "全文搜索：",
                "oPaginate": {
                    "sFirst": "第一页",
                    "sPrevious": " 上页 ",
                    "sNext": " 下页 ",
                    "sLast": " 最后一页 "
                }
            },
            "bLengthChange": false, //开关，是否显示每页显示多少条数据的下拉框
            "aLengthMenu": [[5, 10, 25, 50], [5, 10, 25, 50]],//设置每页显示数据条数的下拉选项
            'iDisplayLength': 10, //每页初始显示5条记录
            'bFilter': false,  //是否使用内置的过滤功能（是否去掉搜索框）
            "bInfo": true, //开关，是否显示表格的一些信息(当前显示XX-XX条数据，共XX条)
            "bPaginate": true, //开关，是否显示分页器
            "bSort": false, //是否可排序 
            "bAutoWidth": false,
        });
        $('#generalTab').DataTable.aLengthMenu;
    }

    /**
     * 重点重置
     */
    function resetFocusClick() {
        $('#generalName').val(null);
        $('#generalLocation').val(null);
        $('#generalUnit').val(null);
        $('#generalType option:first').prop('selected', 'selected');
        // $('#focusTab').empty();
    }

    /**
     * 一般重置
     */
    function resetGeneralClick() {
        $('#generalName').val(null);
        $('#generalLocation').val(null);
        $('#generalUnit').val(null);
        $('#generalType option:first').prop('selected', 'selected');
        $('#generalTown').val(null);
        // $('#generalTab').empty();

        queryGeneralClick();
    }

    /**
     * 人才搜索模态框关闭
     */
    function closeModalClick() {
        resetFocusClick();
        resetGeneralClick();
        $('#talentTab a[href="#menu2"]').tab('show'); // 通过名字选择
        // searchStaff=0;
        $('#focusTab').empty();
        $('#generalTab').empty();
        document.getElementById('videoId').pause();
    }

    /**
     * 搜索按钮，改变全局变量值
     */
    function searchClick() {
        // searchStaff=1;
    }

    /**
     *　点击著名人才跳转famous.index
     * */
    function clickFamous(tfId) {
        window.location.href = "famousDetail?tfId=" + tfId;
    }

    $('#searchModal').on('shown.bs.modal', function () {

        // let searchValue = $("#searchGeneralInput").value;
        // var modal = $(this);
        // modal.find("#generalName").text(searchValue);

        if ($.fn.dataTable.isDataTable('#generalTab')) {
            $('#generalTab').DataTable().destroy();
            // document.getElementById("searchGeneralInput").value = areaName;
            // $('#searchGeneralInput').val()
        }
        let name = $('#searchGeneralInput').val();
         document.getElementById("generalName").value = name;
        $('#generalTab').DataTable({
            "processing": false,
            "serverSide": true,
            "searching": false, // 禁用全文搜索
            "ordering": false, // 禁用排序
            "ajax": "talentInfo/findGeneral?name=" + encodeURIComponent(name),
            "fnDrawCallback": function () {
                let startIndex = this.api().context[0]._iDisplayStart;
                this.api().column(0).nodes().each(function (cell, i) {
                    cell.innerHTML = startIndex + i + 1;
                });
            },
            "columns": [
                {"data": null, "targets": 0},
                {
                    "data": "name",
                    "render": function (data) {
                        console.log("当前的名字：" + data);
                        return table_alert(data);
                    }
                },
                {
                    "data": "town",
                    "render": function (data) {
                        return table_alert(data);
                    }
                },
                {
                    "data": "local",
                    "render": function (data) {
                        return table_alert(data);
                    }
                },
                {
                    "data": "unit",
                    "render": function (data) {
                        return table_alert(data);
                    }
                },
                {
                    "data": "nature",
                    "render": function (data) {
                        return table_alert(data);
                    }
                },
                {
                    "data": "phone",
                    "render": function (data) {
                        return table_alert(data);
                    }
                }

            ],
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "无符合条件的用户信息",
                "sInfo": "共 _TOTAL_ 条 第 _PAGE_ / _PAGES_ 页",
                "sInfoEmpty": "",
                "sInfoFiltered": "(数据表中共 _MAX_ 条记录)",
                "sProcessing": "正在加载中...",
                "sSearch": "全文搜索：",
                "oPaginate": {
                    "sFirst": "第一页",
                    "sPrevious": " 上页 ",
                    "sNext": " 下页 ",
                    "sLast": " 最后一页 "
                }
            },
            "bLengthChange": false, //开关，是否显示每页显示多少条数据的下拉框
            "aLengthMenu": [[5, 10, 25, 50], [5, 10, 25, 50]],//设置每页显示数据条数的下拉选项
            'iDisplayLength': 10, //每页初始显示5条记录
            'bFilter': false,  //是否使用内置的过滤功能（是否去掉搜索框）
            "bInfo": true, //开关，是否显示表格的一些信息(当前显示XX-XX条数据，共XX条)
            "bPaginate": true, //开关，是否显示分页器
            "bSort": false, //是否可排序 
            "bAutoWidth": false,
        });
    });


    $('#videoModal').on('shown.bs.modal', function () {
        document.getElementById('videoId').play();
    });


    /**
     *  根据屏幕大小 选择竖直还是水平
     */
    var width = window.screen.width;
    var varOrient =  'horizontal';
    if(window.screen.width <= 1500){
        varOrient = 'vertical';
    }

    function getInitInfo(){


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
                    title: {
                        // text: '全球衢籍人才地图',
                        x: 'center',
                        textStyle: {
                            color: '#ffffff'
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

                    legend: {

                        orient: varOrient,
                        // orient: 'horizontal',
                        /*orient: 'vertical', */ //垂直显示
                        x: '10px',
                        y: '10px',
                        data: res.data.types,
                        textStyle: {
                            color: '#ffffff',
                            fontSize: 14  // 修改字体大小
                        }
                    },
                    /* borderRadius: 10,*/
                    // 控制左上角的圆形按钮的颜色
                    color: ['#FFD300', '#C23531', '#01C7FF', '#CD1BF6', '#FE8503', '#009933'],

                    geo: {
                        map: 'world',
                        roam: true,
                        zoom: 1,

                        // 世界地图汉化国家对照表
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
                        /*center: [113.83531246, 34.0267395887],*/
                        itemStyle: {

                            // 原来世界地图 出现国家区域的地方的颜色
                            areaColor: '#323C48',
                            borderColor: '#1C1C1C'
                        },
                        emphasis: {
                            itemStyle: {
                                areaColor: '#2a333d'
                            },

                            /*控制世界地图不显示国家*/
                            // label: {
                            //     // show: false
                            //     show: true
                            // }

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
                            symbolSize: 5,
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
                            symbolSize: 5,
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
                            symbolSize: 5,
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
                            symbolSize: 5,
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
                            symbolSize: 5,
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
                            symbolSize: 5,
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
                    legend: {
                        orient: varOrient,
                        /* orient: 'vertical',*/  //垂直显示
                        x: '10px',
                        y: '10px',
                        data: res.data.types,
                        textStyle: {
                            color: '#ffffff',
                            fontSize: 14  // 修改字体大小
                        }
                    },

                    // 控制左上角的圆形按钮的颜色
                    color: ['#FFD300', '#C23531', '#01C7FF', '#CD1BF6', '#FE8503', '#009933'],

                    geo: {
                        map: 'china',
                        roam: true,
                        zoom: 1,
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
         * 人才性质枚举
         */
        $.ajax({
            type: 'POST',
            url: 'nature/queryAll',
            dataType: 'JSON',
            success: function (data) {
                for (let i = 0; i < data.length; i++) {
                    $('#focusType').append("<option value='" + data[i].typeId + "'>" + data[i].name +
                        "</option>");
                    $('#generalType').append("<option value='" + data[i].typeId + "'>" + data[i].name +
                        "</option>");
                }
            }
        });

        /**
         * 知名乡贤人才信息
         */
        $.ajax({
            type: 'GET',
            url: 'talentInfo/findFamous?time=' + Date.parse(new Date()),
            dataType: 'JSON',
            async: false,
            success: function (result) {
                let data = result.data;
                let id;
                /*console.log(data);*/
                $("#famousList div").remove(); // 清空div内部所有子div

                // 无论多少条：都要至少拼接8 条数据
                for (let i = 0; i < data.length && i < 8; i++) {

                    id = data[i].id;
                    let imgAddress = data[i].avatar;


                    let eachHtml = "";
                    /*拼接注意 id 别当成变量了*/
                    eachHtml += "<div class='each' id='famous" + i + "' onclick=clickFamous(" + id + ")>";

                    // 记住这是同一个盒子里面拼接两个 默认显示原来 事件隐藏一个 显示另外一个
                    eachHtml += '<div class="eachSmall " >';

                    /*拼接头像信息*/
                    eachHtml += '<div class="imgDiv" >';

                    /*原来的 地址 判断一下 如果为空的话 将设置为默认的图片：*/
                    if (imgAddress == undefined) {
                        eachHtml += '<img class="imgBorder" src="./images/default.jpg">'
                    } else {
                        eachHtml += '<img class="imgBorder" src=" ';
                        eachHtml += data[i].avatar;
                        eachHtml += '">';
                    }
                    eachHtml += '</div>';

                    /*拼接名字 职位 社会工作 信息 begin*/
                    eachHtml += '<div class="famousInfo" style="padding: 0 10px;">';

                    /*拼接名字*/
                    eachHtml += '<div class="famousName" style="margin-bottom: 20px;">';
                    eachHtml += data[i].name;
                    eachHtml += '</div>';

                    eachHtml += '<div style="text-align: center;margin-bottom: 20px;">';
                    eachHtml += data[i].town;
                    eachHtml += '</div>';

                    /*拼接职位*/
                    eachHtml += '<div id="unitPositionDiv" class="unitPosition omitTextSmall" >';
                    eachHtml += data[i].position;
                    eachHtml += '</div>';

                    eachHtml += '</div>';
                    /*拼接名字 职位 社会工作 信息 end */


                    eachHtml += '</div>'; // 没有触发悬浮时显示的div 结束

                    /*鼠标悬停的时候显示div内容  begin*/
                    /* eachHtml += '<div class="eachBig">';*/

                    /*拼接注意 id 别当成变量了*/
                    eachHtml += "<div class='eachHoverDiv' style=\"display: none;\" id='famous" + i + "' onclick=clickFamous(" + id + ")>";

                    /*拼接头像信息*/
                    eachHtml += '<div class="imgHoverDiv" style="text-align: center;margin-top: 10px;" >';

                    /*原来的 地址 判断一下 如果为空的话 将设置为默认的图片：*/
                    if (imgAddress == undefined) {
                        eachHtml += '<img class="imgHoverBorder" style="height:80px;width:80px;border-radius: 40px;" src="./images/default.jpg">'
                    } else {
                        eachHtml += '<img class="imgHoverBorder" style="height:80px;width:80px;border-radius: 40px;" src=" ';
                        eachHtml += data[i].avatar;
                        eachHtml += '">';
                    }

                    eachHtml += '</div>';


                    /*拼接名字 职位 社会工作 信息 begin*/
                    eachHtml += '<div class="famousInfoHoverDiv" >';

                    /*拼接名字*/
                    eachHtml += '<div class="famousName" style="margin-top: 10px;margin-bottom: 10px;font-size: 14px;">';
                    eachHtml += data[i].name;
                    eachHtml += '</div>';

                    eachHtml += '<div style="text-align: center;">';
                    eachHtml += data[i].town;
                    eachHtml += '</div>';

                    /*社会兼职*/
                    eachHtml += '<div class="unitPositionHover omitTextDiv">';
                    eachHtml += data[i].socialWork;
                    eachHtml += '</div>';

                    eachHtml += '</div>';
                    /*拼接名字 职位 社会工作 信息 end */


                    eachHtml += '<div class="moreInfo" style="position:absolute;bottom: 0">';
                    eachHtml += '更多信息';
                    eachHtml += '</div>';

                    /*eachHtml += '</div >';*/

                    eachHtml += '</div>'; // 触发悬浮事件时显示的拼接div 结束

                    eachHtml += '</div>'; // samll 和 big 最外层的div 拼接结束

                    $('#famousList').append(eachHtml);


                }

                /* 如果数据大于 8 条 则在底部的版权信息上部添加查看等多 按钮
               * 换种思路：查看更多 现在是直接在页面上写死查看更多 如果小于八条 则 删除该div
               * 如果大于8条 则显示
               * */
                if (data.length > 8) {
                    /*显示查看更多：*/
                    $("#seeMoreDiv").show();
                } else {
                    $("#seeMoreDiv").hide();
                }


                /**
                 *  鼠标悬停事件
                 */
                $(".each").hover(function () {

                    $(this).find(".eachSmall").hide();
                    $(this).find(".eachHoverDiv").show();
                }, function () {
                    $(this).find(".eachHoverDiv").hide();
                    $(this).find(".eachSmall").show();

                });
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
                videoHtml += '<video id="videoId" controls="controls"  preload="none">';
                videoHtml += '<source src="';
                /*  注意：result.data 本身就是个字符串 所以不用再加引号，注意这里取值和
                       和freemarker 中的$ 取值没有关系*/
                videoHtml += result.data;
                videoHtml += '"/>';

                videoHtml += '</video>';

                $('#videoDiv').append(videoHtml);

            }
        });


    }


    $(document).ready(function () {

        /**
         *  监控地图窗口的大小 实现重新初始化地图canvas
         */
        $("#mapContent").resize(function () {
            myChartWorld.resize();
            myChartChina.resize();
        });

        // 默认不显示

        $("#exitFull").css("display", "none");

        /**
         * 页面加载事件：默认显示中国人才地图
         */
        $("#china").hide();

        /**
         *  实现全球和全国的地图切换
         */
        $("#switchBtn").click(function () {
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



       <#if preloader >
            setTimeout(function(){
                getInitInfo();
            },9000);
      <#else>
         getInitInfo();
      </#if>

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
