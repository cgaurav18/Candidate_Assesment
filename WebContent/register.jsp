<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!DOCTYPE html>
<html><!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>Candidate Assesment</title>
  <link rel="stylesheet" href="./style.css">

</head>
<body>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<%@ page import="com.Candidate.*" %>
  <% int jid=Integer.parseInt(request.getParameter("jid"));
  		Locker.setJid(jid);
  %>
 <div id="form">
  <div class="container">
    <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-md-8 col-md-offset-2">
      <div id="userform">
        <ul class="nav nav-tabs nav-justified" role="tablist">
          <li class="active"><a href="#signup"  role="tab" data-toggle="tab">Candidate Registration</a></li>
        
        </ul>
        <div class="tab-content">
          <div class="tab-pane fade active in" id="signup">
            <h2 class="text-uppercase text-center"> Registration</h2>
            <form id="signup" action="test.jsp" method="post">
             
              <div class="form-group">
                <label> Your Full Name<span class="req">*</span> </label>
                <input type="text"  name="name" class="form-control" id="email" required data-validation-required-message="Please enter  your full name" autocomplete="off">
                <p class="help-block text-danger"></p>
              </div>
                <div class="form-group">
                <label> Your Email<span class="req">*</span> </label>
                <input type="text" name="email" class="form-control" id="password" required data-validation-required-message="Please enter your email" autocomplete="off">
                <p class="help-block text-danger"></p>
              </div>
               <div class="form-group">
                <label> Your City<span class="req">*</span> </label>
                <input type="text" name="city" class="form-control" id="password" required data-validation-required-message="Please enter your city" autocomplete="off">
                <p class="help-block text-danger"></p>
              </div>
               <div class="form-group">
                <label> Gender<span class="req">*</span> </label>
               <select name="Gender" id="gender" class="form-control">
                  <option value ="gender">Select Gender</option>
               <option value ="male">Male</option>
                   <option value ="female">Female</option>
                   </select><br><br>
                <p class="help-block text-danger"></p>
              </div>
               <div class="form-group">
                <label> Your Mobile Number<span class="req">*</span> </label>
                <input type="text" name="moba" class="form-control" id="password" required data-validation-required-message="Please enter your mobile number" autocomplete="off">
                <p class="help-block text-danger"></p>
              </div>
               <div class="form-group">
                <label> Your Age<span class="req">*</span> </label>
                <input type="text" name="age" class="form-control" id="password" required data-validation-required-message="Please enter your age" autocomplete="off">
                <p class="help-block text-danger"></p>
              </div>
                <div class="form-group">
                <label> Your Experience<span class="req">*</span> </label>
                <input type="text" name="exp" class="form-control" id="password" required data-validation-required-message="Please enter your experience (in years)" autocomplete="off">
                <p class="help-block text-danger"></p>
              </div>
              <div class="mrgn-30-top">
                <button type="submit"  class="btn btn-larger btn-block"/>
                Go for Test
                </button>
              </div>
            </form>
          </div>
          <form action="index.html" method="post">
<div class="mrgn-30-top">
                <button type="submit"  class="btn btn-larger btn-block"/>
                Back to dashboard
                </button>
                </div>
                </form>
          <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
<!-- partial -->
  <script  src="./script.js"></script>
</body>
</html>
</body>
</html>