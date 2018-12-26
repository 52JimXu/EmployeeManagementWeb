<%@page import="com.wwwxy.employeemanagement.entity.CheckDetails"%>
<%@page import="com.wwwxy.employeemanagement.dao.CheckDetailsDao"%>
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
		String status = request.getParameter("status");
		CheckDetails cd = new CheckDetails(id,status);
		CheckDetailsDao cdd = new CheckDetailsDao();
		 int row = cdd.updatestatusBYCidone(cd);
		if(row==1){
			out.print("执行成功！");
			response.setHeader("refresh","3;updatecheckdetails.jsp");
		}else{
			out.print("执行失败！");
			response.setHeader("refresh", "3;updatecheckdetails.jsp");
		} 
	%>
</body>
</html>