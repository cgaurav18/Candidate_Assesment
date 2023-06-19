<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%@ page import ="java.sql.*"  %>
<%@ page import="com.Candidate.*"%>
<%

int cid= Integer.parseInt(request.getParameter("cid")); 
int jid = Integer.parseInt(request.getParameter("jid"));

String message = "Congratulations! You are selected";

Connection con = Candi.connect();
PreparedStatement p3 = con.prepareStatement ("select name from cand where cid=?");
p3.setInt(1, cid);
ResultSet r = p3.executeQuery();
r.next();
String name = r.getString(1);

PreparedStatement p4 = con.prepareStatement ("select title,sal from job where jid=?");
p4.setInt(1,jid);
ResultSet p = p4.executeQuery();
p.next();
String title = p.getString(1);
String sal = p.getString(2);

PreparedStatement p5 = con.prepareStatement ("insert into notif values(?,?,?,?)");
p5.setString(1,message);
p5.setString(2,name);
p5.setString(3,title);
p5.setString(4,sal);
int i =p5.executeUpdate();
if(i>0)
{
	response.sendRedirect("viewshort.jsp");
}

%>
</body>
</html>