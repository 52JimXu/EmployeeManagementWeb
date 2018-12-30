<%@page import="com.wwwxy.employeemanagement.dao.SignMethodDao"%>
<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@page import="com.wwwxy.employeemanagement.dao.CheckDetailsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Title</title>
</head>
	<script src="../layer/jquery-1.11.3.min.js"></script>
	<script src="../layer/layer/layer.js"></script>
<body>
	<%
		int id = (int)session.getAttribute("id");
		int empid = new LoginDao().getEmpidById(id);
		CheckDetailsDao cdd = new CheckDetailsDao();
		int c = Integer.parseInt(request.getParameter("c"));
		if(c==1){
			int i = cdd.GetCheckin(empid);
			if(i==0){
				cdd.checkin(empid);
				%>
				<script>
				layer.msg('加载中', {
					  icon: 16
					  ,shade: 0.01,
					  area: ['180px', '65px'],
					  time:2000
					});
					setTimeout(function(){
					layer.alert('签到成功', {
					  icon: 1,
					  skin: 'layer-ext-moon' 
					});
					}, 1000);
				</script>
				<% 
				response.setHeader("refresh","3;docheck.jsp");
			}else{
				%>
				<script>
				layer.msg('加载中', {
					  icon: 16
					  ,shade: 0.01,
					  area: ['180px', '65px'],
					  time:2000
					});
					setTimeout(function(){
					layer.alert('签到失败，你已经签过到了', {
					  icon: 2,
					  skin: 'layer-ext-moon' 
					});
					}, 1000);
				</script>
				<% 
				response.setHeader("refresh","3;docheck.jsp");
			}
		}else{
			int i = cdd.GetCheckin(empid);
			if(i==0){
				%>
				<script>
				layer.msg('加载中', {
					  icon: 16
					  ,shade: 0.01,
					  area: ['180px', '65px'],
					  time:2000
					});
					setTimeout(function(){
					layer.alert('签退失败，你还没有签到', {
					  icon: 2,
					  skin: 'layer-ext-moon' 
					});
					}, 1000);
				</script>
				<% 
				response.setHeader("refresh","3;docheck.jsp");
			}else{
				cdd.checkout(empid);
				%>
				<script>
				layer.msg('加载中', {
					  icon: 16
					  ,shade: 0.01,
					  area: ['180px', '65px'],
					  time:2000
					});
					setTimeout(function(){
					layer.alert('签退成功', {
					  icon: 1,
					  skin: 'layer-ext-moon' 
					});
					}, 1000);
				</script>
				<% 
				String cstatus = cdd.GetCheckStatus();
				new SignMethodDao().UpdateEventByEmpid(empid, 0);
				response.setHeader("refresh","3;docheck.jsp");
			}
		}
	%>
</body>
</html>