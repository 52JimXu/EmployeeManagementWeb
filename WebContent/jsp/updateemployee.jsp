<%@page import="com.wwwxy.employeemanagement.entity.EmployeeEntity"%>
<%@page import="com.wwwxy.employeemanagement.dao.EmployeeDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工信息修改</title>
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
		List<EmployeeEntity> list=null;
		Iterator iter = null;
		try{
		 	name = request.getParameter("inquire");  
		}catch(NumberFormatException e){
			name=null;
		}
			EmployeeDao ed = new EmployeeDao();
		
			EmployeeEntity ee1 = new EmployeeEntity();
		if(name !=null){
			List<EmployeeEntity> list1= ed.getEmployeeByName(name);
			iter = list1.iterator();
		}else{
			list =ed.getAllEmployee();
			iter = list.iterator();
		}
	%>
		
	<center>
		<h1>欢迎来到员工信息修改</h1>
	
		<div id= "head">
			<a href="../html/employee.html" class="a">返回管理系统</a>
			<form id="form" action="updateemployee.jsp" method="get">
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
			
			
			<% 
			int i = 0;
			while(iter.hasNext()){
				EmployeeEntity ee = (EmployeeEntity)iter.next();
		%>		
		<tr <%if(i%2==0){ %>bgcolor="darkgray" <% }%>>
			<td><%out.print(ee.getEmpId()); %></td>
			<td><%out.print(ee.getEmpName()); %></td>
			<td><%out.print(ee.getEmpSex()); %></td>
			<td><%out.print(ee.getEmpAge()); %></td>
			<td><%out.print(ee.getEmpBirthday()); %></td>
			<td><%out.print(ee.getEmpBasic()); %></td>
			<td><%out.print(ee.getEmpEmail()); %></td>
			<td><%out.print(ee.getEmpAddress()); %></td>
			<td><a href="doupdateemployee.jsp?id=<%=ee.getEmpId() %>" class="anniu">修改</a></td>
		</tr>
		<%		
			i++;	
			}
		%>
		</table>
		</center>
</body>
</html>