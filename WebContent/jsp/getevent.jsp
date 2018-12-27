<%@page import="com.wwwxy.employeemanagement.entity.EventEntity"%>
<%@page import="com.wwwxy.employeemanagement.dao.EventDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>事项记录查询</title>
<style type= "text/css">
	td{
		text-align:center;
		width:120px;
		font-size:20px;
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
	a{
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
		int id = 0;
		List<EventEntity> list=null;
		Iterator iter = null;
		try{
		 id = Integer.parseInt(request.getParameter("inquire"));  
		}catch(NumberFormatException e){
			id = 0;
		}
		EventDao ed = new EventDao();
		
		EventDao ed1 = new EventDao();
		if(id !=0){
		List<EventEntity> list1= ed.getEventById(id);
		iter = list1.iterator();
		}else{
		list =ed.getAllEvent();
		iter = list.iterator();
		}
	%>
		
	<center>
		<h1>欢迎来到事项记录查询</h1>
	
		<div id= "head">
			<a href="../html/event.html">返回管理系统</a>
			<form id="form" action="getevent.jsp" method="get">
				<input type="text" name="inquire" placeholder="请输入查询员工编号" id="inquire"/>
				<input type="submit" value="查询" id="submit"/>
			</form>
		</div>
		<table>
			<tr>
				<td>事项编号</td>
				<td>员工编号</td>
				<td>迟到早退次数</td>
				<td>加班次数</td>
				<td>旷工次数</td>
				<td>事项奖惩</td>
			</tr>
			
			
			<% 
			int i = 0;
			while(iter.hasNext()){
				EventEntity ee = (EventEntity)iter.next();
		%>		
		<tr <%if(i%2==0){ %>bgcolor="darkgray" <% }%>>
			<td><%out.print(ee.geteId()); %></td>
			<td><%out.print(ee.geteMpid()); %></td>
			<td><%out.print(ee.geteClocking()); %></td>
			<td><%out.print(ee.geteOvertime()); %></td>
			<td><%out.print(ee.geteBigevent()); %></td>
			<td><%out.print(ee.geteAward()); %></td>
		</tr>
		<%		
			i++;	
			}
		%>
		</table>
		</center>
</body>
</html>