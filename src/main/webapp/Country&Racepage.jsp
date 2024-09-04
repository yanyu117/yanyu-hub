<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2024/7/3
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layout 管理界面大布局示例 - Layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//cdn.staticfile.net/layui/2.9.13/css/layui.css" rel="stylesheet">
    <script src="echarts.min.js">
    </script>


</head>
<body>

<div class="layui-layout layui-layout-admin  " >
    <div class="layui-header" style="background-color: white">
        <div class="layui-logo " style="background-color: black"><p style="color:white;"> </p> </div>

        <div>
            <marquee  vspace="10px" hspace-left="200px">
                <font face="宋体" size="6px" color="black" >Python数据挖掘与可视化探索——以美国人口年收入数据集(income dataset/adult.data)为例</font>
            </marquee>
        </div>
        <%-- 显示系统当前时间--%>


    </div>

    <div class="layui-side ">
        <div class="layui-side-scroll " style="background-color: black">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test" >
                <li class="layui-nav-item" style="background-color: black">
                    <a class="" href="homepage.jsp">首页</a>

                </li>
                <li class="layui-nav-item" style="background-color: black">
                    <a href="agepage.jsp;">年龄情况</a>

                </li>
                <li class="layui-nav-item "><a href="javascript:;" style="background-color: black">性别情况 </a>
                    <dl class="layui-nav-child">
                        <dd><a href="sexpage.jsp;">收入角度</a></dd>
                        <dd><a href="sex1page.jsp;">性别角度</a></dd>
                        <dd><a href="sex2page.jsp;">总人数角度</a></dd>
                    </dl></li>
                <li class="layui-nav-item"><a href="educationpage.jsp" style="background-color: black">教育情况</a></li>
                <li class="layui-nav-item"><a href="Occupationpage.jsp" style="background-color: black">职业情况</a></li>
                <li class="layui-nav-item"><a href="Country&Racepage.jsp" style="background-color: black">地区及种族情况</a></li>
                <li class="layui-nav-item"><a href="Hourspage.jsp" style="background-color: black">工作时长情况</a></li>
            </ul>
        </div>
    </div>
    <div class="layui-body" >
        <!-- 内容主体区域 -->
        <div style="padding: 1px;">

        </div>
        <div id="main" style="width: 1200px;height:750px;"></div>
        <div  style="width: 1200px;height:80px;"><h1>收入>50K</h1></div>

        <script src="jquery-3.7.1.min.js"></script>
        <div class="layui-col-md12" id="main1" style="width: 1200px;height:750px;"></div>
        <div class="layui-col-md12" style="width: 1200px;height:120px;"><h1>收入<=50K</h1></div>
        <script src="jquery-3.7.1.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $.ajax({
                    url:"/j",
                    type:"get",
                    dataType:"json",
                    success:function (e) {
                        var ind1 = []
                        var cod1= []
                        var co1 = []
                        for (i of e){
                            ind1.push(i.income)
                            cod1.push(i.count)
                            co1.push(i.country)
                        }



                        $(function () {

                            $.ajax({
                                url:"/l",
                                type:"get",
                                dataType:"json",
                                success:function (e) {
                                    var ind = []
                                    var cod = []
                                    var ra = []
                                    for (i of e){
                                        ind.push(i.income)
                                        cod.push(i.count)
                                        ra.push(i.race)
                                    }

                                    console.log(ind)
                                    console.log(cod)
                                    console.log(ra)



                                    // 基于准备好的dom，初始化echarts实例
                                    var chartDom = document.getElementById('main');
                                    var myChart = echarts.init(chartDom);
                                    var option;

                                    option = {
                                        tooltip: {
                                            trigger: 'item',
                                            formatter: '{a} <br/>{b}: {c} ({d}%)'
                                        },

                                        series: [
                                            {
                                                name: 'Access From',
                                                type: 'pie',
                                                selectedMode: 'single',
                                                radius: [0, '30%'],
                                                label: {
                                                    position: 'inner',
                                                    fontSize: 14
                                                },
                                                labelLine: {
                                                    show: false
                                                },
                                                data: [
                                                    { value: cod[0], name: ra[0] },
                                                    { value: cod[1], name: ra[1] },
                                                    { value: cod[2], name: ra[2] },
                                                    { value: cod[3], name: ra[3] },
                                                    { value: cod[4], name: ra[4] }


                                                ]
                                            },
                                            {
                                                name: 'Access From',
                                                type: 'pie',
                                                radius: ['45%', '60%'],
                                                labelLine: {
                                                    length: 30
                                                },
                                                label: {
                                                    formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                                                    backgroundColor: '#F6F8FC',
                                                    borderColor: '#8C8D8E',
                                                    borderWidth: 1,
                                                    borderRadius: 4,
                                                    rich: {
                                                        a: {
                                                            color: '#6E7079',
                                                            lineHeight: 22,
                                                            align: 'center'
                                                        },
                                                        hr: {
                                                            borderColor: '#8C8D8E',
                                                            width: '100%',
                                                            borderWidth: 1,
                                                            height: 0
                                                        },
                                                        b: {
                                                            color: '#4C5058',
                                                            fontSize: 14,
                                                            fontWeight: 'bold',
                                                            lineHeight: 33
                                                        },
                                                        per: {
                                                            color: '#fff',
                                                            backgroundColor: '#4C5058',
                                                            padding: [3, 4],
                                                            borderRadius: 4
                                                        }
                                                    }
                                                },
                                                data: [
                                                    { value: cod1[0], name: co1[0] },
                                                    { value: cod1[1], name: co1[1] },
                                                    { value: cod1[2], name: co1[2] },
                                                    { value: cod1[3], name: co1[3] },
                                                    { value: cod1[4], name: co1[4] },
                                                    { value: cod1[5], name: co1[5] },
                                                    { value: cod1[6], name: co1[6] },
                                                    { value: cod1[7], name: co1[7] },
                                                    { value: cod1[8], name: co1[8] },
                                                    { value: cod1[9], name: co1[9] },
                                                    { value: cod1[10], name: co1[10] },
                                                    { value: cod1[11], name: co1[11] },
                                                    { value: cod1[12], name: co1[12] },
                                                    { value: cod1[13], name: co1[13] },
                                                    { value: cod1[14], name: co1[14] },
                                                    { value: cod1[15], name: co1[15] },
                                                    { value: cod1[16], name: co1[16] },
                                                    { value: cod1[17], name: co1[17] },
                                                    { value: cod1[18], name: co1[18] },
                                                    { value: cod1[19], name: co1[19] },
                                                    { value: cod1[20], name: co1[20] },
                                                    { value: cod1[21], name: co1[21] },
                                                    { value: cod1[22], name: co1[22] },
                                                    { value: cod1[23], name: co1[23] },
                                                    { value: cod1[24], name: co1[24] },
                                                    { value: cod1[25], name: co1[25] },
                                                    { value: cod1[26], name: co1[26] },
                                                    { value: cod1[27], name: co1[27] },
                                                    { value: cod1[28], name: co1[28] },
                                                    { value: cod1[29], name: co1[29] },
                                                    { value: cod1[30], name: co1[30] },
                                                    { value: cod1[31], name: co1[31] },
                                                    { value: cod1[32], name: co1[32] },
                                                    { value: cod1[33], name: co1[33] },
                                                    { value: cod1[34], name: co1[34] },
                                                    { value: cod1[35], name: co1[35] },
                                                    { value: cod1[36], name: co1[36] },
                                                    { value: cod1[37], name: co1[37] },
                                                    { value: cod1[38], name: co1[38] },
                                                    { value: cod1[39], name: co1[39] }


                                                ]
                                            }
                                        ]
                                    };

                                    option && myChart.setOption(option);
                                }

                            }
                                )
                        })
                    }

                }
                    )
            })


        </script>

        <script type="text/javascript">
            $(function () {
                $.ajax({
                    url:"/i",
                    type:"get",
                    dataType:"json",
                    success:function (e) {
                        var ind1 = []
                        var cod1= []
                        var co1 = []
                        for (i of e){
                            ind1.push(i.income)
                            cod1.push(i.count)
                            co1.push(i.country)
                        }



                        $(function () {

                            $.ajax({
                                url:"/k",
                                type:"get",
                                dataType:"json",
                                success:function (e) {
                                    var ind = []
                                    var cod = []
                                    var ra = []
                                    for (i of e){
                                        ind.push(i.income)
                                        cod.push(i.count)
                                        ra.push(i.race)
                                    }

                                    console.log(ind)
                                    console.log(cod)
                                    console.log(ra)



                                    // 基于准备好的dom，初始化echarts实例
                                    var chartDom = document.getElementById('main1');
                                    var myChart = echarts.init(chartDom);
                                    var option;

                                    option = {
                                        tooltip: {
                                            trigger: 'item',
                                            formatter: '{a} <br/>{b}: {c} ({d}%)'
                                        },

                                        series: [
                                            {
                                                name: 'Access From',
                                                type: 'pie',
                                                selectedMode: 'single',
                                                radius: [0, '30%'],
                                                label: {
                                                    position: 'inner',
                                                    fontSize: 14
                                                },
                                                labelLine: {
                                                    show: false
                                                },
                                                data: [
                                                    { value: cod[0], name: ra[0] },
                                                    { value: cod[1], name: ra[1] },
                                                    { value: cod[2], name: ra[2] },
                                                    { value: cod[3], name: ra[3] },
                                                    { value: cod[4], name: ra[4] }


                                                ]
                                            },
                                            {
                                                name: 'Access From',
                                                type: 'pie',
                                                radius: ['45%', '60%'],
                                                labelLine: {
                                                    length: 30
                                                },
                                                label: {
                                                    formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
                                                    backgroundColor: '#F6F8FC',
                                                    borderColor: '#8C8D8E',
                                                    borderWidth: 1,
                                                    borderRadius: 4,
                                                    rich: {
                                                        a: {
                                                            color: '#6E7079',
                                                            lineHeight: 22,
                                                            align: 'center'
                                                        },
                                                        hr: {
                                                            borderColor: '#8C8D8E',
                                                            width: '100%',
                                                            borderWidth: 1,
                                                            height: 0
                                                        },
                                                        b: {
                                                            color: '#4C5058',
                                                            fontSize: 14,
                                                            fontWeight: 'bold',
                                                            lineHeight: 33
                                                        },
                                                        per: {
                                                            color: '#fff',
                                                            backgroundColor: '#4C5058',
                                                            padding: [3, 4],
                                                            borderRadius: 4
                                                        }
                                                    }
                                                },
                                                data: [
                                                    { value: cod1[0], name: co1[0] },
                                                    { value: cod1[1], name: co1[1] },
                                                    { value: cod1[2], name: co1[2] },
                                                    { value: cod1[3], name: co1[3] },
                                                    { value: cod1[4], name: co1[4] },
                                                    { value: cod1[5], name: co1[5] },
                                                    { value: cod1[6], name: co1[6] },
                                                    { value: cod1[7], name: co1[7] },
                                                    { value: cod1[8], name: co1[8] },
                                                    { value: cod1[9], name: co1[9] },
                                                    { value: cod1[10], name: co1[10] },
                                                    { value: cod1[11], name: co1[11] },
                                                    { value: cod1[12], name: co1[12] },
                                                    { value: cod1[13], name: co1[13] },
                                                    { value: cod1[14], name: co1[14] },
                                                    { value: cod1[15], name: co1[15] },
                                                    { value: cod1[16], name: co1[16] },
                                                    { value: cod1[17], name: co1[17] },
                                                    { value: cod1[18], name: co1[18] },
                                                    { value: cod1[19], name: co1[19] },
                                                    { value: cod1[20], name: co1[20] },
                                                    { value: cod1[21], name: co1[21] },
                                                    { value: cod1[22], name: co1[22] },
                                                    { value: cod1[23], name: co1[23] },
                                                    { value: cod1[24], name: co1[24] },
                                                    { value: cod1[25], name: co1[25] },
                                                    { value: cod1[26], name: co1[26] },
                                                    { value: cod1[27], name: co1[27] },
                                                    { value: cod1[28], name: co1[28] },
                                                    { value: cod1[29], name: co1[29] },
                                                    { value: cod1[30], name: co1[30] },
                                                    { value: cod1[31], name: co1[31] },
                                                    { value: cod1[32], name: co1[32] },
                                                    { value: cod1[33], name: co1[33] },
                                                    { value: cod1[34], name: co1[34] },
                                                    { value: cod1[35], name: co1[35] },
                                                    { value: cod1[36], name: co1[36] },
                                                    { value: cod1[37], name: co1[37] },
                                                    { value: cod1[38], name: co1[38] },
                                                    { value: cod1[39], name: co1[39] }


                                                ]
                                            }
                                        ]
                                    };

                                    option && myChart.setOption(option);
                                }

                            }
                                )
                        })
                    }

                }
                    )
            })

        </script>


        <div class="layui-footer">
            <!-- 底部固定区域 -->
            <h3>数据集(http://archive.ics.uci.edu/ml/datasets/Adult)从美国1994年人口普查数据库抽取而来，可用来预测居民收入是否超过50K$/year </h3>
        </div>
    </div>

    <script src="//cdn.staticfile.net/layui/2.9.13/layui.js"></script>
    <script>
        //JS
        layui.use(['element', 'layer', 'util'], function(){
            var element = layui.element;
            var layer = layui.layer;
            var util = layui.util;
            var $ = layui.$;

            //头部事件
            util.event('lay-header-event', {
                menuLeft: function(othis){ // 左侧菜单事件
                    layer.msg('展开左侧菜单的操作', {icon: 0});
                },
                menuRight: function(){  // 右侧菜单事件
                    layer.open({
                        type: 1,
                        title: '更多',
                        content: '<div style="padding: 15px;">处理右侧面板的操作</div>',
                        area: ['260px', '100%'],
                        offset: 'rt', // 右上角
                        anim: 'slideLeft', // 从右侧抽屉滑出
                        shadeClose: true,
                        scrollbar: false
                    });
                }
            });
        });
    </script>
</div>
</body>
<style>
    body{
        text-align: center;
        background-color: white;

    }
    .hcqStyle3{background: #ffb800 url(data:image/gif;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAECAIAAAAmkwkpAAAAHklEQVQImWNkYGBgYGD4//8/A5wF5SBYyAr+//8PAPOCFO0Q2zq7AAAAAElFTkSuQmCC) repeat;text-shadow: 5px -5px #000000, 4px -4px #ffffff;font-weight: bold;-webkit-text-fill-color: transparent;-webkit-background-clip: text}

    @keyframes masked-animation {
        0% {
            background-position: 0  0;
        }
        100% {
            background-position: -100%  0;
        }
    }
</style>
<script>
    layui.use(function(){
        var carousel = layui.carousel;
        // 渲染 - 常规轮播
        carousel.render({
            elem: '#ID-carousel-demo-1',
            width: 'auto',
            height: '666px'
        });

    });
</script>
</html>