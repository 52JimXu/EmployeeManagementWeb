<%@page import="com.wwwxy.employeemanagement.entity.SalaryEntity"%>
<%@page import="java.util.List"%>
<%@page import="com.wwwxy.employeemanagement.dao.SalaryDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	 if(session.getAttribute("admin")==null){
		response.sendRedirect("../login.jsp");
	}else{
		if((int)session.getAttribute("admin")==1){
			response.sendRedirect("main.jsp");
		}
	} 
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>工资记录查询</title>
<style type= "text/css">
	#head{
		width:100%;
		display:inline-block;
	}
	 form{
		width:220px;
		margin-left:150px;
		display:inline-block;
	}
	a{
	    height: 25px;
	    color: black;
	    text-decoration: none;
	    background-color: #DCDCDC;
	    font-size:16px;
	    border-radius:5px;
	    display:inline-block;
	    margin-right:140px;
	}
	input{
        border: 1px solid #ccc; 
        padding: 7px 0px;
        border-radius: 3px; /*css3属性IE不支持*/
       /*  padding-left:5px;  */
        padding:0;
    }
    #inquire{
    	width:160px;
    	height:25px;
    }
    #submit{
    	width:45px;
    	height:30px;
		font-size:15px;
	}
	#submit:hover{
		cursor:pointer;
	}
	table{
	font-size:15px; 
} 
table{ 
table-layout:fixed; 
empty-cells:show; 
border-collapse: collapse; 
margin:0 auto; 
} 
td{ 
height:30px; 
}  
.table{ 
border:1px solid #cad9ea; 
color:#666; 
} 
.table td { 
background-repeat:repeat-x; 
height:30px; 
} 
.table td,.table td{ 
border:1px solid #cad9ea; 
padding:0 1em 0; 
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
        	margin:0;
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
	int empid =0;
	SalaryDao sd =new SalaryDao();
	List<SalaryEntity> list =null;
	if(request.getParameter("empid")!=null){
		empid = Integer.parseInt(request.getParameter("empid"));
		list = sd.GetSalaryByEmpId(empid);
	}else{
		out.print("系统繁忙，稍后再试！");
	}
	pageContext.setAttribute("list", list);
%>
<br>
	<div class="welcome">欢迎你:${sessionScope.username },<a class="exit" href="exit.jsp">退出</a></div>
<div  class="box">
		<br>
		<h1>欢迎来到工资记录查询</h1>
		<br>
		<div id= "head">
			<div class="return"><a href="salary.jsp">返回管理系统</a></div>
		</div>
		<br><br>
		<table  width="90%" class="table">
			<tr>
				<td>工资编号</td>
				<td>员工编号</td>
				<td>事项编号</td>
				<td>工资总和</td>
				<td>发工资时间</td>
			</tr>
		<c:forEach items="${list}" var="str" varStatus="st">
			<c:choose>
				<c:when test="${st.index%2==0 }">
					<tr bgcolor="#DCDCDC">
				</c:when>
				<c:otherwise>
					<tr>
				</c:otherwise>
			</c:choose>
			<td> ${str.sId } </td>
			<td> ${str.empId } </td>
			<td> ${str.eId } </td>
			<td> ${str.sSum } </td>
			<td> ${str.sTime } </td>
			</tr>
			</c:forEach>
		</table>
		<br><br>
		</div>
</body>
</html>