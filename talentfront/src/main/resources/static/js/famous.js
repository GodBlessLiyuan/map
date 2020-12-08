
/**
 * 知名乡贤人才信息
 */
function foldUp() {


    /*折叠的话 重新请求后台 先删除里面所有内容 保留父元素*/

    $("#famousList div").remove(); // 清空div内部所有子div
    /*向上收起 点击后 需要将其隐藏：*/
    $("#foldUpDiv").remove();
    $.ajax({
        type: 'GET',
        url: 'talentInfo/findFamous',
        dataType: 'JSON',
        async: false,
        success: function (result) {
            let data = result.data;
            let id;
/*            console.log(result.length);
            console.log(result.recordsTotal);
            console.log(result.data);*/
            // 无论多少条：都要至少拼接8 条数据
            for (let i = 0; i < data.length && i < 8; i++) {
                id=data[i].id;
                let imgAddress = data[i].avatar;

                let eachHtml = "";
                /*拼接注意 id 别当成变量了*/
                eachHtml += "<div class='each' id='famous"+i+"' onclick=clickFamous("+id+")>";

                // 记住这是同一个盒子里面拼接两个 默认显示原来 事件隐藏一个 显示另外一个
                eachHtml += '<div class="eachSmall " >';

                /*拼接头像信息*/
                eachHtml += '<div class="imgDiv" >';

                /*原来的 地址 判断一下 如果为空的话 将设置为默认的图片：*/
                if( imgAddress == undefined){
                    eachHtml += '<img class="imgBorder" src="./images/default.jpg">'
                }else {
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
                eachHtml +=data[i].town;
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
                eachHtml += "<div class='eachHoverDiv' style=\"display: none;\" id='famous"+i+"' onclick=clickFamous("+id+")>";

                /*拼接头像信息*/
                eachHtml += '<div class="imgHoverDiv" style="text-align: center;margin-top: 10px;" >';

                /*原来的 地址 判断一下 如果为空的话 将设置为默认的图片：*/
                if( imgAddress == undefined){
                    eachHtml += '<img class="imgHoverBorder" style="height:80px;width:80px;border-radius: 40px;" src="./images/default.jpg">'
                }else {
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
                eachHtml +=data[i].town;
                eachHtml += '</div>';

                /*社会兼职*/
                eachHtml += '<div class="unitPositionHover omitTextDiv">';
                eachHtml += data[i].socialWork;
                eachHtml += '</div>';

                eachHtml += '</div>';
                /*拼接名字 职位 社会工作 信息 end */


                eachHtml +='<div class="moreInfo" style="position:absolute;bottom: 0">';
                eachHtml += '更多信息';
                eachHtml +='</div>';

                /*eachHtml += '</div >';*/

                eachHtml += '</div>'; // 触发悬浮事件时显示的拼接div 结束


                eachHtml += '</div>'; // samll 和 big 最外层的div 拼接结束

                $('#famousList').append(eachHtml);


            }

            /**
             *  鼠标悬停 事件
             */
            $(".each").hover(function () {
                /*第一个函数是：进入*/
                $(this).find(".eachSmall").hide();
                $(this).find(".eachHoverDiv").show();
            },function () {

                /*第二个函数：离开*/
                $(this).find(".eachHoverDiv").hide();
                $(this).find(".eachSmall").show();

            });

            /* 如果数据大于 8 条 显示 查看更多*/
            if( data.length > 8){
                /*显示查看更多：*/
                $("#seeMoreDiv").show();

            }

        }
    });
}


/**
 *　点击查看更多
 * */
function clickfindMore() {
    $.ajax({
        type: 'GET',
        url: 'talentInfo/findFamous',
        dataType: 'JSON',
        async: false,
        success: function (result) {
            let data = result.data;
            let id;

            /*点击查看更多后 删除 查看更多这个div所在父盒子 整体删除*/
            $("#seeMoreDiv").hide();
            $("#foldUpDiv").remove();

            /*清空div内部所有子div*/
            $("#famousList div").remove();

            // 无论多少条：都要至少拼接8 条数据
            for (let i = 0; i < data.length; i++) {
                id=data[i].id;
                let imgAddress = data[i].avatar;


                let eachHtml = "";
                /*拼接注意 id 别当成变量了*/
                eachHtml += "<div class='each' id='famous"+i+"' onclick=clickFamous("+id+")>";

                // 记住这是同一个盒子里面拼接两个 默认显示原来 事件隐藏一个 显示另外一个
                eachHtml += '<div class="eachSmall " >';

                /*拼接头像信息*/
                eachHtml += '<div class="imgDiv" >';

                /*原来的 地址 判断一下 如果为空的话 将设置为默认的图片：*/
                if( imgAddress == undefined){
                    eachHtml += '<img class="imgBorder" src="./images/default.jpg">'
                }else {
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
                eachHtml +=data[i].town;
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
                eachHtml += "<div class='eachHoverDiv' style=\"display: none;\" id='famous"+i+"' onclick=clickFamous("+id+")>";

                /*拼接头像信息*/
                eachHtml += '<div class="imgHoverDiv" style="text-align: center;margin-top: 10px;" >';

                /*原来的 地址 判断一下 如果为空的话 将设置为默认的图片：*/
                if( imgAddress == undefined){
                    eachHtml += '<img class="imgHoverBorder" style="height:80px;width:80px;border-radius: 40px;" src="./images/default.jpg">'
                }else {
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
                eachHtml +=data[i].town;
                eachHtml += '</div>';

                /*社会兼职*/
                eachHtml += '<div class="unitPositionHover omitTextDiv">';
                eachHtml += data[i].socialWork;
                eachHtml += '</div>';

                eachHtml += '</div>';
                /*拼接名字 职位 社会工作 信息 end */


                eachHtml +='<div class="moreInfo" style="position:absolute;bottom: 0">';
                eachHtml += '更多信息';
                eachHtml +='</div>';

                /*eachHtml += '</div >';*/

                eachHtml += '</div>'; // 触发悬浮事件时显示的拼接div 结束


                eachHtml += '</div>'; // samll 和 big 最外层的div 拼接结束

                $('#famousList').append(eachHtml);


            }

            /*每次都删除原来的foldUpDiv  重新拼接生成一个*/
            let foldUpHtml = "";
            foldUpHtml += ' <div class="foldUpDiv" id="foldUpDiv" style="float:left;width:80%;margin-left:10%;display: block;text-align: center;" onclick="foldUp();">';
            foldUpHtml += "向上收起∧";
            foldUpHtml += '</div>';

            $("#infoContent").append(foldUpHtml);

            /**
             *  鼠标悬停 事件
             */
            $(".each").hover(function () {
                $(this).find(".eachSmall").hide();
                $(this).find(".eachHoverDiv").show();
            },function () {
                $(this).find(".eachHoverDiv").hide();
                $(this).find(".eachSmall").show();

            });
        }
    });
}