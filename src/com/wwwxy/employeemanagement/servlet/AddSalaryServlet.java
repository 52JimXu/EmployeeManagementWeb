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
import com.wwwxy.employeemanagement.dao.SalaryDao;
import com.wwwxy.employeemanagement.entity.EventEntity;
import com.wwwxy.employeemanagement.entity.SalaryEntity;

/**
 * Servlet implementation class AddSalaryServlet
 */
@WebServlet("/AddSalaryServlet")
public class AddSalaryServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int empid = Integer.parseInt(request.getParameter("empid"));
		EventDao ed = new EventDao();
		PrintWriter out = response.getWriter();
		String flag ="-1";
		List<EventEntity> list = ed.getEventById(empid);
		SalaryDao sd = new SalaryDao();
		List<SalaryEntity> lists = sd.GetSalaryByEmpId(empid);
		if(lists.size()==0){
			if(list.size()==0){
				ed.AddEventAfterAddEmp(empid);
				out.write("1");
			}else{
				sd.AddSalaryAfterAddEvent(empid);
			}
		}else{
			out.write("0");
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
