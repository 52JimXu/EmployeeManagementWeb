<%@page import="com.wwwxy.employeemanagement.entity.EventEntity"%>
<%@page import="com.wwwxy.employeemanagement.dao.EventDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>事项记录查询</title>
<style type= "text/css">
	td{
		text-align:center;
		width:120px;
		font-size:20px;
	}
</style>
</head>
<body>
	<%
		EventDao ed = new EventDao();
		List<EventEntity> list = ed.getAllEvent();
		Iterator iter = list.iterator();
	%>
		
	<center>
		<h1>欢迎来到事项记录查询</h1>
	
	
		<table>
			<tr>
				<td>事项编号</td>
				<td>员工编号</td>
				<td>迟到早退次数</td>
				<td>加班次数</td>
				<td>旷工次数</td>
				<td>事项奖惩</td>
			</tr>
			
			
			<% 
			int i = 0;
			while(iter.hasNext()){
				EventEntity ee = (EventEntity)iter.next();
		%>		
		<tr <%if(i%2==0){ %>bgcolor="darkgray" <% }%>>
			<td><%out.print(ee.geteId()); %></td>
			<td><%out.print(ee.geteMpid()); %></td>
			<td><%out.print(ee.geteClocking()); %></td>
			<td><%out.print(ee.geteOvertime()); %></td>
			<td><%out.print(ee.geteBigevent()); %></td>
			<td><%out.print(ee.geteAward()); %></td>
		</tr>
		<%		
			i++;	
			}
		%>
		</table>
		</center>
</body>
</html>