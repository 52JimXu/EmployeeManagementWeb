<%@page import="java.util.Iterator"%>
<%@page import="com.wwwxy.employeemanagement.entity.SalaryEntity"%>
<%@page import="java.util.List"%>
<%@page import="com.wwwxy.employeemanagement.dao.SalaryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工资记录查询</title>
<style type= "text/css">
	td{
		text-align:center;
		width:120px;
		font-size:20px;
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
</style>
</head>
<body>
	<%
		int id =0;
		List<SalaryEntity> list=null;
		SalaryDao sd = new SalaryDao();
		SalaryEntity se1 = new SalaryEntity();
		try{
			id = Integer.parseInt(request.getParameter("inquire"));  
			list= sd.GetSalaryByEmpId(id);
		}catch(NumberFormatException e){
			id = 0;
			list =sd.GetAllSalary();
		}
		pageContext.setAttribute("list", list);
	%>
		
	<center>
		<h1>欢迎来到工资记录查询</h1>
		<div id= "head">
			<a href="../html/salary.html">返回管理系统</a>
			<form id="form" action="getsalary.jsp" method="get">
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
			</tr>
			</c:forEach>
		</table>
		</center>
</body>
</html>