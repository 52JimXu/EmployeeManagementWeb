<%@page import="com.wwwxy.employeemanagement.dao.EmployeeDao"%>
<%@page import="com.wwwxy.employeemanagement.entity.EmployeeEntity"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <script src="../layer/jquery-1.11.3.min.js"></script>
    <script src="../layer/layer/layer.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		Integer id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		Integer age = Integer.parseInt(request.getParameter("age")); 
		String birthday = request.getParameter("year")+"-"+
							request.getParameter("month")+"-"+request.getParameter("day");
		Float basic =Float.valueOf(request.getParameter("basic"));
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		EmployeeEntity ee = new EmployeeEntity(id,name,sex,age,birthday,basic,email,address);
		EmployeeDao ed = new EmployeeDao();
		
		int row = ed.UpdateEmployeeone(ee);
	 	 if(row==1){
	 		%>
			<script type="text/javascript">
				layer.confirm('执行成功', {
				  btn: ['确定'], //按钮
				  icon:1
				}, function(){
					window.document.location.href="updateemployee.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=updateemployee.jsp");
		}else{
			%>
			<script type="text/javascript">
				layer.confirm('执行失败', {
				  btn: ['确定'], //按钮
				  icon:2
				}, function(){
					window.document.location.href="updateemployee.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=updateemployee.jsp");
		}  
	%>
</body>
</html>