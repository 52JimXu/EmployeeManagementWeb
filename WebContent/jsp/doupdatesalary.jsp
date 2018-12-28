<%@page import="java.util.List"%>
<%@page import="com.wwwxy.employeemanagement.dao.SalaryDao"%>
<%@page import="com.wwwxy.employeemanagement.entity.SalaryEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	if(session.getAttribute("admin")==null){
		response.sendRedirect("../login.jsp");
	}else{
		if((int)session.getAttribute("admin")==0){
			response.sendRedirect("empmain.jsp");
		}
	}
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改工资记录</title>
<style type="text/css">
	form{
		margin:0px;
		font-size:15px;
		margin-right:60px;
	}
	label{
	            display: inline-block;
	            width: 120px;/*或者 width: 100px;*/
	        }
	#submit{
		width:60px;
		height:40px;
		font-size:17px;
		margin:20px 0 0 80px;
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
     .a{
	    height: 25px;
	    color: black;
	    text-decoration: none;
	    background-color: #DCDCDC;
	    font-size:15px;
	    border-radius:5px;
	    display:inline-block;
	    margin-right:200px;
	} 
    a{
		font-size:15px;
	}
     .return{
	/* float:left;	 */
	margin-right:16%;
	}
    #head{
		width:100%;
	}
	center{
		width:600px;
		height:550px;
		margin:50px auto;
	    background-color: white;
	}
	body{
		background-image: url("../image/bg.jpg");
        margin: 0px;
        padding: 0px;
		background-attachment:fixed;
	}
</style>

</head>
<body onload="getTime()">
	<%
		SalaryEntity se = new SalaryEntity();
		int id = Integer.parseInt(request.getParameter("id"));
		SalaryDao sd = new SalaryDao();
		List<SalaryEntity> list = sd.GetSalaryById(id);
		pageContext.setAttribute("list", list);
		pageContext.setAttribute("id", id);
	%>
	
	
	<center>
	<br>
	<h1>欢迎来到工资记录修改</h1>
	<br>
	<div id= "head">
		<div class="return"><a href="updatesalary.jsp" class="a">返回管理系统</a></div>
	</div>
	<br>
		<form name="myform" action="successupdatesalary.jsp?id=${id }" method="post">
			<label for="inputs">工资编号:</label><input class="disabled" type="text" disabled="disabled" value="${list[0].sId }"><span>*不可修改</span><br><br>
			<label for="inputs">员工编号:</label><input class="disabled" type="text" disabled="disabled" value="${list[0].empId }"><span>*不可修改</span><br><br>
			<label for="inputs">事项编号:</label><input class="disabled" type="text" disabled="disabled" value="${list[0].eId }"><span>*不可修改</span><br><br>
			<label for="inputs">工资总和:</label><input class="disabled" type="text" disabled="disabled" value="${list[0].sSum }"><span>*不可修改</span><br><br>
			<label for="inputs">发工资时间:</label>
			<select name="year"  onchange="getday()" >
        		<option value="1990">1990</option>
    		</select>年
    		<select name="month"  onchange="getday()" >
       			<option value="1">1</option>
		    </select>月
		    <select name="day">
		        <option>1</option>
		    </select>日
			
			<br><br>
			<input type="submit" id="submit" value="修改">
			
		</form>
	
	</center>
	<script language="JavaScript">
		function getTime(){
			
			var otime = '${list[0].sTime}';
			var oyear = "",omonth = "", oday = "";
			var oyear = otime.substr(0,4);
			var omonth = otime.substr(5,2);
			var oday = otime.substr(8,2);
			
			
		    var year = document.myform.year;
		    var start =2019;
		    var end =2019;
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
		    if(oyear%4==0&&oyear%100 != 0||oyear%400 == 0){
		    	if(omonth==1||omonth==3||omonth==5||omonth==7||omonth==8||omonth==10||omonth==12){
		    		daynum=31;
		    	}else if(omonth==4||omonth==6||omonth==9||omonth==11){
		    		daynum=30;
		    	}else{
		    		daynum=29;
		    	}
		    }else{
		    	if(omonth==1||omonth==3||omonth==5||omonth==7||omonth==8||omonth==10||omonth==12){
		    		daynum=31;
		    	}else if(omonth==4||omonth==6||omonth==9||omonth==11){
		    		daynum=30;
		    	}else{
		    		daynum=28;
		    	}
		    }
		    for(var i=start;i<=end;i++){
		    	if(i==oyear){
		    		html+="<option selected value="+i+">"+i+"</option>";
		    	}else{
		    		html+="<option value="+i+">"+i+"</option>";
		    	}
		    }
		    year.innerHTML = html;
		    for(var m=start1;m<=end1;m++){
		        if(m==omonth){
		        	Month+="<option selected value="+m+">"+m+"</option>";
		        }else{
		        	Month+="<option value="+m+">"+m+"</option>";
		        }
		    }
		    month.innerHTML = Month;
		    
		    for(var i=1;i<=daynum;i++){
		    	if(i==oday){
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
</script>
</body>
</html>