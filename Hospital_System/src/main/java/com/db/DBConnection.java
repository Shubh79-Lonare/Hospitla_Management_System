package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static Connection conn;

	public static Connection getConn() {
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				 conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/Hospital","root","root");
			System.out.println("Connection Establish");
			}catch(Exception e) {
				System.out.println(e);
			}
			
			return conn;
		}
}
