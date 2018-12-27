<%@page import="java.util.Iterator"%>
<%@page import="com.wwwxy.employeemanagement.entity.SalaryEntity"%>
<%@page import="java.util.List"%>
<%@page import="com.wwwxy.employeemanagement.dao.SalaryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工资记录删除</title>
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
		width:621.6px;
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
</style>
</head>
<body>
	<%
		int id =0;
		List<SalaryEntity> list = null;
		SalaryDao sd = new SalaryDao();
		SalaryEntity se = new SalaryEntity();
		if(request.getParameter("inquire")!=null){
			id = Integer.parseInt(request.getParameter("inquire")); 
			list = sd.GetSalaryByEmpId(id);
		}else{
			list = sd.GetAllSalary();
		}
		pageContext.setAttribute("list", list);
	%>
		
	<center>
		<h1>欢迎来到工资记录删除</h1>
	
		<div id= "head">
			<a href="../html/salary.html" class="a">返回管理系统</a>
			<form id="form" action="deletesalary.jsp" method="get">
				<input type="text" name="inquire" placeholder="请输入查询员工编号" id="inquire"/>
				<input type="submit" value="查询" id="submit"/>
			</form>
		</div>
		<table>
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
					<tr bgcolor="darkgray">
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
			<td><a href="daodeletesalary.jsp?id=${str.sId }" class="anniu">删除</a></td>
			</tr>
			</c:forEach>
		</table>
		</center>
</body>
</html>