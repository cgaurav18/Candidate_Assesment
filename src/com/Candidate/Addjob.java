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

/**
 * Servlet implementation class Addjob
 */
@WebServlet("/Addjob")
public class Addjob extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addjob() {
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
		
		int jid=0;
		String title = request.getParameter("title");
		String desc = request.getParameter("desc");
		String sal = request.getParameter("sal");
		String qua = "";
		String exp = request.getParameter("exp");
		
		boolean o,c,e,a,n;
		Connection con = Candi.connect();
		PreparedStatement pstmt;
		try {
			try{
			if(request.getParameter("o").equals("Openness"))
			{
				qua+=("openness,");
			}
			}
			catch(java.lang.NullPointerException ne)
			{
				o=false;
			}
			try{
			if(request.getParameter("c").equals(" Conscientiousness"))
			{
				qua+=(" Conscientiousness,");
			}
			}catch(java.lang.NullPointerException ne)
			{
				c=false;
			}
			try{
			if(request.getParameter("e").equals("Extraversion"))
			{
				qua+=("Extraversion,");
			}
			}catch(java.lang.NullPointerException ne)
			{
				e=false;
			}
			try{
			if(request.getParameter("a").equals("Agreeableness"))
			{
				qua+=("Agreeableness,");
			}
			}catch(java.lang.NullPointerException ne)
			{
				a=false;
			}
			try{
			if(request.getParameter("n").equals("Neuroticism"))
			{
				qua+=("Neuroticism,");
			}
			}catch(java.lang.NullPointerException ne)
			{
				n=false;
			}
			pstmt = con.prepareStatement("insert into job values(?,?,?,?,?,?,?)");
			pstmt.setInt(1, jid);
			pstmt.setString(2, title);
			pstmt.setString(3,desc);
			pstmt.setString(4, sal);
			pstmt.setString(5, qua);
			pstmt.setString(6, exp);
			pstmt.setInt(7, Locker.getHrid());
			int i =pstmt.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("jobadded.html");
			}
		} catch (SQLException ae) {
			// TODO Auto-generated catch block
			ae.printStackTrace();
		}
	}

}
