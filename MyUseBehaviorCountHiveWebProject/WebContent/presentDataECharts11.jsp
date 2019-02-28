<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dbUesrBehavior.connDb" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>单词出现次数对比(饼图)</title>
	<link href="./css/style.css" type='text/css' rel="stylesheet"/>
	<script src="./js/echarts.min.js"></script>    
</head>
<body>
	<%	ArrayList<String[]> list = connDb.analySexScan(); %>
	<div id="main"></div>
	<script>
		//基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		
	    // 指定图表的配置项和数据
	    var option = {
	    	    title : {
	    	        text: '男女买家浏览商品的比例分析',
	    	        x:'center'
	    	    },
	    	    tooltip : {
	    	        trigger: 'item',
	    	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    	    },
	    	    series : [
	    	        {
	    	            name: '男女买家浏览商品的比例分析',
	    	            type: 'pie',
	    	            radius : '55%',
	    	            center: ['40%', '50%'],
	    	            data: [
	    	            	{value:<%=list.get(0)[1]%>, name: '<%=list.get(0)[0]%>'},
		                    {value:<%=list.get(1)[1]%>, name: '<%=list.get(1)[0]%>'},
		                  
		              
		                    
	                 ].sort(function (a, b) { return a.value - b.value}),
	    	            itemStyle: {
	    	                emphasis: {
	    	                    shadowBlur: 10,
	    	                    shadowOffsetX: 0,
	    	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	    	                }
	    	            }
	    	        }
	    	    ]
	    	};  
	    // 使用刚指定的配置项和数据显示图表。
	    myChart.setOption(option);
	</script>
	<h3 ><center><a href="index.jsp">首页</a> </center> <h3>
</body>
</html>
