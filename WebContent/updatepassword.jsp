<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@page import="com.wwwxy.employeemanagement.entity.LoginEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
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
     	margin-left:55px;
     } 
</style>
</head>
<body>
<%! 
		int id;
		String username;
	%>
	<%
		LoginEntity le = new LoginEntity();
		int id = Integer.parseInt(request.getParameter("id"));
		LoginDao sd = new LoginDao();
		le = sd.getLoginById0(id);
		
			id = le.getId();
			username = le.getUsername();
	%>
<center>
	<h1>欢迎来到密码信息修改</h1>
		<form name="myform">
			<div class="username"><label for="inputs">用户名:</label><input readonly type="text" value="<%=username%>">
			<span class="bkxg">*不可修改</span>
			</div><br>
			<div id="n"><label for="inputs">旧密码:</label><input id="nameinput" onblur="checkold()" type="password" value="">
			<span id="name"></span>
			</div><br>
			<div id="p"><label for="inputs">新密码:</label><input onblur="checknew()" id="passinput" type="password" value="">
			<span id="pass"></span>
			</div><br>
			
			<br><br>
			<input type="submit" id="submit" value="修改">
			
		</form>
	
	</center>
	
	<script language="JavaScript">
	    function checkold(){
        var obj = document.getElementById("nameinput");
        var name = document.getElementById("name");
        var n = document.getElementById("n");
     if((obj.value)==""){
         name.innerHTML =("*旧密码不能为空");
         name.style.cssText="color:red;font-size:12px;display:inline-block;";
         n.style.cssText="margin-left:95px;";
         return false;
     }else{
    	 	name.style.cssText="display:none;";
    	 	n.style.cssText="";
    	 	return true;
    	 }
    }
    function checknew(){
    	var oldobj = document.getElementById("nameinput");
        var obj = document.getElementById("passinput");
        var pass = document.getElementById("pass");
        var p = document.getElementById("p");
     if((obj.value)==""){
         pass.innerHTML =("*新密码不能为空");
         pass.style.cssText="color:red;font-size:12px;display:inline-block;";
         p.style.cssText="margin-left:95px;";
         return false;
     }else if((oldobj.value)==(obj.value)){
    	 pass.innerHTML =("*新旧密码不能一样");
         pass.style.cssText="color:red;font-size:12px;display:inline-block;";
         p.style.cssText="margin-left:105px;";
     }else{	
    	 	pass.style.cssText="display:none;";
    	 	p.style.cssText="margin-left:0;";
    	 	return true;
    	 }
    }
</script>

</body>
</html>