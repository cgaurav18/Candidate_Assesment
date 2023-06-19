<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title>Candidate Assesment</title>
  <link rel="stylesheet" href="./style.css">
  </head>
  <body>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
 <%@ page import ="java.sql.*"  %>
<%@ page import="com.Candidate.*"%>
 <% 
 
 
 String name = request.getParameter("name");
	String mail = request.getParameter("email");
	 String city = request.getParameter("city");
	String Gender = request.getParameter("Gender");
	long moba=Long.parseLong(request.getParameter("moba"));
	int age = Integer.parseInt(request.getParameter("age"));
	int exp = Integer.parseInt(request.getParameter("exp"));
	int cid=0;
	
Connection con = Candi.connect();
PreparedStatement pstmt = con.prepareStatement("insert into cand values(?,?,?,?,?,?,?,?) ");
pstmt.setInt(1, cid);
pstmt.setString(2, name);
pstmt.setString(3, mail);
pstmt.setString(4, city);
pstmt.setString(5, Gender);
pstmt.setLong(6, moba);
pstmt.setInt(7, age);
pstmt.setInt(8, exp);

int i=pstmt.executeUpdate();
if(i>0)
{
	PreparedStatement po = con.prepareStatement("select cid from cand where email=? and mobile=?");
	po.setString(1, mail);
	po.setLong(2, moba);
	ResultSet r = po.executeQuery();
	if(r.next())
	{
		cid=r.getInt(1);
		Locker.setCid(cid);
	}
}
%>
<div id="form">
  <div class="container">
    <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-md-8 col-md-offset-2">
      <div id="userform">
        <ul class="nav nav-tabs nav-justified" role="tablist">
          <li class="active"><a href="#signup"  role="tab" data-toggle="tab">OCEAN Test</a></li>
           </ul>
        <div class="tab-content">
          <div class="tab-pane fade active in" id="signup">
            <h2 class="text-uppercase text-center"> Test</h2>
            
             
              <div class="form-group">
               <% 
 Connection co= Candi.connect();
Statement stmt ;
stmt = co.createStatement();
ResultSet rs=stmt.executeQuery("select * from test");

%>
</div>
</div>
</div>
</div>
</div>

<form action="Addmarks" method="post">
<table class="table table-hover">
        <thead>
<tr bgcolor="white">
    
    <th><font color="black">Questions</font></th>
    <th>         </th>
    <th>         </th>
    <th><font color="black">Choose Any One Option</font></th>
    <th>         </th>
    <th>         </th>
    
  </tr>
  </thead>
  
  <%int count=1; %>
  <tbody>
  <% while(rs.next()) { %>
  <tr bgcolor="white">
    
    <td><font color="black"><%= rs.getString(2) %></font></td>
    <th><input type="radio" value="sd" name="q<%=count %>" ><font color="black"> Strongly Disagree</font> </th>
    <th><input type="radio" value="d" name="q<%=count%>"><font color="black"> Disagree </font></th>
    <th><input type="radio" value="n" name="q<%=count %>"><font color="black"> Neutral </font></th>
    <th><input type="radio" value="a" name="q<%=count %>" ><font color="black"> Agree </font></th>
    <th><input type="radio" value="sa" name="q<%=count %>" > <font color="black">Strongly Agree</font></th>
  
  </tr>
 <%  count++;} %>
 </tbody>
</table>
              
                <button type="submit"  class="btn btn-larger btn-block">
                Submit
                </button>
                
             
              </form>
          
          </div>
          <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
<!-- partial -->
  <script  src="./script.js"></script>
</body>
</html>