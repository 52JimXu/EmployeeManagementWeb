<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Title</title>
</head>
<body>
<%
	Integer id = Integer.parseInt(request.getParameter("id"));
	String oldpassword = request.getParameter("oldpassword");
	String password = request.getParameter("password");
	int admin = (int)session.getAttribute("admin");
	LoginDao ld = new LoginDao();
	String oldpass = ld.getLoginById(id, oldpassword);
	if(admin==1){
		if(oldpassword.equals(oldpass)){
			int row = ld.UpdateLoginPassword(password, id);
			if(row == 1){
				out.print("修改成功");
				response.setHeader("refresh", "3;main.jsp");
			}else{
				out.print("修改失败");
			}
		}else{
			out.print("旧密码错误");
			response.setHeader("refresh", "3;updatepassword.jsp");
		}	
	}else{
		if(oldpassword.equals(oldpass)){
			int row = ld.UpdateLoginPassword(password, id);
			if(row == 1){
				out.print("修改成功");
				response.setHeader("refresh", "3;empmain.jsp");
			}else{
				out.print("修改失败");
			}
		}else{
			out.print("旧密码错误");
			response.setHeader("refresh", "3;updatepassword.jsp");
		}
	}

%>
</body>
</html>