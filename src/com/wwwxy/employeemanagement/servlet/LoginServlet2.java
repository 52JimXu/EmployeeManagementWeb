package com.wwwxy.employeemanagement.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wwwxy.employeemanagement.dao.LoginDao;

/**
 * Servlet implementation class LoginServlet2
 */
@WebServlet("/LoginServlet2")
public class LoginServlet2 extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		HttpSession session=request.getSession();
		LoginDao ld = new LoginDao();
		int id = ld.login(username, password);
		if(id!=0){
			int admin = ld.getAdminById(id);
			if(admin == 1){
				session.setAttribute("admin", admin);
				session.setAttribute("id", id);
				session.setAttribute("username", username);
				out.write("1");
			}else{
				session.setAttribute("admin", admin);
				session.setAttribute("id", id);
				session.setAttribute("username", username);
				out.write("0");
			}
		}else{
			out.write("-1");
		}
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
