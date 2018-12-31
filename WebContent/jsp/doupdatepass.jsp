<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <script src="../layer/jquery-1.11.3.min.js"></script>
    <script src="../layer/layer/layer.js"></script>
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
				%>
				<script type="text/javascript">
					layer.confirm('执行成功', {
					  btn: ['确定'], //按钮
					  icon:1
					}, function(){
						window.document.location.href="main.jsp";
					});
				</script>
				
				<% 
				response.setHeader("refresh", "10;URL=main.jsp");
			}else{
				%>
				<script type="text/javascript">
					layer.confirm('系统异常，请稍后再试', {
					  btn: ['确定'], //按钮
					  icon:3
					}, function(){
						window.document.location.href="main.jsp";
					});
				</script>
				
				<% 
				response.setHeader("refresh", "10;URL=main.jsp");
			}
		}else{
			%>
			<script type="text/javascript">
				layer.confirm('修改失败，旧密码错误', {
				  btn: ['确定'], //按钮
				  icon:2
				}, function(){
					window.document.location.href="updatepassword.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=updatepassword.jsp");
		}	
	}else{
		if(oldpassword.equals(oldpass)){
			int row = ld.UpdateLoginPassword(password, id);
			if(row == 1){
				%>
				<script type="text/javascript">
					layer.confirm('执行成功', {
					  btn: ['确定'], //按钮
					  icon:1
					}, function(){
						window.document.location.href="empmain.jsp";
					});
				</script>
				
				<% 
				response.setHeader("refresh", "10;URL=empmain.jsp");
			}else{
				%>
				<script type="text/javascript">
					layer.confirm('系统异常，请稍后再试', {
					  btn: ['确定'], //按钮
					  icon:3
					}, function(){
						window.document.location.href="empmain.jsp";
					});
				</script>
				
				<% 
				response.setHeader("refresh", "10;URL=empmain.jsp");
			}
		}else{
			%>
			<script type="text/javascript">
				layer.confirm('修改失败，旧密码错误', {
				  btn: ['确定'], //按钮
				  icon:2
				}, function(){
					window.document.location.href="updatepassword.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=updatepassword.jsp");
		}
	}

%>
</body>
</html>