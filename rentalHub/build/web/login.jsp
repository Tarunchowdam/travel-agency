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
    <title> Login | Rent A Car</title>
    
    <!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
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
            <h2>Login page</h2>
        </div>
        <div class="blog">
            <div class="row">
                <div class="col-md-offset-3 col-md-8">
                    <form class="form-horizontal" method="POST" action="loginProcess.jsp" data-toggle="validator">
                      <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-4">
                          <input type="email" name="email" class="form-control" placeholder="Email" required>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-4">
                          <input type="password" name="pwd" class="form-control" placeholder="Password" required>
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-offset-2 col">
                          <button type="submit" class="btn btn-success btn-lg"> Login </button>
                            &emsp;
                            <a href="admin-login.jsp">admin</a>|<a href="forgot.jsp">Forgot Password</a>
                            
                        </div>
                      </div>
                    </form>  
                </div><!--/.col-md-8-->
            </div><!--/.row-->
        </div>
    </section><!--/#blog-->

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