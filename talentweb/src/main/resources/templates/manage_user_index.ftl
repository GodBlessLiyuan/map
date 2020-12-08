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
    <!--toast-->
    <link href="css/toast.css" rel="stylesheet">
    <link href="css/talent.css" rel="stylesheet">
    <link href="./plugins/datatables/jquery.dataTables.min.css" rel="stylesheet">
    <!--jedate-->
    <link rel="stylesheet" type="text/css" href="./plugins/jedate-6.5.0/skin/jedate.css"/>
    <script src="./js/bootstrap.js"></script>
</head>

<body onload="queryCurrentUserInfo()">
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
                            <div>
                                <label class="label-control"><span>用户管理</span></label>
                                <button type="button" class="btn mb-1 btn-primary" id="edit" data-toggle='modal'
                                        data-target='#editModal'
                                        onclick="javascript:editModal(0)" style="float:right">新建用户
                                </button>
                            </div>
                            <hr>
                            <div class="basic-form">
                                <form class="form-inline">
                                    <div class="form-group">
                                        <span>用户名&nbsp;&nbsp;</span>
                                        <input id="username_top" type="text" class="name-input" placeholder="请输入">
                                    </div>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <div class="form-group">
                                        <span>角色&nbsp;&nbsp;</span>
                                        <select id="roleId_top" class="role-input">
                                            <option value='0' selected hidden>请选择</option>
                                        </select>
                                    </div>
                                    <div class="form-group" style="padding-left: 20px;">
                                        <button type="button" class="btn mb-1 btn-outline-info button1-control"
                                                id="query" style="margin-top: 3.5px"
                                                onclick="javascript:queryClick();">查询
                                        </button>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <button type="button" class="btn mb-1 btn-outline-light button1-control"
                                                id="reset" style="margin-top: 3.5px"
                                                onclick="javascript:resetClick()">重置
                                        </button>
                                    </div>

                                </form>

                            </div>

                            <div class="table-responsive">
                                <table id="datatab" class="table table-striped table-bordered zero-configuration"
                                       style="table-layout: fixed; text-align: center; vertical-align: middle">
                                    <thead>
                                    <tr>
                                        <th width="80px">序号</th>
                                        <th width="100px">用户名</th>
                                        <th width="100px">手机号</th>
                                        <th width="100px">角色</th>
                                        <th width="150px">区域</th>
                                        <th width="150px">备注</th>
                                        <th width="250px">操作</th>


                                    </tr>
                                    </thead>
                                </table>
                            </div>
                        </div>

                        <#assign modalId = "deleteModal">
                        <#assign moduleTitle = "是否删除此用户？">
                        <#assign moduleClick = "deleteClick()">
                        <#include "freemarker/base/dialog.ftl"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--弹框：新建/编辑用户-->
    <div class="modal fade" id="editModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content col-lg-12" style="padding-left: 0px;padding-right: 0px;">
                <div class="modal-header" style="border-bottom: none;">

                    <h5 class="modal-title" id="exampleModalLabel"
                        style="font-family: PingFangSC-Medium;font-size: 16px;color: #333333;font-weight: bolder;">
                        新建/编辑用户</h5>
                    <button type="button" class="close" data-dismiss="modal"
                            style="background:url(./images/ico_close.png) no-repeat center;margin-right: 0px;margin-top: -2px;">
                    </button>

                </div>
                <div class="modal-body">
                    <form>
                        <div style="margin: 0 auto;">
                            <div class="form-group row">
                                <div class="col-lg-3 " style="text-align: right">
                                    <label class="col-form-label">
                                        用户名 <span class="text-danger">*</span>
                                    </label>
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" class="form-control input-control" id="username_edit"
                                           placeholder="请输入" maxlength="20"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3" style="text-align: right">
                                    <label class="label-control">手机号<span style="color: red">*</span></label>
                                </div>
                                <div class="col-lg-6">
                                    <input id="phone" class="form-control input-control" type="text"
                                           placeholder="请输入"<#-- onblur="checkPhone(this)"-->/>
                                </div>

                            </div>
                            <div class="form-group row pwddel">
                                <div class="col-lg-3" style="text-align: right">
                                    <label class=" col-form-label">
                                        登录密码<span style="color: red">*</span>
                                    </label>
                                </div>
                                <div class=" col-lg-6">
                                    <input id="password" class="form-control input-control" type="password"
                                           placeholder="请输入" maxlength="16"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3" style="text-align: right">
                                    <label class="col-form-label">
                                        角色<span class="text-danger">*</span>
                                    </label>
                                </div>
                                <div class="col-lg-5">
                                    <select id="roleId_edit" class="form-control input-control" onchange="roleS()">
                                        <option value='0' selected hidden>请选择</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group row" id="areaDiv">
                                <div class="col-lg-3" style="text-align: right">
                                    <label class="col-form-label">
                                        区域
                                        <span style="color: red">*</span>
                                    </label>
                                </div>

                                <div class="col-lg-8" id="address">
                                    <select id="prov" class="select-control" style="width:72px; font-size: 13px">
                                        <option value='0' selected disabled>请选择</option>
                                    </select>
                                    <select id="city" class="select-control" style="width: 130px;">
                                        <option value='0' selected disabled>请选择</option>
                                    </select>
                                    <select id="dist" class="select-control" style="width: 90px;">
                                        <option value='0' selected disabled>请选择</option>
                                    </select>
                                </div>


                            </div>
                            <div class="form-group row" id="org" style="display: none">
                                <div class="col-lg-3" style="text-align: right">
                                    <label class="col-form-label">
                                        学校/商会
                                        <span style="color: red">*</span>
                                    </label>
                                </div>
                                <div class=" col-lg-6">
                                    <input id="orginput" class="form-control input-control" type="text"
                                           placeholder="请输入" maxlength="16"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3" style="text-align: right">
                                    <label class="col-form-label">
                                        备注<span style="color: red">*</span>
                                    </label>
                                </div>
                                <div class="col-lg-6">
                                    <textarea id="extra" class="form-control input-control "
                                              type="text" placeholder="请输入至少五个字符" onkeyup="checkLength(this, 400)"
                                              onblur="checkExtra(this)"></textarea>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-lg-3 col-lg-offset-1"></div>
                                <div class="col-lg-5">
                                    <button type="button" class="btn btn-primary" onclick="editClick()">确定</button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-outline-light" data-dismiss="modal"
                                            aria-label="Close" id="ModalX">
                                        <span aria-hidden="true">取消</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <#--修改密码-->
    <div class="modal fade" id="modifyPwdModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content col-lg-12" style="padding-left: 0px;padding-right: 0px;">
                <div class="modal-header" style="border-bottom: none;">
                    <h5 class="modal-title"
                        style="font-family: PingFangSC-Medium;font-size: 16px;color: #333333;font-weight: bolder;">
                        修改密码</h5>
                    <button type="button" class="close" data-dismiss="modal"
                            style="background:url(./images/ico_close.png) no-repeat center;margin-right: 0px;margin-top: -2px;">
                    </button>

                </div>
                <div class="modal-body">
                    <form>
                        <div style="margin: 0 auto;">
                            <div class="form-group row " >
                                <div class="col-lg-3" style="text-align: right">
                                    <label class=" col-form-label">
                                        登录密码<span style="color: red">*</span>
                                    </label>
                                </div>
                                <div class=" col-lg-7">
                                    <input id="modifyPwdInput" class="form-control input-control" type="password"
                                           placeholder="请输入" maxlength="16"/>
                                    <label>请输入长度为8～16的英文+数字密码</label>
                                </div>
                            </div>

                            <#--确认密码：-->
                            <div class="form-group row " >
                                <div class="col-lg-3" style="text-align: right">
                                    <label class=" col-form-label">
                                        确认密码<span style="color: red">*</span>
                                    </label>
                                </div>
                                <div class=" col-lg-7">
                                    <input id="confirmPwdInput" class="form-control input-control" type="password"
                                           placeholder="请输入" maxlength="16"/>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-lg-3 col-lg-offset-1"></div>
                                <div class="col-lg-5">
                                    <#--<button type="button" class="btn btn-primary" onclick="modifyPwd()">确定</button>-->
                                    <button type="button" class="btn btn-primary" onclick="modifyPassword()">确定</button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-outline-light" data-dismiss="modal"
                                            aria-label="Close" id="ModalModifyClose">
                                        <span aria-hidden="true">取消</span>
                                    </button>
                                </div>
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
    <#include "freemarker/base/footer.ftl"/>
