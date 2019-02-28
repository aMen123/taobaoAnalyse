<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dbUesrBehavior.connDb" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<div id="main" style="width:100%;height:100%;"></div>
    <title>单词出现次数对比(饼图)</title>
	<link href="./css/style.css" type='text/css' rel="stylesheet"/>

	<script src="./js/echarts.min.js"></script>   
	<script src="./js/china.js"></script>   
	
</head>
<body>
	<%	ArrayList<String[]> list = connDb. analyProvinceScan(); %>
	
	<script>
        // 路径配置
        require.config({
            paths: {
                echarts: './js'
            }
        });
        var mydata = [
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
          ];
        var option = { 
        		backgroundColor: '#FFFFFF', 
        		title: { 
        			text: '全国地图', 
        			subtext: '纯属虚构', 
        			x:'center' }, 
        		tooltip : { 
        			trigger: 'item' }, 
        		visualMap: { 
        			show : false,
        			x: 'left', 
        			y: 'bottom',
        			splitList: 
        				[ {start: 500, end:600},
        					{start: 400, end: 500}, 
        					{start: 300, end: 400},
        					{start: 200, end: 300},
        					{start: 100, end: 200},
        					{start: 0, end: 100}, ],
        			color: [
        				'#66CC33', 
        				'#00FF00',
        				'#66FF33',
        				'#339900',
        				'#33CC00', 
        				'#00CC00'] 
        			}, 
        			series: [{
        				name: '随机数据',
        					type: 'map', 
        					mapType: 'china', 
        					roam: true, 
        				label: { 
        					normal: { show: false },
        					emphasis: { show: false } 
        					},
        				data:mydata
        			}] 
        		}; 
        var chart = echarts.init(document.getElementById('main')); 
        chart.setOption(option);
        chart.on('mouseover', function (params) {
            var dataIndex = params.dataIndex;
            console.log(params);
        });
    </script>
</body>
</html>
