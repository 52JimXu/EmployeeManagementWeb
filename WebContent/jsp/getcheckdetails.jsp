<%@page import="com.wwwxy.employeemanagement.entity.CheckDetails"%>
<%@page import="com.wwwxy.employeemanagement.dao.CheckDetailsDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考勤记录查询</title>
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
		CheckDetailsDao cdd = new CheckDetailsDao();
		List<CheckDetails> list = cdd.getAllCheckDetails();
		Iterator iter = list.iterator();
	%>
		
	<center>
		<h1>欢迎来到考勤记录查询</h1>
	
	
		<table>
			<tr>
				<td>考勤编号</td>
				<td>员工编号</td>
				<td>上班打卡</td>
				<td>下班打卡</td>
				<td>考勤状态</td>
				<td>考勤时间</td>
			</tr>
			
			
			<% 
			int i = 0;
			while(iter.hasNext()){
				CheckDetails cd = (CheckDetails)iter.next();
		%>		
		<tr <%if(i%2==0){ %>bgcolor="darkgray" <% }%>>
			<td><%out.print(cd.getCid()); %></td>
			<td><%out.print(cd.getEmpid()); %></td>
			<td><%out.print(cd.getCcheckin()); %></td>
			<td><%out.print(cd.getCcheckout()); %></td>
			<td><%out.print(cd.getCstatus()); %></td>
			<td><%out.print(cd.getCdate()); %></td>
		</tr>
		<%		
			i++;	
			}
		%>
		</table>
		</center>
</body>
</html>