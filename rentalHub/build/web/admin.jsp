<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="rentalHub.UserService" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title> Admin Welcome | RentalHub</title>
    
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
</head>
<body>

<%@ include file="admin-header.jsp" %>

<section id="blog" class="container">
    <div class="center">
        <h2>Admin/Staff Registration Form</h2>
    </div>
    <div class="blog">
        <div class="row">
            <div class="col-md-offset-3 col-md-8">
                <form class="form-horizontal" method="post" action="staffRegistrationProcess.jsp" data-toggle="validator">
                    <!-- Your other form fields here -->
                     <div class="form-group">
                            <label for="staffType" class="col-sm-2 control-label"> Type</label>
                            <div class="col-sm-4">
                                <input type="text" name="staffType" class="form-control" placeholder="Admin/Staff Type only" required>
                            </div>
                     </div>
                    <!-- Staff User ID (Foreign Key) field -->
                    <div class="form-group">
                        <label for="staffUserId" class="col-sm-2 control-label">User ID (Foreign Key)</label>
                        <div class="col-sm-4">
                            <select name="staffUserId" class="form-control" required>
                                <option value="" disabled selected>Select User ID</option>

                                <%
                                    UserService userService = new UserService();
                                    List<String> userIDs = userService.getUserIDsFromDatabase();

                                    for (String userID : userIDs) {
                                %>
                                <option value="<%= userID %>"><%= userID %></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>

                    <!-- Your other form fields here -->

                    <div class="form-group">
                        <div class="col-sm-offset-2 col">
                            <button type="submit" class="btn btn-success btn-lg">Register Staff</button>
                            <!--<!-- comment &emsp;<a href="admin-login.jsp">Already registered? Login</a> |
                            <a href="register.jsp">User</a>-->
                        </div>
                    </div>
                </form>
            </div><!--/.col-md-8-->
        </div><!--/.row-->
    </div>
</section>

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
<%@ include file="admin-footer.jsp" %>


<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.isotope.min.js"></script>
<script src="js/main.js"></script>
<script src="js/wow.min.js"></script>
</body>
</html>
