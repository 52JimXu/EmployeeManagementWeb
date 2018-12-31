<%@page import="java.util.List"%>
<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@page import="com.wwwxy.employeemanagement.entity.LoginEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>doaddemployee.jsp</title>
</head>
  <script src="../layer/jquery-1.11.3.min.js"></script>
    <script src="../layer/layer/layer.js"></script>
<body>
	<%
		//员工登录信息增加
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int empid = Integer.parseInt(request.getParameter("empid"));
		LoginEntity le = new LoginEntity();
		le.setAdmin(0);le.setEmpid(empid);le.setId(0);le.setPassword(password);le.setUsername(username);
		LoginDao ld = new LoginDao();
		boolean flag=false;
		List<LoginEntity> list = ld.getAllLogin();
		for(LoginEntity lists:list){
			if(lists.getEmpid() ==empid ){
				flag = true;
			}
		}
		
		if(flag){
			%>
			<script type="text/javascript">
				layer.confirm('执行失败,此员工已存在', {
				  btn: ['确定'], //按钮
				  icon:2
				}, function(){
					window.document.location.href="getlogin.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=getlogin.jsp");
		}else{
		
		int row = ld.addLogin(le);
		
		if(row==1){
			%>
			<script type="text/javascript">
				layer.confirm('执行成功', {
				  btn: ['确定'], //按钮
				  icon:1
				}, function(){
					window.document.location.href="getlogin.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=getlogin.jsp");
		}else{
			%>
			<script type="text/javascript">
				layer.confirm('系统错误，请稍后再试', {
				  btn: ['确定'], //按钮
				  icon:0
				}, function(){
					window.document.location.href="getlogin.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=getlogin.jsp");
		}
		}
		
		
	%>
</body>
</html>