package com.Candidate;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Candi {
	 public static Connection connect()
	{
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
				con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/candidate","root","");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		 catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		
		
	}
}
