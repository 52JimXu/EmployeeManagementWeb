<%@page import="java.util.List"%>
<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@page import="com.wwwxy.employeemanagement.entity.LoginEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>doaddemployee.jsp</title>
</head>
<body>
	<%
		//员工登录信息增加
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int empid = Integer.parseInt(request.getParameter("empid"));
		LoginEntity le = new LoginEntity();
		le.setAdmin(0);le.setEmpid(empid);le.setId(0);le.setPassword(password);le.setUsername(username);
		LoginDao ld = new LoginDao();
		boolean flag=false;
		List<LoginEntity> list = ld.getAllLogin();
		for(LoginEntity lists:list){
			if(lists.getEmpid() ==empid ){
				flag = true;
			}
		}
		
		if(flag){
			out.print("此员工已经存在登录信息");
		}else{
		
		int row = ld.addLogin(le);
		
		if(row==1){
			response.sendRedirect("getlogin.jsp");//	成功
		}else{
			out.print("失败");
		}
		}
		
		
	%>
</body>
</html>