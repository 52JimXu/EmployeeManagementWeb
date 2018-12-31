<%@page import="com.wwwxy.employeemanagement.dao.CheckDetailsDao"%>
<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	 if(session.getAttribute("admin")==null){
		response.sendRedirect("../index.jsp");
	}else{
		if((int)session.getAttribute("admin")==1){
			response.sendRedirect("main.jsp");
		}
	} 
%>
<head>
<script src="../layer/jquery-1.11.3.min.js"></script>
	<script src="../layer/layer/layer.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考勤打卡</title>
	<style type="text/css">
		body{
			margin:0;
			background-image:url("../image/bg.jpg");
		}
		#head{
		width:100%;
		display:inline-block;
	}
			a{
			height: 25px;
	    color: black;
	    text-decoration: none;
	    background-color: #DCDCDC;
	    font-size:15px;
	    border-radius:5px;
		}
		.box{
			width:500px;
			height:350px;
			margin:100px auto;
			background-color:white;
		}
		.checkin{
			height:20px;
			width:100px;
			margin:0 auto;
			text-align:center;
			border-radius: 25px;
            background-color: #DCDCDC;
		}
		.checkin:hover{
			cursor:pointer;
			color: #fff;
		}
		.checkout{
			height:20px;
			width:100px;
			margin:0 auto;
			text-align:center;
			border-radius: 25px;
            background-color: #DCDCDC;
		}
		.checkout:hover{
			cursor:pointer;
			color: #fff;
		}
		h1{	
	margin:0;
	text-align:center;
}
.return{
	float:left;	
	margin-left:70px;
}
	</style>
</head>
<script>
		function checkin(){
			layer.msg('疯狂加载中', {
				  icon: 16
				  ,shade: 0.01,
				});	
		}
	</script>
	
<body onload="check()">
		<div  class="box">
		<br>
		<h1>欢迎来到考勤记录查询</h1>
	<br>
		<div id= "head">
			<div class="return"><a href="checkdetail.jsp">返回管理系统</a></div>
		</div>
		<br><br><br>
		<div class="checkin" onclick="checkin()"><a href="daodocheck.jsp?c=1">上班打卡</a></div>
		<br><br><br>
		<div class="checkin" onclick="checkin()"><a href="daodocheck.jsp?c=2">下班打卡</a></div>
		
	</div>
</body>
</html>