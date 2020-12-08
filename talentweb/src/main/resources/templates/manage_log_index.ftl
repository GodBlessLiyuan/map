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
    <script src="./js/jquery-3.4.1.min.js"></script>
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
    <link href="./plugins/datatables/jquery.dataTables.min.css" rel="stylesheet">

    <!--toast-->
    <link href="css/toast.css" rel="stylesheet">
    <!--jedate-->
    <link rel="stylesheet" type="text/css" href="./plugins/jedate-6.5.0/skin/jedate.css"/>
    <script src="./js/bootstrap.js"></script>

</head>

<body>
<#include "freemarker/base/loader.ftl"/>
<div id="main-wrapper">
    <#include "freemarker/base/nav_header.ftl"/>
    <#include "freemarker/base/header.ftl"/>
    <#include "freemarker/base/dashboard.ftl"/>

    <#--toast-->
    <#include "freemarker/base/toast.ftl"/>

    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div>
                                <label class="label-control"><span>操作日志</span></label>
                            </div>
                            <hr>
                            <div class="basic-form">
                                <form class="form-inline">
                                    <div class="form-row">
                                        <div class="form-group">
                                            <span>操作人&nbsp;&nbsp;</span>
                                            <input id="operator" type="text" class="name-input" placeholder="请输入" >
                                        </div>
                                        <div class="form-group" style="padding-left: 30px">
                                            <span>开始时间&nbsp;&nbsp;</span>
                                            <input id="startTime" type="text" class="date-input" placeholder="请选择" >
                                        </div>
                                        <div class="form-group" style="padding-left: 30px">
                                            <span>结束时间&nbsp;&nbsp;</span>
                                            <input id="endTime" type="text" class="date-input" placeholder="请选择" >
                                        </div>
                                        <div class="form-group" style="padding-left: 20px">
                                            <button type="button" class="btn btn-outline-info button1-control" id="query"
                                                    onclick="javascript:queryClick();">查询
                                            </button>&nbsp;&nbsp;&nbsp;&nbsp;

                                            <button type="button" class="btn btn-outline-light button1-control" id="reset"
                                                    onclick="javascript:resetClick()">重置
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="table-responsive">
                                <table id="datatab" class="table table-striped table-bordered zero-configuration"
                                       style="table-layout: fixed; text-align: center; vertical-align: middle">
                                    <thead>
                                    <tr>
                                        <th width="90px">序号</th>
                                        <th width="150px">操作时间</th>
                                        <th width="150px">操作人</th>
                                        <th width="150px">归属</th>
                                        <th width="500px">详情</th>
                                        <th width="80px">文件</th>
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

<script src="./plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="./plugins/jedate-6.5.0/dist/jedate.min.js"></script>

<script>
    /**
     * 页面加载事件：查询数据
     */
    $(document).ready(function () {
        queryClick();
    });

    /**
     * 查询点击事件
     */
    function queryClick() {

        if ($.fn.dataTable.isDataTable('#datatab')) {
            $('#datatab').DataTable().destroy();
        }

        let operator = $('#operator').val();
        let startTime = $('#startTime').val();
        let endTime = $('#endTime').val();

        $('#datatab').DataTable({
            "processing": false,
            "serverSide": true,
            "searching": false, // 禁用全文搜索
            "ordering": false, // 禁用排序
            "bAutoWidth":false,
            "bStateSave":true,
            "ajax": "manageLog/queryLog?operator=" + operator + "&startTime=" + startTime + "&endTime=" + endTime,
            "fnDrawCallback": function () {
                this.api().column(0).nodes().each(function (cell, i) {
                    cell.innerHTML = i + 1;
                });
            },
            "columns": [
                {"data": null, "targets": 0},
                {"data": "operateTime"},
                {"data": "operator"},
                {"data": "isolation"},
                {"data": "description"},
                {
                    "data": "url",
                    "render": function (data, type, full) {
                        //权限判断：下载文件
                        var log_download = ${userAuthority.log_download};
                        if (log_download == 2 && (data != null )) {
                            return "<a href='" + data + "' style='color:blue'>下载文件</a>";
                        } else {
                            return "";
                        }
                    }
                }
            ],
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "无符合条件的记录",
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
        $('#operator').val(null);
        $('#startTime').val(null);
        $('#endTime').val(null);

        queryClick();
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
     * 日期控件
     */
    document.getElementById("startTime").addEventListener("focus",function () {
        jeDate(this, {
            theme: {bgcolor: "#3698e9", color: "#fff", pnColor: "#666666"},   //设置颜色
            format: "YYYY-MM-DD",                                       //设置时间格式
            minDate: "1995-01-01 00:00:00",                             //设置最小日期
            maxDate: "2099-12-31 23:59:59"                              //设置最大日期
        });
    });
    document.getElementById("endTime").addEventListener("focus",function () {
        jeDate(this, {
            theme: {bgcolor: "#3698e9", color: "#fff", pnColor: "#666666"},   //设置颜色
            format: "YYYY-MM-DD",                                       //设置时间格式
            minDate: "1995-01-01 00:00:00",                             //设置最小日期
            maxDate: "2099-12-31 23:59:59"                              //设置最大日期
        });
    });

    /**
     * 修改前台：修改密码后清空模态框数据
     */
    $('#updatePwdModal').on('hide.bs.modal', function (event) {
        $("#oldPassword").val(null);
        $("#newPassword").val(null);
        $("#confirm").val(null);
    });

</script>

</body>

</html>