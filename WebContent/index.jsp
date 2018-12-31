<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
     String path = request.getContextPath();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <%
	if(session.getAttribute("admin")==null){
		
	}else{
		if((int)session.getAttribute("admin")==0){
			response.sendRedirect("empmain.jsp");
		}else{
			response.sendRedirect("main.jsp");
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
		font-size:15px;
		margin:0 17px 0 0;
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
            padding:15px 0 0 50px;
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
			height:30px;
			font-size:17px;
	}
	a{
		font-size:15px;
	}
	center{
		width:538px;
		height:330px;
		margin:160px auto;
	    background-color: #C8C8C8;
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
		background-image: url("image/bg.jpg");
        margin: 0px;
        padding: 0px;
		background-attachment:fixed;
	}
    </style>
    <script src="layer/jquery-1.11.3.min.js"></script>
    <script src="layer/layer/layer.js"></script>
    <script language="JavaScript">
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
              	password.style.cssText="margin-left:80px;";
              	flag=false;
            }else{
                //如果通过，在文本框显示绿色提示信息
              	passError.innerHTML="";
              	passError.style.cssText="color:green;display:inline-block;";
              	password.style.cssText="margin-left:0";
               	flag=true;
        	}
           	 	return flag;
            }
        
        function user(){
        	var $username = $("#username").val();
        	var $error = $("#userError");
        	var $user = $("#user");
        	$.ajax({
        		url:"LoginServlet",
        		请求方式:"post",
        		data:"username="+$username,
        		success:function(result,testStatus){
        			if(result == "true"){
        				$error[0].innerHTML = "✔";
        				$error[0].style.cssText="color:green;display:inline-block;";
        				$user[0].style.cssText="margin-left:12px;"
        			}else{
        				$error[0].innerHTML = "✖";
        				$error[0].style.cssText="color:red;display:inline-block;";
        				$user[0].style.cssText="margin-left:12px;"
        			}
        		}
        	});
        }
        function login(){
        	user();
        	var $username = $("#username").val();
        	var $password = $("#passwordinput").val();
        	layer.msg('努力加载中...', {
        		  icon: 16
        		  ,shade: 0.01,
        		  time:5000
        		});
        	var $error = $("#userError");
        	setTimeout(function() {
        		if($error[0].style.color=="green"){
            		if(checkPassword()){
            			$.ajax({
            				url:"LoginServlet2",
            				请求方式:"post",
                    		data:"username="+$username+"&password="+$password,
                    		success:function(result,testStatus){
                    			if(result == "1"){
                    				window.document.location.href="jsp/main.jsp";
                    			}else if(result == "0"){
                    				window.document.location.href="jsp/empmain.jsp";
                    			}else{
                    				layer.alert('用户名或密码错误',{icon:2});
                    			}
                    		}
            			});
            			
            			
            		}else{
            			layer.alert('密码不能为空',{icon:2});
            		}
            	}else{
            		layer.alert('用户名错误',{icon:2});
            	}
            }, 1200);
        	
        
        }
    </script>
</head>
<body>

<center>
	<br>
    <h1>人力资源管理系统</h1>

    <form  class="form" name="myform">
    <div id= "inputtwo">
        <div id="user">
            <label >用户名:</label><input id="username" type="text" name="username" onblur="user()"/>
            <span id="userError"></span><br><br>
        </div>
        <div id="password">
            <label >密码:</label><input type="password" id="passwordinput" name="userpassword"  onblur="checkPassword()"/>
            <span id="passError"></span><br>
        </div>
    </div>
        <div class="anniu">
            <input value="登录" type="button" class="q1 submit" onclick="login()"/>
            &nbsp;&nbsp;
            <input value="重置" type="button" class="q1 reset" onclick="javascript:window.location.reload()" />  
     																	<!--刷新页面 -->
        </div>
    </form>
</center>
</body>
</html>