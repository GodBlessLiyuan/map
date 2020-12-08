<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="screen-orientation" content="portrait">
    <meta name="x5-orientation" content="portrait">
    <link rel="icon" type="image/x-icon" href="./images/logo.png"/>
    <title>人才信息</title>

    <link href="./css/bootstrap.css" rel="stylesheet"/>
    <link href="./css/style.css" rel="stylesheet"/>
    <link href="./css/talentMobile.css" rel="stylesheet">
    <!--toast-->
    <link href="css/toast.css" rel="stylesheet">
    <link href="./css/preloader.css" rel="stylesheet">

</head>

<style>

    html , body {
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
        /*overflow:hidden;*/
        /*overflow-y:auto;*/
    }

    .comFont {
        font-family: PingFangSC-Regular;
        font-size: 14px;
        color: #4C4C4C;
    }

</style>

<body style="background-color: #FFFFFF;">

<!-- 预加载页面-->
<div id="preloader">
    <div class="loader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"/>
        </svg>
    </div>
</div>


<div style="height: 100%;">


    <div style="height: 54px;width:100%;position: fixed;top: 0px;left: 0px;bottom: 0px;  z-index: 999;">

        <#--顶部搜索框及下拉按钮-->
        <div style="border-bottom: 1px solid #EEEEEE;">
            <div style="padding-right:20px;height: 54px;border-top: 1px solid #EEEEEE;">

                <#--当前的搜索框和输入框-->
                <div style="padding-left: 20px;padding-top: 8.5px;">
                    <form id="myform">
                        <input type="search" id="searchInputMobile"
                               style="background-color: #F2F2F2;float: left;border:none;" placeholder="可输入姓名,工作单位,原籍地,现居地">
                    </form>
                </div>

                <#--人才类型筛选按钮-->
                <div style="">
                    <!-- Single button -->
                    <div class="btn-group" style="padding-top: 3px;">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"
                                aria-haspopup="true" style="height: 32px;padding: 0;border:none;"
                                aria-expanded="false"><img src="./images/button_screen@2x.png"
                                                           style="height: 32px;width:auto;">
                            <#--<span class="caret"></span>-->
                        </button>
                        <ul class="dropdown-menu" style="text-align: center;width: 100%;margin-right: 5px;"
                            id="typesList">

                            <li onclick="findGeneralByNatureId(0)" style="padding-top: 5px;">全部</li>
                            <li role="separator" class="divider"></li>
                            <li onclick="findGeneralByNatureId(1)">军队系统人才</li>
                            <li role="separator" class="divider"></li>
                            <li onclick="findGeneralByNatureId(2)">政党系统人才</li>
                            <li role="separator" class="divider"></li>
                            <li onclick="findGeneralByNatureId(3)">科研人才</li>
                            <li role="separator" class="divider"></li>
                            <li onclick="findGeneralByNatureId(4)">企业管理人才</li>
                            <li role="separator" class="divider"></li>
                            <li onclick="findGeneralByNatureId(5)">海外学子</li>
                            <li role="separator" class="divider"></li>
                            <li onclick="findGeneralByNatureId(6)">其他</li>
                        </ul>
                    </div>
                </div>

            </div>
        </div>

    </div>

    <div id="famousScrollDiv" style="margin-top: 54px;width:100%;height:100%;overflow-y: auto;border-top: 1px solid #eeeeee">
        <#--乡贤人才查询展示信息-->
        <div id="talentSearchList"  style="">

            <#--此处循环拼接：不可删 方便查找错误-->
            <#--<div class="eachTalent">-->
            <#--<div class="container">-->
            <#--<div class="row">-->
            <#--<div class="col-xs-6">-->
            <#--<span class="nameSpan">郑树森</span>-->
            <#--</div>-->
            <#--<div class="col-xs-6">-->
            <#--<span class="typeSpan">管理型人才</span>-->
            <#--</div>-->
            <#--</div>-->

            <#--<div style="width: 100%;">-->
            <#--<label>工作单位:</label><span>浙江省杭州树兰医院,美国哥伦比亚大学医学院药理与神经病腿型性疾病研究室主任</span><br>-->
            <#--<label>原籍地:</label><span>浙江衢州市衢江区</span><br>-->
            <#--<label>现居地:</label><span>浙江杭州西湖区</span><br>-->
            <#--</div>-->
            <#--</div>-->
            <#--</div>-->

        </div>


    </div>

</div>



<!--**********************************
    Scripts
***********************************-->
<script src="plugins/common/common.min.js"></script>
<script src="js/mobile/custom.min.js"></script>

