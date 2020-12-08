<!DOCTYPE html>
<html lang="en">

<head>
    <#--    <base href="${basePath}"/>-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="icon" type="image/x-icon" href="./images/logo.png"/>
    <title>全球衢籍乡贤人才地图后台管理系统</title>
    <!-- Favicon icon -->

    <!-- Pignose Calender -->
    <link href="./plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="./plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
    <link href="./css/bootstrap.css" rel="stylesheet">
    <link href="./css/headInfo.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/talent.css" rel="stylesheet">
    <link href="./css/Isfocus.css" rel="stylesheet">

    <link href="./plugins/datatables/jquery.dataTables.min.css" rel="stylesheet">
    <!--jedate-->
    <link rel="stylesheet" type="text/css" href="./plugins/jedate-6.5.0/skin/jedate.css"/>
    <!--toast-->
    <link href="css/toast.css" rel="stylesheet">
    <style>
        table {
            table-layout: fixed;
        }

        td {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        body {
            padding-right: 0px !important;
        }

        *.modal-open {
            overflow-y: scroll;
            padding-right: 0 !important;
        }

        /*       #fileInput {
                   background: url(./images/ico_screen.png) no-repeat right;
               }*/
        .tui-checkbox:checked {
            background:#3698E9;
        }
        .tui-checkbox {
            width:1.2rem;
            height:1.2rem;
            background-color:#ffffff;
            border:solid 1px #dddddd;
            -webkit-border-radius:50%;
            border-radius:50%;
            font-size:0.8rem;
            margin:0;
            padding:0;
            position:relative;
            display:inline-block;
            vertical-align:top;
            cursor:default;
            -webkit-appearance:none;
            -webkit-user-select:none;
            user-select:none;
            -webkit-transition:background-color ease 0.1s;
            transition:background-color ease 0.1s;
        }
        .tui-checkbox:checked::after {
            content:'';

            position:absolute;
            background:transparent;
            border:#fff solid 2px;
            border-top:none;
            border-right:none;
            width:1.2rem;
            height:1.2rem;
        }
        input[type="checkbox"] {
            content:none;
        }
        input[type="checkbox"]:after {
            content:none;
        }
        input[type="checkbox"]:checked:after {
            content:none;
        }

    </style>
</head>

<body>

<!--*******************
    Preloader start
********************-->
<#include "freemarker/base/loader.ftl"/>
<!--*******************
    Preloader end
********************-->

<!--**********************************
    Main wrapper start
***********************************-->
<div id="main-wrapper">

    <!--**********************************
        Nav header start
    ***********************************-->
    <#include "freemarker/base/nav_header.ftl"/>
    <!--**********************************
        Nav header end
    ***********************************-->

    <!--**********************************
        Header start
    ***********************************-->
    <#include "freemarker/base/header.ftl"/>
    <!--**********************************
        Header end ti-comment-alt
    ***********************************-->
    <#include "freemarker/base/dashboard.ftl"/>

    <!--**********************************
        Content body start
    ***********************************-->
    <#include "freemarker/base/toast.ftl"/>
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div>
                                <label class="label-control">乡贤人才列表</label>
                                <div style="float:right">
                                    <button type="button" class="btn mb-2 btn-primary" id="insert"
                                            onclick="javascript:insertClick();">手动录入
                                    </button>
                                    <button type="button" class="btn mb-2 btn-primary" data-toggle="modal" id="batchIns"
                                            data-target="#batchInsertModal" data-whatever="@getbootstrap">批量录入
                                    </button>
                                    <button type="button" class="btn mb-2 btn-outline-info" id="export"
                                            onclick="javascript:exportClick();">导出乡贤数据
                                    </button>
                                </div>
                            </div>
                            <hr>
                            <div class="basic-form">
                                <form class="form-inline">
                                    <div class="form-row">

                                        <div class="form-group">
                                            <span>姓名&nbsp;</span>
                                            <input id="name" type="text" class="name-input" placeholder="请输入">&nbsp;
                                        </div>

                                        <div class="form-group">
                                            <span>原籍地&nbsp;</span>
                                            <input id="town" type="text" class="other-input" placeholder="请输入">&nbsp;
                                        </div>


                                        <div class="form-group">
                                            <span>现所在地&nbsp;</span>
                                            <input id="addr" type="text" class="other-input" placeholder="请输入">&nbsp;
                                        </div>

                                        <div class="form-group">
                                            <span>现工作单位&nbsp;</span>
                                            <input id="workunit" type="text" class="other-input" placeholder="请输入">&nbsp;
                                        </div>
                                        <div class="form-group">
                                            <span>行业领域&nbsp;</span>
                                            <input id="field" type="text" class="other-input" placeholder="请输入">&nbsp;
                                        </div>
                                        <div class="form-group">
                                            <span for="recipient-name" class="col-form-label">人才性质&nbsp;</span>
                                            <select id="type" class="other-input">
                                                <option value='0' selected='selected'>请选择</option>&nbsp;
                                            </select>
                                        </div>

                                        <div class="form-group" style="padding-left: 5px;">
                                            <span> 数据来源&nbsp;</span>
                                            <input id="dataSource" type="text" class="other-input" placeholder="请输入">&nbsp;
                                        </div>


                                        <div class="form-group" style="padding-left: 20px">
                                            <button type="button" class="btn btn-outline-info button1-control"
                                                    id="query"
                                                    <#--onclick="javascript:queryClick();">查询-->
                                                    onclick="javascript:queryClickTwo();">查询
                                            </button>&nbsp;

                                            <button type="button" class="btn btn-outline-light button1-control"
                                                    id="reset"

                                                    onclick="javascript:resetClick()">重置
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="table-responsive" style="width: 100%">
                                <table id="datatab" class="table table-striped table-bordered zero-configuration"
                                       style="text-align: center; vertical-align: middle">
                                    <thead>
                                    <tr>
                                        <#--<th style="width: 30px">序号</th>-->
                                        <#--<th style="width: 60px">姓名</th>-->
                                        <#--<th style="width: 100px">现所在地</th>-->
                                        <#--<th style="width: 150px">现工作单位</th>-->
                                        <#--<th style="width: 80px">行业领域</th>-->
                                        <#--<th style="width: 100px">人才性质</th>-->
                                        <#--<th style="width: 100px">原籍地</th>-->
                                        <#--<th style="width: 80px">是否重要</th>-->
                                        <#--<th style="width: 250px">操作</th>-->
                                        <th style="width: 30px">序号</th>
                                        <th style="width: 80px">是否重要</th>
                                        <th style="width: 60px">姓名</th>
                                        <th style="width: 100px">原籍地</th>
                                        <th style="width: 100px">现所在地</th>
                                        <th style="width: 150px">现工作单位</th>
                                        <th style="width: 80px">行业领域</th>
                                        <th style="width: 100px">人才性质</th>
                                        <th style="width: 100px">数据来源</th>
                                        <th style="width: 250px">操作</th>

                                    </tr>
                                    </thead>
                                </table>
                            </div>

                            <div class="modal fade" id="batchInsertModal" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header" style="border-bottom: none">

                                            <h5 class="modal-title" id="exampleModalLabel"
                                                style="font-family: PingFangSC-Medium;font-size: 16px;color: #333333;font-weight: bolder;">
                                                批量录入乡贤数据</h5>
                                            <button id="biModalX" type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close" onclick="clearInsModal()"
                                                    style="background:url(./images/ico_close.png) no-repeat center;margin-right: 0px;margin-top: -2px;">
                                            </button>

                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="form-group">
                                                    <div class="input-group mb-2">
                                                        <div class="input-group-prepend" style="font-family: PingFangSC-Semibold;
                                                        font-size: 14px;color: #4A5A6A;text-align: right;"><span
                                                                    class="input-group-text">上传文件</span>
                                                        </div>

                                                        <div class="custom-file">
                                                            <input id="file" type="file" class="custom-file-input" onchange="getFilePath(this)">
                                                            <label class="custom-file-label" style="font-weight:normal;">选择文件</label>
                                                        </div>
                                                    </div>
                                                    <span>注：目前仅支持xlsx格式文件，文件大小请控制在1MB以内，如没有模板，请<a href="${res.data}"
                                                                                                  style="color:lightskyblue">下载乡贤录入模板</a></span>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer" style="border-top:0px">
                                            <button type="button" class="btn btn-primary " id="batchInsert"
                                                    onclick="batchInsertClick();">确定
                                            </button>
                                            <button type="button" class="btn btn-outline-info " id="cancel"
                                                    onclick="cancelClick()">取消
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="importModal" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header" style="border-bottom: none">
                                            <h5 class="modal-title" id="exampleModalLabel"
                                                style="font-family: PingFangSC-Medium;font-size: 16px;color: #333333;font-weight: bolder;">
                                                批量录入结束</h5>
                                            <button id="iModalX" type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close" onclick="clearInsModal()"
                                                    style="background:url(./images/ico_close.png) no-repeat center;margin-right: 0px;margin-top: -2px;">

                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="form-group" style="text-align: center">
                                                    文件内数据总条数: <span id="total" for="message-text"
                                                                    class="col-form-label"></span>条<br>
                                                    录入成功: <span id="success" for="message-text"
                                                                class="col-form-label"></span>条<br>
                                                    更新成功: <span id="upSuc" for="message-text"
                                                                class="col-form-label"></span>条<br>
                                                    重复或格式有误的信息: <span id="duplicate" for="message-text"
                                                                   class="col-form-label"></span>条<br>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer" style="border-top:0px;justify-content: center">
                                            <button type="button" class="btn btn-primary " id="batchInsertDup"
                                                    onclick="downloadClick();">下载“重复或格式有误”的信息
                                            </button>
                                            <button type="button" class="btn btn-outline-light" data-dismiss="modal"
                                                    aria-label="Close">完成
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button type="hidden" id="importBtn" class="btn btn-primary" data-toggle="modal"
                                    data-target="#importModal" data-whatever="@getbootstrap"
                                    style="display: none"></button>
                        </div>

                        <#assign modalId = "deleteModal">
                        <#assign moduleTitle = "是否删除此乡贤？">
                        <#assign moduleClick = "deleteClick()">
                        <#include "freemarker/base/dialog.ftl"/>
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
    Main wrapper end
***********************************-->

<!--**********************************
    Scripts
***********************************-->
<script src="plugins/common/common.min.js"></script>
<script src="js/custom.min.js"></script>


<script src="./js/dashboard/dashboard-1.js"></script>

<script src="./plugins/jquery/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="./js/fileup.js"></script>

<script src="./js/Isfocus.js"></script>


<script>
    var natureID = 0;
    var checkStatus;
    $('input').lc_switch();

    let downUrl;

    function getFilePath(this_) {
        $(".custom-file-label").html(this_.value);
    }


    /**
     *  修改是否重要
     */
    function modifyCheck(id, check) {



       /* if (check) {
            check = false;
        } else {
            check = true;
        }
        $.ajax({
            type: 'POST',
            url: 'general/important?tgId=' + id + '&focus=' + check,
            dataType: 'JSON',
            data: {'tgId': id, 'focus': check},

            success: function (res) {
                if (res.status == 1000) {
                    toast("修改成功!");
                    $('#datatab').DataTable().draw(false);
                }
            }
        });*/

    }

    /**
     * 当前用户操作权限判断
     */
    function authorityJudge() {

        //权限判断：手动录入
        var general_single = ${userAuthority.general_single};
        if (general_single == 1) {
            $("#insert").hide();
        }

        //权限判断：批量录入
        var general_batch = ${userAuthority.general_batch};
        if (general_batch == 1) {
            $("#batchIns").hide();
        }

        //权限判断：导出乡贤数据
        var general_export = ${userAuthority.general_export};
        if (general_export == 1) {
            $("#export").hide();
        }
    }

    /**
     * 查询点击事件
     */
    function queryClick() {

        // let type = $('#type').val(); // 人才性质

        if ($.fn.dataTable.isDataTable('#datatab')) {
            $('#datatab').DataTable().destroy();
        }
        let name = $('#name').val();
        let town = $('#town').val();//原籍地
        let addr = $('#addr').val(); //现居地
        let workunit = $('#workunit').val(); // 现有工作单位
        let field = $('#field').val();// 行业领域
        var Ntype = $('#type').val();
        let source = $('#dataSource').val();

        $('#datatab').DataTable({
            "processing": false,
            "serverSide": true,
            "searching": false, // 禁用全文搜索
            "ordering": false, // 禁用排序
            "bAutoWidth": false,
            // 这个设置可以保存状态:解决跳转到第一页的问题 所有问题都解决了
             "bStateSave":true,

            "ajax": "general/query?name=" + name + "&natureId=" + Ntype + "&location=" + addr + "&workUnit=" + workunit + "&town=" +town+"&field=" + field + "&source=" + source,
            "fnDrawCallback": function () {
                this.api().column(0).nodes().each(function (cell, i) {
                    cell.innerHTML = i + 1;
                });
            },
            "columns": [
                {"data": null, "targets": 0},
                {
                    "data": "focus",
                    "render": function (data, type, full) {

                        let check = false;
                        if (data) {
                            check = data;
                        }
                        let checkboxHtml = "";
                        checkboxHtml += '<input type="checkbox" name="check-1" class="tui-checkbox lcs_check" ';
                        if (check) {
                            checkboxHtml += 'checked="checked" ';
                        }
                        /*checkboxHtml += '" onchange="modifyCheck(';
                        checkboxHtml += full.id;
                        checkboxHtml += ',';

                        checkboxHtml += check;
                        checkboxHtml += ')';*/

                        checkboxHtml += '" onclick="return false;"';
                        checkboxHtml += '" />';

                        return checkboxHtml;

                    }

                },

                {
                    "data": "name",
                    "render": function (data) {
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
                    "data": "field",
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
                    "data": "dataSource",
                    "render": function (data) {
                        return table_alert(data);
                    }
                },



                {
                    "data": "id",
                    "render": function (data, type, full) {
                        //权限判断：修改用户和删除用户
                        var general_delete = ${userAuthority.general_delete};
                        var general_update = ${userAuthority.general_update};
                        // var general_look = ${userAuthority.general_look};
                        var label_delete = "<a class='btn btn-outline-info' onclick='deleteModal(" + data + ")'style='color: #1890FF' data-toggle='modal' data-target='#deleteModal'>删除</a>" + "&nbsp;&nbsp;";
                        var label_edit = "<a class='btn btn-outline-light' href='./generaledit?id=" + data + "' style=''>编辑</a>" + "&nbsp;&nbsp;";
                        var label_look = "<a class='btn btn-outline-light' href='./generallook?id=" + data + "' style=''>查看</a>";
                        if (general_delete == 2 && general_update == 2) {
                            return label_delete + label_edit + label_look;
                        } else if (general_delete == 2 && general_update == 1) {
                            return label_delete + label_look;
                        } else if (general_delete == 1 && general_update == 2) {
                            return label_edit + label_look;
                        } else {
                            return label_look;
                        }
                    }
                }
            ],
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "没有符合条件的用户",
                "sInfo": "第 _START_ - _END_ 条 / 共 _TOTAL_ 条数据",
                "sInfoEmpty": "",
                "sInfoFiltered": "(数据表中共 _MAX_ 条记录)",
                "sProcessing": "正在加载中...",
                "sSearch": "全文搜索：",
                "oPaginate": {
                    "sFirst": "第一页",
                    "sPrevious": " 上一页 ",
                    "sNext": " 下一页 ",
                    "sLast": " 最后一页 "
                }
            }
        });
    }

    /**
     * 不记住状态查询
     */
    function queryClickTwo(){

        // let type = $('#type').val(); // 人才性质

        if ($.fn.dataTable.isDataTable('#datatab')) {
            $('#datatab').DataTable().destroy();
        }
        let name = $('#name').val();
        let town = $('#town').val();//原籍地
        let addr = $('#addr').val(); //现居地
        let workunit = $('#workunit').val(); // 现有工作单位
        let field = $('#field').val();// 行业领域
        var Ntype = $('#type').val();
        let source = $('#dataSource').val();

        $('#datatab').DataTable({
            "processing": false,
            "serverSide": true,
            "searching": false, // 禁用全文搜索
            "ordering": false, // 禁用排序
            "bAutoWidth": false,
            // 这个设置可以保存状态:解决跳转到第一页的问题 所有问题都解决了
            "bStateSave":false,

            "ajax": "general/query?name=" + name + "&natureId=" + Ntype + "&location=" + addr + "&workUnit=" + workunit + "&town=" +town+"&field=" + field+"&source=" + source,
            "fnDrawCallback": function () {
                this.api().column(0).nodes().each(function (cell, i) {
                    cell.innerHTML = i + 1;
                });
            },
            "columns": [
                {"data": null, "targets": 0},
                {
                    "data": "focus",
                    "render": function (data, type, full) {

                        let check = false;
                        if (data) {
                            check = data;
                        }
                        let checkboxHtml = "";
                        checkboxHtml += '<input type="checkbox" name="check-1" class="tui-checkbox lcs_check" ';
                        if (check) {
                            checkboxHtml += 'checked="checked" ';
                        }
                        /*checkboxHtml += '" onchange="modifyCheck(';
                        checkboxHtml += full.id;
                        checkboxHtml += ',';

                        checkboxHtml += check;
                        checkboxHtml += ')';*/

                        checkboxHtml += '" onclick="return false;"';
                        checkboxHtml += '" />';

                        return checkboxHtml;

                    }

                },

                {
                    "data": "name",
                    "render": function (data) {
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
                    "data": "field",
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
                    "data": "dataSource",
                    "render": function (data) {
                        return table_alert(data);
                    }
                },



                {
                    "data": "id",
                    "render": function (data, type, full) {
                        //权限判断：修改用户和删除用户
                        var general_delete = ${userAuthority.general_delete};
                        var general_update = ${userAuthority.general_update};
                        // var general_look = ${userAuthority.general_look};
                        var label_delete = "<a class='btn btn-outline-info' onclick='deleteModal(" + data + ")'style='color: #1890FF' data-toggle='modal' data-target='#deleteModal'>删除</a>" + "&nbsp;&nbsp;";
                        var label_edit = "<a class='btn btn-outline-light' href='./generaledit?id=" + data + "' style=''>编辑</a>" + "&nbsp;&nbsp;";
                        var label_look = "<a class='btn btn-outline-light' href='./generallook?id=" + data + "' style=''>查看</a>";
                        if (general_delete == 2 && general_update == 2) {
                            return label_delete + label_edit + label_look;
                        } else if (general_delete == 2 && general_update == 1) {
                            return label_delete + label_look;
                        } else if (general_delete == 1 && general_update == 2) {
                            return label_edit + label_look;
                        } else {
                            return label_look;
                        }
                    }
                }
            ],
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "没有符合条件的用户",
                "sInfo": "第 _START_ - _END_ 条 / 共 _TOTAL_ 条数据",
                "sInfoEmpty": "",
                "sInfoFiltered": "(数据表中共 _MAX_ 条记录)",
                "sProcessing": "正在加载中...",
                "sSearch": "全文搜索：",
                "oPaginate": {
                    "sFirst": "第一页",
                    "sPrevious": " 上一页 ",
                    "sNext": " 下一页 ",
                    "sLast": " 最后一页 "
                }
            }
        });
    }

    /**
     * 重置
     */
    function resetClick() {
        $('#name').val(null);
        $('#type option:first').prop('selected', 'selected');
        $('#addr').val(null);
        $('#town').val(null);
        $('#workunit').val(null);
        $('#field').val(null);
        $('#local').val(null);
        $('#dataSource').val(null);

        queryClickTwo();
        //queryClick();
    }

    /**
     * 手动录入
     */
    function insertClick() {
        window.location.href = "./generaledit";
    }

    /**
     * 批量录入
     */
    function batchInsertClick() {
        if ($('#file')[0].files[0] === undefined) {
            toast("请选择上传文件！");
            return false;
        }

        let reqData = new FormData();
        reqData.append("file", $('#file')[0].files[0]);

        $("#batchInsert").attr("disabled", true);
        $('#preloader').fadeTo('fast', 0.4);
        $.ajax({
            type: 'post',
            url: 'general/batchIns',
            dataType: 'json',
            data: reqData,
            contentType: false,
            processData: false,
            success: function (res) {
                $('#preloader').hide();
                $("#batchInsert").attr("disabled", false);
                if (res.status === 1000) {
                    document.getElementById("biModalX").click();
                    $('#datatab').DataTable().draw(false);
                    $('#total').text(res.data.total);
                    $('#success').text(res.data.success);
                    $('#upSuc').text(res.data.upSuc);
                    $('#duplicate').text(res.data.duplicate);
                    if (res.data.duplicate === 0) {
                        $("#batchInsertDup").hide();
                    } else {
                        $("#batchInsertDup").show();
                    }
                    downUrl = res.data.dupUrl;
                    $('#importBtn').click();
                } else if (res.status === 1100) {
                    toast("文件内表头信息或文件格式有误，请下载模板文件检查后重新上传！");
                }
            },
            error: function () {
                $("#batchInsert").attr("disabled", false);
            }
        });
    }

    /**
     * 取消
     */
    function cancelClick() {
        document.getElementById("biModalX").click();
    }

    /**
     * 导出
     */
    function exportClick() {
        let name = $('#name').val();
        let type = $('#type').val(); // 人才性质
        let addr = $('#addr').val(); //现居地
        let town = $('#town').val(); // 现有工作单位
        let field = $('#field').val();// 行业领域

        window.location.href = "general/export?name=" + name + "&natureId=" + type + "&location=" + addr + "&workUnit=" + town + "&field=" + field;
    }

    let moduleData = new Map();

    /**
     * 删除弹框界面设值
     * @param data nId
     */
    function deleteModal(id) {
        moduleData.set("id", id);
    }

    /**
     * 删除
     */
    function deleteClick() {
        $.ajax({
            type: 'POST',
            url: 'general/delete',
            data: {'tgId': moduleData.get("id")},
            dataType: 'json',
            success: function (data) {
                if (data.status === 1000) {
                    toast("删除成功");
                    $('#datatab').DataTable().draw(false);
                } else {
                    toast("");
                }
            }
        })
    }

    /**
     * 清空批量插入框数据
     */
    function clearInsModal() {
        $('#file').val(null);
    }

    function downloadClick() {
        window.location.href = downUrl;
    }

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

    /**
     * 修改前台：修改密码后清空模态框数据
     */
    $('#updatePwdModal').on('hide.bs.modal', function (event) {
        $("#oldPassword").val(null);
        $("#newPassword").val(null);
        $("#confirm").val(null);
    });

    $(document).ready(function () {
        console.log("历史："+ document.referrer);
        var historyUrl = document.referrer;
        if( historyUrl.indexOf('generallook') != -1 || historyUrl.indexOf('generaledit') != -1 ) {
            queryClick();
        }else {
            queryClickTwo();
        }


        $('input').lc_switch();

        // 人才性质
        $.ajax({
            type: 'POST',
            url: 'nature/queryAll',
            dataType: 'JSON',
            success: function (data) {
                for (let i = 0; i < data.length; i++) {
                    $('#type').append("<option value='" + data[i].typeId + "'>" + data[i].name +
                        "</option>");
                }
            }
        });

        //当前用户操作权限判断
        authorityJudge();

    });


</script>

</body>

</html>