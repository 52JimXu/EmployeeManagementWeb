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
<title>ERROR</title>
<style type="text/css">
        .modal {
            display: none; /* 默认隐藏 */
            position: fixed; /* 根据浏览器定位 */
            z-index: 1; /* 放在顶部 */
            left: 0;
            top: 0;
            width: 100%; /* 全宽 */
            height: 100%; /* 全高 */
            overflow: auto; /* 允许滚动 */
            background:rgba(0,0,0,0.5);
        }
        /*模态框内容*/
        .modal-content {
            border-radius: 5px;
            display: flex; /*采用flexbox布局*/
            flex-direction: column; /*垂直排列*/
            position: relative;
            background-color: #fefefe;
            margin: 19% auto; /*距顶部15% 水平居中*/
            padding: 20px;
            border: 1px solid #888;
            width: 435px;
            height: 125px;
            /* animation: topDown 0.4s; !*自定义动画，从模态框内容上到下出现*!*/
        }
        /*关闭X 样式*/
        .close {
            border-radius: 5px;
           margin-top: 5px;
            margin-left: 380px;
        }
        .close:hover{

            cursor:pointer;
            border-radius: 5px;
            background-color: black;
            color: white;
        }
    </style>
</head>
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
		 		Object id1 = list.get(2);
				 String myid = String.valueOf(id1);
					int id = Integer.parseInt(myid);
					String username = ld.getLoginById5(id);
		 		 session.setAttribute("admin", 1);
		 		 session.setAttribute("username", username);
		 		 session.setAttribute("id", id);
		 		 response.sendRedirect("main.jsp");
			 %>
				<%-- <jsp:forword page=""/> --%>
			<%
			 }else{
				 Object id1 = list.get(2);
				 String myid = String.valueOf(id1);
					int id = Integer.parseInt(myid);
					String username = ld.getLoginById5(id);
				 session.setAttribute("admin", 0);
				 session.setAttribute("id", id);
				 session.setAttribute("username", username);
				 response.sendRedirect("empmain.jsp");
				//out.print("员工登入成功！"); 
			%>
				<%-- <jsp:forword page=""/> --%>
			<%
				}
		 	}else{
		 		%>
		 			<script type="text/javascript"> 
		 				window.onload = function(){
		 					error();
		 				};
		 			</script>
		 		<% 
		 		response.setHeader("refresh","3;../login.jsp");
			%>
				<%-- <jsp:forword page=""/> --%>
			<%
		 	}
		
	%>
<body>
<div class="asdasdas">
    <!-- 模态框 -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <div>
            	<h3>登录失败</h3>
		                密码或账号错误请重新登陆。。。<br/>
		                三秒返回登录页面
            </div>
            <div id="closeBtn" class="close">确定</div>
        </div>
        </div>
    </div>
    <script type="text/javascript">
        function error() {
            /*建立模态框对象*/
            var modalBox = {};
            /*获取模态框*/
            modalBox.modal = document.getElementById("myModal");
            /*获得trigger按钮*/
            modalBox.triggerBtn = document.getElementById("triggerBtn");

            /*获得关闭按钮*/
            modalBox.closeBtn = document.getElementById("closeBtn");
            /*模态框显示*/
            modalBox.show = function() {
                console.log(this.modal);
                this.modal.style.display = "block";
            }
            /*模态框关闭*/
            modalBox.close = function() {
                this.modal.style.display = "none";
            }
            /*当用户点击模态框内容之外的区域，模态框也会关闭*/
            modalBox.outsideClick = function() {
                var modal = this.modal;
                window.onclick = function(event) {
                    if(event.target == modal) {
                        modal.style.display = "none";
                    }
                }
            }
            /*模态框初始化*/
            modalBox.init = function() {
                var i=1;
                var that = this;
                if(i==1) {
                    that.show();
                }
                this.closeBtn.onclick = function() {
                    that.close();
                }
                this.outsideClick();
            }
            modalBox.init();

        }
    </script>

</body>
</html>