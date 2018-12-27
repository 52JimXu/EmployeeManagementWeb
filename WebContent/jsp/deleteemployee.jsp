<%@page import="com.wwwxy.employeemanagement.entity.EmployeeEntity"%>
<%@page import="com.wwwxy.employeemanagement.dao.EmployeeDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工信息删除</title>
<style type= "text/css">
	td{
		text-align:center;
		width:120px;
		font-size:20px;
	}
	.anniu{
		font-size: 20px;
		color: #000000;
		text-decoration:none
	}
	.anniu:link {
		font-size: 20px;
		color: #000000;
		text-decoration: none;
	}
	.anniu:visited {
	 	font-size: 20px;
	 	color: #000000;
	 	text-decoration: none;
	}
	.anniu:hover {
		font-size: 20px;
		color: blue;
		text-decoration: underline;
	}
	#head{
		padding:1% 0 2% 0;
		width:745.6px;
	}
	 form{
		width:220px;
		margin-left:200px;
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
	    margin-right:200px;
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
</style>
</head>
<body>
	<%
		String name = null;
		List<EmployeeEntity> list = null;
		EmployeeDao ed = new EmployeeDao();
		if(request.getParameter("inquire")!=null){
			name = request.getParameter("inquire");
			list = ed.getEmployeeByName(name);
		}else{
			list = ed.getAllEmployee();
		}
		pageContext.setAttribute("list", list);
	%>
		
	<center>
		<h1>欢迎来到员工信息删除</h1>
	
		<div id= "head">
			<a href="../html/employee.html" class="a">返回管理系统</a>
			<form id="form" action="deleteemployee.jsp" method="get">
				<input type="text" name="inquire" placeholder="请输入查询员工姓名" id="inquire"/>
				<input type="submit" value="查询" id="submit"/>
			</form>
		</div>
		<table>
			<tr>
				<td>员工编号</td>
				<td>员工姓名</td>
				<td>员工性别</td>
				<td>员工年龄</td>
				<td>员工生日</td>
				<td>员工工资</td>
				<td>员工邮箱</td>
				<td>员工地址</td>
			</tr>
			<c:forEach items="${list }" var="str" varStatus="st">
				<c:choose>
					<c:when test="${st.index%2==0 }">
						<tr bgcolor="darkgray">
					</c:when>
					<c:otherwise>
						<tr>
					</c:otherwise>
				</c:choose>
				<td>${str.empId}</td>
				<td>${str.empName }</td>
				<td>${str.empSex }</td>
				<td>${str.empAge }</td>
				<td>${str.empBirthday}</td>
				<td>${str.empBasic}</td>
				<td>${str.empEmail}</td>
				<td>${str.empAddress}</td>
				<td><a href="daodeleteemployee.jsp?id=${str.empId }" class="anniu">删除</a></td>
			</c:forEach>
		</table>
		</center>
</body>
</html>