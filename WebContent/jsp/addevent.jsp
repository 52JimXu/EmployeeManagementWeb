<%@page import="com.wwwxy.employeemanagement.entity.EmployeeEntity"%>
<%@page import="com.wwwxy.employeemanagement.dao.EmployeeDao"%>
<%@page import="java.util.List"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增员工事项信息</title>
<style type="text/css">
	form{
		margin:0 77px 0 0;
		font-size:15px;
	}
	label{
	            display: inline-block;
	            width: 120px;/*或者 width: 100px;*/
	        }
	#add{
		width:60px;
		height:40px;
		font-size:17px;
		margin:20px 0 0 80px;
	}
	#add:hover{
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
     	margin-left:130px;
     }
     .lable{
     	display: inline-block;
	    width: 230px;/*或者 width: 100px;*/
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
		width:500px;
		height:400px;
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
	#n{
		margin-left:-15px;
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
<br>
	<div class="welcome">欢迎你:${sessionScope.username },<a class="exit" href="exit.jsp">退出</a></div>
<body onload="getTime()">

			<%
				
				EmployeeDao ed = new EmployeeDao();
				EmployeeEntity ee=new EmployeeEntity();
				int[] empid = new int[ed.GetMaxId()];
				List<EmployeeEntity> list = ed.getAllEmployee();
				int i=0;
			%>

<center>
	<br>
	<h1>欢迎来到员工事项信息新增</h1>
	<br>
	<div id= "head">
		<div class="return"><a onclick="layer.msg('努力加载中',{icon:16,shade: 0.01,time:5000})" href="event.jsp" class="a">返回管理系统</a></div>
	</div>
	<br>
		<form name="myform" method="post" action="doaddemplogin.jsp" onsubmit="return checkAll()">
			<label class="lable" for="inputs">请选择该员工的ID：</label>	
			<select name="empid" id="year" >
			<option value="101">101</option>
    		</select>
    		<br><br>
    		<input type="button" id="add" onclick="addevent()" value="新增">
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
    function addevent(){
    	var $empid = $('#year').val();
    	layer.msg('努力加载中...', {
  		  icon: 16
  		  ,shade: 0.01,
  		  time:5000
  		});
    	 $.ajax({
    		url:"../AddEventServlet",
    		请求方式:"post",
    		data:"empid="+$empid,
    		success:function(result,testStatus){
    			if(result == "1"){
    				layer.alert('新增成功',{icon:1});
    			}else{
    				layer.alert('新增失败，已存在改员工事项信息',{icon:2});
    			}
    		}
    	}); 
    }
</script>
	
	
</body>
</html>