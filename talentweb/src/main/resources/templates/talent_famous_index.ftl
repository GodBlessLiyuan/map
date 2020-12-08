<!DOCTYPE html>
<html lang="en">

<head>
    <#--    <base href="${basePath}"/>-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="icon" type="image/x-icon" href="./images/logo.png"/>
    <title>全球衢籍乡贤人才地图后台管理系统</title>

    <!-- Custom Stylesheet -->
    <link href="./css/bootstrap.css" rel="stylesheet">
    <link href="./css/headInfo.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/talent.css" rel="stylesheet">
    <link href="plugins/rowreorder/rowReorder.dataTables.css" rel="stylesheet">

    <link href="./plugins/datatables/jquery.dataTables.min.css" rel="stylesheet">

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
    </style>

</head>

<style>
    #boldName {
        display: block;
        font-family: PingFangSC-Medium;
        font-size: 14px;
        color: #333333;
        letter-spacing: 0;
        text-align: left;
    }

    #fullUnit {
        font-family: PingFangSC-Medium;
        font-size: 14px;
        color: #999999;
        letter-spacing: 0;
        text-align: left;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }


    table {
        table-layout: fixed;
    }

    td {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }


</style>

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

    <#--toast-->
    <#include "freemarker/base/toast.ftl"/>

    <!--**********************************
        Content body start
    ***********************************-->
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div>
                                <label class="label-control">乡贤展示配置</label>
                                <button type="button" class="btn mb-2 btn-primary" data-toggle="modal" id="addFamous"
                                        data-target="#addModal" data-whatever="@getbootstrap" style="float: right">
                                    添加展示数据
                                </button>
                            </div>
                            <hr>
                            <div class="basic-form">
                                <form class="form-inline">
                                    <div class="form-row">
                                        <div class="form-group">
                                            <span>姓名&nbsp;&nbsp;</span>
                                            <input id="name" type="text" class="name-input" placeholder="请输入">
                                        </div>

                                        <div class="form-group" style="padding-left: 20px">
                                            <span>现工作单位&nbsp;&nbsp;</span>
                                            <input id="workUnit" type="text" class="name-input" placeholder="请输入">
                                        </div>

                                        <div class="form-group" style="padding-left: 20px">
                                            <span>原籍地&nbsp;&nbsp;</span>
                                            <input id="yuanjidi" type="text" class="name-input" placeholder="请输入">
                                        </div>

                                        <div class="form-group" style="padding-left: 20px">
                                            <span for="recipient-name" class="col-form-label">人才性质&nbsp;&nbsp;</span>
                                            <select id="type" class="other-input">
                                                <option value='0' selected='selected'>请选择</option>
                                            </select>
                                        </div>
                                        <div class="form-group" style="padding-left: 20px">
                                            <span>乡贤头像&nbsp;&nbsp;</span>
                                            <select id="ava" class="img-input">
                                                <option value='0' selected='selected'>请选择</option>
                                                <option value='1'>已配置</option>
                                                <option value='2'>未配置</option>
                                            </select>
                                        </div>

                                        <div class="form-group" style="padding-left: 20px">
                                            <button type="button" class="btn mb-1 btn-outline-info button1-control"
                                                    id="query1" style="margin-top: 3.5px;"
                                                    onclick="javascript:queryClick();">查询
                                            </button>&nbsp;&nbsp;&nbsp;&nbsp;

                                            <button type="button" class="btn mb-1 btn-outline-light  button1-control"
                                                    id="reset1" style="margin-top: 3.5px"
                                                    onclick="javascript:resetClick()">重置
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="table-responsive" style="overflow-x: hidden">
                                <table id="datatab" class="table table-striped table-bordered zero-configuration"
                                        <#--  style="table-layout: fixed; text-align: center; vertical-align: middle">-->

                                       style=" text-align: center; vertical-align: middle">
                                    <thead>
                                    <#--                                    添加重点乡贤人才-->

                                    <tr>
                                        <th width="60px">序号</th>
                                        <th id="baseinfo">基本信息</th>
                                        <th width="200px">原籍地</th>
                                        <th width="150px">人才性质</th>
                                        <th width="60px">乡贤头像</th>
                                        <th width="150px">操作</th>
                                    </tr>
                                    </thead>
                                </table>
                            </div>

                            <div class="modal fade bs-example-modal-lg" id="addModal" tabindex="-1" role="dialog"
                                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document" style="max-width: 1100px;">

                                    <#--<div class="modal-content" style="width: 1100px;height: 820px">-->
                                        <div class="modal-content" style="width: 1100px;height: auto;">
                                        <div class="modal-header" style="border-bottom: none;">
                                            <h5 class="modal-title" id="exampleModalLabel"
                                                style="font-size: 16px;color: #333333;font-weight: bolder;">
                                                添加知名乡贤人才展示</h5>
                                            <button id="aModalX" type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close" onclick="resetAddClick()"
                                                    style="background:url(./images/ico_close.png) no-repeat center;margin-right: 0px;margin-top: -2px;">
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="basic-form">
                                                <form class="form-inline">
                                                    <div class="form-row">
                                                        <div class="form-group" style="padding-left: 8px;">
                                                            <span style="padding-left: 30px;">姓名&nbsp;</span>
                                                            <input id="aName" type="text" class="name-input" style="width: 160px;"
                                                                   placeholder="请输入">
                                                        </div>

                                                        <div class="form-group" style="padding-left: 30px">
                                                            <span>原籍地&nbsp;</span>
                                                            <input id="aTown" type="text" class="name-input" style="width: 160px;" placeholder="请输入">
                                                        </div>

                                                        <div class="form-group" style="padding-left: 30px">
                                                            <span>现所在地&nbsp;</span>
                                                            <input id="aNowLive" type="text" class="name-input" style="width: 160px;" placeholder="请输入">
                                                        </div>

                                                        <div class="form-group" style="padding-left: 30px">
                                                            <span>现工作单位&nbsp;</span>
                                                            <input id="aUnit" type="text" class="other-input" style="width: 160px;"
                                                                   placeholder="请输入">
                                                        </div>

                                                        <div class="form-group" style="padding-left: 10px;margin-top: 10px">
                                                            <span >行业领域&nbsp;</span>
                                                            <input id="aField" type="text" class="name-input" style="width: 160px;" placeholder="请输入" >
                                                        </div>

                                                        <div class="form-group" style="padding-left: 15px;margin-top: 10px;">
                                                            <span for="recipient-name"
                                                                  class="col-form-label">人才性质&nbsp;</span>
                                                            <select id="aType" class="select-input" style="width: 160px;">
                                                                <option value='0' selected='selected'>请选择</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group" style="padding-left: 30px;margin-top: 10px;">
                                                            <span>乡贤头像&nbsp;</span>
                                                            <select id="aAva" class="img-input" style="width; 160px;">
                                                                <option value='0' selected='selected'>请选择</option>
                                                                <option value='1'>已上传</option>
                                                                <option value='2'>未上传</option>
                                                            </select>
                                                        </div>

                                                        <div class="form-group" style="padding-left: 90px;margin-top: 10px;">
                                                            <button type="button"
                                                                    class="btn btn-outline-info button1-control"
                                                                    id="query"
                                                                    onclick="queryAddClick();">查询
                                                            </button>&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <button type="button"
                                                                    class="btn btn-outline-light button1-control"
                                                                    id="reset"
                                                                    onclick="resetAddClick()">重置
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>

                                            <div class="table-responsive" style="overflow-x: hidden">
                                                <table id="adddatatab"
                                                       class="table table-striped table-bordered zero-configuration"
                                                       style="table-layout: fixed; text-align: center; vertical-align: middle">
                                                    <thead>
                                                    <tr>
                                                        <th width="50px"><input type='checkbox' id='checkAll'
                                                                                name='checkAll'
                                                                                data-whatever='@getbootstrap'/></th>
                                                        <th width="50px">序号</th>
                                                        <th width="50px">姓名</th>
                                                        <th width="100px">原籍地</th>
                                                        <th width="100px">现所在地</th>
                                                        <th width="100px">现工作单位</th>
                                                        <th width="100px">行业领域</th>
                                                        <th width="100px">人才性质</th>
                                                        <th width="50px">乡贤头像</th>
                                                    </tr>
                                                    </thead>
                                                </table>
                                            </div>
                                            <div style="float: right;padding-top: 10px">
                                                <button type="button" class="btn btn-primary button1-control " id="add"
                                                        data-toggle='modal' data-target='#addcModal'
                                                        data-whatever='@getbootstrap'>确定
                                                </button>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <button type="button" class="btn btn-outline-info button1-control"
                                                        id="cancel"
                                                        onclick="cancelClick()">取消
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <#assign modalId = "deleteModal">
                        <#assign moduleTitle = "是否删除此乡贤？">
                        <#assign moduleClick = "deleteClick()">
                        <#include "freemarker/base/dialog.ftl"/>

                        <#assign modalId = "addcModal">
                        <#assign moduleTitle = "是否添加选择的40名重要乡贤人才?">
                        <#assign moduleClick = "addClick()">
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
<script src="plugins/jquery/jquery.min.js"></script>
<script src="./js/bootstrap.js"></script>

