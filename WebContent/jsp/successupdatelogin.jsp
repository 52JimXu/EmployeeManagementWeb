<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
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
		String username = request.getParameter("username");
		
		LoginDao ld = new LoginDao();
		
		int row = ld.updateLoginById2(id, username);
	 	 if(row==1){
	 		%>
			<script type="text/javascript">
				layer.confirm('执行成功', {
				  btn: ['确定'], //按钮
				  icon:1
				}, function(){
					window.document.location.href="updatelogin.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=updatelogin.jsp");
		}else{
			%>
			<script type="text/javascript">
				layer.confirm('执行失败', {
				  btn: ['确定'], //按钮
				  icon:2
				}, function(){
					window.document.location.href="updatelogin.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=updatelogin.jsp");
		} 
	%>
</body>
</html>