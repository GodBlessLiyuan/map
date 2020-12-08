<!DOCTYPE html>
<html>

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
    <!--toast-->
    <link href="css/toast.css" rel="stylesheet">
    <link href="css/talent.css" rel="stylesheet">

    <link href="./plugins/datatables/jquery.dataTables.min.css" rel="stylesheet">
    <!--jedate-->
    <link rel="stylesheet" type="text/css" href="./plugins/jedate-6.5.0/skin/jedate.css"/>
    <script src="./js/bootstrap.js"></script>

</head>

<style>

    body{
        height: 100%;
        margin: 0;
        padding: 0;
    }

    .first {
        width:20%;
        float: left;
        height: 100%;
    }

    .second {
        width: 80%;
        float: left;
        height: 100%;
    }

    .third {
        height: 15%;
        width: 100%;
        margin-bottom: 20px;
    }

    .four {
        height: 85%;
        width: 100%;
    }

    .five {
        width:20%;
        height: 100%;
        float: left;
    }

    .six {
        width:80%;
        height: 100%;
        float: left;
    }

    .checkbox{
        /*margin-left: 3px;*/
    }

    .save{
        vertical-align: middle;
        text-align: center;
    }

    .notclick{
        pointer-events: none;
        /*background:#f5f5f5;*/
        filter:alpha(opacity=100);
        opacity:1;
    }

    /*标签被点击后变蓝*/
    .label-blue{
        outline: 0;
        background: #3698E9;
        color: #FFFFFF;
        width: 140px;
    }

    .label-red{
        outline: 0;
        background: #3698E9;
        color: #FFFFFF;
        width: 140px;
    }

    .list-group-item {
        position: relative;
        display: block;
        padding: 0rem 1.25rem;
        margin-bottom: -1px;
        background-color: #fff;
        border: 1px solid rgba(0, 0, 0, 0.125); }
    .checkbox-label {
        margin-left: 1rem;
        vertical-align:middle;
        margin-bottom: 0px;
    }
    .table-padding {
        padding-left: 6px;
    }
    .table-padding ul div {
        height: 20px;
        margin-left: 30px;
    }
    input[type="checkbox"]:after {
        border-radius: 3px;
        background-color: #FFFFFF;
        color: #FFFFFF;
        width: 19px;
        height: 19px;
        margin-top: 0px;
        margin-left: 0px;
        vertical-align: middle;
    }

    input[type="checkbox"]:checked:after {
        content: "✓";
        color: #FFFFFF;
        font-size: 12px;
        width: 19px;
        height: 19px;
        background-color: #3698E9;
        border-radius: 3px;
        vertical-align: middle;
    }

    .sencond-control {
        outline:none;
        text-align: center;
        border:1px solid #EEEEEE;
        height: 40px;
        width: 140px;
        font-size: 15px;
    }

    .sencondlabel-control {
        font-family: PingFangSC-Medium;
        line-height: 35px;
        color: #4A5A6A;
        font-weight: bold;
        background: #FFFFFF;
    }
    .footer {
        padding-left: 0;
    }

</style>

<body>
<#include "freemarker/base/loader.ftl"/>
<div id="main-wrapper" class="main-control">
    <#include "freemarker/base/nav_header.ftl"/>
    <#include "freemarker/base/header.ftl"/>
    <#include "freemarker/base/dashboard.ftl"/>
    <#include "freemarker/base/toast.ftl"/>

    <div class="content-body">
        <div class="container-fluid" style="height: 655px;">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <label class="label-control">角色管理&nbsp;</label>&nbsp;&nbsp;
                            <span>角色用来控制用户可使用哪些功能权限，设置完成后请在【用户管理】中分配角色</span>
