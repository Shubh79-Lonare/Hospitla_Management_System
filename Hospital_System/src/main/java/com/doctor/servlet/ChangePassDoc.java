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
@WebServlet("/doctChangePassword")
public class ChangePassDoc extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int uid= Integer.parseInt(request.getParameter("uid"));
	String oldPassword=request.getParameter("oldPassword");
	String newPassword= request.getParameter("newPassword");
	
	DoctorDao dao = new DoctorDao(DBConnection.getConn());
	HttpSession session= request.getSession();
	
	if(dao.checkOldPassword(uid, oldPassword)) {
		
		if(dao.changePassword(uid, newPassword)) {
			
			session.setAttribute("succMsg", "Password Changed Successfully");
			response.sendRedirect("doctor/edit_profile.jsp");
			
		}
		else {
			session.setAttribute("errorMsg", "Old Password Incorrect");
			response.sendRedirect("doctor/edit_profile.jsp");
		}
		
	}else {
		session.setAttribute("errorMsg", "Old Password Incorrect");
		response.sendRedirect("doctor/edit_profile.jsp");
	}
	
	
	}

}
