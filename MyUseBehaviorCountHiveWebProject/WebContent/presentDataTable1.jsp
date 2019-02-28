<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="dbUesrBehavior.connDb" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>  查看前10位用户对商品的行为 </title>
</head>
<body>
      <h1 ><center>分析消费者对商品的行为 </center> </h1>
	<table align="center" width="60%" cellspacing="1" cellpadding="0" border="0" bgcolor="#ccc">
		
		<tr align="center" bgcolor="#ffffff">
			<td width="15%">用户ID</td>          
			<td width="10%">行为</td>
		</tr>
	    <%
	    	ArrayList<String[]> list = connDb.findTopBehavior_type();
            
	    	for(int i = 0; i < list.size(); i++) {
	    		out.println("<tr align='center' bgcolor='#ffffff'>");
	    		out.println("<td height=30px>" + list.get(i)[0] +"</td>");
               	out.println("<td height=30px>" + list.get(i)[1] +"</td>");
               	out.println("</tr>");
            }
        %>
	</table>
	 <h3 ><center><a href="index.jsp">首页</a> </center> <h3>
</body>
</html>
