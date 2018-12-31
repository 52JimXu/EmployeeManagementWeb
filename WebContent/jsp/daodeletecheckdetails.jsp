<%@page import="com.wwwxy.employeemanagement.dao.CheckDetailsDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	if(session.getAttribute("admin")==null){
		response.sendRedirect("../login.jsp");
	}else{
		if((int)session.getAttribute("admin")==0){
			response.sendRedirect("empmain.jsp");
		}
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
  <script src="../layer/jquery-1.11.3.min.js"></script>
    <script src="../layer/layer/layer.js"></script>
</head>
<body>
	<%
		Integer id = Integer.parseInt(request.getParameter("id")); 
		CheckDetailsDao cdd = new CheckDetailsDao();
		int row = cdd.delCheckDetailsBYCid(id);
		if(row==1){
			%>
			<script type="text/javascript">
				layer.confirm('执行成功', {
				  btn: ['确定'], //按钮
				  icon:1
				}, function(){
					window.document.location.href="deletecheckdetails.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=deletecheckdetails.jsp");
		}else{
			%>
			<script type="text/javascript">
				layer.confirm('执行失败', {
				  btn: ['确定'], //按钮
				  icon:2
				}, function(){
					window.document.location.href="deletecheckdetails.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=deletecheckdetails.jsp");
		}
	%>
</body>
</html>