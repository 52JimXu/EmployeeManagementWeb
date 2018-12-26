<%@page import="com.wwwxy.employeemanagement.dao.SalaryDao"%>
<%@page import="com.wwwxy.employeemanagement.control.SalaryControl"%>
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
		String time = request.getParameter("year")+"-"+request.getParameter("month")+"-"+
						request.getParameter("day");
		SalaryDao sd = new SalaryDao();
		
		int row = sd.updatedateone(id, time);
		
	 	if(row==1){
			out.print("执行成功！");
			response.setHeader("refresh","3;updatesalary.jsp");
		}else{
			out.print("执行失败！");
			response.setHeader("refresh", "3;updatesalary.jsp");
		} 
	%>
</body>
</html>