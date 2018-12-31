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
		//管理员增加
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LoginEntity le = new LoginEntity();
		le.setAdmin(1);le.setEmpid(0);le.setId(0);le.setPassword(password);le.setUsername(username);
		LoginDao ld = new LoginDao();
		
		boolean flag=false;
		List<LoginEntity> list = ld.getAllLogin();
		for(LoginEntity lists:list){
			if(username.equals(lists.getUsername()) ){
				flag = true;
			}
		}
		
		if(flag){
			%>
			<script type="text/javascript">
				layer.confirm('执行失败,此管理员已存在', {
				  btn: ['确定'], //按钮
				  icon:2
				}, function(){
					window.document.location.href="getlogin.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=getlogin.jsp");
		}else{
			int row = ld.addLoginAdmin(le);
		
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