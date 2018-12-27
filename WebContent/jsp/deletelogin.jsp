<%@page import="com.wwwxy.employeemanagement.entity.LoginEntity"%>
<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录信息删除</title>
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
	}#head{
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
		String name = null;
		List<LoginEntity> list = null;
		LoginDao  ld = new LoginDao();
		if(request.getParameter("inquire")!=null){
			name = request.getParameter("inquire");
			list = ld.getLoginByUsername(name);
		}else{
			list = ld.getAllLogin();
		}
		pageContext.setAttribute("list", list);
	%>
		
	<center>
		<h1>欢迎来到登录信息删除</h1>
		<div id= "head">
			<a href="../html/login.html" class="a">返回管理系统</a>
			<form id="form" action="deletelogin.jsp" method="get">
				<input type="text" name="inquire" placeholder="请输入查询员工姓名" id="inquire"/>
				<input type="submit" value="查询" id="submit"/>
			</form>
		</div>
		<table>
			<tr>
				<td>登录编号</td>
				<td>用户名</td>
				<td>密码</td>
				<td>是否为管理员</td>
				<td>员工编号</td>
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
				
					<td>${str.id }</td>
					<td>${str.username}</td>
					<td><strong>......</strong></td>
				<td>
					<c:choose>
						<c:when  test="${str.admin==0 }">
							否
						</c:when>
						<c:otherwise>
							是
						</c:otherwise>
					</c:choose>
				
				</td>
				<td>
					<c:choose>
						<c:when  test="${str.empid==0 }">
							无
						</c:when>
						<c:otherwise>
							${str.empid}
						</c:otherwise>
					</c:choose>
				</td>
				<td><a href="daodeletelogin.jsp?id=${str.id}" class="anniu">删除</a></td>
				</tr>
			</c:forEach>
		</table>
		</center>
</body>
</html>