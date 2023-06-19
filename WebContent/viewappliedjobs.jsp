<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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
          <li class="active"><a href="#signup"  role="tab" data-toggle="tab">Applied Jobs</a></li>
         
        </ul>
        <div class="tab-content">
          <div class="tab-pane fade active in" id="signup">
            <h2 class="text-uppercase text-center">Applied Jobs</h2>
            </div>
            </div>
            </div>
            </div>
            </div>
            
    
     <% 
     int joid=0;
     int cid =Integer.parseInt(request.getParameter("cid"));
Connection con = Candi.connect();
PreparedStatement pstmt = con.prepareStatement("select jid from result where cid=?");
pstmt.setInt(1, cid);
ResultSet rs = pstmt.executeQuery();
while(rs.next())
{
	joid = rs.getInt(1);
}
PreparedStatement pst = con.prepareStatement("select * from job where jid=?");
pst.setInt(1, joid);
ResultSet r = pst.executeQuery();
%>
<br>



<center>

 <table class="table table-hover">
        <thead>
<tr bgcolor="white">
<th><font color="black" size="3">Job Id</font></th>

<th><font color="black" size="3">Job Title</font></th>
<th><font color="black" size="3">Description</font></th>
<th><font color="black" size="3">Salary</font></th>
<th><font color="black" size="3">Qualities</font></th>
<th><font color="black" size="3">Experience</font></th>

</tr>
</thead>
<tbody>
<%while(r.next()) {%>
<tr bgcolor="white">
<TD><font color="black" size="3"><%= r.getInt(1) %></font></TD>

<TD><font color="black" size="3"><%= r.getString(2) %></font></TD>
<TD><font color="black" size="3"><%= r.getString(3) %></font></TD>
<TD><font color="black" size="3"><%= r.getString(4) %></font></TD>
<TD><font color="black" size="3"><%= r.getString(5) %></font></TD>
<TD><font color="black" size="3"><%= r.getInt(6) %></font></TD>

</tr>
<%} %>
</tbody>
</table><br><br><br>
 <div class="mrgn-30-top">
                <button type="submit"  class="btn btn-larger btn-block"/><a href=admin.html>
                Back to dashboard</a>
                </button>
                </div>

<!-- /.container --> 
</div>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
<!-- partial -->
  <script  src="./script.js"></script>

</body>
</html>
      
<!--   Core JS Files   -->
<script src="./assets/js/core/popper.min.js" ></script>
<script src="./assets/js/core/bootstrap.min.js" ></script>
<script src="./assets/js/plugins/perfect-scrollbar.min.js" ></script>
<script src="./assets/js/plugins/smooth-scrollbar.min.js" ></script>










































































  </body>


</html>