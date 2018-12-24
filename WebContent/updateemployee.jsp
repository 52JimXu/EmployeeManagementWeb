<%@page import="com.wwwxy.employeemanagement.entity.EmployeeEntity"%>
<%@page import="com.wwwxy.employeemanagement.dao.EmployeeDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工信息修改</title>
<style type= "text/css">
	td{
		text-align:center;
		width:120px;
		font-size:20px;
	}
	a{
		font-size: 20px;
		color: #000000;
		text-decoration:none
	}
	a:link {
		font-size: 20px;
		color: #000000;
		text-decoration: none;
	}
	a:visited {
	 	font-size: 20px;
	 	color: #000000;
	 	text-decoration: none;
	}
	a:hover {
		font-size: 20px;
		color: blue;
		text-decoration: underline;
	}
</style>
</head>
<body>
	<%
		EmployeeDao ed = new EmployeeDao();
		List<EmployeeEntity> list = ed.getAllEmployee();
		Iterator iter = list.iterator();
	%>
		
	<center>
		<h1>欢迎来到员工信息修改</h1>
	
	
		<table>
			<tr>
				<td>员工编号</td>
				<td>员工姓名</td>
				<td>员工性别</td>
				<td>员工年龄</td>
				<td>员工生日</td>
				<td>员工工资</td>
				<td>员工邮箱</td>
				<td>员工地址</td>
			</tr>
			
			
			<% 
			int i = 0;
			while(iter.hasNext()){
				EmployeeEntity ee = (EmployeeEntity)iter.next();
		%>		
		<tr <%if(i%2==0){ %>bgcolor="darkgray" <% }%>>
			<td><%out.print(ee.getEmpId()); %></td>
			<td><%out.print(ee.getEmpName()); %></td>
			<td><%out.print(ee.getEmpSex()); %></td>
			<td><%out.print(ee.getEmpAge()); %></td>
			<td><%out.print(ee.getEmpBirthday()); %></td>
			<td><%out.print(ee.getEmpBasic()); %></td>
			<td><%out.print(ee.getEmpEmail()); %></td>
			<td><%out.print(ee.getEmpAddress()); %></td>
			<td><a href="doupdateemployee.jsp?id=<%=ee.getEmpId() %>">修改</a></td>
		</tr>
		<%		
			i++;	
			}
		%>
		</table>
		</center>
</body>
</html>