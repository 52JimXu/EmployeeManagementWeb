<%@page import="com.wwwxy.employeemanagement.entity.CheckDetails"%>
<%@page import="com.wwwxy.employeemanagement.dao.CheckDetailsDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>考勤记录修改</title>
<style type= "text/css">
	.anniu{
		font-size: 15px;
		color: #000000;
		text-decoration:none
	}
	.anniu:link {
		font-size: 15px;
		color: #000000;
		text-decoration: none;
	}
	.anniu:visited {
	 	font-size: 15px;
	 	color: #000000;
	 	text-decoration: none;
	}
	.anniu:hover {
		font-size: 15px;
		color: blue;
		text-decoration: none;
	}#head{
		width:100%;
		display:inline-block;
	}
	 form{
		width:220px;
		margin-left:150px;
		display:inline-block;
	}
	.a{
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
word-break:break-all;
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
	int id =0;
	List<CheckDetails> list=null;
	CheckDetailsDao cdd = new CheckDetailsDao();
	if(request.getParameter("inquire")!=null){
		try{
		id = Integer.parseInt(request.getParameter("inquire")); 
		list= cdd.getCheckDetailsByempid(id);
		}catch(Exception e){
			list =cdd.getAllCheckDetails();
		}
	}else{
		list =cdd.getAllCheckDetails();
	}
	pageContext.setAttribute("list", list);

	%>
		<br>
	<div class="welcome">欢迎你:${sessionScope.username },<a class="exit" href="exit.jsp">退出</a></div>
	<div  class="box">
		<br>
		<h1>欢迎来到考勤记录修改</h1>
	<br>
		<div id= "head">
			<div class="return"><a href="checkdetail.jsp" class="a">返回管理系统</a></div>
			<div class="select">
			<form id="form" action="updatecheckdetails.jsp" method="get">
				<input type="text" name="inquire" placeholder="请输入查询员工编号" id="inquire"/>
				<input onclick="layer.msg('努力加载中',{icon:16,shade: 0.01,time:5000})" type="submit" value="查询" id="submit"/>
			</form>
			</div>
		</div>
		<br><br>
		<table width="90%" class="table">
			<tr>
				<td>考勤编号</td>
				<td>员工编号</td>
				<td>上班打卡</td>
				<td>下班打卡</td>
				<td>考勤状态</td>
				<td>考勤时间</td>
				<td></td>
			</tr>
			
			<c:forEach items="${list }" var="str" varStatus="st">
				<c:choose>
					<c:when test="${st.index%2==0 }">
						<tr bgcolor="#DCDCDC">
					</c:when>
					<c:otherwise>
						<tr>
					</c:otherwise>
				</c:choose>
				<td>${str.cid}</td>
				<td>${str.empid }</td>
				<td>${str.ccheckin }</td>
				<td>${str.ccheckout }</td>
				<td>${str.cstatus }</td>
				<td>${str.cdate }</td>
				<td><a onclick="layer.msg('努力加载中',{icon:16,shade: 0.01,time:5000})" href="doupdatecheckdetails.jsp?id=${str.cid }" class="anniu">修改</a></td>
				</tr>
			</c:forEach>
			
		</table>
		<br><br>
		</div>
</body>
</html>