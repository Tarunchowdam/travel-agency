<%@ page import="java.sql.*, java.io.*, rentalHub.EnquiryDao, rentalHub.Enquiry" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="rentalHub.ConnectionProvider" %>
<%@ page import="rentalHub.EnquiryDao" %>
<%@ page import="rentalHub.Enquiry" %>

<%
    // Check if the user is already logged in
    HttpSession currentSession = request.getSession(false);
    if (currentSession != null && currentSession.getAttribute("userid") != null) {
        // User is already logged in, redirect to another page
        response.sendRedirect("index.jsp"); // Change "dashboard.jsp" to your desired page
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title> Register | RentalHub</title>
    
    <!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    
       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>

   <%@ include file="header.jsp" %>  

    <section id="blog" class="container">
        <div class="center">
            <h2>Registration Form</h2>
        </div>
        <div class="blog">
            <div class="row">
                <div class="col-md-offset-3 col-md-8">
                    <form class="form-horizontal" method="post" action="registerProcess.jsp" data-toggle="validator">
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label">Name</label>
                            <div class="col-sm-4">
                                <input type="text" name="name" class="form-control" placeholder="Name" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-4">
                                <input type="email" name="email" class="form-control" placeholder="Email" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="address" class="col-sm-2 control-label">Address</label>
                            <div class="col-sm-4">
                                <input type="text" name="address" class="form-control" placeholder="Address" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="city" class="col-sm-2 control-label">City</label>
                            <div class="col-sm-4">
                                <input type="text" name="city" class="form-control" placeholder="City" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="col-sm-2 control-label">Phone</label>
                            <div class="col-sm-4">
                                <input type="text" name="phone" class="form-control" placeholder="Phone" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pwd" class="col-sm-2 control-label">Password</label>
                            <div class="col-sm-4">
                                <input type="password" name="pwd" class="form-control" placeholder="Password" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="active" class="col-sm-2 control-label">Active</label>
                            <div class="col-sm-4">
                                <input type="text" name="active" class="form-control" placeholder="Active" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col">
                                <button type="submit" class="btn btn-success btn-lg">Register</button>
                                &emsp;<a href="login.jsp">all ready register</a> 
                            </div>
                        </div>
                    </form>
                </div><!--/.col-md-8-->
            </div><!--/.row-->
        </div>
    </section><!--/#blog-->
    <%
    String errorMessage = request.getParameter("message");
    if (errorMessage != null && !errorMessage.isEmpty()) {
%>
        <div class="alert alert-danger" role="alert">
            <%= errorMessage %>
        </div>
<%
    }
%>
    <%@ include file="footer.jsp" %>  
 

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/validator.js"></script>
</body>
</html>
