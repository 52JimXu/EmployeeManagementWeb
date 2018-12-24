<%@page import="java.util.Iterator"%>
<%@page import="com.wwwxy.employeemanagement.entity.SalaryEntity"%>
<%@page import="java.util.List"%>
<%@page import="com.wwwxy.employeemanagement.dao.SalaryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工资记录删除</title>
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
		SalaryDao sd = new SalaryDao();
		List<SalaryEntity> list = sd.GetAllSalary();
		Iterator iter = list.iterator();
	%>
		
	<center>
		<h1>欢迎来到工资记录删除</h1>
	
	
		<table>
			<tr>
				<td>工资编号</td>
				<td>员工编号</td>
				<td>事项编号</td>
				<td>工资总和</td>
				<td>发工资时间</td>
			</tr>
			
			
			<% 
			int i = 0;
			while(iter.hasNext()){
				SalaryEntity se = (SalaryEntity)iter.next();
		%>		
		<tr <%if(i%2==0){ %>bgcolor="darkgray" <% }%>>
			<td><%out.print(se.getsId()); %></td>
			<td><%out.print(se.getEmpId()); %></td>
			<td><%out.print(se.geteId()); %></td>
			<td><%out.print(se.getsSum()); %></td>
			<td><%out.print(se.getsTime()); %></td>
			<td><a href="doupdatesalary.jsp?id=<%=se.getsId()%>">删除</a></td>
		</tr>
		<%		
			i++;	
			}
		%>
		</table>
		</center>
</body>
</html>