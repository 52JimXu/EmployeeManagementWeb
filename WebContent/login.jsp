<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
     String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basepath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta http-equiv="pragma" content="no-cache">
<meta http-equiv="expires" content="0">  
<meta http-equiv="cache-control" content="no-cache"> 
    <title>人力资源系统</title>
    <style type=text/css>
        body{
            margin:0;
            /* background-color:black; */
        }
        form{
            margin:0px;
            font-size:20px;
        }
        label{
            display: inline-block;
            width: 120px;/*或者 width: 100px;*/
        }
        input{
            border: 1px solid #ccc;
            padding: 7px 0px;
            border-radius: 3px; /*css3属性IE不支持*/
            padding-left:5px;
           	
        }
        #inputtwo{
        	margin-right:20px;
        }
        #user{
        	margin-top:40px;
        }
        #password{
        	margin:0 0 20px 0;
        }
        .anniu{
            whidth:50px;
            padding:10px 0 0 55px;
            display:block;
        }
        .q1{
        	padding:0;
        }
        .submit:hover,.reset:hover{
			cursor:pointer;
		}
		.submit,.reset{
			width:50px;
			height:35px;
			font-size:18px;
	}
    </style>
    <script language="JavaScript">
        function checkName(){
            //获取用户输入的数据
            var username = document.myform.username.value;
            
            var flag;
            var rule = /^\w{1,10}$/;
            //对数据检验，不能为空
            var userError= document.getElementById("userError");
            if(username==null||username==""){
                //如果未能通过校验，在文本框后显示红色错误的信息
               userError.innerHTML="*用户名不能为空";
               userError.style.cssText="color:red;font-size:12px;display:inline-block;";
               user.style.cssText="margin-left:95px;";
               flag=false;
            }else{
                /* if(username.length>10||username.length<1){
                 //如果未能通过校验，在文本框后显示红色错误的信息
                 span.style.color="red";
                 span.innerHTML="✖用户名1-10";
                 flag=false;
                 }else{
                 if(!rule.test(username)){//如果未能通过校验，在文本框后显示红色错误的信息
                 span.style.color="red";
                 span.innerHTML="✖用户名只能包含字母，数字或下划线";
                 flag=false;
                 }else{ */
                //如果通过，在文本框显示绿色提示信息
                 userError.innerHTML="✔";
                userError.style.cssText="color:green;display:inline-block;";
                user.style.cssText="margin-left:16px; margin-top:38.9px;";
                flag=true;
           /*  } */
          
        	}
           	 	return flag;
            }
        function checkPassword(){
            //获取用户输入的数据
            var userpassword = document.myform.userpassword.value;
            var flag;
            //对数据检验，不能为空
            var passError= document.getElementById("passError");
            if(userpassword==null||userpassword==""){
                //如果未能通过校验，在文本框后显示红色错误的信息
               	passError.innerHTML="*密码不能为空";
              	passError.style.cssText="color:red;font-size:12px;display:inline-block;";
              	password.style.cssText="margin-left:83px;";
              	flag=false;
            }else{
                //如果通过，在文本框显示绿色提示信息
              	passError.innerHTML="";
              	passError.style.cssText="color:green;display:inline-block;";
               	flag=true;
        	}
           	 	return flag;
            }
        function checkAll(){
            if(checkName()) {
                return true;
            }else{
                return false;
            }
            if(checkPassword()) {
                return true;
            }else{
                return false;
            }
        }
    </script>
</head>
<body>

<center>
    <h1>人力资源管理系统</h1>
    <form  class="form" name="myform" onsubmit="return checkAll()" action="jsp/daologin.jsp" method="post">
    <div id= "inputtwo">
        <div id="user">
            <label >用户名:</label><input type="text" name="username" onblur="checkName()"/>
            <span id="userError"></span><br><br>
        </div>
        <div id="password">
            <label >密码:</label><input type="password" name="userpassword"  onblur="checkPassword()"/>
            <span id="passError"></span><br>
        </div>
    </div>
        <div class="anniu">
            <input value="提交" type="submit" class="q1 submit"/>
            &nbsp;&nbsp;
            <input value="重置" type="button" class="q1 reset" onclick="javascript:window.location.reload()" />  
     																	<!--刷新页面 -->
        </div>
    </form>
</center>
</body>
</html>