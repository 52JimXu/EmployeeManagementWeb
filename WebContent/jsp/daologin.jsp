<%@page import="java.util.List"%>
<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@page import="com.wwwxy.employeemanagement.entity.LoginEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String path = request.getContentType();
    String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href = <%=basepath %>>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
	
		String name = request.getParameter("username");
		String password = request.getParameter("userpassword");
		
		LoginDao ld = new LoginDao();
		
		List list = ld.loginone(name, password);
		
		
		Object row = list.get(0);
		Object flag = list.get(1);
		 if("true".equals(flag)){
		 	if("1".equals(row)){
		 		 response.sendRedirect("../html/adminlogin.html");
			 %>
				<%-- <jsp:forword page=""/> --%>
			<%
			 }else{
				 response.sendRedirect("../html/emplogin.html");
				//out.print("员工登入成功！"); 
			%>
				<%-- <jsp:forword page=""/> --%>
			<%
				}
		 	}else{
		 		%>
		 			<script type="text/javascript">alert("用户名或密码错误");</script>
		 		<% 
		 		response.setHeader("refresh","0.1;../login.jsp");
			%>
				<%-- <jsp:forword page=""/> --%>
			<%
		 	}
		
	%>
</body>
</html>