<script src="plugins/common/common.min.js"></script>
<script src="plugins/metismenu/js/metisMenu.min.js"></script>

<script src="js/custom.min.js"></script>
<script src="js/settings.js"></script>
<script src="js/gleek.js"></script>
<script src="js/styleSwitcher.js"></script>


<script src="./plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="plugins/rowreorder/dataTables.rowReorder.min.js"></script>


<script src="./js/dashboard/dashboard-1.js"></script>

<script>
    const tfIds = new Set();

    /**
     * 修改前台：修改密码后清空模态框数据
     */
    $('#updatePwdModal').on('hide.bs.modal', function (event) {
        $("#oldPassword").val(null);
        $("#newPassword").val(null);
        $("#confirm").val(null);
    });

    $(document).ready(function () {
        // 自动查询
        queryClick();
        // 人才性质
        $.ajax({
            type: 'POST',
            url: 'nature/queryAll',
            dataType: 'JSON',
            success: function (data) {
                for (let i = 0; i < data.length; i++) {
                    $('#type').append("<option value='" + data[i].typeId + "'>" + data[i].name +
                        "</option>");
                    $('#aType').append("<option value='" + data[i].typeId + "'>" + data[i].name +
                        "</option>");
                }
            }
        });

        // 展示添加时，自动查询
        $("#addModal").on('shown.bs.modal', function () {
            queryAddClick()
        });

        $("#addcModal").on('shown.bs.modal', function () {
            $("#addcModal .modal-body .con ").text("是否添加选择的" + tfIds.size + "名重要乡贤人才?");
        });

        //当前用户操作权限判断
        authorityJudge();
    });

    /**
     * 当前用户操作权限判断
     */
    function authorityJudge() {

        //权限判断：添加展示数据
        var show_create = ${userAuthority.show_create};
        if (show_create == 1) {
            $("#addFamous").hide();
        }
    }

    /**
     * 查询点击事件
     */
    function queryClick() {

        if ($.fn.dataTable.isDataTable('#datatab')) {
            $('#datatab').DataTable().destroy();
        }

        let name = $('#name').val();
        let type = $('#type').val();
        let ava = $('#ava').val();
        let unit = $("#workUnit").val();

        let town = $('#yuanjidi').val();

        var table = $('#datatab').DataTable({
            "processing": false,
            "serverSide": true,
            "searching": false, // 禁用全文搜索
            "ordering": false, // 禁用排序
            "rowReorder": true,
            "paging": false,
            "ajax": "famous/query?name=" + name + "&type=" + type + "&ava=" + ava + "&unit=" + unit+ "&town=" + town,
            "fnDrawCallback": function () {
                let startIndex = this.api().context[0]._iDisplayStart;
                this.api().column(0).nodes().each(function (cell, i) {
                    cell.innerHTML = startIndex + i + 1;
                });
            },
            rowReorder: {
                dataSrc: 'id',
                selector: 'tr'
            },
            "columns": [
                {"data": null, "targets": 0},
                {
                    "data": "name",
                    "render": function (data, type, full) {
                        let src = "./images/img_default.png";
                        if (full.avatar) {
                            src = full.avatar;
                        }

                        let widthpx = $("#baseinfo").css('width');
                        let width = widthpx.substring(0, widthpx.indexOf('p'));
                        width = width - 120;

                        let basicInfoHtml = "";
                        basicInfoHtml += ' <div style="display:flex; flex-wrap:wrap;height:61px;width:100%;border-radius: 30px;text-align: left;">';
                        basicInfoHtml += '<img src="';
                        basicInfoHtml += src;
                        basicInfoHtml += '" style="margin-left:10px; height: 60px;width: 60px;border-radius: 30px;"/>';


                        basicInfoHtml += ' <div  style="position: absolute; box-sizing:border-box; margin-left: 75px; margin-top: 10px;width: ' + width + 'px;" title="' + full.unit + '">';
                        basicInfoHtml += '<div id="boldName">';
                        basicInfoHtml += data;
                        basicInfoHtml += '<br>';
                        basicInfoHtml += '<div id="fullUnit">';
                        basicInfoHtml += full.unit;
                        basicInfoHtml += '</div>';
                        basicInfoHtml += '</div>';
                        basicInfoHtml += ' </div>';

                        return basicInfoHtml;

                    }
                },
                {
                    "data": "town",
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
                    "data": "avatar",
                    "render": function (data) {
                        return data ? "已配置" : "未配置";
                    }
                },
                {
                    "data": "id",
                    "render": function (data, type, full) {
                        //权限判断：修改用户和删除用户
                        var show_delete = ${userAuthority.show_delete};
                        var show_update = ${userAuthority.show_update};
                        /*原来写法*/
                        var label_delete = "<a class='btn btn-outline-info' onclick='deleteModal(" + data + ")' style='color: #1890FF' data-toggle='modal' data-target='#deleteModal' >删除</a>" + "&nbsp;&nbsp;";
                        var label_edit = "<a class='btn btn-outline-light' href='./generaledit?id=" + full.tgId + "' style=''>编辑</a>";


                        if (show_delete == 2 && show_update == 2) {
                            return label_delete + label_edit;
                        } else if (show_delete == 2 && show_update == 1) {
                            return label_delete;
                        } else if (show_delete == 1 && show_update == 2) {
                            return label_edit;
                        } else {
                            return "";
                        }
                    }
                }
            ],
            "oLanguage": {
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

        table.on('row-reorder', function (e, diff, edit) {
            let ids = [];
            let update = false;
            for (let node of diff) {
                if (node.oldData !== node.newData) {
                    update = true;
                }
                ids.push(node.oldData);
            }

            if (update) {
                $.ajax({
                    type: 'POST',
                    url: 'famous/updateNum',
                    data: {'tfIds': ids},
                    dataType: 'json',
                    async: false,
                    success: function (data) {
                        if (data.status === 1000) {
                            $('#datatab').DataTable().draw(false);
                        }
                    }
                });
            }
        });
    }

    /**
     * 重置
     */
    function resetClick() {
        $('#name').val(null);
        $('#workUnit').val(null);
        $('#yuanjidi').val(null);

        $('#type option:first').prop('selected', 'selected');
        $('#ava option:first').prop('selected', 'selected');

        queryClick();
    }

    /**
     * 手动录入
     */
    function insertClick() {
        window.location.href = "./focusedit";
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
            url: 'famous/deleteFamous',
            data: {'tfsId': moduleData.get("id")},
            dataType: 'json',
            success: function (data) {
                if (data.status === 1000) {
                    alert("删除成功");
                    $('#datatab').DataTable().draw(false);
                } else {
                    alert("");
                }
            }
        })
    }

    /**
     * 添加查询
     */
    function queryAddClick() {
        if ($.fn.dataTable.isDataTable('#adddatatab')) {
            $('#adddatatab').DataTable().destroy();
        }

        $("#checkAll").prop("checked", false);

        tfIds.clear();

        let name = $('#aName').val(); // 姓名
        let town =  $('#aTown').val(); // 原籍地

        let location= $('#aNowLive').val(); // 现所在地

        let unit = $('#aUnit').val(); // 现工作单位

        let field = $('#aField').val(); // 行业领域
        let type = $('#aType').val(); // 人才类型
        let ava = $('#aAva').val();  // 乡贤头像


        $('#adddatatab').DataTable({
            "processing": false,
            "serverSide": true,
            "searching": false, // 禁用全文搜索
            "ordering": false, // 禁用排序
            "bLengthChange": false, //关闭每页显示选项
            "sLengthMenu":false,
            "ajax": "famous/queryFocus?name=" + name + "&town=" + town  + "&location=" + location +"&unit=" + unit + "&field=" + field +"&type=" + type+ "&ava=" + ava,
            "fnDrawCallback": function () {
                let startIndex = this.api().context[0]._iDisplayStart;
                this.api().column(1).nodes().each(function (cell, i) {
                    cell.innerHTML = startIndex + i + 1;
                });
            },
            "columns": [
                {
                    "data": "id",
                    "render": function (data) {
                        let checked = tfIds.has(data.toString()) ? "checked='checked'" : "";
                        return "<input type='checkbox' id='tfBox' name='tfBox' " + checked + " onclick='javascript:tfboxClick(this);' data-whatever='@getbootstrap' value='" + data + "'/>";
                    }
                },
                {"data": null},
                {"data": "name"},

                {
                    "data": "town",
                    "render": function (data) {
                        return table_alert(data);
                    }
                },

                {
                    "data": "location",
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
                    "data": "avatar",
                    "render": function (data) {
                        return data ? "已上传" : "未上传";
                    }
                }
            ],
            "oLanguage": {
                // "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "暂无符合条件的用户",
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
     * 添加重置
     */
    function resetAddClick() {
        $('#aName').val(null);
        $('#aUnit').val(null);

        $('#aTown').val(null);
        $('#aField').val(null);

        $('#aType option:first').prop('selected', 'selected');
        $('#aNowLive').val(null)
        $('#aAva option:first').prop('selected', 'selected');

        queryAddClick();
    }

    /**
     * 添加
     */
    function addClick() {
        if (tfIds.size === 0) {
            alert("请先勾选数据！")
        } else {
            var tfIdList = Array.from(tfIds);
            console.log(tfIds)
            $.ajax({
                type: 'POST',
                /*url: 'famous/status',*/
                url: 'famous/addFamous',
                data: {'tfIds': Array.from(tfIds)},
                dataType: 'json',
                success: function (data) {
                    if (data.status === 1000) {
                        document.getElementById("aModalX").click();
                        $('#datatab').DataTable().draw(false);
                        $('#adddatatab').DataTable().draw(false);
                        alert("添加成功");
                        window.location.reload();
                    } else {
                        alert("");
                    }
                }
            })
        }
    }

    /**
     * 取消
     */
    function cancelClick() {
        document.getElementById("aModalX").click();
    }

    $('#checkAll').on('click', function () {
        if (this.checked) {
            $(this).attr('checked', 'checked')
            $("input[id='tfBox']").each(function () {
                this.checked = true;
                tfIds.add(this.value);
            });
        } else {
            $(this).removeAttr('checked')
            $("input[id='tfBox']").each(function () {
                this.checked = false;
                tfIds.delete(this.value);
            });
        }
    });

    function tfboxClick(_this) {
        if (_this.checked) {
            tfIds.add(_this.value);
        } else {
            tfIds.delete(_this.value);
        }
        console.log("當前勾選")
        var flag = true;
        $("input[id='tfBox']").each(function () {
            if (!this.checked) {
                flag = false;
            }
        });
        $("#checkAll").prop("checked", flag);
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

</script>

</body>

</html>