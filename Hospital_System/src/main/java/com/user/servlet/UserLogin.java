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
@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password= request.getParameter("password");
		
		HttpSession session = request.getSession();
		
		UserDao dao= new UserDao(DBConnection.getConn());
		User user =dao.login(email, password);
		
		if(user!=null) {
			session.setAttribute("userObj", user);
			response.sendRedirect("index.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Invalid Email Or Password");
			response.sendRedirect("user_login.jsp");
		}
		
	}
}