<#--                            <span style="position: absolute; right: 20px">-->
<#--                                <button type="button" class="btn mb-1 btn-primary" style="font-size: 14px;" id="create_role" data-toggle='modal' data-target='#editModal'-->
<#--                                >新建角色</button>-->
<#--                            </span>-->
                            <br><br><br>

                            <div class="email-left-box">
                                <#--角色名称列表-->
                                <div id="role" class="text-primary p-r-0" >
                                </div>

                            </div>
                            <#--角色权限描述-->
                            <div class="email-right-box" style="height: 420px;">
                                <div class="message">
                                    <label class="label-control"><span style="margin-left:28px">功能权限</span>&nbsp;</label>&nbsp;&nbsp;&nbsp;
                                    <span>描述：</span><span id="role_name_show"></span><span>是</span><span
                                            id="description_show"></span>
                                </div>
                                <#--权限配置一级模块-->
                                <div class="email-left-box" id="authority_config_first">
                                    <div class="list-group-item border-0 text-primary p-r-0">
                                        <button id="manage_system_first" class="sencond-control sencondlabel-control"
                                               onclick="manageSystemClick()">系统管理</button><br>
                                        <button id="manage_talent_first" class="sencond-control sencondlabel-control"
                                               onclick="manageTalentClick()">乡贤管理</button><br>
                                        <button id="config_video_first" class="sencond-control sencondlabel-control"
                                               onclick="configVideoClick()">视频配置</button><br>
                                    </div>
                                </div>
                                <#--权限配置二级模块-->
                                <div class="email-right-box" id="authority_config_second" style="border: 0px solid #EEEEEE">
                                    <#--系统管理-->
                                    <div id="manage_system_second" class="table-padding">
                                        <input type="checkbox" id="manage_system"
                                               onclick="manageSystemSelectAllClick(this)"><label class="checkbox-label">全选</label>
                                        <hr>
                                        <ul>
                                                    <span><input type="checkbox" name="manage_system" id="manage_system_role"
                                                                 onclick="manageSystemRoleSelectAllClick(this)"><label class="checkbox-label">角色管理</label></span>
                                            <hr>
                                            <div>
                                                <span><input type="checkbox" name="manage_system_role"
                                                             id="role_create"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">新建角色</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_system_role"
                                                             id="role_update"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">修改角色</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_system_role"
                                                             id="role_query"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">查看角色</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_system_role"
                                                             id="role_delete"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">删除角色</label></span>
                                            </div>
                                            <hr>
                                        </ul>
                                        <ul>
                                                    <span><input type="checkbox" name="manage_system" id="manage_system_user"
                                                                 onclick="manageSystemUserSelectAllClick(this)"><label class="checkbox-label">用户管理</label></span>
                                            <hr>
                                            <div>
                                                <span><input type="checkbox" name="manage_system_user"
                                                             id="user_create"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">新建用户</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_system_user"
                                                             id="user_update"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">修改用户</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_system_user"
                                                             id="user_query"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">查看用户</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_system_user"
                                                             id="user_delete"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">删除用户</label></span>
                                            </div>
                                            <hr>
                                        </ul>
                                        <ul>
                                                    <span><input type="checkbox" name="manage_system" id="manage_system_log"
                                                                 onclick="manageSystemLogSelectAllClick(this)"><label class="checkbox-label">操作日志</label></span>
                                            <hr>
                                            <div>
                                                <span><input type="checkbox" name="manage_system_log" id="log_query"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">查看日志</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_system_log"
                                                             id="log_download"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">下载日志</label></span>
                                            </div>
                                        </ul>
                                    </div>

                                    <#--乡贤管理-->
                                    <div id="manage_talent_second"  class="table-padding">
                                                <span><input type="checkbox" id="manage_talent"
                                                             onclick="manageTalentSelectAllClick(this)"><label class="checkbox-label">全选</label></span>
                                        <hr>
                                        <ul>
                                                    <span><input type="checkbox" name="manage_talent" id="manage_talent_general"
                                                                 onclick="manageTalentGeneralSelectAllClick(this)"><label class="checkbox-label">乡贤人才</label></span>
                                            <hr>
                                            <div>
                                                <span><input type="checkbox" name="manage_talent_general"
                                                             id="general_single"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">手动录入</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_talent_general"
                                                             id="general_batch"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">批量录入</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_talent_general"
                                                             id="general_update"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">编辑</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_talent_general"
                                                             id="general_query"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">查看</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_talent_general"
                                                             id="general_delete"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">删除</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_talent_general"
                                                             id="general_export"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">导出乡贤数据</label></span>
                                            </div>
                                            <hr>
                                        </ul>
                                        <ul>
                                                    <span><input type="checkbox" name="manage_talent" id="manage_talent_show"
                                                                 onclick="manageTalentShowSelectAllClick(this)"><label class="checkbox-label">展示配置</label></span>
                                            <hr>
                                            <div>
                                                <span><input type="checkbox" name="manage_talent_show"
                                                             id="show_create"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">添加展示数据</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_talent_show"
                                                             id="show_update"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">编辑</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_talent_show"
                                                             id="show_query"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">查看</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_talent_show"
                                                             id="show_delete"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">删除</label></span>&nbsp;&nbsp;&nbsp;
                                                <span><input type="checkbox" name="manage_talent_show"
                                                             id="show_sort"
                                                             onclick="authorityStatus(this)"><label class="checkbox-label">排序</label></span>
                                            </div>
                                        </ul>
                                    </div>

                                    <#--视频配置-->
                                    <div id="config_video_second" class="table-padding">
                                                <span><input type="checkbox" id="config_video"
                                                             onclick="configVideoSelectAllClick(this)"><label class="checkbox-label">全选</label></span>
                                        <hr>
                                        <div style="margin-left: 30px;height: 20px;">
                                            <span><input type="checkbox" name="config_video" id="video_query"
                                                         onclick="authorityStatus(this)"><label class="checkbox-label">查看</label></span>&nbsp;&nbsp;&nbsp;
                                            <span><input type="checkbox" name="config_video" id="video_upload"
                                                         onclick="authorityStatus(this)"><label class="checkbox-label">视频上传</label></span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="save" style="height:50px; width:100%;text-align: center;padding-top: 22px;">
                                <div class="btn btn-primary button-control" onclick="saveClick()" style="margin: 0 auto;line-height: 22px;">
                                    保存
                                </div>



                             <#-- <button type="button" class="btn btn-primary" id="save" onclick="saveClick()">保存</button>-->
                            </div>

                            <#assign modalId = "deleteModal">
                            <#assign moduleTitle = "是否删除此角色？">
                            <#assign moduleClick = "deleteClick()">
                            <#include "freemarker/base/dialog.ftl"/>
                        </div>
                    </div>

                </div>
            </div>
        </div>


        <!--弹框：新建角色-->

        <div class="modal fade" id="editModal" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content col-lg-12" >
                            <div class="modal-header" style="border-bottom: none;">
                                <h5 class="modal-title" id="exampleModalLabel" style="font-family: PingFangSC-Medium;font-size: 16px;
                                    color: #333333;font-weight: bolder;">添加角色</h5>
                                <button type="button" class="close" data-dismiss="modal"
                                        style="background:url(./images/ico_close.png) no-repeat center;margin-right: 2px;margin-top: -2px;">
                                </button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-group row" style="text-align: right">
                                        <label class="col-lg-3 col-lg-offset-1 col-form-label">角色名
                                            <span class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-6">
                                            <input type="text" class="form-control input-control" id="role_name_create"
                                                   placeholder="请输入"  onkeyup="checkLength(this, 30)"/>
                                        </div>
                                    </div>
                                    <div class="form-group row" style="text-align: right">
                                        <label class="col-lg-3 col-lg-offset-1 col-form-label">角色描述
                                            <span class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-6">
                                            <textarea id="description_create" class="form-control input-control" rows="5" placeholder="请输入至少5个字"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-lg-3 col-lg-offset-1 col-form-label">
                                        </label>
                                        <div class="col-lg-6">
                                            <button type="button" class="btn btn-primary" onclick="createRole()">确定</button>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <button type="button" class="btn btn-outline-light" data-dismiss="modal" aria-label="Close" id="ModalX">
                                                取消
                                            </button>
                                        </div>
                                    </div>
                                </form>
                      </div>
                </div>
            </div>
        </div>

        <!--**********************************
            Content body end
        ***********************************-->
        <div style="text-align: center">
            <#include "freemarker/base/footer.ftl"/>
        </div>

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

    <script src="./js/bootstrap.js"></script>

    <script src="./js/dashboard/dashboard-1.js"></script>

    <#--<script src="./plugins/jquery/jquery.min.js"></script>-->
    <script src="./plugins/datatables/js/jquery.dataTables.min.js"></script>
    <script src="./plugins/jedate-6.5.0/dist/jedate.min.js"></script>

    <script>

        /**
         * 修改bug：修改密码后清空模态框数据
         */
        $('#updatePwdModal').on('hide.bs.modal', function (event) {
            console.log("关闭前 清理模态框.....");
            $("#oldPassword").val(null);
            $("#newPassword").val(null);
            $("#confirm").val(null);
        });


        /**
         * 页面加载事件：
         * 查询当前所有角色名称
         * 默认选中【超级管理员】
         * 判断当前用户所属角色的权限，以决定其在本页面的操作权限
         */
        $(document).ready(function () {
            queryRoleNameList();

            authorityJudge();
        })
        
        /**
         * 当前用户操作权限判断
         */
        function authorityJudge() {

            //权限判断：创建角色
            var role_create = ${userAuthority.role_create};
            if (role_create == 1) {
                $("#create_role").hide();
            }
        }
        /**
         * 往t_role查询所有的角色名称
         */
        function queryRoleNameList() {
            //查询前，先清除原有数据
            $("#role").empty();

            //查询
            $.ajax({
                type: 'GET',
                url: 'manageRole/queryRoleNameList',
                dataType: 'JSON',
                success: function (result) {
                    if (result.status === 1005) {
                        toast("登录超时，请重新登录！");
                        window.location.href = 'login';
                    } else if (result.status === 1000) {
                        for (var i = 0; i < result.data.length; i++) {
                            var roleId = result.data[i].roleId;
                            var roleName = result.data[i].roleName;
                            var description = result.data[i].description;
                            //权限判断：删除角色
                            var role_delete = ${userAuthority.role_delete};
                            if(roleId == 1 || roleId ==2 || roleId==3 || roleId ==4 || roleId ==5 || roleId==6){
                            // if (roleName == "超级管理员" || roleName == "游客" || role_delete == 1|| roleName == "市级角色" ||
                            //         roleName == "区级角色" || roleName == "乡镇角色" || roleName == "学校/商会"
                            // ) {
                                $('#role').append("<button class='button3-control label-control' id='roleId"+roleId+"' onclick='roleClick("+ roleId + ",\""+ roleName +"\",\""+ description +"\",this)'>" + roleName + "</button>");
                            } else {
                                $('#role').append("<button class='button3-control label-control' id='roleId"+roleId+"' onclick='roleClick("+ roleId + ",\""+ roleName +"\",\""+ description +"\",this)'>" + roleName +
                                    "<label style='float: right;margin-right: 5px;' data-toggle='modal' data-target='#deleteModal' data-whatever='@getbootstrap' onclick='deleteModal(" + roleId + ")'>x</label>"+ "</button>   ");
                            }
                        }
                        var labels = $(".button3-control");
                        roleClick(1,"超级管理员","系统自动生成，拥有全部权限",labels[0]);
                    }else {
                        toast("查询角色失败");
                    }
                }
            });
        }

        /**
         * 容器：暂时存放数值，供取用，中转作用
         */
        var moduleData = new Map();


        /**
         * 新建角色
         */
        function createRole() {
            var reqData = new FormData();
            var roleName = $('#role_name_create').val()
            var description = $('#description_create').val()
            reqData.append("roleName", roleName);
            reqData.append("description", description);

            //判空
            if (roleName == null || roleName.trim() == "") {
                toast("请输入角色名");
            } else if (description == null || description.trim() == "") {
                toast("请输入角色描述");
            } else if (description.replace(/[^\x00-\xff]/g, "**").length * 1 <= 5){
                toast("请输入至少5个字");
            } else {
                //判空通过
                $.ajax({
                    type: 'post',
                    url: 'manageRole/createRole',
                    dataType: 'json',
                    data: reqData,
                    contentType: false,
                    processData: false,
                    success: function (res) {
                        if (res.status === 1005) {
                            toast("登录超时，请重新登录");
                            window.location.href = 'login';
                        } else if (res.status === 1000) {
                            document.getElementById("ModalX").click();
                            toast("创建成功");
                            queryRoleNameList()
                        } else if (res.status === 1007) {
                            toast("该角色名已存在，请重新填写");
                        } else {
                            toast("创建失败");
                        }
                    }
                });
            }
        }

        /**
         * 选中标签：选中角色，显示角色的基本信息
         * 默认选中【系统管理】权限模块
         */
        function roleClick(roleId, roleName, description, obj) {
            //存放当前所选角色的数据，备用
            moduleData.set("roleId", roleId);

            $('#role_name_show').text(roleName);
            $('#description_show').text(description);

            //查询当前角色的权限数据
            queryRoleAuthority(roleId);

            //当前角色颜色变红
            $(".button3-control").removeClass("label-red");
           /* var labelId = $(obj).attr('id');*/
            /*var labelId = "roleId" + roleId;
            $(document.getElementById(labelId)).addClass("label-red");*/
            $(obj).addClass("label-red")

            //默认选中系统管理权限模块
            manageSystemClick()

            //无论如何，只要是超级管理员或游客，隐藏掉保存按钮，并且设置不可点击
            if (roleId == 1 || roleId == 2) {
                $("#save").hide();
                $("#authority_config_second").addClass("notclick");
            } else {
                //不是的话，再判断：当前用户是否有修改角色的权限
                var role_update = ${userAuthority.role_update};
                if (role_update == 1) {
                    $("#save").hide();
                } else {
                    $("#save").show();
                    $("#authority_config_second").removeClass("notclick");
                }
            }
        }

        /**
         * 选中标签：选中角色，查询角色的权限数据，以供填充权限复选框
         */
        function queryRoleAuthority(roleId) {
            $.ajax({
                type: 'GET',
                url: 'manageRole/queryRoleAuthority?roleId=' + roleId,
                dataType: 'JSON',
                success: function (result) {
                    if (result.status === 1005) {
                        toast("登录超时，请重新登录");
                        window.location.href = 'login';
                    } else if (result.status === 1000) {
                        for (var key in result.data) {
                            var value = result.data[key];
                            //将返回数据的key，设计成与复选框id一致，便于操作
                            if (value == 1) {
                                document.getElementById(key).checked = false;
                            } else {
                                document.getElementById(key).checked = true;
                            }
                        }
                        //先清空【全选】复选框，因为这是对上个角色的操作，不能遗留
                        selectAllBoxClear();
                        //再勾选【全选】复选框，根据当前角色的权限来，有选择性地勾选
                        selectAllBoxChoose();
                    } else {
                        toast("加载角色权限数据失败");
                    }
                }
            })
        }


        /**
         * 选中标签：选中系统管理，弹出权限复选框
         */
        function manageSystemClick() {
            //显示与隐藏
            document.getElementById("manage_system_second").style.display = 'block';
            document.getElementById("manage_talent_second").style.display = 'none';
            document.getElementById("config_video_second").style.display = 'none';

            //颜色变蓝
            $(".sencond-control").removeClass("label-blue");
            $(".sencond-control").addClass("sencondlabel-control");

            $("#manage_system_first").removeClass("sencondlabel-control");
            $("#manage_system_first").addClass("label-blue");
        }

        /**
         * 选中标签：选中乡贤管理，弹出复选框
         */
        function manageTalentClick() {
            //显示与隐藏
            document.getElementById("manage_system_second").style.display = 'none';
            document.getElementById("manage_talent_second").style.display = 'block';
            document.getElementById("config_video_second").style.display = 'none';

            //颜色变蓝
            $(".sencond-control").removeClass("label-blue");
            $(".sencond-control").addClass("sencondlabel-control");

            $("#manage_talent_first").removeClass("sencondlabel-control");
            $("#manage_talent_first").addClass("label-blue");
        }

        /**
         * 选中标签：选中视频配置，弹出复选框
         */
        function configVideoClick() {
            //显示与隐藏
            document.getElementById("manage_system_second").style.display = 'none';
            document.getElementById("manage_talent_second").style.display = 'none';
            document.getElementById("config_video_second").style.display = 'block';

            //颜色变蓝
            $(".sencond-control").removeClass("label-blue");
            $(".sencond-control").addClass("sencondlabel-control");

            $("#config_video_first").removeClass("sencondlabel-control");
            $("#config_video_first").addClass("label-blue");
        }


        /**
         * 勾选权限：系统管理--全选/全不选
         */
        function manageSystemSelectAllClick(obj) {
            //获取全选按钮下的子框
            var boxes = document.getElementsByName("manage_system");
            selectAllCheckBox(obj, boxes);
        }

        /**
         * 勾选权限：系统管理--角色管理--全选/全不选
         */
        function manageSystemRoleSelectAllClick(obj) {
            //获取全选按钮下的子框
            var boxes = document.getElementsByName("manage_system_role");
            selectAllCheckBox(obj, boxes);
        }

        /**
         * 勾选权限：系统管理--用户管理--全选/全不选
         */
        function manageSystemUserSelectAllClick(obj) {
            //获取全选按钮下的子框
            var boxes = document.getElementsByName("manage_system_user");
            selectAllCheckBox(obj, boxes);
        }

        /**
         * 勾选权限：系统管理--用户管理--全选/全不选
         */
        function manageSystemLogSelectAllClick(obj) {
            //获取全选按钮下的子框
            var boxes = document.getElementsByName("manage_system_log");
            selectAllCheckBox(obj, boxes);
        }


        /**
         * 勾选权限：乡贤管理--全选/全不选
         */
        function manageTalentSelectAllClick(obj) {
            //获取全选按钮下的子框
            var boxes = document.getElementsByName("manage_talent");
            selectAllCheckBox(obj, boxes);
        }

        /**
         * 勾选权限：乡贤管理--一般乡贤--全选/全不选
         */
        function manageTalentGeneralSelectAllClick(obj) {
            //获取全选按钮下的子框
            var boxes = document.getElementsByName("manage_talent_general");
            selectAllCheckBox(obj, boxes);
        }

        /**
         * 勾选权限：乡贤管理--重要乡贤--全选/全不选
         */
        function manageTalentMajorSelectAllClick(obj) {
            //获取全选按钮下的子框
            var boxes = document.getElementsByName("manage_talent_major");
            selectAllCheckBox(obj, boxes);
        }

        /**
         * 勾选权限：乡贤管理--展示配置--全选/全不选
         */
        function manageTalentShowSelectAllClick(obj) {
            //获取全选按钮下的子框
            var boxes = document.getElementsByName("manage_talent_show");
            selectAllCheckBox(obj, boxes);
        }


        /**
         * 勾选权限：配置视频--全选/全不选
         */
        function configVideoSelectAllClick(obj) {
            //获取全选按钮下的子框
            var boxes = document.getElementsByName("config_video");
            selectAllCheckBox(obj, boxes);
        }


        /**
         * 复选框函数：全选/全不选，不是将子框的checked属性设置为true，而是去触发子框的click函数
         * obj：全选框对象
         * boxes：各子框对象
         */
        function selectAllCheckBox(obj, boxes) {
            //分析：甫一进入页面，全选按钮的初始状态为未勾选，此时，其子框既有勾选也有未勾选
            //一旦开始全选/反选操作后，子框状态便统一了：要么都是已勾选，要么都是未勾选
            for(var i=0; i < boxes.length; i++){
                //点击前，全选按钮处于未勾选状态，涵盖了两种情况：部分子框未勾选，所有子框未勾选
                //点击全选，要进行的是全选操作
                //点击后，全选按钮处于勾选状态，只把未勾选的子框点击一下，变成已勾选
                if (obj.checked) {
                    if(!boxes[i].checked){
                        boxes[i].click();
                    }
                } else {
                    //点击前，全选按钮处于已勾选状态，此时，其子框全部为已勾选状态
                    //点击全选，要进行的是全不选操作
                    //点击后，全选按钮处于未勾选状态，点击所有子框，变成未勾选
                    //boxes[i].click();
                    //以上是常规分析，但要注意一个特殊地方：查看按钮
                    //因为一旦点击到【查看】按钮、将其变为未勾选后，其他还未及点的按钮即由已勾选变为未勾选了，便不必再点了
                    //于是，逻辑变成：做判断，只点击那些仍处于勾选状态的按钮
                    if (boxes[i].checked) {
                        boxes[i].click();
                    }
                }
            }
        }

        /**
         * 勾选权限：清空全选复选框
         * 用于切换选中角色时，剔除对上个角色的操作遗留
         * 将复选框的checked属性设置为false，不能去触发click点击复选框
         * 准备一个数组，存好所有父框的id
         * 其实，准备父框name更简单些，但不知为何【document.getElementsByName(boxName).checked = false】无效
         */
        var arr_dad_id = ["manage_system","manage_system_role","manage_system_user","manage_system_log","manage_talent","manage_talent_general",
            "manage_talent_major","manage_talent_show","config_video"];
        function selectAllBoxClear() {
            for(var i = 0; i < arr_dad_id.length; i++){
                var boxId = arr_dad_id[i];
                $("#"+boxId).prop("checked",false)
            }
        }


        /**
         * 勾选权限：根据当前角色的权限，有选择性地勾选上复选框
         * 判断：
         * 如果某行子框都被勾选，那么其上面的小全选框也勾选
         * 如果所有的小全选框都被勾选，那么大全选框也勾选
         * 准备一个数组，存放所有子框name，设计的巧妙之处就在于：父框id与子框name同名
         * 所以，数组内容与arr_dad_id一致，但本数组内容的顺序一定不能乱：先对小全选框进行判定，再对大全选框进行判定
         */
        var arr_son_name = ["manage_system_role","manage_system_user","manage_system_log","manage_system","manage_talent_general",
            "manage_talent_show","manage_talent","config_video"]
        function selectAllBoxChoose() {
            for(var i = 0; i < arr_son_name.length; i++){
                //一行子框的name
                var boxName = arr_son_name[i];
                //获取一行所有的子框
                var boxes = document.getElementsByName(boxName);
                //遍历：只要有一个未被勾选，flag即为false
                var flag = true;
                for(var j=0; j < boxes.length; j++){
                    if (!boxes[j].checked) {
                        flag = false;
                        break;
                    }
                }
                //给【全选】框设定勾选状态
                //巧妙之处在于：子框的name就是父框的id
                if (flag) {
                    document.getElementById(boxName).checked = true;
                }
            }
        }



        /**
         * 勾选权限：
         * 某行子框按钮，如果有勾选，保证查看按钮必勾选
         * 如果查看按钮未被勾选，则其他按钮一律不被勾选
         * 同时，子框按钮由【已勾选】-->【未勾选】，若此时全选框处于勾选状态，还要对全选框进行取消勾选操作
         */
        function authorityStatus(obj) {
            //获取子复选框的id
            var boxId = obj.id;

            var array = boxId.split("_");
            //判断：点击的是查看按钮
            if (array[1] == "query") {
                //操作方向：若是由【未勾选】-->【已勾选】，不对其他按钮做操作
                //只有是由【已勾选】-->【未勾选】，对其他那些已勾选的按钮，进行取消勾选操作
                var queryBox = document.getElementById(boxId);
                var boxName;    //同一行的复选框name
                var littleBoxId;//小全选按钮id
                var bigBoxId;   //大全选按钮id
                if (!queryBox.checked) {

                    //拼接子框标签name，和全选框id
                    if (array[0] == "role") {
                        boxName = "manage_system_role"
                        littleBoxId = "manage_system_role"
                        bigBoxId = "manage_system"
                    } else if (array[0] == "user") {
                        boxName = "manage_system_user"
                        littleBoxId = "manage_system_user"
                        bigBoxId = "manage_system"
                    } else if (array[0] == "log") {
                        boxName = "manage_system_log"
                        littleBoxId = "manage_system_log"
                        bigBoxId = "manage_system"
                    } else if (array[0] == "general") {
                        boxName = "manage_talent_general"
                        littleBoxId = "manage_talent_general"
                        bigBoxId = "manage_talent"
                    } else if (array[0] == "major") {
                        boxName = "manage_talent_major"
                        littleBoxId = "manage_talent_major"
                        bigBoxId = "manage_talent"
                    } else if (array[0] == "show") {
                        boxName = "manage_talent_show";
                        littleBoxId = "manage_talent_show"
                        bigBoxId = "manage_talent"
                    } else {
                        boxName = "config_video"
                        littleBoxId = "config_video" //其实无小全选，纯粹为避免null
                        bigBoxId = "config_video"
                    }

                    //获得该查询按钮所在行的所有子框
                    var boxes = document.getElementsByName(boxName);
                    //遍历，判断，将已勾选的变为未勾选
                    for (var i = 0; i < boxes.length; i++) {
                        if (boxes[i].checked) {
                            $(boxes[i]).prop("checked",false)
                        }
                    }

                    //获得该查询按钮所属的小全选框
                    var littleBox = document.getElementById(littleBoxId);
                    //判断：将已勾选变为未勾选，且不能用click
                    if (littleBox.checked) {
                        littleBox.checked = false; //这种方式，只能是通过id获得复选框对象
                    }

                    //获得该查询按钮所属的大全选框
                    var bigBox = document.getElementById(bigBoxId);
                    //判断：将已勾选变为未勾选，且不能用click
                    if (bigBox.checked) {
                        bigBox.checked = false; //这种方式，只能是通过id获得复选框对象
                    }
                }
            } else{
                //点击的不是查看按钮
                //勾选方向：由【已勾选】-->【未勾选】，此时查询按钮必定是已勾选状态，不操作查询按钮，只取消全选框
                //勾选方向：由【未勾选】-->【已勾选】，此时查询按钮，若已勾选便罢，若未勾选，则勾选上，并判断是否要勾选全选框

                //获取该子框对象
                var box = document.getElementById(boxId);
                //判断：只操作全选框
                if (!box.checked) {
                    var littleBoxId;//小全选按钮id
                    var bigBoxId;   //大全选按钮id
                    //全选框id
                    if (array[0] == "role") {
                        littleBoxId = "manage_system_role"
                        bigBoxId = "manage_system"
                    } else if (array[0] == "user") {
                        littleBoxId = "manage_system_user"
                        bigBoxId = "manage_system"
                    } else if (array[0] == "log") {
                        littleBoxId = "manage_system_log"
                        bigBoxId = "manage_system"
                    } else if (array[0] == "general") {
                        littleBoxId = "manage_talent_general"
                        bigBoxId = "manage_talent"
                    } else if (array[0] == "major") {
                        littleBoxId = "manage_talent_major"
                        bigBoxId = "manage_talent"
                    } else if (array[0] == "show") {
                        littleBoxId = "manage_talent_show"
                        bigBoxId = "manage_talent"
                    } else {
                        littleBoxId = "config_video" //其实无小全选，纯粹为避免null
                        bigBoxId = "config_video"
                    }

                    //获得该按钮所属的小全选框
                    var littleBox = document.getElementById(littleBoxId);
                    //判断：将已勾选变为未勾选，且不能用click
                    if (littleBox.checked) {
                        littleBox.checked = false; //这种方式，只能是通过id获得复选框对象
                    }

                    //获得该按钮所属的大全选框
                    var bigBox = document.getElementById(bigBoxId);
                    //判断：将已勾选变为未勾选，且不能用click
                    if (bigBox.checked) {
                        bigBox.checked = false; //这种方式，只能是通过id获得复选框对象
                    }
                } else {
                    //判断：操作查看按钮
                    //构造查询按钮的id，获取查询按钮对象
                    var queryId = array[0] + "_query";
                    var queryBox = document.getElementById(queryId);
                    if (!queryBox.checked) {
                        $(queryBox).prop("checked",false)
                    }
                    //判断：是否勾选上全选框
                    selectAllBoxChoose();
                }
            }
        }

        /**
         * 保存：将勾选好的角色权限发送给后台，即修改角色权限
         * 准备一个数组，存好所有子框的id，从各子框中取状态值
         */
        var arr_son_id = ["role_query","role_create","role_update","role_delete","user_query","user_create","user_update","user_delete",
            "log_query","log_download","general_query","general_single","general_batch","general_export","general_update","general_delete",
            "show_query","show_create","show_update",
            "show_delete","show_sort","video_query","video_upload"];
        function saveClick() {
            //为便于准备数据，将复选框id名作为请求参数名
            var reqData = new FormData();
            reqData.append("roleId", moduleData.get("roleId"));
            for(var i = 0; i < arr_son_id.length; i++){
                var boxId = arr_son_id[i];
                var box = document.getElementById(boxId);
                if (box.checked) {
                    reqData.append(boxId, 2);
                } else {
                    reqData.append(boxId, 1);
                }
            }
            $.ajax({
                type: 'post',
                url: 'manageRole/configRoleAuthority',
                dataType: 'json',
                data: reqData,
                contentType: false,
                processData: false,
                success: function (res) {
                    if (res.status === 1005) {
                        toast("登录超时，请重新登录");
                        window.location.href = 'login';
                    } else if (res.status === 1000) {
                        toast("保存成功");
                    } else {
                        toast("保存失败");
                    }
                }
            });
        }


        /**
         * 删除弹框界面设值
         */
        function deleteModal(roleId) {
            moduleData.set("roleId", roleId);
        }

        /**
         * 删除
         */
        function deleteClick() {
            $.ajax({
                type: 'POST',
                url: 'manageRole/deleteRole',
                data: {'roleId': moduleData.get("roleId")},
                dataType: 'json',
                success: function (data) {
                    if (data.status === 1005) {
                        toast("登录超时，请重新登录");
                        window.location.href = 'login';
                    } else if(data.status === 1004) {
                        toast("此角色正在被使用，无法删除，请先修改用户的角色信息后再尝试删除操作！");
                    } else if(data.status === 1000) {
                        toast("删除成功");
                        queryRoleNameList();
                    }else {
                        toast("删除失败");
                    }
                }
            })
        }


        /*/!**
         * 校验：新建角色--角色名
         *!/
        function checkRoleNameCreate(obj) {
            var roleName = obj.value;
            //判断：字符长度不能超过20
            var length = roleName.replace(/[^\x00-\xff]/g, "**").length;
            if (length * 1 >= 20){
                toast("角色名不能超过10个汉字");
            }
        }*/

        /**
         * 检查文本框长度：汉字和字符
         */
        function checkLength(obj, maxLength) {
            var length = 0;
            for(var i=0; i < obj.value.length; i++) {
                if (/[\u4e00-\u9fa5]/.test(obj.value[i])) {
                    length+=2;
                } else {
                    length++;
                }
                if (length > maxLength) {
                    obj.value = obj.value.substr(0,i);
                    break;
                }
            }
        }

        /**
         * 校验：新建角色--角色描述
         */
        function checkDescriptionCreate(obj) {
            var description = obj.value;
            //判断：字符长度不能超过20
            var length = description.replace(/[^\x00-\xff]/g, "**").length;
            if (length * 1 <= 5){
                toast("请输入至少5个字");
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
        function closeClick() {
            $('#role_name_create').val(null);
            $('#description_create').val(null);
        }
    </script>

</body>

</html>