<script src="./js/jquery-3.4.1.min.js"></script>

<script src="js/mapComm.js"></script>
<script src="js/famous.js"></script>




<script type="text/javascript">



    /**
     * draw = 0 : 从第1 个开始查询并显示
     * draw = 1 : 从第6个开始查询显示
     */
    var draw = 0;


    /**
     * 返回
     */
    function backClick() {
        window.history.back();
    }

    /**
     * 为人才类型变量、查询名字初始化
     */
    var natureId = 0;
    var searchName = "";
    function findGeneralByNatureId(id){
        // if(natureId == 0){
        //     $('#searchInputMobile').val(null);
        //     natureId = id;
        //     queryGeneraInit();
        // }else {
        //     natureId = id;
        //     queryGeneraInit();
        // }
        draw = 0;
        natureId = id;
        queryGeneraInit();
    }
    var selectType = 0;
    /**
     * 初始化查询函数
     */
    function queryGeneraInit() {
        searchName = $('#searchInputMobile').val();

        $.ajax({
            type: 'POST',
            url: 'talentInfo/findGeneralMobileOnlyByName?name='+ encodeURIComponent(searchName)+ '&draw='+ draw + '&natureId='+ natureId,
            dataType: 'JSON',
            success: function (res) {
                selectType = res.selectType;

                $('#talentSearchList div').remove(); // 每次下滑 将查询的数据拼接到 这里 不能清除

                if(!res.data){
                    return;
                }
                draw = res.draw + 1;

                if(res.data.length > 0 ){

                    for(let i = 0; i<res.data.length; i++){
                        let eachTalentHtml = "";
                        eachTalentHtml +=  '<div class="eachTalent">';
                        eachTalentHtml +=  '<div class="container">';

                        // 名字和人才类型
                        eachTalentHtml +=  '<div class="row">';
                        // eachTalentHtml +=  '<div style="width: 50%;padding-left:15px;">';
                        eachTalentHtml +=  '<div class="col-xs-5" style="padding-left:15px;">';
                        eachTalentHtml +=  '<span class="nameSpan" style="">';
                        eachTalentHtml +=  res.data[i].name;
                        eachTalentHtml +=  '</span>';
                        eachTalentHtml +=  '</div>';
                        // eachTalentHtml +=  ' <div style="width: 50%;padding-right: 15px;">';
                        eachTalentHtml +=  ' <div class="col-xs-6" style="padding-right: 0px;">';

                        if(res.data[i].nature != undefined && res.data[i].nature != '其他'){
                            switch (res.data[i].nature) {
                                case '军队系统人才' :
                                    eachTalentHtml +=  '<span class="typeSpan" style="color:#FFD300">';
                                    break;
                                case '党政系统人才' :
                                    eachTalentHtml +=  '<span class="typeSpan" style="color: #C23531;">';
                                    break;
                                case '科研人才' :
                                    eachTalentHtml +=  '<span class="typeSpan" style="color: #01C7FF;">';
                                    break;
                                case '企业管理人才' :
                                    eachTalentHtml +=  '<span class="typeSpan" style="color: #CD1BF6;">';
                                    break;
                                case '海外学子' :
                                    eachTalentHtml +=  '<span class="typeSpan" style="color: #FE8503">';
                                    break;
                            }
                            eachTalentHtml +=  res.data[i].nature;
                        }else {
                            eachTalentHtml +=  '<span class="typeSpan" style="color: #009933;">';
                            eachTalentHtml += '其他';
                        }
                        eachTalentHtml +=  '</span>';
                        eachTalentHtml +=  '</div>';
                        eachTalentHtml +=  '</div>';

                        // 工作单位 原籍地 现居地 旧版本
                        // eachTalentHtml += '<div style="width: 100%;">';
                        // eachTalentHtml += '<span class="comFont" style="">工作单位:&nbsp;&nbsp;</span ><span class="comFont" style="text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">';
                        // eachTalentHtml += res.data[i].unit + '</span><br>';
                        //
                        // eachTalentHtml +=  '<span class="comFont">原籍地:&nbsp;&nbsp;</span><span class="comFont">';
                        // eachTalentHtml +=  res.data[i].town+ '</span><br>';
                        //
                        // eachTalentHtml +=  '<span class="comFont">现居地:&nbsp;&nbsp;</span><span class="comFont">';
                        // eachTalentHtml +=  res.data[i].local+ '</span><br>';

                        // 工作单位 原籍地 现居地 改成：自动换行
                        eachTalentHtml += '<div style="width: 100%;">';
                        eachTalentHtml += '<span class="comFont" style=""><b>工作单位:</b>&nbsp;&nbsp;';
                        eachTalentHtml += res.data[i].unit + '</span><br>';

                        eachTalentHtml +=  '<span class="comFont"><b>原籍地:</b>&nbsp;&nbsp;';
                        eachTalentHtml +=  res.data[i].town+ '</span><br>';

                        eachTalentHtml +=  '<span class="comFont"><b>现居地:</b>&nbsp;&nbsp;';
                        eachTalentHtml +=  res.data[i].local+ '</span><br>';

                        eachTalentHtml +=  '</div>';
                        eachTalentHtml +=  '</div>';
                        eachTalentHtml +=  '</div>';

                        $('#talentSearchList').append(eachTalentHtml);

                        // $('#famousScrollDiv').animate({scrollTop: 0},30);
                        // 滚动条回到该div顶部
                         document.body.scrollTop!==0?document.body.scrollTop=0:null; // 暂时注释掉
                    }
                }else {

                    $('#talentSearchList div').remove();
                    // 如果搜索结果为空，则提示：没有符合条件的用户
                    var tipsHtml = '<div  style="margin: 0 auto;text-align: center;"> 没有符合条件的用户</div >'
                    $('#talentSearchList').append(tipsHtml);
                }

            }

        });
    }

    /**
     * 查询函数
     */
    function queryGeneral() {
        searchName = $('#searchInputMobile').val();
        $.ajax({
            type: 'POST',
            url: 'talentInfo/findGeneralMobileOnlyByName?name='+ encodeURIComponent(searchName)+ '&draw='+ draw + '&natureId='+ natureId,
            dataType: 'JSON',
            success: function (res) {
                // $('#talentSearchList div').remove(); // 每次下滑 将查询的数据拼接到 这里 不能清除
                if(!res.data){
                    return;
                }
                draw = res.draw + 1;

                if(res.data.length > 0 ){
                    for(let i = 0; i<res.data.length; i++){
                        let eachTalentHtml = "";
                        eachTalentHtml +=  '<div class="eachTalent">';
                        eachTalentHtml +=  '<div class="container">';

                        // 名字和人才类型
                        eachTalentHtml +=  '<div class="row">';
                        // eachTalentHtml +=  '<div style="width: 50%;padding-left:15px;">';
                        eachTalentHtml +=  '<div class="col-xs-5" style="padding-left:15px;">';
                        eachTalentHtml +=  '<span class="nameSpan" style="">';
                        eachTalentHtml +=  res.data[i].name;
                        eachTalentHtml +=  '</span>';
                        eachTalentHtml +=  '</div>';
                        // eachTalentHtml +=  ' <div style="width: 50%;padding-right: 15px;">';
                        eachTalentHtml +=  ' <div class="col-xs-6" style="padding-right: 0px;">';

                        if(res.data[i].nature != undefined && res.data[i].nature != '其他'){
                            switch (res.data[i].nature) {
                                case '军队系统人才' :
                                    eachTalentHtml +=  '<span class="typeSpan" style="color:#FFD300">';
                                    break;
                                case '党政系统人才' :
                                    eachTalentHtml +=  '<span class="typeSpan" style="color: #C23531;">';
                                    break;
                                case '科研人才' :
                                    eachTalentHtml +=  '<span class="typeSpan" style="color: #01C7FF;">';
                                    break;
                                case '企业管理人才' :
                                    eachTalentHtml +=  '<span class="typeSpan" style="color: #CD1BF6;">';
                                    break;
                                case '海外学子' :
                                    eachTalentHtml +=  '<span class="typeSpan" style="color: #FE8503">';
                                    break;
                            }
                            eachTalentHtml +=  res.data[i].nature;
                        }else {
                            eachTalentHtml +=  '<span class="typeSpan" style="color: #009933;">';
                            eachTalentHtml += '其他';
                        }
                        eachTalentHtml +=  '</span>';
                        eachTalentHtml +=  '</div>';
                        eachTalentHtml +=  '</div>';

                        // 工作单位 原籍地 现居地 旧版本
                        // eachTalentHtml += '<div style="width: 100%;">';
                        // eachTalentHtml += '<span class="comFont" style="">工作单位:&nbsp;&nbsp;</span ><span class="comFont" style="text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">';
                        // eachTalentHtml += res.data[i].unit + '</span><br>';
                        //
                        // eachTalentHtml +=  '<span class="comFont">原籍地:&nbsp;&nbsp;</span><span class="comFont">';
                        // eachTalentHtml +=  res.data[i].town+ '</span><br>';
                        //
                        // eachTalentHtml +=  '<span class="comFont">现居地:&nbsp;&nbsp;</span><span class="comFont">';
                        // eachTalentHtml +=  res.data[i].local+ '</span><br>';

                        // 工作单位 原籍地 现居地 改成：自动换行
                        eachTalentHtml += '<div style="width: 100%;">';
                        eachTalentHtml += '<span class="comFont" style=""><b>工作单位:</b>&nbsp;&nbsp;';
                        eachTalentHtml += res.data[i].unit + '</span><br>';

                        eachTalentHtml +=  '<span class="comFont"><b>原籍地:</b>&nbsp;&nbsp;';
                        eachTalentHtml +=  res.data[i].town+ '</span><br>';

                        eachTalentHtml +=  '<span class="comFont"><b>现居地:</b>&nbsp;&nbsp;';
                        eachTalentHtml +=  res.data[i].local+ '</span><br>';

                        eachTalentHtml +=  '</div>';
                        eachTalentHtml +=  '</div>';
                        eachTalentHtml +=  '</div>';

                        $('#talentSearchList').append(eachTalentHtml);

                        // $('#famousScrollDiv').animate({scrollTop: 0},30);
                        // 滚动条回到该div顶部
                       //document.body.scrollTop!==0?document.body.scrollTop=0:null; // 暂时注释掉
                    }
                }else {
                    $('#talentSearchList div').remove();
                    // 如果搜索结果为空，则提示：没有符合条件的用户
                    var tipsHtml = '<div  style="margin: 20px auto;padding-top:20px;text-align: center;"> 没有符合条件的用户</div >'
                    $('#talentSearchList').append(tipsHtml);
                }

            }

        });
    }

    var lockSelect = false;
    /**
     * 滚动查询
     */
    function queryGeneralScroll() {
        if(lockSelect){
            return;
        }

        lockSelect = true;
        //alert("您进行了下滑查询操作");
        searchName = $('#searchInputMobile').val();
        //alert("当前页："+draw);
        $.ajax({
            type: 'POST',
            url: 'talentInfo/findGeneralMobileOnlyByName?name='+ encodeURIComponent(searchName)+ '&draw='+ draw + '&natureId='+ natureId +'&selectType='+selectType,
            dataType: 'JSON',
            success: function (res) {
                lockSelect = false;
                if(!res.data){
                    return;
                }
               // alert("返回结果：");
                // $('#talentSearchList div').remove(); // 每次下滑 将查询的数据拼接到 这里 不能清除
                draw = res.draw + 1;
                if(res.data.length > 0 ){
                    for(let i = 0; i<res.data.length; i++){
                        let eachTalentHtml = "";
                        eachTalentHtml +=  '<div id="eachTalent" class="eachTalent" style="border-top: 1px solid #eeeeee">';
                        eachTalentHtml +=  '<div class="container">';

                        // 名字和人才类型
                        eachTalentHtml +=  '<div class="row" style="">';
                        // eachTalentHtml +=  '<div style="width: 50%;padding-left:15px;">';
                        eachTalentHtml +=  '<div class="col-xs-5" style="padding-left:15px;">';
                        eachTalentHtml +=  '<span class="nameSpan" style="">';
                        eachTalentHtml +=  res.data[i].name;
                        eachTalentHtml +=  '</span>';
                        eachTalentHtml +=  '</div>';
                        // eachTalentHtml +=  ' <div style="width: 50%;padding-right: 15px;">';
                        eachTalentHtml +=  ' <div class="col-xs-6" style="padding-right: 0px;">';

                        if(res.data[i].nature != undefined && res.data[i].nature != '其他'){
                            switch (res.data[i].nature) {
                                case '军队系统人才' :
                                    eachTalentHtml +=  '<span class="typeSpan" style="color:#FFD300">';
                                    break;
                                case '党政系统人才' :
                                    eachTalentHtml +=  '<span class="typeSpan" style="color: #C23531;">';
                                    break;
                                case '科研人才' :
                                    eachTalentHtml +=  '<span class="typeSpan" style="color: #01C7FF;">';
                                    break;
                                case '企业管理人才' :
                                    eachTalentHtml +=  '<span class="typeSpan" style="color: #CD1BF6;">';
                                    break;
                                case '海外学子' :
                                    eachTalentHtml +=  '<span class="typeSpan" style="color: #FE8503">';
                                    break;
                            }
                            eachTalentHtml +=  res.data[i].nature;
                        }else {
                            eachTalentHtml +=  '<span class="typeSpan" style="color: #009933;">';
                            eachTalentHtml += '其他';
                        }
                        eachTalentHtml +=  '</span>';
                        eachTalentHtml +=  '</div>';
                        eachTalentHtml +=  '</div>';

                        // 工作单位 原籍地 现居地 旧版本
                        // eachTalentHtml += '<div style="width: 100%;">';
                        // eachTalentHtml += '<span class="comFont" style="">工作单位:&nbsp;&nbsp;</span ><span class="comFont" style="text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">';
                        // eachTalentHtml += res.data[i].unit + '</span><br>';
                        //
                        // eachTalentHtml +=  '<span class="comFont">原籍地:&nbsp;&nbsp;</span><span class="comFont">';
                        // eachTalentHtml +=  res.data[i].town+ '</span><br>';
                        //
                        // eachTalentHtml +=  '<span class="comFont">现居地:&nbsp;&nbsp;</span><span class="comFont">';
                        // eachTalentHtml +=  res.data[i].local+ '</span><br>';

                        // 工作单位 原籍地 现居地 改成：自动换行
                        eachTalentHtml += '<div style="width: 100%;">';
                        eachTalentHtml += '<span class="comFont" style=""><b>工作单位:</b>&nbsp;&nbsp;';
                        eachTalentHtml += res.data[i].unit + '</span><br>';

                        eachTalentHtml +=  '<span class="comFont"><b>原籍地:</b>&nbsp;&nbsp;';
                        eachTalentHtml +=  res.data[i].town+ '</span><br>';

                        eachTalentHtml +=  '<span class="comFont"><b>现居地:</b>&nbsp;&nbsp;';
                        eachTalentHtml +=  res.data[i].local+ '</span><br>';

                        eachTalentHtml +=  '</div>';
                        eachTalentHtml +=  '</div>';
                        eachTalentHtml +=  '</div>';

                        //alert(eachTalentHtml);
                        $('#talentSearchList').append(eachTalentHtml);

                        // $('#famousScrollDiv').animate({scrollTop: 0},30);
                        // 滚动条回到该div顶部
                        //document.body.scrollTop!==0?document.body.scrollTop=0:null; // 暂时注释掉
                    }
                }

            }

        });
    }


    ///////////////////////
    //获取滚动条当前的位置
    function getScrollTop() {
        var scrollTop = 0;
        if (document.documentElement && document.documentElement.scrollTop) {
            scrollTop = document.documentElement.scrollTop;
        } else if (document.body) {
            scrollTop = document.body.scrollTop;
        }
        return scrollTop;
    }

    //获取当前可视范围的高度
    function getClientHeight() {
        var clientHeight = 0;
        if (document.body.clientHeight && document.documentElement.clientHeight) {
            clientHeight = Math.min(document.body.clientHeight, document.documentElement.clientHeight);
        } else {
            clientHeight = Math.max(document.body.clientHeight, document.documentElement.clientHeight);
        }
        return clientHeight;
    }

    //获取文档完整的高度
    function getScrollHeight() {
        return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
    }

    //滚动事件触发
    // window.onscroll = function () {
    //
    //     if (getScrollTop() + getClientHeight() > (getScrollHeight()-200)) {
    //         queryGeneralScroll(); // 滚动条不能回到顶部
    //     }
    // }

    //滚动事件触发 修改版本
    window.ontouchmove = function () {

        if (getScrollTop() + getClientHeight() > (getScrollHeight()-200)) {
            queryGeneralScroll(); // 滚动条不能回到顶部
        }


    }
        ///////////////////////


    $(document).ready(function () {


        /**
        *初始化加载时查询
        */
        queryGeneraInit();

        /**
         * 监控input 搜索框的变化：当其文本内容被清空的时候 将searchName 置空
         */
        $('#searchInputMobile').bind('input propertychange', function () {
            // 记得清除空格
            if($(this).val().trim() == "") {
                searchName = "";
                draw = 0;
                natureId = 0;
                queryGeneraInit(); //清空后 初始化界面
            }

        });

        // 搜索框点击enter查询
        $("#myform").on('keypress', function(e) {
            draw = 0;
            natureId = 0;
            var keycode = e.keyCode;
            searchName = $('#searchInputMobile').val();
            //keycode是键码，13也是电脑物理键盘的 enter
            if(keycode == '13') {
                e.preventDefault();
                //请求搜索接口
                queryGeneraInit();
            }
        });


    });

</script>


</body>
</html>
