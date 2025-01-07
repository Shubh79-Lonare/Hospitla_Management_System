package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DBConnection;
import com.entity.Doctor;
@WebServlet("/addDoctor")
public class AddDoctor extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	try {
		
		String fullName=request.getParameter("fullname");
		String dob=request.getParameter("dob");
		String qualification=request.getParameter("qualification");
		String spec=request.getParameter("spec");
		String email=request.getParameter("email");
		String mobno=request.getParameter("mobno");
		String password=request.getParameter("password");
		
		Doctor d=new Doctor(fullName, dob, qualification, spec, email, mobno, password);
		
		DoctorDao dao= new DoctorDao(DBConnection.getConn());
		
		HttpSession session = request.getSession();
		
		if(dao.registerDoctor(d)) {
		session.setAttribute("sucMsg", "Doctor Added Successfully..");
		response.sendRedirect("admin/doctor.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Something Went Wrong..");
			response.sendRedirect("admin/doctor.jsp");
		}
		
	} catch (Exception e) {

	}
	
	}

}
