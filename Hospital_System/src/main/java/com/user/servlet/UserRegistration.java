package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnection;
import com.entity.User;

@WebServlet("/user_register")
public class UserRegistration extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String fullName= request.getParameter("full name");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			User u= new User(fullName, email, password);
			
			UserDao dao= new UserDao(DBConnection.getConn());
			
			HttpSession session= request.getSession();
			
			boolean f=dao.register(u);
			
			if(f) {
				session.setAttribute("sucMsg", "Register Successfully");
				response.sendRedirect("signup.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Something Went Wrong");
				response.sendRedirect("signup.jsp");
			}
			System.out.println("Value of f: " + f);

			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
			
	}

}
