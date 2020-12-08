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
    <link href="css/style.css" rel="stylesheet">
    <link href="./css/headInfo.css" rel="stylesheet">
    <link href="css/talent.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="./plugins/jedate-6.5.0/skin/jedate.css"/>

    <link href="./plugins/datatables/jquery.dataTables.min.css" rel="stylesheet">
    <!--jedate-->
    <link href="./css/upload.css" rel="stylesheet">
    <link href="./css/Isfocus.css" rel="stylesheet">
    <script src="./js/bootstrap.js"></script>

</head>


<style>
    .imageDiv {
        /*float: right;*/
        display:inline-block;
        width:90px;
        height:90px;
        -webkit-box-sizing:border-box;
        -moz-box-sizing:border-box;
        box-sizing:border-box;
        border:0;
        background:#FFFFFF;
        position:relative;
        overflow:hidden;
    }

    .addImages {
        display:inline-block;
        width:90px;
        height:90px;
        -webkit-box-sizing:border-box;
        -moz-box-sizing:border-box;
        box-sizing:border-box;
        border:0;
        background:#FFFFFF;
        position:relative;
        overflow:hidden;
        margin:10px;
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

    <!--**********************************
        Content body start
    ***********************************-->
    <div class="content-body">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <#--添加编辑页面的标题及横线-->
                            <div>
                                <label class="label-control"><span>乡贤人才详情</span></label>
                            </div>
                            <hr>
                            <div class="basic-form">
                                <form>
                                    <div class="form-group row">
                                        <div class="col-lg-2 " style="text-align: right">
                                            <label class="label-control">
                                                姓名<span style="color: red">*</span></label>
                                        </div>
                                        <div class="col-lg-3">
                                            <input id="name" type="text" class="input1-control" readonly="true"
                                                   placeholder="请输入"
                                                   value="${res.data.name}">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-lg-2" style="text-align: right">
                                            <label class="label-control ">
                                                是否重要
                                            </label>
                                        </div>
                                        <div class="col-lg-2">
                                            <input id="focus" type="checkbox" name="check-1" class="lcs_check" disabled="true"
                                                   autocomplete="off" <#if res.data??> ${res.data.focus?string("checked","")} </#if>/>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-lg-2" style="text-align: right">
                                            <label class="label-control ">
                                                性别<span style="color: red">*</span>
                                            </label>
                                        </div>
                                        <div class="col-lg-2">
                                            <select id="sex" class="input2-control">
                                                <option value='0'>请选择</option>
                                                <option value='1'>男</option>
                                                <option value='2'>女</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2" style="text-align: right">
                                            <label class="label-control">
                                                出生年月<span style="color: red">*</span>
                                            </label>
                                        </div>
                                        <div class="col-lg-3">
                                            <input id="birth" type="text" class="input1-control" readonly="true" disabled="true"
                                                   placeholder="出生年月"
                                                   value="${res.data.birth}"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2 " style="text-align: right">
                                            <label class="col-form-label">
                                                原籍地<span style="color: red">*</span>
                                            </label>
                                        </div>
                                        <div class="col-lg-3">
                                            <input id="town" type="text" class="input1-control" readonly="true"
                                                   placeholder="请输入"
                                                   value="${res.data.town}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2 " style="text-align: right">
                                            <label class="label-control">
                                                所在地区<span style="color: red">*</span>
                                            </label>
                                        </div>
                                        <div class="col-lg-3">
                                            <input id="local" type="text" class="input1-control" readonly="true"
                                                   placeholder="请输入"
                                                   value="${res.data.local}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2 " style="text-align: right">
                                            <label class="label-control">
                                                学历<span style="color: red">*</span>
                                            </label>
                                        </div>
                                        <div class="col-lg-2">
                                            <select id="educ" class="input2-control"
                                                    style="text-align: right">
                                                <option value='0' selected='selected'>请选择</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2" style="text-align: right">
                                            <label class="label-control">
                                                现工作单位
                                            </label>
                                        </div>
                                        <div class="col-lg-3">
                                            <input id="unit" type="text" class="input1-control" readonly="true"
                                                   placeholder="请输入"
                                                   value="${res.data.unit}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2 " style="text-align: right">
                                            <label class="label-control">
                                                职务
                                            </label>
                                        </div>
                                        <div class="col-lg-3">
                                            <input id="posi" type="text" class="input1-control" readonly="true"
                                                   placeholder="请输入"
                                                   value="${res.data.posi}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2 " style="text-align: right">
                                            <label class="label-control">
                                                社会兼职
                                            </label>
                                        </div>
                                        <div class="col-lg-3">
                                            <input id="social" type="text" class="input1-control" readonly="true"
                                                   placeholder="请输入"
                                                   value="${res.data.social}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2 " style="text-align: right">
                                            <label class="label-control">
                                                行业领域<span style="color: red">*</span>
                                            </label>
                                        </div>
                                        <div class="col-lg-3">
                                            <input id="field" type="text" class="input1-control" readonly="true"
                                                   placeholder="请输入"
                                                   value="${res.data.field}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2 " style="text-align: right">
                                            <label class="label-control">
                                                人才性质<span style="color: red">*</span>
                                            </label>
                                        </div>
                                        <div class="col-lg-2">
                                            <select id="type" class="input2-control">
                                                <option value='0' selected='selected'>请选择</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2" style="text-align: right">
                                            <label class="label-control">
                                                联系方式
                                            </label>
                                        </div>
                                        <div class="col-lg-3">
                                            <input id="phone" type="text" class="input1-control" readonly="true"
                                                   placeholder="请输入"
                                                   value="${res.data.phone}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2" style="text-align: right">
                                            <label class="label-control">
                                                经度</label>
                                        </div>
                                        <div class="col-lg-3">
                                            <input id="lgtd" type="text" class="input1-control" readonly="true"
                                                   placeholder="请输入"
                                                   value="${res.data.lgtd}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2" style="text-align: right">
                                            <label class="label-control">
                                                纬度
                                            </label>
                                        </div>
                                        <div class="col-lg-3">
                                            <input id="lat" type="text" class="input1-control" readonly="true"
                                                   placeholder="请输入"
                                                   value="${res.data.lati}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2" style="text-align: right">
                                            <label class="label-control">
                                                邮箱/微信
                                            </label>
                                        </div>
                                        <div class="col-lg-3">
                                            <input id="contact" type="text" class="input1-control" readonly="true"
                                                   placeholder="请输入"
                                                   value="${res.data.contact}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2 " style="text-align: right">
                                            <label class="label-control">
                                                高中毕业院校
                                            </label>
                                        </div>
                                        <div class="col-lg-3">
                                            <input id="school" type="text" class="input1-control" readonly="true"
                                                   placeholder="请输入"
                                                   value="${res.data.school}">
                                        </div>
                                    </div>
                                    <#--                                    <div class="form-group row">-->
                                    <#--                                        <div class="col-lg-2 " style="text-align: right">-->
                                    <#--                                            <label class="label-control">-->
                                    <#--                                                数据来源-->
                                    <#--                                            </label>-->
                                    <#--                                        </div>-->
                                    <#--                                        <div class="col-lg-3">-->
                                    <#--                                            <input id="where" type="text" class="input1-control"-->
                                    <#--                                                   placeholder="请输入"-->
                                    <#--                                                   value="${res.data.where}">-->
                                    <#--                                        </div>-->
                                    <#--                                    </div>-->
                                    <div class="form-group row">
                                        <div class="col-lg-2 " style="text-align: right">
                                            <label class="label-control">
                                                乡贤头像
                                            </label>
                                        </div>
                                        <div class="col-lg-3">
                                            <div id="avatarDiv" class="imageDiv" style="margin: 0px;background-color: #FFFFFF;">
                                                <#if res.data?? && res.data.avatar??>
                                                <img id="avaImg" border="0" src="${res.data.avatar}"
                                                     width="90" height="90" onclick="$('#avatar').click();">
                                                <div class='cover'><img src='images/ico_delete_red.png'
                                                                        <#--onclick='delAvatar(this)'-->/>
                                                </div>
                                                <#else>
                                                    <div style="background-color: #FFFFFF;border:none;padding-top: 8px;">
                                                        暂未上传
                                                    </div>

                                                <#--<img id="avaImg" border="0" src="images/button_add@2x.png"-->
                                                     <#--width="90" height="90" onclick="$('#avatar').click();" style="display: none;">-->
                                                </#if>
                                            </div>
                                            <input id="avatar" type="file" accept="image/jpeg, image/png"  contenteditable="false"
                                                   onchange="previewImage(this)" style="display: none;"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2" style="text-align: right">
                                            <label class="label-control"></label>
                                        </div>
                                        <div class="col-lg-3">
                                          <#--  只能上传1张，尺寸130*130，支持扩展名: png .jpg-->
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2" style="text-align: right">
                                            <label class="label-control">
                                                乡贤其他图片
                                            </label>
                                        </div>
                                        <div class="col-lg-8">
                                            <div class="picDiv row" style="padding-left: 15px">
                                                <#--<div class="addImages" style="margin: 0px">-->
                                                    <#--<input id="picture" type="file" class="file" multiple="multiple"  contenteditable="false"-->
                                                           <#--accept="image/jpeg, image/png" style="display: none">-->
                                                    <#--<img id="imghead" border="0" src="images/button_add@2x.png"-->
                                                         <#--style="display:block; width: 90px; height: 90px;display: none;"/>-->
                                                <#--</div>-->
                                                <#--<#if res.data??>-->
                                                <#--<div id='existTotal'></div>-->
                                                <#--<#assign picMap=res.data.picture>-->
                                                <#--<#assign keys=picMap?keys/>-->
                                                <#--<#list keys as key>-->
                                                <#--<div class='imageDiv'>-->
                                                    <#--<img id='${key}' src='${picMap[key]!''}'-->
                                                         <#--style="display:block; width: 90px; height: 90px"/>-->
                                                    <#--<div class='cover'><img src='images/ico_delete_red.png'-->
                                                                            <#--&lt;#&ndash;onclick='delExistPic(this, ${key})'&ndash;&gt;/>-->
                                                    <#--</div>-->
                                                <#--</div>-->
                                                <#--</#list>-->

                                                <#--<#else>-->
                                                    <#--<div style="background-color: #FFFFFF;border:none;padding-top: 10px;">-->
                                                        <#--<span>暂未上传</span>-->
                                                    <#--</div>-->

                                                <#--</#if>-->


                                                <#--实现隐藏添加图片 显示中文提示-->
                                                <#if res.data.picture?? && (res.data.picture?size >0) >
                                                    <div id='existTotal'></div>
                                                    <#assign picMap=res.data.picture>
                                                    <#assign keys=picMap?keys/>
                                                    <#list keys as key>
                                                        <div class='imageDiv'>
                                                            <img id='${key}' src='${picMap[key]!''}'
                                                                 style="display:block; width: 90px; height: 90px"/>
                                                            <div class='cover'><img src='images/ico_delete_red.png'
                                                                        <#--onclick='delExistPic(this, ${key})'-->/>
                                                            </div>
                                                        </div>
                                                    </#list>
                                                <#else>
                                                    <div style="padding-top: 8px;">
                                                        暂未上传
                                                    </div>


                                                <#--<img id="avaImg" border="0" src="images/button_add@2x.png"-->
                                                <#--width="90" height="90" onclick="$('#avatar').click();" style="display: none;">-->
                                                </#if>





                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2">
                                            <label class="label-control"></label>
                                        </div>
                                        <div class="col-lg-3">
                                          <#--  最多可上传10张，尺寸750*360，支持扩展名: png .jpg-->
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-2">
                                            <label class="label-control"></label>
                                        </div>

                                        <div class="col-lg-3">
                                            <button type="hidden" id="tgId" style="display:none;"
                                                    value="${res.data.id}"/>
<#--                                            <button type="button" class="btn btn-primary" id="query"
                                                    onclick="saveClick();">保存
                                            </button>-->
                                            &nbsp;&nbsp;
<#--                                            <button type="button" class="btn btn-outline-light" id="reset"
                                                    onclick="backClick()">返回
                                            </button>-->

                                            <button type="button" class="btn btn-primary" id="reset"
                                                    onclick="backClick()">返回
                                            </button>
                                        </div>
                                    </div>
                                    <div class="msg" style="display: none;"></div>
                                </form>
                            </div>
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

<!--**********************************
    Main wrapper end
***********************************-->

<!--**********************************
    Scripts
***********************************-->
<script src="plugins/common/common.min.js"></script>
<script src="js/custom.min.js"></script>
<script src="js/settings.js"></script>
<script src="js/gleek.js"></script>
<script src="js/styleSwitcher.js"></script>
<script src="./plugins/moment/moment.js"></script>
<script src="./plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
<script src="./plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
<script src="./plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
<script src="./plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
<script src="./plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
<script src="./plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="./plugins/timepicker/bootstrap-timepicker.min.js"></script>
<script src="./plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="./plugins/jedate-6.5.0/dist/jedate.min.js"></script>
<script src="./js/dashboard/dashboard-1.js"></script>
<script src="./js/Isfocus.js"></script>

<script src="./js/lsfocus.min.js"></script>
<script>

    /**
     * 修改前台：修改密码后清空模态框数据
     */
    $('#updatePwdModal').on('hide.bs.modal', function (event) {
        $("#oldPassword").val(null);
        $("#newPassword").val(null);
        $("#confirm").val(null);
    });

    $(document).ready(function (e) {

        $("select").attr("disabled",true);

        $('input').lc_switch();
        // triggered each time a field changes status
        $('body').delegate('.lcs_check', 'lcs-statuschange', function () {
            var status = ($(this).is(':checked')) ? 'checked' : 'unchecked';
            //     console.log('field changed status: '+ status );
        });

        // triggered each time a field is checked
        $('body').delegate('.lcs_check', 'lcs-on', function () {
            // console.log('field is checked');
        });


        // triggered each time a is unchecked
        $('body').delegate('.lcs_check', 'lcs-off', function () {
            //  console.log('field is unchecked');
        });
    });
    const picture = new Map();
    const delIds = [];

    let existPic = 0;
    <#if res.data??>
    existPic = ${res.data.picture?size};
    </#if>

    $(document).ready(function () {
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
                // 编辑时设置默认值
                $("#type").val(${res.data.natureId});
            }
        });
        // 学历
        $.ajax({
            type: 'POST',
            url: 'education/queryAll',
            dataType: 'JSON',
            success: function (data) {
                for (let i = 0; i < data.length; i++) {
                    $('#educ').append("<option value='" + data[i].educId + "'>" + data[i].name +
                        "</option>");
                }
                // 编辑时设置默认值
                $("#educ").val(${res.data.educId});
            }
        });

        // 编辑时设置默认值
        $("#sex").val(${res.data.sex});
        var userAgent = navigator.userAgent; //用于判断浏览器类型
        $("#picture").change(function () {
            //获取选择图片的对象
            var docObj = $(this)[0];
            var picDiv = $(this).parents(".picDiv");
            //得到所有的图片文件
            var fileList = docObj.files;
            if (fileList.length + existPic + picture.size - delIds.length > 10) {
                alert("图片最多上传10张");
                return
            }
            for (let i = 0; i < fileList.length; i++) {
                let name = fileList[i].name;
                let suffix = name.substr(name.lastIndexOf(".") + 1).toLocaleLowerCase();
                if (suffix !== "png" && suffix !== "jpg") {
                    alert("图片只能上传png或jpg格式");
                    return;
                }
            }

            //循环遍历
            for (var i = 0; i < fileList.length; i++) {
                let name = "img" + fileList[i].name;
                if (!picture.get(name)) {
                    //动态添加html元素
                    var picHtml = "<div class='imageDiv' > <img id='" + name + "' /> " +
                        "<div class='cover'><img src='images/ico_delete_red.png' onclick=\"delPic(this, '" + name + "')\" /></div></div>";
                    console.log(picHtml);
                    picDiv.append(picHtml);
                    //获取图片imgi的对象
                    var imgObjPreview = document.getElementById(name);
                    if (fileList && fileList[i]) {
                        //图片属性
                        imgObjPreview.style.display = 'block';
                        imgObjPreview.style.width = '90px';
                        imgObjPreview.style.height = '90px';
                        //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要以下方式
                        if (userAgent.indexOf('MSIE') === -1) {
                            let file = docObj.files[i];
                            //IE以外浏览器
                            imgObjPreview.src = window.URL.createObjectURL(file); //获取上传图片文件的物理路径;
                            picture.set(name, file);
                        } else {
                            //IE浏览器
                            if (docObj.value.indexOf(",") !== -1) {
                                var srcArr = docObj.value.split(",");
                                imgObjPreview.src = srcArr[i];
                            } else {
                                imgObjPreview.src = docObj.value;
                            }
                        }
                    }
                }
            }
        });
    });

    /*删除功能*/
    function delPic(_this, picPath) {
        picture.delete(picPath);
        $(_this).parents(".imageDiv").remove();
    }

    /**
     * 删除已上传的图片
     */
    function delExistPic(_this, fgId) {
        delIds.push(fgId);
        $(_this).parents(".imageDiv").remove();
    }

    /**
     * 删除头像
     */
    function delAvatar(_this) {
        let ch = $(_this).parents(".imageDiv").children();
        ch.get(0).src = "images/button_add@2x.png";
        ch.get(1).remove();
        $('#avatar').val(null);
    }

    /**
     * 保存
     */
    function saveClick() {
        let reqData = new FormData();
        if ($('#tgId').val()) {
            reqData.append("id", $('#tgId').val());
            reqData.append("delIds", delIds);
            if ($('#avaImg').attr('src') === 'images/button_add@2x.png') {
                reqData.append("delAva", "true");
            }
        }
        reqData.append("name", $('#name').val());
        reqData.append("focus", $('#focus').prop("checked"));
        reqData.append("sex", $('#sex').val());
        reqData.append("birth", $('#birth').val());
        reqData.append("town", $('#town').val());
        reqData.append("local", $('#local').val());
        reqData.append("educ", $('#educ').val());
        reqData.append("unit", $('#unit').val());
        reqData.append("posi", $('#posi').val());
        reqData.append("social", $('#social').val());
        reqData.append("field", $('#field').val());
        reqData.append("type", $('#type').val());
        reqData.append("phone", $('#phone').val());
        reqData.append("lgtd", $('#lgtd').val());
        reqData.append("lat", $('#lat').val());
        reqData.append("contact", $('#contact').val());
        reqData.append("school", $('#school').val());
        reqData.append("avatar", $('#avatar')[0].files[0]);
        picture.forEach(function (item) {
            reqData.append("picture", item);
        });

        if (!$('#name').val()) {
            alert("请输入姓名！");
        } else {
            // $('#preloader').fadeTo('fast', 0.4);
            $.ajax({
                type: 'post',
                url: 'general/edit',
                dataType: 'json',
                data: reqData,
                contentType: false,
                processData: false,
                success: function (res) {
                    // $('#preloader').hide();
                    if (res.status === 1000) {
                        if ($('#tgId').val()) {
                            alert("乡贤人才信息修改成功");
                        } else {
                            alert("乡贤人才信息录入成功");
                        }
                        window.history.back();
                    } else if (res.status === 1100) {
                        alert("已有重复数据");
                    }
                }
            });
        }
    }

    /**
     * 返回
     */
    function backClick() {
        // window.history.back();
        //  var talentType = $("#type").val();
        self.location=document.referrer;

        //window.sessionStorage.setItem("natureId", natureID);
        // window.history.back(-1);
    }

    document.getElementById("birth").addEventListener("focus", function () {
        jeDate(this, {
            theme: {bgcolor: "#3698E9", color: "#fff", pnColor: "#666666"},   //设置颜色
            format: "YYYY.MM",                                       //设置时间格式
            minDate: "1900-01",                             //设置最小日期
            maxDate: "2099-12"                              //设置最大日期
        });
    });

    /**
     * 头像选择
     * @param file
     */
    function previewImage(file) {
        var MAXWIDTH = 90;
        var MAXHEIGHT = 90;
        var div = document.getElementById('avatarDiv');
        if (file.files && file.files[0]) {
            let name = file.files[0].name;
            let suffix = name.substr(name.lastIndexOf(".") + 1).toLocaleLowerCase();
            if (suffix !== "png" && suffix !== "jpg") {
                alert("图片只能上传png或jpg格式");
                return;
            }

            div.innerHTML = '<img id=avaImg onclick=$("#avatar").click() style="display:block; width: 90px; height: 90px">';
            var img = document.getElementById('avaImg');
            img.onload = function () {
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width = rect.width;
                img.height = rect.height;
//                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top + 'px';
            }
            var reader = new FileReader();
            reader.onload = function (evt) {
                img.src = evt.target.result;
            }
            reader.readAsDataURL(file.files[0]);
        } else //兼容IE
        {
            var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=avaImg>';
            var img = document.getElementById('avaImg');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
            div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
        }

        if ($("#avatarDiv").children().length <= 1) {
            $("#avatarDiv").append("<div class='cover'><img src='images/ico_delete_red.png'\n" +
                "onclick='delAvatar(this)'/></div>");
        }
    }

    function clacImgZoomParam(maxWidth, maxHeight, width, height) {
        var param = {top: 0, left: 0, width: width, height: height};
        if (width > maxWidth || height > maxHeight) {
            rateWidth = width / maxWidth;
            rateHeight = height / maxHeight;

            if (rateWidth > rateHeight) {
                param.width = maxWidth;
                param.height = Math.round(height / rateWidth);
            } else {
                param.width = Math.round(width / rateHeight);
                param.height = maxHeight;
            }
        }
        param.left = Math.round((maxWidth - param.width) / 2);
        param.top = Math.round((maxHeight - param.height) / 2);
        return param;
    }

</script>
</body>
</html>