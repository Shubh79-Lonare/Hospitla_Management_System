package com.doctor.servlet;

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

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password= request.getParameter("password");
		
		HttpSession session = request.getSession();
		
		DoctorDao dao= new DoctorDao(DBConnection.getConn());
		Doctor doctor=dao.login(email, password);
		
		if(doctor!=null) {
			session.setAttribute("doctorObj", doctor);
			response.sendRedirect("doctor/index.jsp");
			System.out.println("trying to get index page");
		}
		else {
			session.setAttribute("errorMsg", "Invalid Email Or Password");
			response.sendRedirect("doctor_login.jsp");
		}
	
	}

}
