<%@page import="com.wwwxy.employeemanagement.dao.EmployeeDao"%>
<%@page import="com.wwwxy.employeemanagement.entity.EmployeeEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>doaddemployee.jsp</title>
</head>
  <script src="../layer/jquery-1.11.3.min.js"></script>
    <script src="../layer/layer/layer.js"></script>
<body>
	<%	
		request.setCharacterEncoding("utf-8");
		String empname = request.getParameter("empname");
		String empsex = request.getParameter("sex");
		int empage = Integer.parseInt(request.getParameter("empage")); 
		String empbirthday = request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day");
		float empbasic =Float.valueOf(request.getParameter("empbasic"));
		String empemail = request.getParameter("empemail");
		String empaddress = request.getParameter("empaddress");
		EmployeeEntity ee = new EmployeeEntity(0, empname,empsex,
				empage, empbirthday, empbasic,
				empemail, empaddress);
		EmployeeDao ed = new EmployeeDao();
		 int row = ed.AddEmployee(ee);
		if(row >0){
			%>
			<script type="text/javascript">
				layer.confirm('执行成功', {
				  btn: ['确定'], //按钮
				  icon:1
				}, function(){
					window.document.location.href="getemployee.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=getemployee.jsp");
		}else{
			%>
			<script type="text/javascript">
				layer.confirm('执行失败', {
				  btn: ['确定'], //按钮
				  icon:2
				}, function(){
					window.document.location.href="getemployee.jsp";
				});
			</script>
			
			<% 
			response.setHeader("refresh", "10;URL=getemployee.jsp");
		} 
		
	%>
</body>
</html>