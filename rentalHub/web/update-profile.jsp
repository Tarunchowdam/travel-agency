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
    <title>Update Profile | RentalHub</title>

    <!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">

    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
        href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
        href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
        href="images/ico/apple-touch-icon-72-precomposed.png">
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

        .update-profile-container {
            max-width: 600px;
            margin: 50px auto;
        }

        .update-profile-card {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .update-profile-card-header {
            background: linear-gradient(to right, #3498db, #6f7b96);
            color: #ffffff;
            padding: 20px;
            border-radius: 10px 10px 0 0;
            text-align: center;
        }

        .update-profile-card-header h3 {
            margin: 0;
            font-size: 1.5em;
            font-weight: bold;
            color: #ffffff;
        }

        .update-profile-card-body {
            padding: 20px;
        }

        .update-profile-form {
            margin-bottom: 20px;
        }

        .update-profile-form label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #6c757d;
        }

        .update-profile-form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            box-sizing: border-box;
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
</head>

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
    <section id="update-profile" class="container">
        <div class="center">
            <h2>Update Profile</h2>
        </div>
        <div class="update-profile-container">
            <!-- Display user update form with enhanced styling -->
            <div class="update-profile-card">
                <div class="update-profile-card-header">
                    <h3 class="card-title"><strong><%= user.getName() %></strong></h3>
                </div>
                <div class="update-profile-card-body">
                    <!-- User update profile form -->
                    <form class="update-profile-form" method="post" action="update-profile-process.jsp"
                        data-toggle="validator">
                        <label for="name">Name:</label>
                        <input type="text" name="name" class="form-control" value="<%= user.getName() %>" required>

                        <label for="email">Email:</label>
                        <input type="email" name="email" class="form-control" value="<%= user.getEmail() %>"
                            required>

                        <label for="phone">Phone:</label>
                        <input type="text" name="phone" class="form-control" value="<%= user.getPhone() %>"
                            required>

                        <label for="address">Address:</label>
                        <input type="text" name="address" class="form-control" value="<%= user.getAddress() %>"
                            required>

                        <label for="city">City:</label>
                        <input type="text" name="city" class="form-control" value="<%= user.getCity() %>" required>

                        <!-- Add more fields as needed -->

                        <label for="active">Active:</label>
                        <input type="text" name="active" class="form-control" value="<%= user.getActive() %>"
                            required>

                        <!-- Update Profile Button -->
                        <div class="text-center">
                            <button type="submit" class="btn update-profile-btn">Update Profile</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section><!--/#update-profile-->
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
