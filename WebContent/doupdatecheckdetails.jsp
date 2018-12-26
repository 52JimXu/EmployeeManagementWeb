<%@page import="com.wwwxy.employeemanagement.dao.CheckDetailsDao"%>
<%@page import="com.wwwxy.employeemanagement.entity.CheckDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改考勤记录</title>
<style type="text/css">
	form{
		margin:0px;
		font-size:20px;
	}
	label{
	            display: inline-block;
	            width: 120px;/*或者 width: 100px;*/
	        }
	#submit{
		width:100px;
		height:50px;
		font-size:25px;
	}
	#submit:hover{
		cursor:pointer;
	}
	input{
                border: 1px solid #ccc; 
                padding: 7px 0px;
                border-radius: 3px; /*css3属性IE不支持*/
                padding-left:5px; 
            }
     span{
     	font-size:12px;
     }
     select{
     	border: 1px solid #ccc; 
                padding: 7px 0px;
                border-radius: 3px; /*css3属性IE不支持*/
                padding-left:5px; 
     }
     #status{
     	margin-right:55px;
     }
</style>

</head>
<body onload="getTime()">
	<%! 
		int cid;
		int empid;
		String checkin;
		String checkout;
		String cstatus;
		String cdate;
	%>
	<%
		CheckDetails cd = new CheckDetails();
		int id = Integer.parseInt(request.getParameter("id"));
		CheckDetailsDao cdd = new CheckDetailsDao();
		List<CheckDetails> list = cdd.getCheckDetails(id);
		for(CheckDetails lists:list){
			cid = lists.getCid();
			empid = lists.getEmpid();
			checkin = lists.getCcheckin();
			checkout = lists.getCcheckout();
			cstatus = lists.getCstatus();
			cdate = lists.getCdate();
		}
		
		String year;
		String month;
		String day;
		
		String[] strs = cdate.split("-");
		year =strs[0];
		month = strs[1];
		day = strs[2];
	%>
	
	
	<center>
	<h1>欢迎来到考勤记录修改</h1>
		<form name="myform" action="successupdatecheckdetails.jsp?id=<%=id%>" method="post">
			<label for="inputs">考勤编号:</label><input name="cid" class="disabled" type="text" readonly value="<%=cid%>"><span>*不可修改</span><br><br>
			<label for="inputs">员工编号:</label><input name="empid" class="disabled" type="text" readonly value="<%=empid%>"><span>*不可修改</span><br><br>
			<label for="inputs">上班打卡:</label><input name="checkin" class="disabled" type="text" readonly value="<%=checkin%>"><span>*不可修改</span><br><br>
			<label for="inputs">下班打卡:</label><input name="checkout" class="disabled" type="text" readonly value="<%=checkout%>"><span>*不可修改</span><br><br>
			<div id="status"><label for="inputs">考勤状态:</label>
			<select name="status" >
        		<option value="正常" <%if("正常".equals(cstatus)){%>selected ="selected"<% }%>>正常</option>
        		<option value="迟到" <%if("迟到".equals(cstatus)){%>selected ="selected"<% }%>>迟到</option>
        		<option value="早退" <%if("早退".equals(cstatus)){%>selected ="selected"<% }%>>早退</option>
        		<option value="加班" <%if("加班".equals(cstatus)){%>selected ="selected"<% }%>>加班</option>
        		<option value="旷工" <%if("旷工".equals(cstatus)){%>selected ="selected"<% }%>>旷工</option>
        		<option value="迟到,加班" <%if("迟到,加班".equals(cstatus)){%>selected ="selected"<% }%>>迟到,加班</option>
        		<option value="迟到,早退" <%if("迟到,早退".equals(cstatus)){%>selected ="selected"<% }%>>迟到,早退</option>
    		</select>
			</div><br>
			
			
			
			<label for="inputs">考勤时间:</label>
			<select name="year" disabled="disabled" onchange="getday()" >
        		<option value="1990">1990</option>
    		</select>年
    		<select name="month" disabled="disabled" onchange="getday()" >
       			<option value="1">1</option>
		    </select>月
		    <select disabled="disabled" name="day">
		        <option>1</option>
		    </select>日
			<span>*不可修改</span>
			<br><br>
			<input type="submit" id="submit" value="修改">
			
		</form>
	
	</center>
