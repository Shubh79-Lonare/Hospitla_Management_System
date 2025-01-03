package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			boolean f=dao.register(u);
			if(f==true) {
				System.out.println("Data inserted Successfully");
			}
			else {
				System.out.println("Something Wrong on Server");
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
			
	}

}
