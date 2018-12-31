package com.wwwxy.employeemanagement.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wwwxy.employeemanagement.dao.EventDao;
import com.wwwxy.employeemanagement.entity.EventEntity;

/**
 * Servlet implementation class AddEventServlet
 */
@WebServlet("/AddEventServlet")
public class AddEventServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int empid = Integer.parseInt(request.getParameter("empid"));
		EventDao ed = new EventDao();
		PrintWriter out = response.getWriter();
		String flag ="-1";
		List<EventEntity> list = ed.getAllEvent();
		for(EventEntity lists:list){
			if(lists.geteMpid()==empid){
				flag="0";
			}
		}
		if("0".equals(flag)){
			out.write("0");
		}else{
			ed.AddEventAfterAddEmp(empid);
			out.write("1");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
