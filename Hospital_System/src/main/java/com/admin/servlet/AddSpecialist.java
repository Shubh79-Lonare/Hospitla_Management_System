package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialistDao;
import com.db.DBConnection;
@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String specName= request.getParameter("specName");
		
		SpecialistDao dao = new SpecialistDao(DBConnection .getConn());
		boolean f=dao.addSpecialist(specName);
		
		HttpSession session = request.getSession();
		
		if(f) {
			session.setAttribute("sucMsg", "Specialist Added");
			response.sendRedirect("admin/index.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Something wrong on server");
			response.sendRedirect("admin/index.jsp");
			
		}
		
		
		
		
		
	}

}
