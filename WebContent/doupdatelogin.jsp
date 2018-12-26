<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@page import="com.wwwxy.employeemanagement.entity.LoginEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录信息修改</title>
<style type="text/css">
	form{
		margin:0px;
		font-size:20px;
	}
	label{
	            display: inline-block;
	            width: 120px;/*或者 width: 100px;*/
	        }
	#submit{
		width:100px;
		height:50px;
		font-size:25px;
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
</style>
</head>
<body>
<%! 
		int id;
		int empid;
		int admin;
		String username;
	%>
	<%
		LoginEntity le = new LoginEntity();
		int id = Integer.parseInt(request.getParameter("id"));
		LoginDao sd = new LoginDao();
		le = sd.getLoginById0(id);
		
			id = le.getId();
			empid = le.getEmpid();
			admin = le.getAdmin();
			username = le.getUsername();
			
			boolean flag;
			if(admin==1){
				flag = true;
			}else{
				flag=false;
			}
	%>
	
	
	<center>
	<h1>欢迎来到登录信息修改</h1>
		<form name="myform" action="successupdatelogin.jsp?id=<%=id%>" method="post">
			<label for="inputs">登录编号:</label><input class="disabled" type="text" disabled="disabled" value="<%=id%>"><span>*不可修改</span><br><br>
			<label for="inputs">员工编号:</label><input class="disabled" type="text" disabled="disabled" value="<%=empid%>"><span>*不可修改</span><br><br>
			<div class="username"><label for="inputs">用户名:</label><input name="username" type="text" value="<%=username%>"></div><br>
			<label for="inputs">是否管理员</label>
			
			<input name="admin" type="radio" disabled value="是" <%if(flag){%>checked<% } %>/>是
			<input name="admin" type="radio" disabled value="否" <%if(!flag){%>checked<% } %>/>否
			<span>*不可修改</span>
			
			
			
			<br><br>
			
			
			<input type="submit" id="submit" value="修改">
			
		</form>
	
	</center>
</body>
</html>