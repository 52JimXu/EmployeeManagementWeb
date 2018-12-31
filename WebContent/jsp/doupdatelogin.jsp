<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@page import="com.wwwxy.employeemanagement.entity.LoginEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录信息修改</title>
<style type="text/css">
	form{
		margin:0px;
		font-size:15px;
		margin-right:60px;
	}
	label{
	            display: inline-block;
	            width: 120px;/*或者 width: 100px;*/
	        }
	#submit{
		width:60px;
		height:40px;
		font-size:17px;
		margin:20px 0 0 80px;
	}
	#submit:hover{
		cursor:pointer;
	}
	input{
                border: 1px solid #ccc; 
                padding: 7px 0px;
                border-radius: 3px; /*css3属性IE不支持*/
                padding-left:5px; 
            }
     span{
     	font-size:12px;
     }
     select{
     	border: 1px solid #ccc; 
                padding: 7px 0px;
                border-radius: 3px; /*css3属性IE不支持*/
                padding-left:5px; 
     }
     .username{
     	margin-right:55px;
     }
      .a{
	    height: 25px;
	    color: black;
	    text-decoration: none;
	    background-color: #DCDCDC;
	    font-size:15px;
	    border-radius:5px;
	    display:inline-block;
	    margin-right:200px;
	} 
    a{
		font-size:15px;
	}
     .return{
	/* float:left;	 */
	margin-right:16%;
	}
    #head{
		width:100%;
	}
	center{
		width:600px;
		height:490px;
		margin:50px auto;
	    background-color: white;
	}
	body{
		background-image: url("../image/bg.jpg");
        margin: 0px;
        padding: 0px;
		background-attachment:fixed;
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
	<%
		LoginEntity le = new LoginEntity();
		int id = Integer.parseInt(request.getParameter("id"));
		LoginDao sd = new LoginDao();
		le = sd.getLoginById0(id);
		pageContext.setAttribute("id", id);
		pageContext.setAttribute("login", le);
	%>
	
<br>
	<div class="welcome">欢迎你:${sessionScope.username },<a class="exit" href="exit.jsp">退出</a></div>	
	<center>
	<br>
	<h1>欢迎来到登录信息修改</h1>
	<br>
	<div id= "head">
		<div class="return"><a href="updatelogin.jsp" class="a">返回登录信息修改</a></div>
	</div>
	<br>
		<form name="myform" action="successupdatelogin.jsp?id=${id }" method="post">
			<label for="inputs">登录编号:</label><input class="disabled" type="text" disabled="disabled" value="${id }"><span>*不可修改</span><br><br>
			<label for="inputs">员工编号:</label><input class="disabled" type="text" disabled="disabled" value="${login.empid }"><span>*不可修改</span><br><br>
			<div class="username"><label for="inputs">用户名:</label><input name="username" type="text" value="${login.username }"></div><br>
			<label for="inputs">是否管理员</label>
			<c:choose>
				<c:when test="${login.admin == 1 }">
					<input name="sex" type="radio" disabled value="是" checked/>是
					<input name="sex" type="radio" disabled value="否"/>否
				</c:when>
				<c:otherwise>
					<input name="sex" type="radio" disabled value="是"/>是
					<input name="sex" type="radio" disabled value="否" checked/>否
				</c:otherwise>
			</c:choose>
			<span>*不可修改</span>
			
			
			
			<br><br>
			
			
			<input type="submit" id="submit" value="修改">
			
		</form>
	
	</center>
</body>
</html>