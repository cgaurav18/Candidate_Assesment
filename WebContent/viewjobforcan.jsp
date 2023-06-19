<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body >
 <%@ page import ="java.sql.*"  %>
<%@ page import="com.Candidate.*"%>
  <title>Candidate Assesment</title>
  <link rel="stylesheet" href="./style.css">

</head>
<body>
<!-- partial:index.partial.html -->
<html lang="en">
<head>
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  </head>

<body>
<div id="form">
  <div class="container">
    <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-md-8 col-md-offset-2">
      <div id="userform">
        <ul class="nav nav-tabs nav-justified" role="tablist">
          <li class="active"><a href="#signup"  role="tab" data-toggle="tab">Job Details</a></li>
         
        </ul>
        <div class="tab-content">
          <div class="tab-pane fade active in" id="signup">
            <h2 class="text-uppercase text-center">Job Details</h2>
            </div>
            </div>
            </div>
            </div>
            </div>
  <% 
Connection con = Candi.connect();
PreparedStatement pstmt = con.prepareStatement("select * from job ");

ResultSet rs = pstmt.executeQuery();
%>

<center>

<br><br><br>

<center>

 <table class="table table-hover">
        <thead>
<tr bgcolor="white">

<th><font color="black" size="3">Job ID</font></th>
<th><font color="black" size="3">Title</font></th>
<th><font color="black" size="3">Description</font></th>
<th><font color="black" size="3">Salary Range</font></th>
<th><font color="black" size="3">Experience</font></th>
<th><font color="black" size="3">Register</font></th>

</tr>
 </thead>
        <tbody>
<%while(rs.next()) {%>
<tr bgcolor="white">
<TD><font color="black" size="3"><%= rs.getInt(1) %></font></TD>


<TD><font color="black" size="3"><%= rs.getString(2) %></font></TD>
<TD><font color="black" size="3"><%= rs.getString(3) %></font></TD>
<TD><font color="black" size="3"><%= rs.getString(4) %></font></TD>
<TD><font color="black" size="3"><%= rs.getString(6) %></font></TD>
<TD><font color="black" size="3"><a href="register.jsp?jid=<%=rs.getInt(1) %>">Apply</a></font></TD>

</tr>
<%} %>
</tbody>
</table><br><br><br>
<form action="index.html" method="post">
<div class="mrgn-30-top">
                <button type="submit"  class="btn btn-larger btn-block"/>
                Back to dashboard
                </button>
                </div>
                </form>
</body>
</html>