<%@page import="com.wwwxy.employeemanagement.dao.EmployeeDao"%>
<%@page import="com.wwwxy.employeemanagement.entity.EmployeeEntity"%>
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
		String empname = request.getParameter("empname");
		String empsex = request.getParameter("sex");
		int empage = Integer.parseInt(request.getParameter("empage")); 
		String empbirthday = request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day");
		float empbasic =Float.valueOf(request.getParameter("empbasic"));
		String empemail = request.getParameter("empemail");
		out.print(empemail);
		String empaddress = request.getParameter("empaddress");
		
		EmployeeEntity ee = new EmployeeEntity(0, empname,empsex,
				empage, empbirthday, empbasic,
				empemail, empaddress);
		EmployeeDao ed = new EmployeeDao();
		 int row = ed.AddEmployee(ee);
		if(row ==1){
			response.sendRedirect("getemployee.jsp");//成功
		}else{
			out.print("失败");
		} 
		
	%>
</body>
</html>