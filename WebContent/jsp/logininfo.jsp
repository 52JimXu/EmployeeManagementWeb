<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	if(session.getAttribute("admin")==null){
		response.sendRedirect("../index.jsp");
	}else{
		if((int)session.getAttribute("admin")==0){
			response.sendRedirect("empmain.jsp");
		}
	}
%>
<head>
  <script src="../layer/jquery-1.11.3.min.js"></script>
    <script src="../layer/layer/layer.js"></script>
    <meta charset="UTF-8">
    <title>人力资源管理系统</title>
    <style type="text/css">
        .zy{
            width: 300px;
            height: 400px;
            padding-left: 26%;
            padding-top: 4%;
        }
       a:active{
           display: block;
           background-color: black;
       }
        a:hover{
            display: block;
            color: #fff;
           }
        a{
            padding-top: 4px;
            padding-left: 34px;
            height: 30px;
            color: black;
            display: block;
            text-decoration:none;
           background-color: #DCDCDC;
        }
        .xx{
            overflow: hidden;
            width: 170px;
            height: 30px;
            margin-top: 10px;
            border-radius: 25px;
            background-color: chartreuse;
        }
        .nav{
            padding-left: 16%;
            padding-top: 16%;
        }
        .nr{
            border-radius: 5px;
            position:fixed;
            left:37%;
            top: 65px;
            width: 387px;
            height: 532px;
            background-color:#C8C8C8;
        }
        .nr:hover{
            box-shadow: 0px 0px 8px #fff;
        }
        body{
            background-image: url("../image/bg.jpg");
            margin: 0px;
            padding: 0px;
        }
        .exit{
        	display:inline-block;
        	background-color:transparent;
        	padding:0;
        	color:white;
        	text-decoration:none;
        }
        .exit:hover{
        	display: inline-block;
            color: red;
            cursor:pointer;
        }
         .exit:active{
           
           display: inline-block;
           background-color:transparent;
       }
        .welcome{
        	width:170px;
        	height:25px;
        	float:right;
        	margin-right:300px;
        	color:white;
        }
     </style>
</head>
<body>
<br>
	<div class="welcome">欢迎你:${sessionScope.username },<a class="exit" href="exit.jsp">退出</a></div>
    <div class="nr">
        <div class="nav"><h1>人力资源管理系统</h1></div>
        <div class="zy">
            <div class="xx"><a onclick="layer.msg('努力加载中',{icon:16,shade: 0.01,time:5000})" href="getlogin.jsp">查询登录信息</a></div>
            <div class="xx"><a onclick="layer.msg('努力加载中',{icon:16,shade: 0.01,time:5000})" href="updatelogin.jsp">修改登录信息</a></div>
            <div class="xx"><a onclick="layer.msg('努力加载中',{icon:16,shade: 0.01,time:5000})" href="addlogin.jsp">新增登录信息</a></div>
            <div class="xx"><a onclick="layer.msg('努力加载中',{icon:16,shade: 0.01,time:5000})" href="deletelogin.jsp">删除登录信息</a></div>
            <div class="xx"><a onclick="layer.msg('努力加载中',{icon:16,shade: 0.01,time:5000})" href="main.jsp">退出登录管理</a></div>
        </div>
    </div>
    <div class="bg"></div>
</body>
</html>