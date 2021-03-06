<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dbUesrBehavior.connDb" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>浏览排名前十的不同种类商品在某天的浏览比例分析(饼图)</title>
	<link href="./css/style.css" type='text/css' rel="stylesheet"/>
	<script src="./js/echarts.min.js"></script>    
</head>
<body>
	<%	ArrayList<String[]> list = connDb.analyKindItemTopScan(); %>
	<div id="main"></div>
	<script>
		//基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		
	    // 指定图表的配置项和数据
	    var option = {
	    	    title : {
	    	        text: '不同种类商品在某天的购买比例分析',
	    	        x:'center'
	    	    },
	    	    tooltip : {
	    	        trigger: 'item',
	    	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    	    },
	    	    series : [
	    	        {
	    	            name: '浏览次数',
	    	            type: 'pie',
	    	            radius : '55%',
	    	            center: ['40%', '50%'],
	    	            data: [
	    	            	{value:<%=list.get(0)[1]%>, name: '<%=list.get(0)[0]%>'},
		                    {value:<%=list.get(1)[1]%>, name: '<%=list.get(1)[0]%>'},
		                    {value:<%=list.get(2)[1]%>, name: '<%=list.get(2)[0]%>'},
		                    {value:<%=list.get(3)[1]%>, name: '<%=list.get(3)[0]%>'},
		                    {value:<%=list.get(4)[1]%>, name: '<%=list.get(4)[0]%>'},
		                    {value:<%=list.get(5)[1]%>, name: '<%=list.get(5)[0]%>'},
		                    {value:<%=list.get(6)[1]%>, name: '<%=list.get(6)[0]%>'},
		                    {value:<%=list.get(7)[1]%>, name: '<%=list.get(7)[0]%>'},
		                    {value:<%=list.get(8)[1]%>, name: '<%=list.get(8)[0]%>'},
		                    {value:<%=list.get(9)[1]%>, name: '<%=list.get(9)[0]%>'}
		              
		                    
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
