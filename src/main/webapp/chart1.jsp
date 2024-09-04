<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2024/6/30
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <meta charset="utf-8" />
    <!-- 引入刚刚下载的 ECharts 文件 -->
    <script src="echarts.min.js">
    </script>

</head>
<body>
<!-- 为 ECharts 准备一个定义了宽高的 DOM -->
<div id="main" style="width: 600px;height:400px;"></div>
<script src="jquery-3.7.1.min.js"></script>

<script type="text/javascript">

    $(function () {
        $.ajax({
            url:"/a",
            type:"get",
            dataType:"json",
            success:function (e) {
                var na = []
                var ia = []
                for (i of e){
                    na.push(i.name)
                    ia.push(i.id)
                }

                console.log(na)
                console.log(ia)

            }

        }
            )
    })

    // 使用刚指定的配置项和数据显示图表。


</script>
</body>

</html>
