<%@page import="java.util.List"%>
<%@page import="com.wwwxy.employeemanagement.dao.EmployeeDao"%>
<%@page import="com.wwwxy.employeemanagement.entity.EmployeeEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增员工信息</title>
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
      form .empage{
     	margin-left:125px;
     } 
     
</style>
<body onload="getTime()">

<%
		EmployeeDao ed = new EmployeeDao();
		int id = ed.GetMaxId();
		int empid = id+1;
		
%>


<center>
	<h1>欢迎来到员工信息新增</h1>
		<form name="myform" method="post" action="doaddemployee.jsp" onsubmit="return checkAll()">
			<div id="n">
			<label for="inputs">员工姓名:</label><input name="empname" onblur="checkname()" id="nameinput" type="text"  value="">
			<span id ="name"></span>
			<br><br>
			</div>
			<label for="inputs">员工性别:</label>
			
			<input name="sex" class="sex" type="radio" value="男" />男
			<input name="sex" class="sex" type="radio" value="女" />女
			


			<br><br>
			<div class="empage"><label for="inputs">员工年龄:</label><input name="empage" id="empage" type="text" readonly value="118"><span class="bkxg">*请通过修改生日新增年龄</span><br><br></div>
			<label for="inputs">员工生日:</label>
			<select name="year" id="year" onchange="getday()" >
        		<option value="1990">1990</option>
    		</select>年
    		<select name="month"  onchange="getday()" >
       			<option value="1">1</option>
		    </select>月
		    <select name="day">
		        <option>1</option>
		    </select>日
			
			
			<br><br>
			<div id="b">
			<label for="inputs">员工工资:</label><input name="empbasic"  type="text" onblur="validate()" id="basicinput"  value="">
			<span id ="basic"></span>
			<br><br>
			</div>
			<div id="big">
			<label for="inputs">员工邮箱:</label><input name="empemail" type="text" onblur="isEmail(this.value)" id="emailinput"  value="">
			<span id ="email"></span>
			<br><br>
			</div>
			<div id ="a">
			<label for="inputs">员工地址:</label><input id="addressinput" name="empaddress" onblur="checkaddress()" type="text"  value="">
			<span id ="address"></span>
			<br><br>
			</div>
			
			
			<br>
			<input type="submit" id="submit" value="新增">
			
		</form>
	
	</center>
<script language="JavaScript">
function getTime(){
    var year = document.myform.year;
    var start =1900;
    var end =2017;
    var html;
    var month = document.myform.month;
    var start1 =1;
    var end1 =12;
    var Month;
    var day = document.myform.day;
    var start2 =1;
    var end2 =31;
    var Day;
    for(var i=start;i<=end;i++){
        html+="<option value="+i+">"+i+"</option>";
    }
    year.innerHTML = html;
    for(var m=start1;m<=end1;m++){
        Month+="<option value="+m+">"+m+"</option>";
    }
    month.innerHTML = Month;
    for(var i=1;i<=31;i++){
        Day += "<option value="+i+">"+i+"</option>";
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
	var flag = false;
	var emailinput = document.getElementById("emailinput").value;
		if(checkname()&&checksex()&&validate()&&isEmail(emailinput)&&checkaddress()){
			flag=true;
			
		}else{
			flag=false;
		}
			
	return flag;


}
function checksex(){
	var sex = document.getElementsByClassName("sex");
	var flag = false;
	for(var i=0; i<sex.length; i ++){
        if(sex[i].checked){
            flag = true;
        }
    }
	if(flag){
		return true;
	}else{
		alert("你还没有选择性别");
		return false;
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
function validate(){
    var reg = /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;
    var obj = document.getElementById("basicinput");
    var basic = document.getElementById("basic");
    var big = document.getElementById("b");
 if(!reg.test(obj.value)){
	 basic.innerHTML =("*工资不正确");
	 basic.style.cssText="color:red;font-size:12px;display:inline-block;";
	 big.style.cssText="margin-left:75px;";
 	return false;
 }else{
 	basic.style.cssText="display:none;";
 	big.style.cssText="";
 }
 return true;
 }
function checkaddress(){
    var reg = /^[\u4e00-\u9fa5a-zA-Z0-9]+$/;
    var obj = document.getElementById("addressinput");
    var address = document.getElementById("address");
    var a = document.getElementById("a");
 if(!reg.test(obj.value)){
     address.innerHTML =("*地址不正确");
     address.style.cssText="color:red;font-size:12px;display:inline-block;";
     a.style.cssText="margin-left:75px;";
     return false;
 }else{
	 	address.style.cssText="display:none;";
	 	a.style.cssText="";
	 }
 return true;
}
function checkname(){
    var obj = document.getElementById("nameinput");
    var name = document.getElementById("name");
    var n = document.getElementById("n");
 if((obj.value)==""){
     name.innerHTML =("*姓名不正确");
     name.style.cssText="color:red;font-size:12px;display:inline-block;";
     n.style.cssText="margin-left:75px;";
     return false;
 }else{
	 	name.style.cssText="display:none;";
	 	n.style.cssText="";
	 	return true;
	 }
}

</script>
</body>
</html>