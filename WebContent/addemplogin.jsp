<%@page import="com.wwwxy.employeemanagement.entity.EmployeeEntity"%>
<%@page import="com.wwwxy.employeemanagement.dao.EmployeeDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增员工登录信息</title>
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
            
       .disabled{
       			/* margin-right:-50px; */
       }     
     .bkxg{
     	
     	font-size:12px;
     	
     }
     #disabled{
     	font-size:20px;
     }
     select{
     	border: 1px solid #ccc; 
                padding: 7px 0px;
                border-radius: 3px; /*css3属性IE不支持*/
                padding-left:5px; 
     }
      form .empage{
     	margin-left:125px;
     } 
     .pass{
     	margin-left:145px;
     }
     .lable{
     	display: inline-block;
	    width: 230px;/*或者 width: 100px;*/
     }
     
</style>
</head>
<body onload="getTime()">

			<%
				
				EmployeeDao ed = new EmployeeDao();
				EmployeeEntity ee=new EmployeeEntity();
				int[] empid = new int[ed.GetMaxId()];
				List<EmployeeEntity> list = ed.getAllEmployee();
				int i=0;
			%>

<center>
	<h1>欢迎来到员工登录信息新增</h1>
		<form name="myform" method="post" action="doaddemplogin.jsp" onsubmit="return checkAll()">
			<div id="n">
			<label for="inputs">用户名:</label><input name="username" onblur="checkname()" id="nameinput" type="text"  value=""><span id ="name"></span>
			<br><br>
			</div>
			<div class="pass" id="p">
			<label for="inputs">密码:</label>
			<input id="passinput" name="password" onblur="checkpass()" type="password" value="1234" /><span id="pass" class="bkxg">*默认密码为1234，建议修改</span>
			<br><br>
			</div>
				
			<label class="lable" for="inputs">请选择该员工的ID：</label>	
			<select name="empid" id="year" onchange="getday()" >
			<option value="101">101</option>
    		</select>
    		<br><br>
    		<input type="submit" id="submit" value="新增">
		</form>
	
	</center>
	
	
	
	
	<script language="JavaScript">
    function getTime(){
    	var year = document.myform.empid;
        var html="";
        	<%
            for(EmployeeEntity lists:list){
            	empid[i]=lists.getEmpId();
    		%>
    		html +="<option value="+<%=empid[i]%>+">"+<%=empid[i]%>+"</option>";
    			<%
    			i++;
    		} 
            %>
        year.innerHTML = html;
    }
    
    function checkname(){
        var obj = document.getElementById("nameinput");
        var name = document.getElementById("name");
        var n = document.getElementById("n");
     if((obj.value)==""){
         name.innerHTML =("*姓名不正确");
         name.style.cssText="color:red;font-size:12px;display:inline-block;";
         n.style.cssText="margin-left:75px;";
         return false;
     }else{
    	 	name.style.cssText="display:none;";
    	 	n.style.cssText="";
    	 	return true;
    	 }
    }
    function checkpass(){
        var obj = document.getElementById("passinput");
        var pass = document.getElementById("pass");
        var p = document.getElementById("p");
     if((obj.value)==""){
         pass.innerHTML =("*密码不能为空");
         pass.style.cssText="color:red;font-size:12px;display:inline-block;";
         p.style.cssText="margin-left:70px;";
         return false;
     }else{	
    	 	pass.style.cssText="display:none;";
    	 	p.style.cssText="margin-left:0;";
    	 	return true;
    	 }
    }
</script>
	
	
</body>
</html>