<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@page import="com.wwwxy.employeemanagement.entity.LoginEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	if(session.getAttribute("admin")==null){
		response.sendRedirect("../index.jsp");
	}
%>
<head>
  <script src="../layer/jquery-1.11.3.min.js"></script>
    <script src="../layer/layer/layer.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<style type="text/css">
	form{
		font-size:15px;
	}
	label{
	            display: inline-block;
	            width: 120px;/*或者 width: 100px;*/
	        }
	#submit{
		width:60px;
		height:40px;
		font-size:17px;
		/* margin:20px 0 0 80px; */
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
     h1{	
	margin:0;
	text-align:center;
}
.box{
	width:800px;
	margin:50px auto;
	background-color:white;
}
body{
	background-image: url("../image/bg.jpg");
            margin: 0px;
            padding: 0px;
			background-attachment:fixed;
}
a{
	font-size:15px;
}
.return{
	float:left;	
	margin-left:70px;
}
 .select{
 	float:right;
 	margin-right:70px;
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
       .username{
    		margin-left:-35px;
       }
        .welcome{
        	width:170px;
        	height:25px;
        	float:right;
        	margin-right:300px;
        	color:white;
        }
        .input123{
        	width:400px;
        	height:300px;
        	margin:0 auto;
        }
        .submit{
        	width:100px;
        	height:50px;
        	margin:0 auto;
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
		width:590px;
		height:410px;
		margin:50px auto;
	    background-color: white;
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
           color:white;
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
	int id;
	String username;
	LoginEntity le = new LoginEntity();
	LoginDao sd = new LoginDao();
	if(request.getParameter("id")!=null){
		id = Integer.parseInt(request.getParameter("id"));
		le = sd.getLoginById0(id);
		id = le.getId();
		username = le.getUsername();
		pageContext.setAttribute("username", username);
	}
	%>
	<br>
	<div class="welcome">欢迎你:${sessionScope.username },<a class="exit" href="exit.jsp">退出</a></div>
<center>
		<br>
	<h1>欢迎来到密码信息修改</h1>
	<br>
	<div id= "head">
		<div class="return"><a href="dopass.jsp" class="a">返回管理系统</a></div>
	</div>
	<br>
	<br>
		<form name="myform" action="doupdatepass.jsp?id=${sessionScope.id } " onsubmit="return checkAll()" method="post">
			<div class="input123">
			<div class="username"><label for="inputs">用户名:</label><input name="username" readonly type="text" value="${sessionScope.username }">
			<span class="bkxg">*不可修改</span>
			</div><br>
			<div id="n" style="margin-left:-95px;"><label for="inputs">旧密码:</label><input id="nameinput" name="oldpassword" onblur="checkold()" type="password" value="">
			<span id="name"></span>
			</div><br>
			<div id="p" style="margin-left:-95px;"><label for="inputs">新密码:</label><input onblur="checknew()" name="password" id="passinput" type="password" value="">
			<span id="pass"></span>
			</div><br>
			
			<br>
			<div class="submit">
				<input type="submit" id="submit" value="修改">
			</div>
			</div>
		</form>
	<br><br>
		</center>
	
	<script language="JavaScript">
	    function checkold(){
        var obj = document.getElementById("nameinput");
        var name = document.getElementById("name");
        var n = document.getElementById("n");
     if((obj.value)==""){
         name.innerHTML =("*旧密码不能为空");
         name.style.cssText="color:red;font-size:12px;display:inline-block;";
         n.style.cssText="margin-left:0;";
         return false;
     }else{
    	 	name.style.cssText="display:none;";
    	 	n.style.cssText="margin-left:-95px;";
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
         p.style.cssText="margin-left:0;";
         return false;
     }else if((oldobj.value)==(obj.value)){
    	 pass.innerHTML =("*新旧密码不能一样");
         pass.style.cssText="color:red;font-size:12px;display:inline-block;";
         p.style.cssText="margin-left:10px;";
         return false;
     }else{	
    	 	pass.style.cssText="display:none;";
    	 	p.style.cssText="margin-left:-95px;";
    	 	return true;
    	 }
    }
    function checkAll(){
    	var flag = false;
    	if(checkold()){
    		flag = true;
	    	if(checknew()){
	    		flag = true;
	    	}else{
	    		flag = false;
	    	}
    	}else{
    		flag=false;
    	}
    	return flag;
    }
</script>

</body>
</html>