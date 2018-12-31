<%@page import="com.wwwxy.employeemanagement.entity.CheckDetails"%>
<%@page import="com.wwwxy.employeemanagement.dao.CheckDetailsDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
  <script src="../layer/jquery-1.11.3.min.js"></script>
    <script src="../layer/layer/layer.js"></script>
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
			%>
			<script type="text/javascript">
				layer.confirm('执行成功', {
				  btn: ['确定'], //按钮
				  icon:1
				}, function(){
					window.document.location.href="updatecheckdetails.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=updatecheckdetails.jsp");
		}else{
			%>
			<script type="text/javascript">
				layer.confirm('执行失败', {
				  btn: ['确定'], //按钮
				  icon:2
				}, function(){
					window.document.location.href="updatecheckdetails.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=updatecheckdetails.jsp");
		} 
	%>
</body>
</html>