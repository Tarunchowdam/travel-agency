<%@ page import="rentalHub.UserDAO" %>
<%@ page import="rentalHub.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>User Profile | RentalHub</title>
    
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
    
    <!-- Additional custom styles for enhanced attractiveness -->
    <link href="css/custom-styles.css" rel="stylesheet">
    
    <!-- Additional styles for enhanced appearance -->
 <style>
    body {
        background: #f8f9fa;
        color: #495057;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .profile-container {
        max-width: 600px;
        margin: 50px auto;
    }

    .profile-card {
        background: #ffffff;
        border-radius: 10px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }

    .profile-card-header {
        background: linear-gradient(to right, #3498db, #6f7b96);
        color: #ffffff;
        padding: 20px;
        border-radius: 10px 10px 0 0;
        text-align: center;
    }
    .profile-card-header h3 {
        margin: 0;
        font-size: 1.5em;
        font-weight: bold;
        color: #ffffff;
    }

    .profile-card-body {
        padding: 20px;
    }

    .profile-details {
        margin-bottom: 20px;
    }

    .profile-details label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
        color: #6c757d;
    }

    .profile-details p {
        margin: 0;
        color: #495057;
    }

    .update-profile-btn {
        background: #28a745;
        color: #ffffff;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        text-decoration: none;
        display: inline-block;
        transition: background 0.3s ease;
    }

    .update-profile-btn:hover {
        background: #218838;
    }
</style>
</head><!--/head-->

<body>

   <%@ include file="header.jsp" %>  
<%
// Get userId from the session
String userIdStr = (String) session.getAttribute("userid");

// Check if userId is not null
if (userIdStr != null && !userIdStr.isEmpty()) {
    // Convert userId to integer
    int userId = Integer.parseInt(userIdStr);

    // Instantiate UserDAO
    UserDAO userDAO = new UserDAO();

    // Retrieve user data based on userId
    User user = userDAO.getUserById(userId);

    // Check if user is not null
    if (user != null) {
%>
        <section id="profile" class="container">
            <div class="center">
                <h2>User Profile</h2>
            </div>
            <div class="profile-container">
                <!-- Display user profile information with enhanced styling -->
                <div class="profile-card">
                    <div class="profile-card-header">
                        <h3 class="card-title"><strong><%= user.getName() %></strong></h3>
                    </div>
                    <div class="profile-card-body">
                        <!-- User profile details -->
                        <div class="profile-details">
                            <label>Email:</label>
                            <p><%= user.getEmail() %></p>
                        </div>
                        <div class="profile-details">
                            <label>Address:</label>
                            <p><%= user.getAddress() %></p>
                        </div>
                        <div class="profile-details">
                            <label>City:</label>
                            <p><%= user.getCity() %></p>
                        </div>
                        <div class="profile-details">
                            <label>Phone Number:</label>
                            <p><%= user.getPhone() %></p>
                        </div>
                        <div class="profile-details">
                            <label>Password:</label>
                            <p>*********</p>
                        </div>
                        <div class="profile-details">
                            <label>Active Status:</label>
                            <p><%= user.getActive() %></p>
                        </div>

                        <!-- Update Profile Button -->
                        <div class="text-center">
                            <a href="update-profile.jsp" class="btn update-profile-btn">Update Profile</a>
                        </div>
                    </div>
                </div>
            </div>
        </section><!--/#profile-->
<%
    } else {
%>
        <div class="alert alert-danger" role="alert">
            User not found.
        </div>
<%
    }
} else {
%>
    <div class="alert alert-danger" role="alert">
        User ID not provided.
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
