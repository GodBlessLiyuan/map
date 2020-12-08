<#--<div class="modal fade" id="${modalId}" style="display: none;" aria-hidden="true">-->
<#--    <div class="modal-dialog" role="document">-->
<#--        <div class="modal-content">-->
<#--            <div class="modal-header">-->
<#--                <label style="font-size: large">提示</label>-->
<#--            </div>-->
<#--            <div class="modal-body">-->
<#--                <div style="margin: 0 auto;">-->
<#--                    <div style="padding-left: 40%">-->
<#--                        <span style="font-size: medium">${moduleTitle}</span>-->
<#--                    </div>-->
<#--                </div>-->
<#--            </div>-->
<#--            <div class="modal-footer">-->
<#--                <div style="padding-left: 38%">-->
<#--                    <button type="button" class="btn btn-primary button1-control" data-dismiss="modal" onclick="${moduleClick}">确定</button>-->
<#--                    &nbsp;&nbsp;-->
<#--                    <button type="button" class="btn btn-outline-info button1-control" data-dismiss="modal">取消</button>-->
<#--                </div>-->
<#--            </div>-->
<#--        </div>-->
<#--    </div>-->
<#--</div>-->
<div class="modal fade" id="${modalId}" style="display: none;" aria-hidden="true" >
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header" style="border-bottom:0px">
                <h5 class="modal-title"  style="font-family: PingFangSC-Medium;font-size: 16px;color: #333333;font-weight: bolder;">提示</h5>
                <button type="button" class="close" data-dismiss="modal"
                        style="background:url(./images/ico_close.png) no-repeat center;margin-right: 2px;margin-top: -2px;">
                </button>

            </div>
            <div class="modal-body" style="text-align: center;padding-top: 0px">
                <div class="con">${moduleTitle}</div>
                <div style="text-align: center;padding-top: 25px">
                    <button type="button" class="btn btn-primary button-control" style="margin-right: 10px;font-size: 14px;line-height: 1px; " data-dismiss="modal" onclick="${moduleClick}">确认</button>
                    <button type="button" class="btn btn-outline-light button-control" data-dismiss="modal" style="font-size: 14px;line-height: 1px;">取消</button>
                </div>
                <div style="padding-top: 10%"></div>
            </div>
<#--            <div class="modal-footer"> </div>-->
        </div>
    </div>
</div>
