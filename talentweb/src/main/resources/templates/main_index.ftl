<!DOCTYPE html>
<html lang="en">

<head>
<#--    <base href="${basePath}"/>-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="icon" type="image/x-icon" href="./images/logo.png"  />
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
    <link href="./css/style.css" rel="stylesheet">
    <link href="./css/talent.css" rel="stylesheet">
    <link href="./css/mymain.css" rel="stylesheet">

    <!--toast-->
    <link href="css/toast.css" rel="stylesheet">

    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>
    <script type="text/javascript"
            src="https://api.map.baidu.com/api?v=2.0&ak=${baiduAK}"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>
    <script src="./js/bootstrap.js"></script>
</head>


<body >
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

    <#--    toast-->
    <#include "freemarker/base/toast.ftl"/>
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
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div>
                                <label class="label-control"><span>乡贤人才分布情况</span></label>
                            </div>
                            <hr>
                            <div class="basic-form" style="margin-top: 30px;">
                                <div id="mapContent" >
                                    <div class="worldmap" id="world" style="height: 720px;" >
                                        <div id="worldcontainer" style="height: 100%;width: 100%;"></div>
                                    </div>

                                    <div class="chinamap" id="china" style="height: 720px;" >
                                        <div id="chinacontainer" style="height: 100%;width: 100%;"></div>
                                    </div>

                                    <div class="btn-group" role="group" aria-label="..." style="float:right;margin-top: -700px;margin-right:20px;z-index: 1000">
                                        <button id="china_btn"  type="button" class="btn btn-primary" onclick="ChangeColor1()">全国</button>
                                        <button id="world_btn"  type="button" class="btn btn-outline-info"   onclick="ChangeColor2()">全球</button>
                                    </div>


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
</div>
<!--**********************************
    Main wrapper end
***********************************-->

<!--**********************************
    Scripts
***********************************-->

