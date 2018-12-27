<%@page import="com.wwwxy.employeemanagement.entity.LoginEntity"%>
<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		List<LoginEntity> list=null;
		Iterator iter = null;
	try{
	 	name = request.getParameter("inquire");  
	}catch(NumberFormatException e){
		name=null;
	}
		LoginDao ld = new LoginDao();
	
		LoginEntity le1 = new LoginEntity();
	if(name !=null){
		List<LoginEntity> list1= ld.getLoginByUsername(name);
		iter = list1.iterator();
	}else{
		list =ld.getAllLogin();
		iter = list.iterator();
	}
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
			
			
			<% 
			int i = 0;
			while(iter.hasNext()){
				LoginEntity le = (LoginEntity)iter.next();
		%>		
		<tr <%if(i%2==0){ %>bgcolor="darkgray" <% }%>>
			<td><%out.print(le.getId()); %></td>
			<td><%out.print(le.getUsername()); %></td>
			<td><strong>······</strong></td>
			<td><%if(le.getAdmin()==0){
				out.print("否");
			}else{
				out.print("是");
			} %></td>
			<td><%if(le.getEmpid()==0){
				out.print("无");
			}else{
				out.print(le.getEmpid());
			} %></td>
			<td><a href="daodeletelogin.jsp?id=<%=le.getId()%>" class="anniu">删除</a></td>
		</tr>
		<%		
			i++;	
			}
		%>
		</table>
		</center>
</body>
</html>