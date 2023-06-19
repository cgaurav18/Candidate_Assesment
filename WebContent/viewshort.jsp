<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8" />


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
          <li class="active"><a href="#signup"  role="tab" data-toggle="tab">Shortlisted Candidates</a></li>
         
        </ul>
        <div class="tab-content">
          <div class="tab-pane fade active in" id="signup">
            <h2 class="text-uppercase text-center">Shortlisted Candidates</h2>
            </div>
            </div>
            </div>
            </div>
            </div>
     <% 
     boolean O=false,C=false,E=false,A=false,N=false;
     int jid=Integer.parseInt(request.getParameter("id"));
     
 	
Connection con = Candi.connect();
PreparedStatement pstmt = con.prepareStatement("select * from job where jid=?");
pstmt.setInt(1, jid);
ResultSet rs = pstmt.executeQuery();
rs.next();
int exp = rs.getInt(6);

	if(rs.getString(5).contains("Openness"))
	{
	O=true;
	}
	if(rs.getString(5).contains("Conscientiousness"))
	{
	C=true;
	}
	if(rs.getString(5).contains("Extraversion"))
	{
	E=true;
	}
	if(rs.getString(5).contains("Agreeableness"))
	{
	A=true;
	}
	if(rs.getString(5).contains("Neuroticism"))
	{
	N=true;
	}
	String query = "select * from result where jid="+jid;
	if(O)
	{
	query+=" and o>=10";
	}
	if(C)
	{
	query+=" and c>=10";
	}
	if(E)
	{
	query+=" and e>=10";
	}
	if(A){
	query+=" and a>=10";
	}
	if(N){
	query+=" and n>=10";
			
	}

PreparedStatement psmt2 = con.prepareStatement(query);
ResultSet rs2 = psmt2.executeQuery();
PreparedStatement p3 = con.prepareStatement ("select * from cand where cid=?");

%>
    <table class="table table-hover">
        <thead>
            <tr bgcolor="white">
                <th><font color="black">CANDIDATE ID</font></th>
                <th><font color="black">CANDIDATE NAME</font></th>
                <th><font color="black">O-MARKS</font></th>
                <th><font color="black">C-MARKS</font></th>
                <th><font color="black">E-MARKS</font></th>
                <th><font color="black">A-MARKS</font></th>
                <th><font color="black">N-MARKS</font></th>
                  
            </tr>
        </thead>
        <tbody>
        <%while(rs2.next())
    	{ %>
            <tr bgcolor="white">
               
                <td><font color="black"><%=rs2.getInt(2)%></font></td>
                
                <% int cid=rs2.getInt(2);
                		int joid = rs2.getInt(1);
                	p3.setInt(1,rs2.getInt(2));
                	ResultSet rs3=p3.executeQuery();
                	rs3.next();
                %>
                <td><font color="black"><%=rs3.getString(2) %></font></td>
                <td><font color="black"><%=rs2.getInt(3) %></font></td>
                <td><font color="black"><%=rs2.getInt(4) %></font></td>
                <td><font color="black"><%=rs2.getInt(5) %></font></td>
                <td><font color="black"><%=rs2.getInt(6) %></font></td>
                <td><font color="black"><%=rs2.getInt(7) %></font></td>
               
            </tr>
             <%} %>
        </tbody>
    </table>
    <form action="viewjob.jsp" method="post">
<div class="mrgn-30-top">
                <button type="submit"  class="btn btn-larger btn-block"/>
                Back to dashboard
                </button>
                </div>
                </form>
      
<!--   Core JS Files   -->
<script src="./assets/js/core/popper.min.js" ></script>
<script src="./assets/js/core/bootstrap.min.js" ></script>
<script src="./assets/js/plugins/perfect-scrollbar.min.js" ></script>
<script src="./assets/js/plugins/smooth-scrollbar.min.js" ></script>









































































<script>
  var win = navigator.platform.indexOf('Win') > -1;
  if (win && document.querySelector('#sidenav-scrollbar')) {
    var options = {
      damping: '0.5'
    }
    Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
  }
</script>

<!-- Github buttons -->
<script async defer src="https://buttons.github.io/buttons.js"></script>


<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc --><script src="./assets/js/material-dashboard.min.js?v=3.0.4"></script>
  </body>


</html>