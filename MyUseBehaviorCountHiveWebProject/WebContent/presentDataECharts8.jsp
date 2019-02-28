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
	<%	ArrayList<String[]> list = connDb.analyProvinceBuy(); %>
	<div id="main"></div>
	<script>
		//基于准备好的dom，初始化echarts实例
		var myChart = echarts.init(document.getElementById('main'));
		
	    // 指定图表的配置项和数据
	    var option = {
	    	    title : {
	    	        text: '各省份购买商品的比例分析',
	    	        x:'center'
	    	    },
	    	    tooltip : {
	    	        trigger: 'item',
	    	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    	    },
	    	    series : [
	    	        {
	    	            name: '各省份购买商品的比例分析',
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
			                {value:<%=list.get(9)[1]%>, name: '<%=list.get(9)[0]%>'},
			                {value:<%=list.get(10)[1]%>, name: '<%=list.get(10)[0]%>'},
			                {value:<%=list.get(11)[1]%>, name: '<%=list.get(11)[0]%>'},
			                {value:<%=list.get(12)[1]%>, name: '<%=list.get(12)[0]%>'},
			                
			                {value:<%=list.get(13)[1]%>, name: '<%=list.get(13)[0]%>'},
			                {value:<%=list.get(14)[1]%>, name: '<%=list.get(14)[0]%>'},
			                {value:<%=list.get(15)[1]%>, name: '<%=list.get(15)[0]%>'},
			                {value:<%=list.get(16)[1]%>, name: '<%=list.get(16)[0]%>'},
			                {value:<%=list.get(17)[1]%>, name: '<%=list.get(17)[0]%>'},
			                {value:<%=list.get(18)[1]%>, name: '<%=list.get(18)[0]%>'},
			                {value:<%=list.get(19)[1]%>, name: '<%=list.get(19)[0]%>'},
			                {value:<%=list.get(20)[1]%>, name: '<%=list.get(20)[0]%>'},
			                {value:<%=list.get(21)[1]%>, name: '<%=list.get(21)[0]%>'},
			                {value:<%=list.get(22)[1]%>, name: '<%=list.get(22)[0]%>'},
			                {value:<%=list.get(23)[1]%>, name: '<%=list.get(23)[0]%>'},
			                {value:<%=list.get(24)[1]%>, name: '<%=list.get(24)[0]%>'},
			                {value:<%=list.get(25)[1]%>, name: '<%=list.get(25)[0]%>'},
			                {value:<%=list.get(26)[1]%>, name: '<%=list.get(26)[0]%>'},
			                {value:<%=list.get(27)[1]%>, name: '<%=list.get(27)[0]%>'},
			                {value:<%=list.get(28)[1]%>, name: '<%=list.get(28)[0]%>'},
			                {value:<%=list.get(29)[1]%>, name: '<%=list.get(29)[0]%>'},
			                {value:<%=list.get(30)[1]%>, name: '<%=list.get(30)[0]%>'},
			                {value:<%=list.get(31)[1]%>, name: '<%=list.get(31)[0]%>'},
			                {value:<%=list.get(32)[1]%>, name: '<%=list.get(32)[0]%>'},
			                {value:<%=list.get(33)[1]%>, name: '<%=list.get(33)[0]%>'}
			                
		                  
		              
		                    
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
