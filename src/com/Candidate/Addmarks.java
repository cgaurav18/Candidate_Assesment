package com.Candidate;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Addmarks
 */
@WebServlet("/Addmarks")
public class Addmarks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addmarks() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int O=0,C=0,E=0,A=0,N=0;
		int rid=0;
		Connection con=Candi.connect();
		PreparedStatement psmt,qr;
		try {
			qr = con.prepareStatement("select * from test");
			ResultSet r = qr.executeQuery();
			psmt = con.prepareStatement("select * from test where qid=?");
			while(r.next()){
		
				psmt.setInt(1, r.getInt(1));
				ResultSet rs=psmt.executeQuery();
				rs.next();	
				String result=null;
				if(request.getParameter("q"+ r.getInt(1)).equals("sd")){
					result=rs.getString(3);
				}
				else if(request.getParameter("q"+ r.getInt(1)).equals("d")){
					result=rs.getString(4);
				}
				else if(request.getParameter("q"+ r.getInt(1)).equals("n")){
					result=rs.getString(5);
				}
				else if(request.getParameter("q"+ r.getInt(1)).equals("a")){
					result=rs.getString(6);
				}
				else if(request.getParameter("q"+ r.getInt(1)).equals("sa")){
					result=rs.getString(7);
				}
				
				switch(result.charAt(0)){
				case 'o' : O+=Character.getNumericValue(result.charAt(1));
							break;
				case 'c' : C+=Character.getNumericValue(result.charAt(1));
							break;
				case 'e' : E+=Character.getNumericValue(result.charAt(1));
							break;
				case 'a' : A+=Character.getNumericValue(result.charAt(1));
							break;
				case 'n' : N+=Character.getNumericValue(result.charAt(1));
							break;
				}
			}
			
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		PreparedStatement psmt2;
		try {
			psmt2 = con.prepareStatement("insert into result values(?,?,?,?,?,?,?,?)");
			psmt2.setInt(1, Locker.getJid());
			psmt2.setInt(2,Locker.getCid());
			psmt2.setInt(3, O);
			psmt2.setInt(4, C);
			psmt2.setInt(5, E);
			psmt2.setInt(6, A);
			psmt2.setInt(7, N);
			psmt2.setInt(8, rid);
			if(psmt2.executeUpdate()==1){
				response.sendRedirect("applied.html");
			}
			
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}

	}

