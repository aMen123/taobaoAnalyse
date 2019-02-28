<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dbUesrBehavior.connDb" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>分析消费者对商品的行为</title>
	<link href="./css/style.css" type='text/css' rel="stylesheet"/>
	<script src="./js/echarts.min.js"></script>    
</head>
<body>
	<%	ArrayList<String[]> list = connDb.analyBehavior_type(); %>
	<div id="main"></div>
	<script>
		//基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		
	    // 指定图表的配置项和数据
	    var option = {
	        title: {
	            text: '分析消费者对商品的行为'
	        },
	        tooltip: {},
	        legend: {
	            data:['消费者对商品的行为']
	        },
	        xAxis: {
	        	type: 'category',
	            axisLabel:{
	              interval:0,  //类目全显
	              rotate:-45   //顺时针旋转45度
	            },
	            data: ["<%= list.get(0)[0] %>",
	            		"<%= list.get(1)[0] %>",
	            		"<%= list.get(2)[0] %>",
	            		"<%= list.get(3)[0] %>"
	            		],
	            		
	        },
	        yAxis: {},
	        series: [{
	            name: '出现次数',
	            type: 'bar',
	            data: ["<%= list.get(0)[1] %>",
	        		"<%= list.get(1)[1] %>",
	        		"<%= list.get(2)[1] %>",
	        		"<%= list.get(3)[1] %>"
	        		],
	        	barWidth: 30
	        }]
	    };
	
	    // 使用刚指定的配置项和数据显示图表。
	    myChart.setOption(option);
	</script>
	<h3 ><center><a href="index.jsp">首页</a> </center> <h3>
</body>
</html>