</div>

<!--**********************************
    Scripts
***********************************-->
<script src="plugins/common/common.min.js"></script>
<script src="js/custom.min.js"></script>
<script src="js/settings.js"></script>
<script src="js/gleek.js"></script>
<script src="js/styleSwitcher.js"></script>
<script src="js/cityselect.js"></script>

<script src="./js/dashboard/dashboard-1.js"></script>

<#--<script src="./plugins/jquery/jquery.min.js"></script>-->
<script src="./plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="./plugins/jedate-6.5.0/dist/jedate.min.js"></script>

<script>

    /**
     * 单独修改密码
     */
    function modifyPassword(){
        //获取数据
        var password = $('#modifyPwdInput').val();
        var confirmPwd = $('#confirmPwdInput').val();
        //准备数据
        var userId = moduleData.get("userId")
        console.log(userId)
        var reqData = new FormData();
        reqData.append("userId", moduleData.get("userId"));

        reqData.append("password", password);

        if (password == null || password.trim() == "") {
            toast("请填写登录密码")
        }
        else if (!/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/.test(password)) {
            toast("密码长度为8~16位数字+英文");
        }else if(password != confirmPwd){
            toast("两次密码不一致!");
        } else {

            //判空通过，方才发送请求
            $.ajax({
                type: 'post',
                url: 'manageUser/updateUserPwd',
                dataType: 'json',
                data: reqData,
                contentType: false,
                processData: false,
                success: function (res) {
                    if (res.status === 1005) {
                        toast("登录超时，请重新登录");
                        window.location.href = 'login';
                    } else if (res.status === 1000) {
                        console.log("修改用户的uerId" + userId)
                        toast("修改密码成功");

                        // 修改完成后清空密码
                         $('#modifyPwdInput').val(null);
                         $('#confirmPwdInput').val(null);

                        // 修改成功后关闭模态框
                        document.getElementById("ModalModifyClose").click();


                        // 修改成功后关闭模态框 可以关闭 但是 出现修改成功后 页面无法点击问题
                        // $("#modifyPwdModal").modal('hide');

                        $('#datatab').DataTable().draw(false);
                    }

                }
            });
        }

    }

    /**
     * 修改密码弹框界面设值
     */
    function modifyPwsModal(userId) {
        moduleData.set("userId", userId);
    }


    /**
     * 修改前台：修改密码后清空模态框数据
     */
    $('#updatePwdModal').on('hide.bs.modal', function (event) {
        $("#oldPassword").val(null);
        $("#newPassword").val(null);
        $("#confirm").val(null);
    });


    //页面加载执行
    window.onload = queryCurrentUserInfo();
    var tag;
    var roleId;
    var currentIsolationId;
    var city;
    var areaName;
    var flagName;
    var flagExtra;
    var areaNameId;
    var Temp = [], arr = [], arr2 = [], key = ['name', 'isolation_id'];
    Temp = arr.map(function (item, index) {
        var obj = {};
        obj[key[0]] = arr[index];
        obj[key[1]] = arr2[index];
        return obj;
    });
    var TempId;


    $(document).ready(function () {
        queryCurrentUserInfo();
        queryClick();
        queryCreateRole();
        // queryRoleNameList();
        authorityJudge();
    })

    //获取当前登录用户相关信息
    function queryCurrentUserInfo() {
        $.ajax({
            type: 'post',
            url: 'manageUser/userCreateInitial',
            dataType: 'json',
            success: function (res) {
                console.log(res.data)
                roleId = res.data.roleId; //当前登录roleId
                currentIsolationId = res.data.isolationId;//当前用户隔离Id
                city = res.data.name; //当前区域
            }
        })
    }

    //根据登录用户查询可创建角色名称，并填充查询角色下拉表
    function queryCreateRole() {
        $.ajax({
            type: 'GET',
            url: 'manageRole/queryRoleNameList',
            dataType: 'JSON',
            success: function (result) {
                if (result.status === 1005) {
                    toast("登录超时，请重新登录！");
                    window.location.href = 'login';
                } else if (result.status === 1000) {
                    if (roleId === 1) {
                        for (let i = 0; i < result.data.length; i++) {
                            if (result.data[i].roleId >= 1) {
                                $('#roleId_top').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                            }
                        }
                    }
                    if (roleId === 2) {
                        for (let i = 0; i < result.data.length; i++) {
                            if (result.data[i].roleId === 2) {
                                $('#roleId_top').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                            }
                        }
                    }
                    if (roleId === 3) {
                        for (let i = 0; i < result.data.length; i++) {
                            if (result.data[i].roleId >= 3) {
                                $('#roleId_top').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                            }
                        }
                    }
                    if (roleId === 4) {
                        for (let i = 0; i < result.data.length; i++) {
                            if (result.data[i].roleId >= 4 && result.data[i].roleId < 6) {
                                $('#roleId_top').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                            }
                        }
                    }
                    if (roleId === 5) {
                        for (let i = 0; i < result.data.length; i++) {
                            if (result.data[i].roleId >= 5 && result.data[i].roleId < 6) {
                                $('#roleId_top').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                            }
                        }
                    }

                    if (roleId === 6) {
                        for (let i = 0; i < result.data.length; i++) {
                            if (result.data[i].roleId === 6) {
                                $('#roleId_top').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                            }
                        }
                    }

                } else {
                    toast("查询角色失败");
                }
            }
        });
    }

    //角色选中事件，根据选择的角色判断区域
    function roleS() {
        let selectRole = $("#roleId_edit").find("option:selected").text(); //创建或编辑时选择的角色
        //如果当前登录使超级管理员
        if (roleId === 1) {
            //角色选择是超级管理员、游客、市级角色
            if (selectRole === "学校/商会") {
                $("#areaDiv").hide();
                $("#org").show();
            }
            if (selectRole === "市级角色" || selectRole === "超级管理员" || selectRole === "游客") {
                $("#areaDiv").show();
                $("#org").hide();
                $("#city").hide();
                $("#dist").hide();
                $("#prov").empty();
                let selectProv = "<option value='1' selected disabled>衢州市</option>";
                $("#prov").append(selectProv);
            }
            //如果角色选择是区级角色
            if (selectRole === "区级角色") {
                $("#areaDiv").show();
                $("#org").hide();
                $("#dist").hide();
                $("#prov").empty();
                $("#city").empty();
                $("#city").show();
                let selectProv = "";
                selectProv += "<option value='1' selected hidden>衢州市</option>";
                $("#prov").append(selectProv);
                $.ajax({
                    type: 'post',
                    url: 'manageUser/findIsolation?isolationId=' + currentIsolationId,
                    dataType: 'json',
                    success: function (res) {
                        $("#city").empty();
                        let selectCity = "<option value='0' selected hidden>请选择</option>";
                        let areaArr = res.data;
                        Temp = areaArr;
                        for (let i = 0; i < areaArr.length; i++) {
                            selectCity += '<option value="';
                            selectCity += areaArr[i].isolationId;
                            selectCity += '">';
                            selectCity += areaArr[i].name;
                            selectCity += '</option>';
                        }
                        $("#city").append(selectCity);
                    }
                })
            }
            //如果角色选择是乡镇角色
            if (selectRole === "乡镇角色") {
                $("#areaDiv").show();
                $("#org").hide();
                $("#prov").empty();
                //$("#dist").empty();
                $("#city").empty();
                $("#city").show();
                $("#dist").show();
                $("#dist").empty();
                $("#dist").append("<option value='0' selected hidden>请选择</option>");
                let selectProv = "<option value='1' selected hidden>衢州市</option>";
                $("#prov").append(selectProv);

                $.ajax({
                    type: 'post',
                    url: 'manageUser/findIsolation?isolationId=' + currentIsolationId,
                    dataType: 'json',
                    success: function (res) {
                        $("#city").empty();
                        let selectCity = "<option value='0' selected hidden>请选择</option>";
                        let areaArr = res.data;
                        Temp = areaArr;
                        for (let i = 0; i < areaArr.length; i++) {
                            selectCity += '<option value="';
                            selectCity += areaArr[i].isolationId;
                            selectCity += '" >';
                            selectCity += areaArr[i].name;
                            selectCity += '</option>';
                        }
                        $("#city").append(selectCity);

                        $("#city").change(function () {
                            let selectCityIsolationId = $("#city").find("option:selected").val(); //创建或编辑时选择的角色
                            $.ajax({
                                type: 'post',
                                url: 'manageUser/findIsolation?isolationId=' + selectCityIsolationId,
                                dataType: 'json',
                                success: function (res) {
                                    // $("#dist").empty();
                                    //  var selectDist = "<option value='0' selected hidden>请选择</option>";
                                    let areaArr = res.data;
                                    Temp = areaArr;
                                    $("#dist").empty();
                                    $("#dist").append("<option value='0' selected hidden>请选择</option>");
                                    let selectDist = "";
                                    for (let i = 0; i < areaArr.length; i++) {
                                        selectDist += '<option value="';
                                        selectDist += areaArr[i].isolationId;
                                        selectDist += '">';
                                        selectDist += areaArr[i].name;
                                        selectDist += '</option>';
                                    }
                                    $("#dist").empty();
                                    $("#dist").append("<option value='0' selected hidden>请选择</option>");
                                    $("#dist").append(selectDist);
                                },

                            })
                        })

                    },

                })

            }

        } else if (roleId === 3) {
            if (selectRole === "学校/商会") {
                $("#areaDiv").hide();
                $("#org").show();
            }
            if (selectRole === "市级角色") {
                $("#areaDiv").show();
                $("#org").hide();
                $("#city").hide();
                $("#dist").hide();
                $("#prov").empty();
                let selectProv = "<option value='1' selected>衢州市</option>";
                $("#prov").append(selectProv);
            }
            //如果角色选择是区级角色
            if (selectRole === "区级角色") {
                $("#areaDiv").show();
                $("#org").hide();
                $("#dist").hide();
                $("#prov").empty();
                $("#city").empty();
                $("#city").show();
                let selectProv = "";
                selectProv += "<option value='1' selected>衢州市</option>";
                $("#prov").append(selectProv);
                $.ajax({
                    type: 'post',
                    url: 'manageUser/findIsolation?isolationId=' + currentIsolationId,
                    dataType: 'json',
                    success: function (res) {
                        $("#city").empty();
                        let selectCity = "<option value='0' selected hidden>请选择</option>";
                        let areaArr = res.data;
                        Temp = areaArr;
                        for (let i = 0; i < areaArr.length; i++) {
                            selectCity += '<option value="';
                            selectCity += areaArr[i].isolationId;
                            selectCity += '">';
                            selectCity += areaArr[i].name;
                            selectCity += '</option>';
                        }
                        $("#city").append(selectCity);
                    }
                })
            }
            //如果角色选择是乡镇角色
            if (selectRole === "乡镇角色") {
                $("#areaDiv").show();
                $("#org").hide();
                $("#prov").empty();
                //$("#dist").empty();
                $("#city").empty();
                $("#city").show();
                $("#dist").show();
                $("#dist").empty();
                $("#dist").append("<option value='0' selected hidden>请选择</option>");
                let selectProv = "<option value='1' selected>衢州市</option>";
                $("#prov").append(selectProv);

                $.ajax({
                    type: 'post',
                    url: 'manageUser/findIsolation?isolationId=' + currentIsolationId,
                    dataType: 'json',
                    success: function (res) {
                        $("#city").empty();
                        let selectCity = "<option value='0' selected hidden>请选择</option>";
                        let areaArr = res.data;
                        Temp = areaArr;
                        for (let i = 0; i < areaArr.length; i++) {
                            selectCity += '<option value="';
                            selectCity += areaArr[i].isolationId;
                            selectCity += '">';
                            selectCity += areaArr[i].name;
                            selectCity += '</option>';
                        }
                        $("#city").append(selectCity);

                        $("#city").change(function () {
                            let selectCityIsolationId = $("#city").find("option:selected").val(); //创建或编辑时选择的角色
                            $.ajax({
                                type: 'post',
                                url: 'manageUser/findIsolation?isolationId=' + selectCityIsolationId,
                                dataType: 'json',
                                success: function (res) {
                                    // $("#dist").empty();
                                    //  var selectDist = "<option value='0' selected hidden>请选择</option>";
                                    let areaArr = res.data;
                                    Temp = areaArr;
                                    $("#dist").empty();
                                    $("#dist").append("<option value='0' selected hidden>请选择</option>");
                                    let selectDist = "";
                                    for (let i = 0; i < areaArr.length; i++) {
                                        selectDist += '<option value="';
                                        selectDist += areaArr[i].isolationId;
                                        selectDist += '">';
                                        selectDist += areaArr[i].name;
                                        selectDist += '</option>';
                                    }
                                    $("#dist").empty();
                                    $("#dist").append("<option value='0' selected hidden>请选择</option>");
                                    $("#dist").append(selectDist);
                                },

                            })
                        })

                    },

                })

                // let selectCity = "<option value=" + currentIsolationId + "selected hidden>" + city + "</option>";
                // $("#city").append(selectCity);

            }
        } else if (roleId === 4) {
            $("#dist").hide();
            if (selectRole === "区级角色") {
                $("#dist").hide();
                $("#prov").empty();
                $("#city").empty();
                $("#city").show();
                let selectProv = "";
                selectProv += "<option value='1' selected>衢州市</option>";
                $("#prov").append(selectProv);
                let selectCity = "<option value=" + currentIsolationId + " selected>" + city + "</option>";
                $("#city").append(selectCity);
            }
            //如果角色选择是乡镇角色
            if (selectRole === "乡镇角色") {
                $("#dist").show();
                $("#prov").empty();
                $("#city").empty();
                $("#city").show();
                let selectProv = "";
                selectProv += "<option value='1' selected>衢州市</option>";
                $("#prov").append(selectProv);
                let selectCity = "<option value=" + currentIsolationId + " selected >" + city + "</option>";
                $("#city").append(selectCity);

                $.ajax({
                    type: 'post',
                    url: 'manageUser/findIsolation?isolationId=' + currentIsolationId,
                    dataType: 'json',
                    success: function (res) {
                        $("#dist").empty();
                        let selectDist = "<option value='0' selected>请选择</option>";
                        let areaArr = res.data;
                        Temp = areaArr;
                        for (let i = 0; i < areaArr.length; i++) {
                            selectDist += '<option value="';
                            selectDist += areaArr[i].isolationId;
                            selectDist += '">';
                            selectDist += areaArr[i].name;
                            selectDist += '</option>';
                        }
                        $("#dist").append(selectDist);
                    },

                })

            }
        } else if (roleId === 5) {
            $("#prov").empty();
            $("#city").empty();
            $("#city").show();
            $("#dist").empty();
            let selectProv = "";
            selectProv += "<option value='1' selected>衢州市</option>";
            $("#prov").append(selectProv);
            $.ajax({
                type: 'post',
                url: 'manageUser/findParent?isolationId=' + currentIsolationId,
                dataType: 'json',
                success: function (res) {
                    let cityName = res.data.name;
                    let cityIsolationId = res.data.isolationId;
                    let selectCity = "<option value=" + cityIsolationId + " selected>" + cityName + "</option>";
                    $("#city").empty();
                    $("#city").append(selectCity);
                    $("#dist").append("<option value=" + currentIsolationId + " selected>" + city + "</option>");
                }
            })
        } else {
            let selectRole;
            selectRole = "<option value='6' selected>学校/商会</option>";
            $("#roleId_edit").empty();
            $("#roleId_edit").append(selectRole)
            $("#areaDiv").hide();
            $("#org").show();
            document.getElementById("orginput").value = areaName;
            document.getElementById("orginput").setAttribute('disabled', 'disabled');
        }
    }

    /**
     * 当前用户操作权限判断
     */
    function authorityJudge() {
        //权限判断：创建用户
        var user_create = ${userAuthority.user_create};
        if (user_create == 1) {
            $("#edit").hide();
        }
    }

    /**
     * 查询用户数据
     */
    function queryClick() {
        if ($.fn.dataTable.isDataTable('#datatab')) {
            $('#datatab').DataTable().destroy();
        }

        let username = $('#username_top').val();
        let roleId = $('#roleId_top').val();
        //   let isolationId = currentIsolationId;
        $('#datatab').DataTable({
            "processing": false,
            "serverSide": true,
            "searching": false, // 禁用全文搜索
            "ordering": false, // 禁用排序
            "bAutoWidth": false,
            "bStateSave":true,
            "ajax": "manageUser/queryUser?username=" + username + "&roleId=" + roleId,
            "fnDrawCallback": function () {
                this.api().column(0).nodes().each(function (cell, i) {
                    cell.innerHTML = i + 1;
                });
            },
            "columns": [
                {"data": null, "targets": 0},
                {"data": "username"},
                {"data": "phone"},
                {"data": "roleName"},
                {"data": "areaName"},
                {"data": "extra"},
                {
                    "data": "userId",
                    "render": function (data, type, full) {
                        areaName = full.areaName; //区域名
                        flagName = full.roleName;//角色名
                        flagExtra = full.extra;//备注信息
                        areaNameId = full.roldId;//角色Id
                        //权限判断：修改用户和删除用户
                        var user_delete = ${userAuthority.user_delete};
                        var user_update = ${userAuthority.user_update};
                        var modify_password = "<button class='btn btn-outline-info'  id='modifyPwd' onclick='modifyPwsModal(" + data + ")' data-toggle='modal' data-target='#modifyPwdModal'>修改密码</button> "
                        var label_delete = "<button class='btn btn-outline-info' id='deleB' onclick='deleteModal(" + data + ")' data-toggle='modal' data-target='#deleteModal'>删除</button> "
                        var label_edit = "<button class='btn btn-outline-light' id='editB' onclick='editModal(" + data + ")' data-toggle='modal' data-target='#editModal'>编辑</button> "
                        if (user_delete == 2 && user_update == 2) {
                             return modify_password + label_delete + label_edit;
                        } else if (user_delete == 2 && user_update == 1) {
                            return modify_password + label_delete;
                        } else if (user_delete == 1 && user_update == 2) {
                            return  modify_password + label_edit;
                        } else {
                            return "";
                        }
                    }
                }
            ],
            "oLanguage": {
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "无符合条件的用户信息",
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
        $('#username_top').val(null);
        $('#roleId_top option:first').prop('selected', 'selected');

        queryClick();
    }


    /**
     * 容器：暂时存放数值，供取用，中转作用
     */
    var moduleData = new Map();


    /**
     * 编辑：点击新增/修改用户时，将userId放入容器（修改用户）
     */
    function editModal(userId) {

        if (userId ==0){
            $(".pwddel").show();
        }

        if (userId !==0){
            $(".pwddel").hide();
        }


        moduleData.set("userId", userId);
        //moduleData.set("userId", userId);
        console.log("userId" + userId)
        //新增：清空弹框输入框数据
        if (userId == 0) {
            $('#username_edit').val("");
            $('#phone').val("");
            $('#password').val("");
            $('#roleId_edit').empty();
            $('#address').val("");
            // $('#prov').empty();
            // $('#city').empty();
            // $('#dist').empty();
            $('#extra').val("");

            $.ajax({
                type: 'GET',
                url: 'manageRole/queryRoleNameList',
                dataType: 'JSON',
                success: function (result) {
                    if (result.status === 1005) {
                        toast("登录超时，请重新登录！");
                        window.location.href = 'login';
                    } else if (result.status === 1000) {
                        $("#roleId_edit").empty();
                        $("#roleId_edit").append("<option value='0' selected hidden>请选择</option>");
                        if (roleId === 1) {
                            for (let i = 0; i < result.data.length; i++) {
                                if (result.data[i].roleId >= 1) {
                                    $('#roleId_edit').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                                }
                            }
                        }
                        if (roleId === 2) {
                            for (let i = 0; i < result.data.length; i++) {
                                if (result.data[i].roleId === 2) {
                                    $('#roleId_edit').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                                }
                            }
                        }
                        if (roleId === 3) {
                            for (let i = 0; i < result.data.length; i++) {
                                if (result.data[i].roleId >= 3) {
                                    $('#roleId_edit').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                                }
                            }
                        }
                        if (roleId === 4) {
                            for (let i = 0; i < result.data.length; i++) {
                                if (result.data[i].roleId >= 4 && result.data[i].roleId < 6) {
                                    $('#roleId_edit').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                                }
                            }
                        }
                        if (roleId === 5) {
                            for (let i = 0; i < result.data.length; i++) {
                                if (result.data[i].roleId >= 5 && result.data[i].roleId < 6) {
                                    $('#roleId_edit').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                                }
                            }
                        }
                        if (roleId === 6) {
                            for (let i = 0; i < result.data.length; i++) {
                                if (result.data[i].roleId === 6) {
                                    $('#roleId_edit').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                                }
                            }
                        }
                    } else {
                        toast("查询角色失败");
                    }
                }
            });

        } else {
            var selectRoleInfo;
            $.ajax({
                type: 'get',
                url: 'manageUser/queryUserInfoByEditUserId?userId=' + userId,
                dataType: 'json',
                success: function (res) {
                    $('#username_edit').val(res.data.username);
                    $('#phone').val(res.data.phone);
                    console.log(res.data)
                    selectRoleInfo = res.data;
                    $.ajax({
                        type: 'GET',
                        url: 'manageRole/queryRoleNameList',
                        dataType: 'JSON',
                        success: function (result) {
                            if (result.status === 1005) {
                                toast("登录超时，请重新登录！");
                                window.location.href = 'login';
                            } else if (result.status === 1000) {
                                $("#roleId_edit").empty();
                                $("#roleId_edit").append("<option value='0' selected hidden>请选择</option>");
                                if (roleId === 1) {
                                    for (let i = 0; i < result.data.length; i++) {
                                        if (result.data[i].roleId >= 1) {
                                            $('#roleId_edit').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                                        }
                                    }
                                    let id = selectRoleInfo.roleId;
                                    //console.log(id)
                                    $("#roleId_edit option[value=" + id + "]").attr("selected", "selected");
                                    if (id === 1) {
                                        $("#city").hide();
                                        $("#dist").hide();
                                        $("#org").hide();
                                        $("#areaDiv").show();
                                        $("#prov").empty();
                                        let selectProv = "";
                                        selectProv += "<option value='1' selected hidden>衢州市</option>";
                                        $("#prov").append(selectProv);
                                        $('#extra').val(selectRoleInfo.extra);
                                    }
                                    if (id === 2) {
                                        $("#org").hide();
                                        $("#areaDiv").show();
                                        $("#city").hide();
                                        $("#dist").hide();
                                        let selectProv = "";
                                        selectProv += "<option value='1' selected hidden>衢州市</option>";
                                        $("#prov").append(selectProv);
                                        $('#extra').val(selectRoleInfo.extra);
                                    }
                                    if (id === 3) {
                                        $("#city").hide();
                                        $("#dist").hide();
                                        $("#org").hide();
                                        $("#areaDiv").show();
                                        $("#prov").empty();
                                        let selectProv = "";
                                        selectProv += "<option value='1' selected hidden>衢州市</option>";
                                        $("#prov").append(selectProv);
                                        $('#extra').val(selectRoleInfo.extra);

                                    }
                                    if (id === 4) {
                                        $("#org").hide();
                                        $("#areaDiv").show();
                                        $("#city").show();
                                        $("#dist").hide();
                                        $("#prov").empty();
                                        let selectProv = "";
                                        selectProv += "<option value='1' selected >衢州市</option>";
                                        $("#prov").append(selectProv);
                                        $.ajax({
                                            type: 'post',
                                            url: 'manageUser/findIsolation?isolationId=' + 1,
                                            dataType: 'json',
                                            success: function (res) {
                                                $("#city").empty();
                                                let selectCity = "<option value='0'  hidden>请选择</option>";
                                                let areaArr = res.data;
                                                Temp = areaArr;
                                                for (let i = 0; i < areaArr.length; i++) {
                                                    selectCity += '<option value="';
                                                    selectCity += areaArr[i].isolationId;
                                                    selectCity += '">';
                                                    selectCity += areaArr[i].name;
                                                    selectCity += '</option>';
                                                }
                                                $("#city").empty();
                                                $("#city").append(selectCity);
                                                let iosId = selectRoleInfo.isolationId;
                                                $("#city option[value=" + iosId + "]").attr("selected", "selected");
                                                $('#extra').val(selectRoleInfo.extra);
                                            }
                                        })
                                    }
                                    if (id === 5) {
                                        $("#org").hide();
                                        $("#areaDiv").show();
                                        $("#city").show();
                                        $("#dist").show();
                                        $("#prov").empty();
                                        let selectProv = "";
                                        selectProv += "<option value='1' selected >衢州市</option>";
                                        $("#prov").append(selectProv);
                                        $.ajax({
                                            type: 'post',
                                            url: 'manageUser/findIsolation?isolationId=' + 1,
                                            dataType: 'json',
                                            success: function (res) {
                                                $("#city").empty();
                                                let selectCity = "<option value='0'  hidden>请选择</option>";
                                                let areaArr = res.data;
                                                Temp = areaArr;
                                                for (let i = 0; i < areaArr.length; i++) {
                                                    selectCity += '<option value="';
                                                    selectCity += areaArr[i].isolationId;
                                                    selectCity += '">';
                                                    selectCity += areaArr[i].name;
                                                    selectCity += '</option>';
                                                }
                                                $("#city").empty();
                                                $("#city").append(selectCity);
                                                $('#extra').val(selectRoleInfo.extra);
                                                $.ajax({
                                                    type: 'post',
                                                    url: 'manageUser/findParent?isolationId=' + selectRoleInfo.isolationId,
                                                    dataType: 'json',
                                                    success: function (res) {
                                                        console.log(res.data)
                                                        let cityIsolationId = res.data.isolationId;
                                                        $("#city option[value=" + cityIsolationId + "]").attr("selected", "selected");
                                                        $.ajax({
                                                            type: 'post',
                                                            url: 'manageUser/findIsolation?isolationId=' + cityIsolationId,
                                                            dataType: 'json',
                                                            success: function (res) {
                                                                let areaArr = res.data;
                                                                Temp = areaArr;
                                                                $("#dist").empty();
                                                                $("#dist").append("<option value='0' hidden>请选择</option>");
                                                                let selectDist = "";
                                                                for (let i = 0; i < areaArr.length; i++) {
                                                                    selectDist += '<option value="';
                                                                    selectDist += areaArr[i].isolationId;
                                                                    selectDist += '">';
                                                                    selectDist += areaArr[i].name;
                                                                    selectDist += '</option>';
                                                                }
                                                                $("#dist").empty();
                                                                $("#dist").append("<option value='0' hidden>请选择</option>");
                                                                $("#dist").append(selectDist);
                                                                $("#dist option[value=" + selectRoleInfo.isolationId + "]").attr("selected", "selected");
                                                            }
                                                        })
                                                    }
                                                })
                                            }
                                        })
                                        // if (id ===5) {
                                        //     $("#city").show();
                                        //     let selectProv = "";
                                        //     $("#dist").show();
                                        //     selectProv += "<option value='1' selected >衢州市</option>";
                                        //     $("#prov").append(selectProv);
                                        //     $.ajax({
                                        //         type: 'post',
                                        //         url: 'manageUser/findIsolation?isolationId='+ 1,
                                        //         dataType: 'json',
                                        //         success:function (res) {
                                        //             $("#city").empty();
                                        //             let selectCity = "<option value='0'  hidden>请选择</option>";
                                        //             let areaArr = res.data;
                                        //             Temp = areaArr;
                                        //             for (let i = 0; i < areaArr.length; i++) {
                                        //                 selectCity += '<option value="';
                                        //                 selectCity +=areaArr[i].isolationId;
                                        //                 selectCity +='">';
                                        //                 selectCity += areaArr[i].name;
                                        //                 selectCity +='</option>';
                                        //             }
                                        //             $("#city").append(selectCity);
                                        //             $.ajax({
                                        //                 type: 'post',
                                        //                 url: 'manageUser/findParent?isolationId='+ selectRoleInfo.isolationId,
                                        //                 dataType: 'json',
                                        //                 success:function (res) {
                                        //                     let cityIsolationId = res.data.isolationId;
                                        //                     $("#city option[value="+cityIsolationId+"]").attr("selected","selected");
                                        //                     $.ajax({
                                        //                         type: 'post',
                                        //                         url: 'manageUser/findIsolation?isolationId='+ cityIsolationId,
                                        //                         dataType: 'json',
                                        //                         success:function (res) {
                                        //                             let areaArr = res.data;
                                        //                             Temp = areaArr;
                                        //                             $("#dist").empty();
                                        //                             $("#dist").append("<option value='0' hidden>请选择</option>");
                                        //                             let selectDist="";
                                        //                             for (let i = 0; i < areaArr.length; i++) {
                                        //                                 selectDist += '<option value="';
                                        //                                 selectDist +=areaArr[i].isolationId;
                                        //                                 selectDist +='">';
                                        //                                 selectDist += areaArr[i].name;
                                        //                                 selectDist +='</option>';
                                        //                             }
                                        //                             $("#dist option[value="+selectRoleInfo.isolationId+"]").attr("selected","selected");
                                        //                 }
                                        //             })
                                        //         }
                                        //     })
                                        //
                                        //
                                        //             // $("#dist").empty();
                                        //             // let selectCity = "<option value='0'  hidden>请选择</option>";
                                        //             // let areaArr = res.data;
                                        //             // Temp = areaArr;
                                        //             // for (let i = 0; i < areaArr.length; i++) {
                                        //             //     selectCity += '<option value="';
                                        //             //     selectCity +=areaArr[i].isolationId;
                                        //             //     selectCity +='">';
                                        //             //     selectCity += areaArr[i].name;
                                        //             //     selectCity +='</option>';
                                        //             // }
                                        //             // $("#dist").append(selectCity);
                                        //             // let iosId = selectRoleInfo.isolationId;
                                        //             // $("#dist option[value="+iosId+"]").attr("selected","selected");
                                        //             $('#extra').val(selectRoleInfo.extra);
                                        //         }
                                        //     })
                                        // }

                                    }
                                    if (id === 6) {
                                        $("#areaDiv").hide();
                                        $("#org").show();
                                        //  findIsolationName
                                        $.ajax({
                                            type: 'GET',
                                            url: 'manageUser/findIsolationName?isolationId=' + selectRoleInfo.isolationId,
                                            dataType: 'JSON',
                                            success: function (res) {
                                                console.log(res.data)
                                                document.getElementById("orginput").value = res.data;
                                                $("#roleId_edit option[value='6']").attr("selected", "selected");

                                                // document.getElementById("orginput").setAttribute('disabled', 'disabled');
                                                $('#extra').val(selectRoleInfo.extra);
                                            }
                                        })
                                        //  $("#roleId_edit option[value='6']").attr("selected", "selected");
                                        //  $("#areaDiv").hide();
                                        //  $("#org").show();
                                        //  document.getElementById("orginput").value = areaName;
                                        // // document.getElementById("orginput").setAttribute('disabled', 'disabled');
                                        //  $('#extra').val(selectRoleInfo.extra);
                                    }

                                }
                                if (roleId === 2) {
                                    for (let i = 0; i < result.data.length; i++) {
                                        if (result.data[i].roleId === 2) {
                                            $('#roleId_edit').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                                        }
                                    }

                                    $('#extra').val(selectRoleInfo.extra);
                                }
                                if (roleId === 3) {
                                    for (let i = 0; i < result.data.length; i++) {
                                        if (result.data[i].roleId >= 3) {
                                            $('#roleId_edit').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                                        }
                                    }
                                    let id = selectRoleInfo.roleId;
                                    //console.log(id)
                                    $("#roleId_edit option[value=" + id + "]").attr("selected", "selected");
                                    if (id === 3) {
                                        $("#org").hide();
                                        $("#areaDiv").show();
                                        $("#city").hide();
                                        $("#dist").hide();
                                        $("#prov").empty();
                                        let selectProv = "";
                                        selectProv += "<option value='1' selected hidden>衢州市</option>";
                                        $("#prov").append(selectProv);
                                        $('#extra').val(selectRoleInfo.extra);

                                    }
                                    if (id === 4) {
                                        $("#org").hide();
                                        $("#areaDiv").show();
                                        $("#city").show();
                                        $("#dist").hide();
                                        $("#prov").empty();
                                        let selectProv = "";
                                        selectProv += "<option value='1' selected >衢州市</option>";
                                        $("#prov").append(selectProv);
                                        $.ajax({
                                            type: 'post',
                                            url: 'manageUser/findIsolation?isolationId=' + 1,
                                            dataType: 'json',
                                            success: function (res) {
                                                $("#city").empty();
                                                let selectCity = "<option value='0'  hidden>请选择</option>";
                                                let areaArr = res.data;
                                                Temp = areaArr;
                                                for (let i = 0; i < areaArr.length; i++) {
                                                    selectCity += '<option value="';
                                                    selectCity += areaArr[i].isolationId;
                                                    selectCity += '">';
                                                    selectCity += areaArr[i].name;
                                                    selectCity += '</option>';
                                                }
                                                $("#city").empty();
                                                $("#city").append(selectCity);
                                                let iosId = selectRoleInfo.isolationId;
                                                $("#city option[value=" + iosId + "]").attr("selected", "selected");
                                                $('#extra').val(selectRoleInfo.extra);
                                            }
                                        })
                                    }
                                    if (id === 5) {
                                        $("#org").hide();
                                        $("#areaDiv").show();
                                        $("#city").show();
                                        $("#dist").show();
                                        $("#prov").empty();
                                        let selectProv = "";
                                        selectProv += "<option value='1' selected >衢州市</option>";
                                        $("#prov").append(selectProv);
                                        $.ajax({
                                            type: 'post',
                                            url: 'manageUser/findIsolation?isolationId=' + 1,
                                            dataType: 'json',
                                            success: function (res) {
                                                $("#city").empty();
                                                let selectCity = "<option value='0'  hidden>请选择</option>";
                                                let areaArr = res.data;
                                                Temp = areaArr;
                                                for (let i = 0; i < areaArr.length; i++) {
                                                    selectCity += '<option value="';
                                                    selectCity += areaArr[i].isolationId;
                                                    selectCity += '">';
                                                    selectCity += areaArr[i].name;
                                                    selectCity += '</option>';
                                                }
                                                $("#city").empty();
                                                $("#city").append(selectCity);
                                                $('#extra').val(selectRoleInfo.extra);
                                                $.ajax({
                                                    type: 'post',
                                                    url: 'manageUser/findParent?isolationId=' + selectRoleInfo.isolationId,
                                                    dataType: 'json',
                                                    success: function (res) {
                                                        console.log(res.data)
                                                        let cityIsolationId = res.data.isolationId;
                                                        $("#city option[value=" + cityIsolationId + "]").attr("selected", "selected");
                                                        $.ajax({
                                                            type: 'post',
                                                            url: 'manageUser/findIsolation?isolationId=' + cityIsolationId,
                                                            dataType: 'json',
                                                            success: function (res) {
                                                                let areaArr = res.data;
                                                                Temp = areaArr;
                                                                $("#dist").empty();
                                                                $("#dist").append("<option value='0' hidden>请选择</option>");
                                                                let selectDist = "";
                                                                for (let i = 0; i < areaArr.length; i++) {
                                                                    selectDist += '<option value="';
                                                                    selectDist += areaArr[i].isolationId;
                                                                    selectDist += '">';
                                                                    selectDist += areaArr[i].name;
                                                                    selectDist += '</option>';
                                                                }
                                                                $("#dist").empty();
                                                                $("#dist").append("<option value='0' hidden>请选择</option>");
                                                                $("#dist").append(selectDist);
                                                                $("#dist option[value=" + selectRoleInfo.isolationId + "]").attr("selected", "selected");
                                                            }
                                                        })
                                                    }
                                                })
                                            }
                                        })
                                        // if (id ===5) {
                                        //     $("#city").show();
                                        //     let selectProv = "";
                                        //     $("#dist").show();
                                        //     selectProv += "<option value='1' selected >衢州市</option>";
                                        //     $("#prov").append(selectProv);
                                        //     $.ajax({
                                        //         type: 'post',
                                        //         url: 'manageUser/findIsolation?isolationId='+ 1,
                                        //         dataType: 'json',
                                        //         success:function (res) {
                                        //             $("#city").empty();
                                        //             let selectCity = "<option value='0'  hidden>请选择</option>";
                                        //             let areaArr = res.data;
                                        //             Temp = areaArr;
                                        //             for (let i = 0; i < areaArr.length; i++) {
                                        //                 selectCity += '<option value="';
                                        //                 selectCity +=areaArr[i].isolationId;
                                        //                 selectCity +='">';
                                        //                 selectCity += areaArr[i].name;
                                        //                 selectCity +='</option>';
                                        //             }
                                        //             $("#city").append(selectCity);
                                        //             $.ajax({
                                        //                 type: 'post',
                                        //                 url: 'manageUser/findParent?isolationId='+ selectRoleInfo.isolationId,
                                        //                 dataType: 'json',
                                        //                 success:function (res) {
                                        //                     let cityIsolationId = res.data.isolationId;
                                        //                     $("#city option[value="+cityIsolationId+"]").attr("selected","selected");
                                        //                     $.ajax({
                                        //                         type: 'post',
                                        //                         url: 'manageUser/findIsolation?isolationId='+ cityIsolationId,
                                        //                         dataType: 'json',
                                        //                         success:function (res) {
                                        //                             let areaArr = res.data;
                                        //                             Temp = areaArr;
                                        //                             $("#dist").empty();
                                        //                             $("#dist").append("<option value='0' hidden>请选择</option>");
                                        //                             let selectDist="";
                                        //                             for (let i = 0; i < areaArr.length; i++) {
                                        //                                 selectDist += '<option value="';
                                        //                                 selectDist +=areaArr[i].isolationId;
                                        //                                 selectDist +='">';
                                        //                                 selectDist += areaArr[i].name;
                                        //                                 selectDist +='</option>';
                                        //                             }
                                        //                             $("#dist option[value="+selectRoleInfo.isolationId+"]").attr("selected","selected");
                                        //                 }
                                        //             })
                                        //         }
                                        //     })
                                        //
                                        //
                                        //             // $("#dist").empty();
                                        //             // let selectCity = "<option value='0'  hidden>请选择</option>";
                                        //             // let areaArr = res.data;
                                        //             // Temp = areaArr;
                                        //             // for (let i = 0; i < areaArr.length; i++) {
                                        //             //     selectCity += '<option value="';
                                        //             //     selectCity +=areaArr[i].isolationId;
                                        //             //     selectCity +='">';
                                        //             //     selectCity += areaArr[i].name;
                                        //             //     selectCity +='</option>';
                                        //             // }
                                        //             // $("#dist").append(selectCity);
                                        //             // let iosId = selectRoleInfo.isolationId;
                                        //             // $("#dist option[value="+iosId+"]").attr("selected","selected");
                                        //             $('#extra').val(selectRoleInfo.extra);
                                        //         }
                                        //     })
                                        // }

                                    }
                                    if (id === 6) {
                                        $("#areaDiv").hide();
                                        $("#org").show();
                                        //  findIsolationName
                                        $.ajax({
                                            type: 'GET',
                                            url: 'manageUser/findIsolationName?isolationId=' + selectRoleInfo.isolationId,
                                            dataType: 'JSON',
                                            success: function (res) {
                                                console.log(res.data)
                                                document.getElementById("orginput").value = res.data;
                                                $("#roleId_edit option[value='6']").attr("selected", "selected");

                                                // document.getElementById("orginput").setAttribute('disabled', 'disabled');
                                                $('#extra').val(selectRoleInfo.extra);
                                            }
                                        })
                                    }
                                }
                                if (roleId === 4) {
                                    for (let i = 0; i < result.data.length; i++) {
                                        if (result.data[i].roleId >= 4 && result.data[i].roleId < 6) {
                                            $('#roleId_edit').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                                        }
                                    }
                                    let id = selectRoleInfo.roleId;
                                    let isolationId = selectRoleInfo.isolationId;
                                    //console.log(id)
                                    $("#roleId_edit option[value=" + id + "]").attr("selected", "selected");
                                    if (id === 4) {
                                        $("#org").hide();
                                        $("#areaDiv").show();
                                        $("#city").show();
                                        $("#prov").empty();
                                        let selectProv = "";
                                        $("#dist").hide();
                                        selectProv += "<option value='1' selected>衢州市</option>";
                                        $("#prov").append(selectProv);
                                        $.ajax({
                                            type: 'post',
                                            url: 'manageUser/findIsolationName?isolationId='+ isolationId,
                                            dataType: 'json',
                                            success: function (res) {
                                                console.log(res)
                                                $("#city").empty();
                                                let selectCity = "<option value=" +id +" selected>"+res.data+"</option>";
                                                  //  "'0'  hidden>请选择</option>";
                                                // let areaArr = res.data;
                                                // Temp = areaArr;
                                                // for (let i = 0; i < areaArr.length; i++) {
                                                //     selectCity += '<option value="';
                                                //     selectCity += areaArr[i].isolationId;
                                                //     selectCity += '">';
                                                //     selectCity += areaArr[i].name;
                                                //     selectCity += '</option>';
                                                // }
                                                // $("#city").empty();
                                                // $("#city").append(selectCity);
                                                // let iosId = selectRoleInfo.isolationId;
                                                // $("#city option[value=" + iosId + "]").attr("selected", "selected");
                                                $("#city").append(selectCity);
                                                $('#extra').val(selectRoleInfo.extra);
                                            }
                                        })
                                    }
                                    if (id === 5) {
                                        $("#org").hide();
                                        $("#areaDiv").show();
                                        $("#city").show();
                                        $("#dist").show();
                                        $("#prov").empty();
                                        let selectProv = "";
                                        selectProv += "<option value='1' selected >衢州市</option>";
                                        $("#prov").append(selectProv);
                                        $.ajax({
                                            type: 'post',
                                            url: 'manageUser/findIsolation?isolationId=' + 1,
                                            dataType: 'json',
                                            success: function (res) {
                                                $("#city").empty();
                                                let selectCity = "<option value='0'  hidden>请选择</option>";
                                                let areaArr = res.data;
                                                Temp = areaArr;
                                                for (let i = 0; i < areaArr.length; i++) {
                                                    selectCity += '<option value="';
                                                    selectCity += areaArr[i].isolationId;
                                                    selectCity += '">';
                                                    selectCity += areaArr[i].name;
                                                    selectCity += '</option>';
                                                }
                                                $("#city").empty();
                                                $("#city").append(selectCity);
                                                $('#extra').val(selectRoleInfo.extra);
                                                $.ajax({
                                                    type: 'post',
                                                    url: 'manageUser/findParent?isolationId=' + selectRoleInfo.isolationId,
                                                    dataType: 'json',
                                                    success: function (res) {
                                                        console.log(res.data)
                                                        let cityIsolationId = res.data.isolationId;
                                                        $("#city option[value=" + cityIsolationId + "]").attr("selected", "selected");
                                                        $.ajax({
                                                            type: 'post',
                                                            url: 'manageUser/findIsolation?isolationId=' + cityIsolationId,
                                                            dataType: 'json',
                                                            success: function (res) {
                                                                let areaArr = res.data;
                                                                Temp = areaArr;
                                                                $("#dist").empty();
                                                                $("#dist").append("<option value='0' hidden>请选择</option>");
                                                                let selectDist = "";
                                                                for (let i = 0; i < areaArr.length; i++) {
                                                                    selectDist += '<option value="';
                                                                    selectDist += areaArr[i].isolationId;
                                                                    selectDist += '">';
                                                                    selectDist += areaArr[i].name;
                                                                    selectDist += '</option>';
                                                                }
                                                                $("#dist").empty();
                                                                $("#dist").append("<option value='0' hidden>请选择</option>");
                                                                $("#dist").append(selectDist);
                                                                $("#dist option[value=" + selectRoleInfo.isolationId + "]").attr("selected", "selected");
                                                            }
                                                        })
                                                    }
                                                })
                                            }
                                        })
                                        // if (id ===5) {
                                        //     $("#city").show();
                                        //     let selectProv = "";
                                        //     $("#dist").show();
                                        //     selectProv += "<option value='1' selected >衢州市</option>";
                                        //     $("#prov").append(selectProv);
                                        //     $.ajax({
                                        //         type: 'post',
                                        //         url: 'manageUser/findIsolation?isolationId='+ 1,
                                        //         dataType: 'json',
                                        //         success:function (res) {
                                        //             $("#city").empty();
                                        //             let selectCity = "<option value='0'  hidden>请选择</option>";
                                        //             let areaArr = res.data;
                                        //             Temp = areaArr;
                                        //             for (let i = 0; i < areaArr.length; i++) {
                                        //                 selectCity += '<option value="';
                                        //                 selectCity +=areaArr[i].isolationId;
                                        //                 selectCity +='">';
                                        //                 selectCity += areaArr[i].name;
                                        //                 selectCity +='</option>';
                                        //             }
                                        //             $("#city").append(selectCity);
                                        //             $.ajax({
                                        //                 type: 'post',
                                        //                 url: 'manageUser/findParent?isolationId='+ selectRoleInfo.isolationId,
                                        //                 dataType: 'json',
                                        //                 success:function (res) {
                                        //                     let cityIsolationId = res.data.isolationId;
                                        //                     $("#city option[value="+cityIsolationId+"]").attr("selected","selected");
                                        //                     $.ajax({
                                        //                         type: 'post',
                                        //                         url: 'manageUser/findIsolation?isolationId='+ cityIsolationId,
                                        //                         dataType: 'json',
                                        //                         success:function (res) {
                                        //                             let areaArr = res.data;
                                        //                             Temp = areaArr;
                                        //                             $("#dist").empty();
                                        //                             $("#dist").append("<option value='0' hidden>请选择</option>");
                                        //                             let selectDist="";
                                        //                             for (let i = 0; i < areaArr.length; i++) {
                                        //                                 selectDist += '<option value="';
                                        //                                 selectDist +=areaArr[i].isolationId;
                                        //                                 selectDist +='">';
                                        //                                 selectDist += areaArr[i].name;
                                        //                                 selectDist +='</option>';
                                        //                             }
                                        //                             $("#dist option[value="+selectRoleInfo.isolationId+"]").attr("selected","selected");
                                        //                 }
                                        //             })
                                        //         }
                                        //     })
                                        //
                                        //
                                        //             // $("#dist").empty();
                                        //             // let selectCity = "<option value='0'  hidden>请选择</option>";
                                        //             // let areaArr = res.data;
                                        //             // Temp = areaArr;
                                        //             // for (let i = 0; i < areaArr.length; i++) {
                                        //             //     selectCity += '<option value="';
                                        //             //     selectCity +=areaArr[i].isolationId;
                                        //             //     selectCity +='">';
                                        //             //     selectCity += areaArr[i].name;
                                        //             //     selectCity +='</option>';
                                        //             // }
                                        //             // $("#dist").append(selectCity);
                                        //             // let iosId = selectRoleInfo.isolationId;
                                        //             // $("#dist option[value="+iosId+"]").attr("selected","selected");
                                        //             $('#extra').val(selectRoleInfo.extra);
                                        //         }
                                        //     })
                                        // }

                                    }
                                    $('#extra').val(selectRoleInfo.extra);
                                }
                                if (roleId === 5) {
                                    for (let i = 0; i < result.data.length; i++) {
                                        if (result.data[i].roleId >= 5 && result.data[i].roleId < 6) {
                                            $('#roleId_edit').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                                        }
                                    }

                                    $("#roleId_edit option[value='5']").attr("selected", "selected");
                                    $("#org").hide();
                                    $("#areaDiv").show();
                                    $("#prov").empty();
                                    $("#city").show();
                                    $("#prov").empty();
                                    let selectProv = "";
                                    selectProv += "<option value='1' selected>衢州市</option>";
                                    $("#prov").append(selectProv);
                                    let selectDist = "";
                                    selectDist += "<option value=" + currentIsolationId + " selected>" + city + "</option>";
                                    $("#dist").append(selectDist);
                                    $.ajax({
                                        type: 'POST',
                                        url: 'manageUser/findParent?isolationId=' + currentIsolationId,
                                        dataType: 'JSON',
                                        success: function (res) {
                                            let cityName = res.data.name;
                                            let cityIsolationId = res.data.isolationId;
                                            let selectCity = "<option value=" + cityIsolationId + " selected>" + cityName + "</option>";
                                            $("#city").empty();
                                            $("#city").append(selectCity);

                                        }
                                    })
                                    $('#extra').val(selectRoleInfo.extra);

                                }
                                if (roleId === 6) {
                                    for (let i = 0; i < result.data.length; i++) {
                                        if (result.data[i].roleId === 6) {
                                            $('#roleId_edit').append("<option value='" + result.data[i].roleId + "'>" + result.data[i].roleName + "</option>");
                                        }
                                    }
                                    $("#roleId_edit option[value='6']").attr("selected", "selected");
                                    $("#areaDiv").hide();
                                    $("#org").show();
                                    document.getElementById("orginput").value = areaName;
                                    document.getElementById("orginput").setAttribute('disabled', 'disabled');
                                    $('#extra').val(selectRoleInfo.extra);
                                }
                            } else {
                                toast("查询角色失败");
                            }
                        }
                    });
                }
            })
        }
    }

    /**
     * 编辑：确认新建/修改，提交数据
     */
    function editClick() {
        //获取数据
        var username = $('#username_edit').val();
        var phone = $('#phone').val();
        var password = $('#password').val();
        var roleId = $('#roleId_edit').find("option:selected").val();
        var address = $('#prov').find("option:selected").text() + $('#city').find("option:selected").text() + $('#dist').find("option:selected").text();
        var extra = $('#extra').val();
        var isolationId1;
        var id2 = $('#city').find("option:selected").val()
        var id3 = $('#dist').find("option:selected").val()
        var id1 = $('#prov').find("option:selected").val()
        console.log(id3);
        if (id3 && id3 != 0) {
            isolationId1 = id3
        } else if (id2 && id2 != 0) {
            isolationId1 = id2
        } else if (id1 && id1 != 0) {
            isolationId1 = id1
        }
        var tagName = $("#orginput").val();
        console.log($('#prov').find("option:selected").text() + $('#city').find("option:selected").text() + $('#dist').find("option:selected").text())
        console.log($('#city').find("option:selected").text())

        //准备数据
        var userId = moduleData.get("userId")
        console.log(userId)
        var reqData = new FormData();
        if (userId === 0) {
            reqData.append("userId", userId);
        } else {
            reqData.append("userId", moduleData.get("userId"));
        }
        reqData.append("username", username);
        reqData.append("phone", phone);
        reqData.append("password", password);
        reqData.append("roleId", roleId);
        reqData.append("extra", extra);
        if (roleId == 6) {
            reqData.append("tagName", tagName);
        } else {
            reqData.append("isolationId", isolationId1);
        }

        console.log(roleId)
        console.log(id2)
        console.log(id3)
        if (roleId ==='5' && (id2==='0' || id3 ==='0')){
            toast("请确认区域选择是否正确");
        } else if (roleId ==='4' && id2==='0'){
            toast("请确认区域选择是否正确");
        } else if (username == null || username.trim() == "") {
            toast("请填写用户名")
        } else if (phone == null || phone.trim() == "") {
            toast("请填写手机号")
        } else if (!(/^1[3456789]\d{9}$/.test(phone))) {
            toast("手机号码有误，请重新填写");
        } else if (password == null || password.trim() == "") {
            toast("请填写登录密码")
        } else if (!/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/.test(password)) {
            toast("密码长度为8~16位数字+英文");
        } else if (roleId == null || roleId == 0) {
            toast("请选择角色")
        } else if (address == null || address == 0) {
            toast("请选择区域");
        } else if ((address !== null || address !== 0) &&(roleId ===5 && (id2===0 || id3 ===0))) {
            toast("请确认区域选择是否正确");
        } else if (extra == null || extra.trim() == "") {
            toast("请填写备注")
        } else if (extra.replace(/[^\x00-\xff]/g, "**").length * 1 <= 5) {
            toast("请输入至少五个字符");
        } else {

            //判空通过，方才发送请求
            $.ajax({
                type: 'post',
                url: 'manageUser/editUser',
                dataType: 'json',
                data: reqData,
                contentType: false,
                processData: false,
                success: function (res) {
                    if (res.status === 1005) {
                        toast("登录超时，请重新登录");
                        window.location.href = 'login';
                    } else if (res.status === 1000) {
                        console.log("删除toast测试" + userId)
                        if (userId === 0) {
                            toast("创建成功");
                        } else {
                            toast("修改成功")
                        }

                        $('#datatab').DataTable().draw(false);
                    } else if (res.status === 1007) {
                        toast("手机号已被注册，请重新填写");
                    } else {
                        toast("创建失败");
                    }
                    document.getElementById("ModalX").click();
                }
            });
        }
    }


    /**
     * 删除弹框界面设值
     */
    function deleteModal(userId) {
        moduleData.set("userId", userId);
    }

    /**
     * 删除
     */
    function deleteClick() {
        $.ajax({
            type: 'POST',
            url: 'manageUser/deleteUser',
            data: {'userId': moduleData.get("userId")},
            dataType: 'json',
            success: function (data) {
                console.log(data)
                if (data.status === 1005) {
                    toast("登录超时，请重新登录");
                    window.location.href = 'login';
                } else if (data.status === 1000) {
                    $('#datatab').DataTable().draw(false);
                    toast("删除成功");
                } else if (data.status === 1004) {
                    toast("自己无法删除自己");
                } else {
                    toast("删除失败");
                }
            }
        })
    }



    /**
     * 手机号合法性校验
     */
    /*function checkPhone(obj){
        var phone = obj.value;
        if(!(/^1[3456789]\d{9}$/.test(phone))){
            toast("手机号码有误，请重新填写");
        }
    }*/

    /**
     * 密码框长度限制
     */

    /*function checkPwd(obj){
        if (!/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/.test(obj.value)) {
            toast("密码长度为8~16位数字+英文");
        }
    }*/

    /**
     * 检查文本框长度：汉字和字符
     */
    function checkLength(obj, maxLength) {
        var length = 0;
        for (var i = 0; i < obj.value.length; i++) {
            if (/[\u4e00-\u9fa5]/.test(obj.value[i])) {
                length += 2;
            } else {
                length++;
            }
            if (length > maxLength) {
                obj.value = obj.value.substr(0, i);
                break;
            }
        }
    }


    /**
     * 备注长度限制
     */
    function checkExtra(obj) {
        var description = obj.value;
        var length = description.replace(/[^\x00-\xff]/g, "**").length;
        if (length * 1 <= 5) {
            toast("请输入至少五个字符");
        }
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
</script>

</body>

</html>