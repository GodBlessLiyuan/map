<div class="loginDiv" >

    <div style="float: left;vertical-align: middle;height: 80px;margin-left: 18%;margin-top: 15px;">
        <img src="./images/bg_logo.png" style="height: 50px;width: auto;" >
    </div>
    <div class="headerfont" style="height:80px;float: left;font-size: 34px;font-weight: bolder; word-spacing:8px; letter-spacing: 1px;vertical-align: middle;">

       <div style="height:100%;float: left; margin-left: 5px;">
           全球衢籍乡贤人才地图
       </div>

        <#if roleId == 5>
            <div style="font-style: italic;float: left;font-family: YouSheBiaoTiHei;font-size: 20px;/*line-height: 80px;*/color: #3698E9;margin-left: 5px;padding-top: 6px">
                （乡镇版）
            </div>
        <#elseif roleId == 6>
            <div style="font-style: italic;float: left;font-family: YouSheBiaoTiHei;font-size: 20px;/*line-height: 80px;*/color: #3698E9;margin-left: 5px;padding-top: 6px">
                （校友版）
            </div>
        <#else >
        </#if>


    </div>

    <!-- Single button -->

    <div style="float:right;margin-right: 18%; ">
        <div class="btn-group borderNone" style="margin: 0 auto;padding-top: 25px;">
            <button id="userInfoBtn" type="button" class="btn btn-default dropdown-toggle" style="border:none; width: 160px;text-align: center;background-color: transparent;"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                您好,${username} <span class="caret userInfo"></span>
            </button>

            <ul class="dropdown-menu" style="min-width: 120px;padding: 0 0;">

                <ul class="clearfix" style="width:120px;padding-left: 0px;background-color: #FFFFFF;" id="ulDotNone">

                    <li class="icons dropdown d-none d-md-flex" style="width:100%;height: 44px;">
                        <a type="button"
                           style="width: 100%;height:100%;line-height:44px;border:none;outline: none; text-align: center;font-family: PingFangSC-Regular;font-size: 14px;color: #666666;"
                           data-toggle='modal' data-target='#updatePwdModal'>修改密码
                        </a>
                    </li>


                    <li class="icons dropdown d-none d-md-flex" style="width:100%;height: 44px;border-top: 1px solid #EEEEEE;">
                        <a type="button"
                           style="width: 100%;height:100%;line-height:44px;border:none;outline: none; text-align: center;font-family: PingFangSC-Regular;font-size: 14px;color: #666666;"
                           data-toggle='modal' data-target='#logoutModal'>退出登录
                        </a>
                    </li>



                </ul>

            </ul>

        </div>
    </div>


</div>

<!--**********************************
                    弹框
 ***********************************-->
<!--弹框：修改密码 隐藏-->
<div class="modal fade" id="updatePwdModal" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel" style="display: none;" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom:0px">
                <h5 class="modal-title" id="exampleModalLabel" style="display: block;margin-left: 15px;">修改密码</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="xModal"
                        style="background:url(./images/ico_close.png) no-repeat center;margin-right: 15px;margin-top: 5px;">
                </button>
            </div>
            <div class="modal-body" style="margin: 0 auto;">
                <form>
                    <div class="form-group row">
                        <label class="col-form-label" style="width: 100px;text-align: right;display: block;line-height: 30.5px; height: 40px">旧密码:&nbsp;<span style="color: red;">*&nbsp;</span></label>
                        <div style="width: 300px;height: 40px">
                            <input type="password" class="form-control input-control" id="oldPassword" placeholder="请输入" style="height: 40px;font-size: 14px"  >
                            <img id="invisible" onclick="hideShowPsw1()" src="./icons/hide.png" style="width:12px;height: 12px;margin-top: -60px;margin-right: 5px;">
                        </div>
                    </div>
                    <div class="form-group row" style="text-align: right">
                        <label class="col-form-label" style="width: 100px;text-align: right;display: block;line-height: 30.5px; height: 40px">新密码:&nbsp;<span style="color: red">*&nbsp;</span></label>
                        <div style="width: 300px;height: 40px">
                            <input type="password" class="form-control input-control" id="newPassword" placeholder="请输入" maxlength="16"   style="height: 40px;font-size: 14px" >
                            <img id="invisible1" onclick="hideShowPsw2()" src="./icons/hide.png" style="width:12px;height: 12px;margin-top: -60px;margin-right: 5px;">
                        </div>
                    </div>
                    <div class="form-group row" style="text-align: right">
                        <label class="col-form-label" style="width: 100px;text-align: right;display: block;line-height: 30.5px; height: 40px">确认新密码:&nbsp;<font color="red">*&nbsp;</font></label>
                        <div style="width: 300px;height: 40px">
                            <input type="password" class="form-control input-control" id="confirm" placeholder="请输入" style="height: 40px;font-size: 14px"  >
                            <img id="invisible2" onclick="hideShowPsw3()" src="./icons/hide.png" style="width:12px;height: 12px;margin-top: -60px;margin-right: 5px;">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label" style="width: 100px;text-align: right">
                        </label>
                        <div>
                            <button type="button" class="btn btn-primary button-control" style="font-size: 14px;line-height: 1px;"
                                    onclick="updatePassword()">
                                保存
                            </button>
                            &nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-outline-light button-control" style="font-size: 14px;line-height: 1px;"
                                    data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!--弹框：退出登录-->
