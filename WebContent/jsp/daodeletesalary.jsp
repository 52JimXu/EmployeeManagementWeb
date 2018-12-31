<%@page import="com.wwwxy.employeemanagement.dao.SalaryDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
  <script src="../layer/jquery-1.11.3.min.js"></script>
    <script src="../layer/layer/layer.js"></script>
<body>
	<%
		Integer id = Integer.parseInt(request.getParameter("id")); 
		SalaryDao ld = new SalaryDao();
		int row = ld.delete(id);
		if(row==1){
			%>
			<script type="text/javascript">
				layer.confirm('执行成功', {
				  btn: ['确定'], //按钮
				  icon:1
				}, function(){
					window.document.location.href="deletesalary.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=deletesalary.jsp");
		}else{
			%>
			<script type="text/javascript">
				layer.confirm('执行失败', {
				  btn: ['确定'], //按钮
				  icon:2
				}, function(){
					window.document.location.href="deletesalary.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=deletesalary.jsp");
		}
	%>
</body>
</html>