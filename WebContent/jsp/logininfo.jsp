<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
     </style>
</head>
<body>
    <div class="nr">
        <div class="nav"><h1>人力资源管理系统</h1></div>
        <div class="zy">
            <div class="xx"><a href="getlogin.jsp">查询登录信息</a></div>
            <div class="xx"><a href="updatelogin.jsp">修改登录信息</a></div>
            <div class="xx"><a href="addlogin.jsp">新增登录信息</a></div>
            <div class="xx"><a href="deletelogin.jsp">删除登录信息</a></div>
            <div class="xx"><a href="main.jsp">退出登录管理</a></div>
        </div>
    </div>
    <div class="bg"></div>
</body>
</html>