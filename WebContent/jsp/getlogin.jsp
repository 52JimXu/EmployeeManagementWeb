<%@page import="com.wwwxy.employeemanagement.entity.LoginEntity"%>
<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录信息查询</title>
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
		LoginDao ld = new LoginDao();
		List<LoginEntity> list = ld.getAllLogin();
		Iterator iter = list.iterator();
	%>
		
	<center>
		<h1>欢迎来到登录信息查询</h1>
	
	
		<table>
			<tr>
				<td>登录编号</td>
				<td>用户名</td>
				<td>密码</td>
				<td>是否为管理员</td>
				<td>员工编号</td>
			</tr>
			
			
			<% 
			int i = 0;
			while(iter.hasNext()){
				LoginEntity le = (LoginEntity)iter.next();
		%>		
		<tr <%if(i%2==0){ %>bgcolor="darkgray" <% }%>>
			<td><%out.print(le.getId()); %></td>
			<td><%out.print(le.getUsername()); %></td>
			<td><strong>······</strong></td>
			<td><%if(le.getAdmin()==0){
				out.print("否");
			}else{
				out.print("是");
			} %></td>
			<td><%if(le.getEmpid()==0){
				out.print("无");
			}else{
				out.print(le.getEmpid());
			} %></td>
		</tr>
		<%		
			i++;	
			}
		%>
		</table>
		</center>
</body>
</html>