<script language="JavaScript">
		function getTime(){
		    var year = document.myform.year;
		    var start =1900;
		    var end =2018;
		    var html;
		    var month = document.myform.month;
		    var start1 =1;
		    var end1 =12;
		    var Month;
		    var day = document.myform.day;
		    var start2 =1;
		    var end2 =31;
		    var Day;
		    var daynum;
		    if(<%=year%>%4==0&&<%=year%>%100 != 0||<%=year%>%400 == 0){
		    	if(<%=month%>==1||<%=month%>==3||<%=month%>==5||<%=month%>==7||<%=month%>==8||<%=month%>==10||<%=month%>==12){
		    		daynum=31;
		    	}else if(<%=month%>==4||<%=month%>==6||<%=month%>==9||<%=month%>==11){
		    		daynum=30;
		    	}else{
		    		daynum=29;
		    	}
		    }else{
		    	if(<%=month%>==1||<%=month%>==3||<%=month%>==5||<%=month%>==7||<%=month%>==8||<%=month%>==10||<%=month%>==12){
		    		daynum=31;
		    	}else if(<%=month%>==4||<%=month%>==6||<%=month%>==9||<%=month%>==11){
		    		daynum=30;
		    	}else{
		    		daynum=28;
		    	}
		    }
		    for(var i=start;i<=end;i++){
		    	if(i==<%=year%>){
		    		html+="<option selected value="+i+">"+i+"</option>";
		    	}else{
		    		html+="<option value="+i+">"+i+"</option>";
		    	}
		    }
		    year.innerHTML = html;
		    for(var m=start1;m<=end1;m++){
		        if(m==<%=month%>){
		        	Month+="<option selected value="+m+">"+m+"</option>";
		        }else{
		        	Month+="<option value="+m+">"+m+"</option>";
		        }
		    }
		    month.innerHTML = Month;
		    
		    for(var i=1;i<=daynum;i++){
		    	if(i==<%=day%>){
		        	Day += "<option selected value="+i+">"+i+"</option>";
		    	}else{
		    		Day += "<option value="+i+">"+i+"</option>";
		    	}
		    }
		    day.innerHTML =Day;
		}
		function getday(){
		    var year = document.myform.year.value;
		    var month = document.myform.month.value;
		    var day;
		    if(year%4==0&&year%100 != 0||year%400 == 0){
		        if(month==1||month==3||month==5||month==7||month==8||month==10||month==12){
		            for(var i=1;i<=31;i++){
		                day += "<option value="+i+">"+i+"</option>";
		            }
		        }else if(month==4||month==6||month==9||month==11){
		            for(var i=1;i<=30;i++){
		                day += "<option value="+i+">"+i+"</option>";
		            }
		        }else{
		            for(var i=1;i<=29;i++){
		                day += "<option value="+i+">"+i+"</option>";
		            }
		        }
		    }else{
		        if(month==1||month==3||month==5||month==7||month==8||month==10||month==12){
		            for(var i=1;i<=31;i++){
		                day += "<option value="+i+">"+i+"</option>";
		            }
		        }else if(month==4||month==6||month==9||month==11){
		            for(var i=1;i<=30;i++){
		                day += "<option value="+i+">"+i+"</option>";
		            }
		        }else{
		            for(var i=1;i<=28;i++){
		                day += "<option value="+i+">"+i+"</option>";
		            }
		        }
		    }
		    document.myform.day.innerHTML = day;
		}
</script></body>
</html>