<script type="text/javascript">


    function ChangeColor1() {
        document.getElementById("china_btn").style.backgroundColor = "#3698E9";
        document.getElementById("china_btn").style.color="#FFFFFF";
        document.getElementById("world_btn").style.backgroundColor = "#FFFFFF";
        document.getElementById("world_btn").style.color="#3698E9";
    }
    function ChangeColor2() {
        document.getElementById("world_btn").style.backgroundColor = "#3698E9";
        document.getElementById("world_btn").style.color="#FFFFFF";
        document.getElementById("china_btn").style.backgroundColor = "#FFFFFF";
        document.getElementById("china_btn").style.color="#3698E9";
    }


    var domChina = document.getElementById("chinacontainer");
    var myChartChina = echarts.init(domChina);

    var domWorld = document.getElementById("worldcontainer");
    var myChartWorld = echarts.init(domWorld);

    /**
     * 过滤：刷选出符合某一特定类型的人才 返回人信息点集合
     */
    var filterData = function (data, type) {
        var typeList = [];
        for (let i = 0; i < data.length; i++) {
            if (data[i].value[2].type == type) {
                typeList.push(
                    data[i]);
            }
        }
        return typeList;
    };

    /**
     * 功能：监控div的大小变化相当于window.resize 函数
     */
    (function($, h, c) {
        var a = $([]),
            e = $.resize = $.extend($.resize, {}),
            i,
            k = "setTimeout",
            j = "resize",
            d = j + "-special-event",
            b = "delay",
            f = "throttleWindow";
        e[b] = 250;
        e[f] = true;
        $.event.special[j] = {
            setup: function() {
                if (!e[f] && this[k]) {
                    return false;
                }
                var l = $(this);
                a = a.add(l);
                $.data(this, d, {
                    w: l.width(),
                    h: l.height()
                });
                if (a.length === 1) {
                    g();
                }
            },
            teardown: function() {
                if (!e[f] && this[k]) {
                    return false;
                }
                var l = $(this);
                a = a.not(l);
                l.removeData(d);
                if (!a.length) {
                    clearTimeout(i);
                }
            },
            add: function(l) {
                if (!e[f] && this[k]) {
                    return false;
                }
                var n;
                function m(s, o, p) {
                    var q = $(this),
                        r = $.data(this, d);
                    r.w = o !== c ? o: q.width();
                    r.h = p !== c ? p: q.height();
                    n.apply(this, arguments);
                }
                if ($.isFunction(l)) {
                    n = l;
                    return m;
                } else {
                    n = l.handler;
                    l.handler = m;
                }
            }
        };
        function g() {
            i = h[k](function() {
                    a.each(function() {
                        var n = $(this),
                            m = n.width(),
                            l = n.height(),
                            o = $.data(this, d);
                        if (m !== o.w || l !== o.h) {
                            n.trigger(j, [o.w = m, o.h = l]);
                        }
                    });
                    g();
                },
                e[b]);
        }
    })(jQuery, this);


    $(function () {
        /**
         *  监控地图窗口的大小 实现重新初始化地图canvas
         */
        $("#mapContent").resize(function(){
            myChartWorld.resize();
            myChartChina.resize();
        });


        /**
         * 页面加载事件：默认显示中国人才地图
         */
            $("#world").hide();

        /**
         * 全国按钮：显示中国地图，隐藏世界人才地图
         */
        $("#china_btn").click(function () {
            $("#china").show();
            $("#world").hide();
        });
        /**
         * 世界按钮：显示世界地图，隐藏中国地图
         */
        $("#world_btn").click(function () {
            $("#world").show();
            $("#china").hide();
        });


        // 中国地图初始化
        $.ajax({
            type: 'POST',
            url: 'general/queryMap?china=1',
            dataType: 'JSON',
            success: function (res) {
                optionChina = {
                    backgroundColor: '#EFEFEF',
                    title: {
                      /*  text: '全球衢籍人才地图',*/
                        x: 'center',
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    tooltip: {
                        trigger: 'item',
                        // 弹窗显示内容
                        formatter: function (params) {
                            var tipHtml = '';
                            tipHtml = '<div style="background:rgba(22,80,158,0.8);border:1px solid rgba(7,166,255,0.7)">'
                                + '<div style="width:100%;height:40px;line-height:30px;border-bottom:2px solid rgba(7,166,255,0.7);padding:0 20px">' + '<i style="display:inline-block;width:8px;height:8px;background:#16d6ff;border-radius:40px;">' + '</i>'
                                + '<span style="margin-left:10px;color:#fff;font-size:16px;">' + params.name + '</span>' + '</div>'
                                + '<div style="padding:20px">'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '原籍地：' + '<span style="color:#f4e925;margin:0 6px;">' + params.value[2].town + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '现所在地：' + '<span style="color:#f4e925;margin:0 6px;">' + params.value[2].local + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '现工作单位：' + '<span style="color:#f4e925;margin:0 6px;">' + params.value[2].unit + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '职务：' + '<span style="color:#11ee7d;margin:0 6px;">' + params.value[2].posi + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '人才性质：' + '<span style="color:#f48225;margin:0 6px;">' + params.value[2].type + '</span>' + '</p>'


                                /*                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                                                + '联系方式：' + '<span style="color:#25f4f2;margin:0 6px;">' + params.value[2].phone + '</span>' + '</p>'*/
                                + '</div>' + '</div>';

                            return tipHtml;
                        }
                    },
                    legend: {
                        /*orient: 'vertical',*/
                        orient: 'horizontal',
                        x: '10px',
                        y: '10px',
                        data: res.data.types,
                        textStyle: {
                            color: '#666666',
                            fontSize: 14  // 修改字体大小
                        }
                    },

                    // 控制左上角的圆形按钮的颜色
                    color: ['#FFD300', '#C23531', '#01C7FF', '#CD1BF6', '#FE8503', '#009933'],

                    geo: {
                        map: 'china',
                        roam:true,
                        zoom: 1,
                        itemStyle: {
                            areaColor: '#3698E9',
                            borderColor: '#ffffff'
                        },
                        emphasis: {
                            itemStyle: {
                                areaColor: '#2a333d'
                            },
                            label: {
                                show: false
                            }
                        },



                        /*显示省份的名字  放在此处是一直显示省份名字*/
                        label: {
                            /* show: false*/
                            /*  show:true*/  // 此时是 鼠标放上去显示省份的名字
                            normal:{
                                show: true, // 是否显示对应地名
                                textStyle: { //字体颜色
                                    /* color: '#ff0b07'*/
                                    color: '#000000'
                                }
                            },
                            emphasis: {
                                show: false,
                                textStyle: {
                                    color: '#fff'
                                }
                            }
                        }
                    },

                    series: [
                        // 第一组数据
                        {
                            name: res.data.types[0],
                            type: 'scatter',
                            center: [113.83531246, 34.0267395887],
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[0]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第二组数据
                        {
                            name: res.data.types[1],
                            type: 'scatter',
                            center: [113.83531246, 34.0267395887],
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[1]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第三组数据
                        {
                            name: res.data.types[2],
                            type: 'scatter',
                            center: [113.83531246, 34.0267395887],
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[2]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第四组数据
                        {
                            name: res.data.types[3],
                            type: 'scatter',
                            center: [113.83531246, 34.0267395887],
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[3]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第五组数据
                        {
                            name: res.data.types[4],
                            type: 'scatter',
                            center: [113.83531246, 34.0267395887],
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[4]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第六组数据
                        {
                            name: res.data.types[5],
                            type: 'scatter',

                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[5]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        }
                    ]

                }

                if (optionChina && typeof optionChina === "object") {
                    myChartChina.setOption(optionChina, true);
                }


            }
        });

        // 世界地图初始化
        $.ajax({
            type: 'POST',
            url: 'general/queryMap',
            dataType: 'JSON',
            success: function (res) {
                /**
                 * 地图属性：设置地图的各种属性值
                 */
                optionWorld = {
                    backgroundColor: '#EFEFEF',
                    title: {
                       /* text: '全球衢籍人才地图',*/
                        x: 'center',
                        textStyle: {
                            color: '#fff'
                        }
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: function (params) {
                            var tipHtml = '';
                            tipHtml = '<div style="background:rgba(22,80,158,0.8);border:1px solid rgba(7,166,255,0.7)">'
                                + '<div style="width:100%;height:40px;line-height:30px;border-bottom:2px solid rgba(7,166,255,0.7);padding:0 20px">' + '<i style="display:inline-block;width:8px;height:8px;background:#16d6ff;border-radius:40px;">' + '</i>'
                                + '<span style="margin-left:10px;color:#fff;font-size:16px;">' + params.name + '</span>' + '</div>'
                                + '<div style="padding:20px">'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '原籍地：' + '<span style="color:#f4e925;margin:0 6px;">' + params.value[2].town + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '现所在地：' + '<span style="color:#f4e925;margin:0 6px;">' + params.value[2].local + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '现工作单位：' + '<span style="color:#f4e925;margin:0 6px;">' + params.value[2].unit + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '职务：' + '<span style="color:#11ee7d;margin:0 6px;">' + params.value[2].posi + '</span>' + '</p>'

                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '人才性质：' + '<span style="color:#f48225;margin:0 6px;">' + params.value[2].type + '</span>' + '</p>'


/*                                + '<p style="color:#fff;font-size:12px;">' + '<i style="display:inline-block;width:10px;height:10px;background:#16d6ff;border-radius:40px;margin:0 8px">' + '</i>'
                                + '联系方式：' + '<span style="color:#25f4f2;margin:0 6px;">' + params.value[2].phone + '</span>' + '</p>'*/
                                + '</div>' + '</div>';

                            return tipHtml;
                        }
                    },
                    legend: {
                        /*orient: 'vertical',*/
                        orient: 'horizontal',
                        x: '10px', // 调整位置
                        y: '10px',
                        data: res.data.types,
                        textStyle: {
                            color: '#666666',
                            fontSize: 14
                        }
                    },

                    // 控制左上角的圆形按钮的颜色

                    color: ['#FFD300', '#C23531', '#01C7FF', '#CD1BF6', '#FE8503', '#009933'],
                    geo: {
                        map: 'world',
                        roam:true,
                        zoom: 1,
                        // 世界地图汉化国家对照表
                        nameMap: {

                            'Singapore Rep.':'新加坡',
                            'Dominican Rep.':'多米尼加',
                            'Palestine':'巴勒斯坦',
                            'Bahamas':'巴哈马',
                            'Timor-Leste':'东帝汶',
                            'Afghanistan':'阿富汗',
                            'Guinea-Bissau':'几内亚比绍',
                            "Côte d'Ivoire":'科特迪瓦',
                            'Siachen Glacier':'锡亚琴冰川',
                            "Br. Indian Ocean Ter.":'英属印度洋领土',
                            'Angola':'安哥拉',
                            'Albania':'阿尔巴尼亚',
                            'United Arab Emirates':'阿联酋',
                            'Argentina':'阿根廷',
                            'Armenia':'亚美尼亚',
                            'French Southern and Antarctic Lands':'法属南半球和南极领地',
                            'Australia':'澳大利亚',
                            'Austria':'奥地利',
                            'Azerbaijan':'阿塞拜疆',
                            'Burundi':'布隆迪',
                            'Belgium':'比利时',
                            'Benin':'贝宁',
                            'Burkina Faso':'布基纳法索',
                            'Bangladesh':'孟加拉国',
                            'Bulgaria':'保加利亚',
                            'The Bahamas':'巴哈马',
                            'Bosnia and Herz.':'波斯尼亚和黑塞哥维那',
                            'Belarus':'白俄罗斯',
                            'Belize':'伯利兹',
                            'Bermuda':'百慕大',
                            'Bolivia':'玻利维亚',
                            'Brazil':'巴西',
                            'Brunei':'文莱',
                            'Bhutan':'不丹',
                            'Botswana':'博茨瓦纳',
                            'Central African Rep.':'中非',
                            'Canada':'加拿大',
                            'Switzerland':'瑞士',
                            'Chile':'智利',
                            'China':'中国',
                            'Ivory Coast':'象牙海岸',
                            'Cameroon':'喀麦隆',
                            'Dem. Rep. Congo':'刚果民主共和国',
                            'Congo':'刚果',
                            'Colombia':'哥伦比亚',
                            'Costa Rica':'哥斯达黎加',
                            'Cuba':'古巴',
                            'N. Cyprus':'北塞浦路斯',
                            'Cyprus':'塞浦路斯',
                            'Czech Rep.':'捷克',
                            'Germany':'德国',
                            'Djibouti':'吉布提',
                            'Denmark':'丹麦',
                            'Algeria':'阿尔及利亚',
                            'Ecuador':'厄瓜多尔',
                            'Egypt':'埃及',
                            'Eritrea':'厄立特里亚',
                            'Spain':'西班牙',
                            'Estonia':'爱沙尼亚',
                            'Ethiopia':'埃塞俄比亚',
                            'Finland':'芬兰',
                            'Fiji':'斐',
                            'Falkland Islands':'福克兰群岛',
                            'France':'法国',
                            'Gabon':'加蓬',
                            'United Kingdom':'英国',
                            'Georgia':'格鲁吉亚',
                            'Ghana':'加纳',
                            'Guinea':'几内亚',
                            'Gambia':'冈比亚',
                            'Guinea Bissau':'几内亚比绍',
                            'Eq. Guinea':'赤道几内亚',
                            'Greece':'希腊',
                            'Greenland':'格陵兰',
                            'Guatemala':'危地马拉',
                            'French Guiana':'法属圭亚那',
                            'Guyana':'圭亚那',
                            'Honduras':'洪都拉斯',
                            'Croatia':'克罗地亚',
                            'Haiti':'海地',
                            'Hungary':'匈牙利',
                            'Indonesia':'印度尼西亚',
                            'India':'印度',
                            'Ireland':'爱尔兰',
                            'Iran':'伊朗',
                            'Iraq':'伊拉克',
                            'Iceland':'冰岛',
                            'Israel':'以色列',
                            'Italy':'意大利',
                            'Jamaica':'牙买加',
                            'Jordan':'约旦',
                            'Japan':'日本',
                            'Kazakhstan':'哈萨克斯坦',
                            'Kenya':'肯尼亚',
                            'Kyrgyzstan':'吉尔吉斯斯坦',
                            'Cambodia':'柬埔寨',
                            'Korea':'韩国',
                            'Kosovo':'科索沃',
                            'Kuwait':'科威特',
                            'Lao PDR':'老挝',
                            'Lebanon':'黎巴嫩',
                            'Liberia':'利比里亚',
                            'Libya':'利比亚',
                            'Sri Lanka':'斯里兰卡',
                            'Lesotho':'莱索托',
                            'Lithuania':'立陶宛',
                            'Luxembourg':'卢森堡',
                            'Latvia':'拉脱维亚',
                            'Morocco':'摩洛哥',
                            'Moldova':'摩尔多瓦',
                            'Madagascar':'马达加斯加',
                            'Mexico':'墨西哥',
                            'Macedonia':'马其顿',
                            'Mali':'马里',
                            'Myanmar':'缅甸',
                            'Montenegro':'黑山',
                            'Mongolia':'蒙古',
                            'Mozambique':'莫桑比克',
                            'Mauritania':'毛里塔尼亚',
                            'Malawi':'马拉维',
                            'Malaysia':'马来西亚',
                            'Namibia':'纳米比亚',
                            'New Caledonia':'新喀里多尼亚',
                            'Niger':'尼日尔',
                            'Nigeria':'尼日利亚',
                            'Nicaragua':'尼加拉瓜',
                            'Netherlands':'荷兰',
                            'Norway':'挪威',
                            'Nepal':'尼泊尔',
                            'New Zealand':'新西兰',
                            'Oman':'阿曼',
                            'Pakistan':'巴基斯坦',
                            'Panama':'巴拿马',
                            'Peru':'秘鲁',
                            'Philippines':'菲律宾',
                            'Papua New Guinea':'巴布亚新几内亚',
                            'Poland':'波兰',
                            'Puerto Rico':'波多黎各',
                            'Dem. Rep. Korea':'朝鲜',
                            'Portugal':'葡萄牙',
                            'Paraguay':'巴拉圭',
                            'Qatar':'卡塔尔',
                            'Romania':'罗马尼亚',
                            'Russia':'俄罗斯',
                            'Rwanda':'卢旺达',
                            'W. Sahara':'西撒哈拉',
                            'Saudi Arabia':'沙特阿拉伯',
                            'Sudan':'苏丹',
                            'S. Sudan':'南苏丹',
                            'Senegal':'塞内加尔',
                            'Solomon Is.':'所罗门群岛',
                            'Sierra Leone':'塞拉利昂',
                            'El Salvador':'萨尔瓦多',
                            'Somaliland':'索马里兰',
                            'Somalia':'索马里',
                            'Serbia':'塞尔维亚',
                            'Suriname':'苏里南',
                            'Slovakia':'斯洛伐克',
                            'Slovenia':'斯洛文尼亚',
                            'Sweden':'瑞典',
                            'Swaziland':'斯威士兰',
                            'Syria':'叙利亚',
                            'Chad':'乍得',
                            'Togo':'多哥',
                            'Thailand':'泰国',
                            'Tajikistan':'塔吉克斯坦',
                            'Turkmenistan':'土库曼斯坦',
                            'East Timor':'东帝汶',
                            'Trinidad and Tobago':'特里尼达和多巴哥',
                            'Tunisia':'突尼斯',
                            'Turkey':'土耳其',
                            'Tanzania':'坦桑尼亚',
                            'Uganda':'乌干达',
                            'Ukraine':'乌克兰',
                            'Uruguay':'乌拉圭',
                            'United States':'美国',
                            'Uzbekistan':'乌兹别克斯坦',
                            'Venezuela':'委内瑞拉',
                            'Vietnam':'越南',
                            'Vanuatu':'瓦努阿图',
                            'West Bank':'西岸',
                            'Yemen':'也门',
                            'South Africa':'南非',
                            'Zambia':'赞比亚',
                            'Zimbabwe':'津巴布韦'
                        },
                        itemStyle: {
                            areaColor: '#3698E9',
                            borderColor: '#ffffff'
                        },


                        emphasis: {
                            itemStyle: {
                                // 鼠标悬停的时候国家或者地区的背景颜色
                                areaColor: '#2a333d'
                            },

                            // 控制世界地图不显示国家
                           // label: {
                           //      show: false
                           //  }


                            /**
                             *  此种实现方式是：鼠标放上去的时候才显示国家名字
                             *  lable标签：放在emphasis里面：鼠标悬停的时候才显示国家名字或者省份名字
                             *  lable标签：放在emphasis外面 及与emphasis是兄弟关系 一直显示国家名字
                             */
                            label: {
                                /*控制悬浮的时候国家字体为白色*/
                                color: '#fff',
                                normal: {
                                    show: false, // 是否显示对应地名
                                    textStyle: { //字体颜色
                                        color: '#000000'
                                    }
                                },
                                emphasis: {
                                    show: true,
                                    textStyle: {
                                        color: '#fff'
                                    }
                                }
                            }


                        }


                    },

                    series: [
                        // 第一组数据
                        {
                            name: res.data.types[0],
                            type: 'scatter',
                            /* center: [113.83531246, 34.0267395887],地图中心 使用默认的就好*/
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[0]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第二组数据
                        {
                            name: res.data.types[1],
                            type: 'scatter',
                            /*   center: [113.83531246, 34.0267395887],*/
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[1]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第三组数据
                        {
                            name: res.data.types[2],
                            type: 'scatter',
                            /*  center: [113.83531246, 34.0267395887],*/
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[2]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第四组数据
                        {
                            name: res.data.types[3],
                            type: 'scatter',
                            /*center: [113.83531246, 34.0267395887],*/
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[3]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第五组数据
                        {
                            name: res.data.types[4],
                            type: 'scatter',
                            /*  center: [113.83531246, 34.0267395887],*/
                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[4]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        },
                        // 第六组数据
                        {
                            name: res.data.types[5],
                            type: 'scatter',

                            zoom: 1,
                            roam: true,
                            scaleLimit: {
                                min: 1,
                                max: 2
                            },

                            coordinateSystem: 'geo',
                            data: filterData(res.data.details, res.data.types[5]),
                            symbolSize: 12,
                            emphasis: {
                                itemStyle: {
                                    borderColor: '#eac736',
                                    borderWidth: 1
                                }
                            }
                        }
                    ]

                }

                if (optionWorld && typeof optionWorld === "object") {
                    myChartWorld.setOption(optionWorld, true);
                }


            }
        });

    })


    /**
     * 修改前台：修改密码后清空模态框数据
     */
    $('#updatePwdModal').on('hide.bs.modal', function (event) {
        $("#oldPassword").val(null);
        $("#newPassword").val(null);
        $("#confirm").val(null);
    });


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
<script src="plugins/common/common.min.js"></script>
<script src="js/custom.min.js"></script>
<script src="js/settings.js"></script>
<script src="js/gleek.js"></script>
<script src="js/styleSwitcher.js"></script>


<script src="./js/dashboard/dashboard-1.js"></script>

</body>

</html>