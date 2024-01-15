<%@ page import="java.sql.*, java.io.*, rentalHub.EnquiryDao, rentalHub.Enquiry" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="rentalHub.ConnectionProvider" %>
<%@ page import="rentalHub.EnquiryDao" %>
<%@ page import="rentalHub.Enquiry" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Enquiry | RentalHub</title>

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
            background: #ffffff;
            color: #495057;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        #enquiry {
            padding: 100px 0;
        }

        h1 {
            font-size: 36px;
            font-weight: bold;
            color: #333333;
            margin-bottom: 30px;
        }

        .enquiryForm {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-size: 18px;
            color: #333333;
            font-weight: bold;
        }

        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 20px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            color: #495057;
        }

        button {
            background-color: #007bff;
            color: #ffffff;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        .alert {
            font-size: 16px;
            margin-top: 20px;
            padding: 15px;
        }

        .alert-warning {
            background-color: #f8d7da;
            border-color: #f5c6cb;
            color: #721c24;
        }
    </style>
</head>

<body>
    <%@ include file="header.jsp" %>
    <section id="enquiry" class="container">
        <div class="center">
            <h1>Enquiry Form</h1>

            <!-- Check if the user is logged in -->
            <% if (session.getAttribute("userid") != null) { %>
                <%-- Retrieve user information from the session --%>
                <% String userId = (String)session.getAttribute("userid"); %>

                <%-- Enquiry Form --%>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <form action="processEnquiry.jsp" method="post" role="form" class="enquiryForm">
                            <!-- Add a hidden field to store userId -->
                            <input type="hidden" name="userId" value="<%= userId %>">
                            
                            <!-- Enquiry Type (Dropdown) -->
                            <div class="form-group">
                                <label for="type">Enquiry Type:</label>
                                <select name="type" class="form-control" id="type" required="required">
                                    <option value="Enquiry">Enquiry</option>
                                    <option value="Feedback">Feedback</option>
                                </select>
                            </div>

                            <!-- Message -->
                            <div class="form-group">
                                <label for="message">Message:</label>
                                <textarea name="message" class="form-control" id="message" rows="5" required="required"></textarea>
                            </div>

                            <!-- Admin-set Status (hidden field) -->
                            <input type="hidden" name="status" value="Pending">

                            <div class="text-center">
                                <button type="submit">Submit Enquiry</button>
                            </div>
                        </form>
                    </div>
                </div><!--/.row-->

            <% } else { %>
                <!-- User is not logged in, display a message or redirect to the login page -->
                <div class="alert alert-warning" role="alert">
                    <strong>Please log in to submit an enquiry.</strong>
                </div>
            <% } %>
        </div>
    </section><!--/#enquiry-->
    <%@ include file="footer.jsp" %>  
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/wow.min.js"></script>
</body>
</html>
