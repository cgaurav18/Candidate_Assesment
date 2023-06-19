package com.Candidate;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Candidate.Candi;

/**
 * Servlet implementation class Addhr
 */
@WebServlet("/Addhr")
public class Addhr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addhr() {
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
		int hrid=0;
		
		String name = request.getParameter("name");
		String mail = request.getParameter("mail");
		long mob = Long.parseLong(request.getParameter("mob"));
		String psd = request.getParameter("psd");
		String desig = request.getParameter("desig");
		
		Connection con = Candi.connect();
		PreparedStatement pstmt;
		try {
			pstmt = con.prepareStatement("insert into hr values(?,?,?,?,?,?)");
			pstmt.setInt(1, hrid);
			pstmt.setString(2, name);
			pstmt.setString(3, mail);
			pstmt.setLong(4, mob);
			pstmt.setString(5, psd);
			pstmt.setString(6, desig);
			
			int i =pstmt.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("hradded.html");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
