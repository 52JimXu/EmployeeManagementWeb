<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		Integer id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		
		LoginDao ld = new LoginDao();
		
		int row = ld.updateLoginById2(id, username);
	 	 if(row==1){
			out.print("执行成功！");
			response.setHeader("refresh","3;updatelogin.jsp");
		}else{
			out.print("执行失败！");
			response.setHeader("refresh", "3;updatelogin.jsp");
		} 
	%>
</body>
</html>