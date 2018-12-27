<%@page import="com.wwwxy.employeemanagement.dao.EmployeeDao"%>
<%@page import="com.wwwxy.employeemanagement.entity.EmployeeEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改员工信息</title>
</head>
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
            
       .disabled{
       			/* margin-right:-50px; */
       }     
     .bkxg{
     	
     	font-size:12px;
     	
     }
     #disabled{
     	font-size:20px;
     }
     select{
     	border: 1px solid #ccc; 
                padding: 7px 0px;
                border-radius: 3px; /*css3属性IE不支持*/
                padding-left:5px; 
     }
     form .empid{
     	margin-left:55px;
     }
     form .empage{
     	margin-left:125px;
     }
     
</style>
<body onload="getTime()">
	<%
		
		int id = Integer.parseInt(request.getParameter("id"));
		EmployeeDao ed = new EmployeeDao();
		EmployeeEntity ee  = ed.getEmployeeById(id);
		
		pageContext.setAttribute("id", id);
		pageContext.setAttribute("ee", ee);
	%>
<center>
	<h1>欢迎来到员工信息修改</h1>
		<form name="myform" onsubmit="return checkAll()" action="successupdateemployee.jsp?id=${id }" method="post">
			<div class="empid"><label for="inputs"><span id="disabled">员工编号:</span></label><input class="disabled" type="text" readonly value="${ee.empId }"><span class="bkxg">*不可修改</span><br><br></div>
			<label for="inputs">员工姓名:</label><input name="name" type="text"  value="${ee.empName }"><br><br>
			<label for="inputs">员工性别:</label>
			
			<%-- <input name="sex" type="radio" value="男" <%if(flag){%>checked<% } %>/>男
			<input name="sex" type="radio" value="女" <%if(!flag){%>checked<% } %>/>女 --%>
			<c:choose>
				<c:when test="${ee.empSex eq '男' }">
					<input name="sex" type="radio" value="男" checked/>男
					<input name="sex" type="radio" value="女"/>女
				</c:when>
				<c:otherwise>
					<input name="sex" type="radio" value="男"/>男
					<input name="sex" type="radio" value="女" checked/>女
				</c:otherwise>
			</c:choose>


			<br><br>
			<div class="empage"><label for="inputs">员工年龄:</label><input name="age" id="empage" type="text" readonly value="${ee.empAge }"><span class="bkxg">*请通过修改生日修改年龄</span><br><br></div>
			<label for="inputs">员工生日:</label>
			<select name="year"  id="year" onchange="getday()" >
        		<option value="1990">1990</option>
    		</select>年
    		<select name="month"   onchange="getday()" >
       			<option value="1">1</option>
		    </select>月
		    <select name="day" >
		        <option>1</option>
		    </select>日
			
			
			<br><br>
			<label for="inputs">员工工资:</label><input name="basic" type="text"  value="${ee.empBasic }"><br><br>
			<div id="big">
			<label for="inputs">员工邮箱:</label><input name="email" type="text" onblur="isEmail(this.value)" id="emailinput"  value="${ee.empEmail }">
			<span id ="email"></span>
			</div>
			<br>
			<label for="inputs">员工地址:</label><input name="address" type="text"  value="${ee.empAddress }"><br><br>
			
			
			
			<br>
			<input type="submit" id="submit" value="修改">
			
		</form>
	
	</center>
<script language="JavaScript">
		function getTime(){
		    var year = document.myform.year;
		    var otime = '${ee.empBirthday}';
			var oyear = "",omonth = "", oday = "";
			var oyear = otime.substr(0,4);
			var omonth = otime.substr(5,2);
			var oday = otime.substr(8,2);
		    
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
		    yearchage();
		}
</script>
<script type="text/javascript">
function isEmail(strEmail) {
    var flag = strEmail.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/);
    var email = document.getElementById("email");
	var big = document.getElementById("big");
    if (flag == -1){
    	email.innerHTML =("*邮箱不正确");
    	email.style.cssText="color:red;font-size:12px;display:inline-block;";
    	big.style.cssText="margin-left:70px;";
    	return false;
    }else{
    	email.style.cssText="display:none;";
    	big.style.cssText="";
    }
    return true;
}
function checkAll(){
	var emailinput = document.getElementById("emailinput").value;
    if(!isEmail(emailinput)){
        return false;
    }else{
        return true;
    }

}
</script>
<script type="text/javascript">
/*根据出生日期算出年龄*/
function yearchage(){
	var birthYear = document.getElementById("year").value;
	var returnAge = jsGetAge(birthYear);
	var empage = document.getElementById("empage");
	empage.value = returnAge;
}


function jsGetAge(birthYear){       
    var returnAge;

    d = new Date();
    var nowYear = d.getFullYear();
    
    if(nowYear == birthYear){
        returnAge = 0;//同年 则为0岁
    }
    else{
        var ageDiff = nowYear - birthYear ; //年之差
		returnAge = ageDiff
    }
    return returnAge;//返回周岁年龄
    
}

</script>
</body>
</html>