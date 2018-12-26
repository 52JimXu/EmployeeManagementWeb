<%@page import="com.wwwxy.employeemanagement.dao.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    	String path = request.getContentType();
    	String basepath = request.getScheme()+"://"+request.getServerName()
    			+":"+request.getServerPort()+path+"/";
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href = <%=basepath %>>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	

</script>
</head>
<body>
	<%
		Integer id = Integer.parseInt(request.getParameter("id")); 
		LoginDao ld = new LoginDao();
		int row = ld.delLoginById3(id);
		if(row==1){
			out.print("执行成功！");
			//执行成功，重定向更新3秒回“deletelogin.jsp”
			response.setHeader("refresh", "3;URL=deletelogin.jsp");
		}else{
			out.print("执行失败！");
			//执行失败，重定向更新3秒回“deletelogin.jsp”
			response.setHeader("refresh", "3;URL=deletelogin.jsp");
		}
	%>
</body>
</html>