<div class="modal fade" id="logoutModal" style="display: none;" aria-hidden="true" >
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom:0px">
                <h5 class="modal-title" style="display: block;margin-left: 10px;">提示</h5>
                <button type="button" class="close" data-dismiss="modal"
                        style="background:url(./images/ico_close.png) no-repeat center;margin-right: 10px;margin-top: 3px;">
                </button>

            </div>
            <div class="modal-body">
                <div >是否退出登录？</div>
                <div style="padding-top: 10%">
                    <button type="button" class="btn btn-primary button-control" style="margin-right: 10px;font-size: 14px;line-height: 1px; " data-dismiss="modal" onclick="javascript:logoutClick()">确认</button>
                    <button type="button" class="btn btn-outline-light button-control" data-dismiss="modal" style="font-size: 14px;line-height: 1px;">取消</button>
                </div>
                <div style="padding-top: 10%"></div>
            </div>
        </div>
    </div>
</div>


<!--**********************************
            script
***********************************-->
<script type="text/javascript">



    function hideShowPsw1(){
        var imgInfo = document.getElementById("invisible");
        var inputInfo = document.getElementById("oldPassword");
        if (inputInfo.type == "password") {
            inputInfo.type = "text";
            imgInfo.src = "./icons/show.png";
        }else {
            inputInfo.type = "password";
            imgInfo.src = "./icons/hide.png";
        }
    }

    function hideShowPsw2(){
        var imgInfo = document.getElementById("invisible1");
        var inputInfo = document.getElementById("newPassword");
        if (inputInfo.type == "password") {
            inputInfo.type = "text";
            imgInfo.src = "./icons/show.png";
        }else {
            inputInfo.type = "password";
            imgInfo.src = "./icons/hide.png";
        }
    }
    function hideShowPsw3(){
        var imgInfo = document.getElementById("invisible2");
        var inputInfo = document.getElementById("confirm");
        if (inputInfo.type == "password") {
            inputInfo.type = "text";
            imgInfo.src = "./icons/show.png";
        }else {
            inputInfo.type = "password";
            imgInfo.src = "./icons/hide.png";
        }
    }
    function updatePassword() {
        var oldPassword = $('#oldPassword').val();
        var newPassword = $('#newPassword').val();
        var confirm = $('#confirm').val();
        if (oldPassword == null || oldPassword.trim() == "") {
            toast("请输入旧密码！")
        } else if (newPassword == null || newPassword.trim() == "") {
            toast("请输入新密码！")
        } else if (!/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/.test(newPassword)) {
            toast("密码长度为8~16位数字+英文");
        } else if (confirm == null) {
            toast("请输入确认新密码");
        } else if (newPassword != confirm) {
            toast("输入密码不一致，请重新输入");
        } else {
            $.post("updatePassword", {oldPassword: oldPassword, newPassword: newPassword}, function (result) {
                if (result.status === 1000) {
                    toast("密码修改成功")
                    document.getElementById("xModal").click();
                } else if (result.status === 1005) {
                    toast("登录超时，请重新登录")
                    window.location.href = 'login';
                } else if (result.status === 1006) {
                    toast("输入的旧密码错误，修改密码失败")
                } else {
                    toast("密码修改失败");
                }
            }, "json");
        }
    }


    /**
     * 退出登录
     */
    function logoutClick() {
        window.location= "logout";
    }

    /**
     * 密码框长度限制
     */
    /*function checkLength(obj){
        if (!/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/.test(obj.value)) {
            toast("密码长度为8~16位数字+英文");
        }
    }*/

    function table_alert(data) {
        if(data!=null&&data!=''){
            return "<a title='"+data+"'>"+data+"</a>";
        }else{
            return "";
        }
    }

</script>
