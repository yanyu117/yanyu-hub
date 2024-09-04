<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2024/7/2
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
    <link href="//cdn.staticfile.net/layui/2.9.13/css/layui.css" rel="stylesheet" >
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
                <li class="layui-nav-item"><a href="javascript:;" style="background-color: black">性别情况 </a>
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
        <script src="jquery-3.7.1.min.js"></script>
        <script type="text/javascript">
            $(function () {
                $.ajax({
                    url:"/b",
                    type:"get",
                    dataType:"json",
                    success:function (e) {
                        var ind = []
                        var cod = []
                        var agd = []
                        for (i of e){
                            ind.push(i.income)
                            cod.push(i.count)
                            agd.push(i.age_stage)
                        }

                        console.log(ind)
                        console.log(cod)
                        console.log(agd)


                        // 基于准备好的dom，初始化echarts实例
                        var app = {};
                        var chartDom = document.getElementById('main');
                        var myChart = echarts.init(chartDom);
                        var option;
                        const posList = [
                            'left',
                            'right',
                            'top',
                            'bottom',
                            'inside',
                            'insideTop',
                            'insideLeft',
                            'insideRight',
                            'insideBottom',
                            'insideTopLeft',
                            'insideTopRight',
                            'insideBottomLeft',
                            'insideBottomRight'
                        ];
                        app.configParameters = {
                            rotate: {
                                min: -90,
                                max: 90
                            },
                            align: {
                                options: {
                                    left: 'left',
                                    center: 'center',
                                    right: 'right'
                                }
                            },
                            verticalAlign: {
                                options: {
                                    top: 'top',
                                    middle: 'middle',
                                    bottom: 'bottom'
                                }
                            },
                            position: {
                                options: posList.reduce(function (map, pos) {
                                    map[pos] = pos;
                                    return map;
                                }, {})
                            },
                            distance: {
                                min: 0,
                                max: 100
                            }
                        };
                        app.config = {
                            rotate: 90,
                            align: 'left',
                            verticalAlign: 'middle',
                            position: 'insideBottom',
                            distance: 15,
                            onChange: function () {
                                const labelOption = {
                                    rotate: app.config.rotate,
                                    align: app.config.align,
                                    verticalAlign: app.config.verticalAlign,
                                    position: app.config.position,
                                    distance: app.config.distance
                                };
                                myChart.setOption({
                                    series: [
                                        {
                                            label: labelOption
                                        },
                                        {
                                            label: labelOption
                                        },

                                    ]
                                });
                            }
                        };
                        const labelOption = {
                            show: true,
                            position: app.config.position,
                            distance: app.config.distance,
                            align: app.config.align,
                            verticalAlign: app.config.verticalAlign,
                            rotate: app.config.rotate,
                            formatter: '{c}  {name|{a}}',
                            fontSize: 16,
                            rich: {
                                name: {}
                            }
                        };
                        option = {
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'shadow'
                                }
                            },
                            legend: {
                                data: ind
                            },
                            toolbox: {
                                show: true,
                                orient: 'vertical',
                                left: 'right',
                                top: 'center',
                                feature: {
                                    mark: { show: true },
                                    dataView: { show: true, readOnly: false },
                                    magicType: { show: true, type: ['line', 'bar', 'stack'] },
                                    restore: { show: true },
                                    saveAsImage: { show: true }
                                }
                            },
                            xAxis: [
                                {
                                    type: 'category',
                                    axisTick: { show: false },
                                    data: ['青年','中年','老年']
                                }
                            ],
                            yAxis: [
                                {
                                    type: 'value'
                                }
                            ],
                            series: [
                                {
                                    name: '>50K',
                                    type: 'bar',
                                    barGap: 0,
                                    label: labelOption,
                                    emphasis: {
                                        focus: 'series'
                                    },
                                    data: [721,10141,346]
                                },

                                {
                                    name: '<=50K',
                                    type: 'bar',
                                    label: labelOption,
                                    emphasis: {
                                        focus: 'series'
                                    },
                                    data: [11831,20475,1215]
                                }
                            ]
                        };

                        option && myChart.setOption(option)
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