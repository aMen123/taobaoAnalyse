<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link href="./css/style.css" type='text/css' rel="stylesheet"/>	
    <title>WordCount数据分析</title>
</head>
<body>
	<div class='header'>
        <p>大数据分析</p>
    </div>
    <div class="content">
        <div>
            <ul>
                <li><a href="./presentDataTable1.jsp" target="_blank">查看前10位用户对商品的行为</a></li>
                <li><a href="./presentDataTable2.jsp" target="_blank">查询前20位用户购买商品的时间</a></li>
                <li><a href="./presentDataTable3.jsp" target="_blank">查询前20位用户购买商品的种类</a></li>
                <li><a href="./presentDataTable4.jsp" target="_blank"> 查询uid不重复的数据有多少条</a></li>
                <li><a href="./presentDataTable5.jsp" target="_blank">查询购买商品的人数</a></li>
                <li><a href="./presentDataTable6.jsp" target="_blank">查询浏览商品的人数</a></li>
                <li><a href="./presentDataTable7.jsp" target="_blank">查询收藏商品的人数</a></li>
                <li><a href="./presentDataTable8.jsp" target="_blank">查询2014年12月10日有多少人点击了淘宝店</a></li>
                <li><a href="./presentDataTable9.jsp" target="_blank">查询2014年12月10日到13日有多少人购买了商品</a></li>
                <li><a href="./presentDataTable10.jsp" target="_blank">查询2014年12月10日到13日有多少人浏览了商品</a></li>
                <li><a href="./presentDataTable11.jsp" target="_blank">查询某月每天商品的购买数量</a></li>
                <li><a href="./presentDataTable12.jsp" target="_blank"> 查询不同种类商品在某天的购买数量</a></li>
                <li><a href="./presentDataTable13.jsp" target="_blank">查询不同种类商品在某天的浏览数量</a></li>
                <li><a href="./presentDataTable14.jsp" target="_blank">查询某天购买商品数量在指定范围内的用户id</a></li>
                <li><a href="./presentDataTable15.jsp" target="_blank">查询2014年买家购买商品的人数</a></li>
                <li><a href="./presentDataTable16.jsp" target="_blank">查询不同类别商品的浏览次数</a></li>
                <li><a href="./presentDataTable17.jsp" target="_blank">查询不同类别商品的购买次数</a></li>
                <li><a href="./presentDataTable18.jsp" target="_blank">查询各省份用户购买商品的数量</a></li>
                <li><a href="./presentDataTable19.jsp" target="_blank">查询各省份用户浏览商品的数量</a></li>
                <li><a href="./presentDataTable20.jsp" target="_blank">查询某年购买商品总量前20名的用户</a></li>
                <li><a href="./presentDataTable21.jsp" target="_blank">查询某年购买商品总量前10名的省份</a></li>
                <li><a href="./presentDataTable22.jsp" target="_blank">查询某年男买家购买商品的人数</a></li>
                <li><a href="./presentDataTable23.jsp" target="_blank">查询某年女买家购买商品的人数</a></li>
            </ul>
        </div>
    </div>
    
	<div class='header'>
        <p>数据可视化分析</p>
    </div>
    <div class="content">
        <div>
            <ul>
                <li><a href="./presentDataECharts1.jsp" target="_blank">分析消费者对商品的行为(柱状图)</a></li>
                <li><a href="./presentDataECharts2.jsp" target="_blank">分析被购买商品总量前十的商品类型和被购买总量(柱状图)</a></li>
                 <li><a href="./presentDataECharts3.jsp" target="_blank">分析每年的哪个月份购买商品的量最多(折线图)</a></li>
                <li><a href="./presentDataECharts4.jsp" target="_blank">排名前十的不同种类商品在某天的购买比例分析(饼状图)</a></li>
                <li><a href="./presentDataECharts5.jsp" target="_blank">浏览排名前十的不同种类商品在某天的浏览比例分析(饼状图)</a></li>
                <li><a href="./presentDataECharts6.jsp" target="_blank">某个用户在某年购买、加入购物车、浏览和收藏商品的比例分析(饼状图)</a></li>
                <li><a href="./presentDataECharts7.jsp" target="_blank">分析购买排名前十的不同类别商品的购买次数比例(饼状图)</a></li>
                <li><a href="./presentDataECharts8.jsp" target="_blank">各省份购买商品的比例分析(饼状图)</a></li>
                <li><a href="./presentDataECharts9.jsp" target="_blank">各省份浏览商品的比例分析(饼状图)</a></li>
                <li><a href="./presentDataECharts10.jsp" target="_blank">男女买家购买商品的比例分析(饼状图)</a></li>
                <li><a href="./presentDataECharts11.jsp" target="_blank">男女买家浏览商品的比例分析(饼状图)</a></li>
            </ul>
        </div>
     </div>
</body>
</html>