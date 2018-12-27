<%@page import="com.wwwxy.employeemanagement.entity.CheckDetails"%>
<%@page import="com.wwwxy.employeemanagement.dao.CheckDetailsDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>考勤记录修改</title>
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
	int id =0;
	List<CheckDetails> list=null;
	Iterator iter = null;
	try{
	 	id = Integer.parseInt(request.getParameter("inquire"));  
	}catch(NumberFormatException e){
		id = 0;
	}
		CheckDetailsDao cdd = new CheckDetailsDao();
	
		CheckDetails cd1 = new CheckDetails();
	if(id !=0){
		List<CheckDetails> list1= cdd.getCheckDetailsByempid(id);
		iter = list1.iterator();
	}else{
		list =cdd.getAllCheckDetails();
		iter = list.iterator();
	}
	%>
		
	<center>
		<h1>欢迎来到考勤记录修改</h1>
	
		<div id= "head">
			<a href="../html/checkdetail.html" class="a">返回管理系统</a>
			<form id="form" action="updatecheckdetails.jsp" method="get">
				<input type="text" name="inquire" placeholder="请输入查询员工编号" id="inquire"/>
				<input type="submit" value="查询" id="submit"/>
			</form>
		</div>
		<table>
			<tr>
				<td>考勤编号</td>
				<td>员工编号</td>
				<td>上班打卡</td>
				<td>下班打卡</td>
				<td>考勤状态</td>
				<td>考勤时间</td>
			</tr>
			
			<% 
			int i = 0;
			while(iter.hasNext()){
				CheckDetails cd = (CheckDetails)iter.next();
		%>		
		<tr <%if(i%2==0){ %>bgcolor="darkgray" <% }%>>
			<td><%out.print(cd.getCid()); %></td>
			<td><%out.print(cd.getEmpid()); %></td>
			<td><%out.print(cd.getCcheckin()); %></td>
			<td><%out.print(cd.getCcheckout()); %></td>
			<td><%out.print(cd.getCstatus()); %></td>
			<td><%out.print(cd.getCdate()); %></td>
			<td><a href="doupdatecheckdetails.jsp?id=<%=cd.getCid()%>" class="anniu">修改</a></td>
		</tr>
		<%		
			i++;	
			}
		%>
		</table>
		</center>
</body>
</html>