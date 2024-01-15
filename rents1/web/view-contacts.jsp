<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.StringWriter"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="rentalHub.ConnectionProvider"%>
<%@ page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Contact Messages | RentalHub</title>

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

    <section id="contact-messages" class="container">
        <div class="center">
            <h2>All Contact Messages</h2>
        </div>
        <div class="contact-messages">
            <div class="row">
                <div class="col-md-12">
                    <%
                        String error;
                        if (session.getAttribute("type") != null && (session.getAttribute("type").equals("Staff") || session.getAttribute("type").equals("Admin"))) { %>
                    <table class="table table-condensed table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>User ID</th>
                                <th>Team</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Message</th>
                            </tr>
                        </thead>
                        <%
                            try {
                                // Get connection object from ConnectionProvider.java
                                Connection conn = ConnectionProvider.getConnection();
                                // Prepare SQL query
                                PreparedStatement ps = conn.prepareStatement("SELECT * FROM ContactMessages");

                                ResultSet rs = ps.executeQuery();
                                int count = 1;
                                while (rs.next()) {
                                    String team = rs.getString("team");
                                    String name = rs.getString("name");
                                    String email = rs.getString("email");
                                    String message = rs.getString("message");
                        %>
                        <tr>
                            <td><%= count++ %></td>
                            <td><%= rs.getString("user_id") %></td>
                            <td><%= team %></td>
                            <td><%= name %></td>
                            <td><%= email %></td>
                            <td><%= message %></td>
                        </tr>
                        <%
                            }
                        } catch (Exception ex) {
                            StringWriter errors = new StringWriter();
                            ex.printStackTrace(new PrintWriter(errors));
                            error = "Exception: " + errors.toString();
                            out.println("<div class='alert alert-danger' role='alert'>" + error + "</div>");
                        }
                        %>
                    </table>
                    <% } else { %>
                    <div class="alert alert-danger" role="alert">
                        <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                        <strong>Please log in: </strong>You must be logged in to view this page
                    </div>                           
                    <% }%>
                </div>
            </div><!--/.row-->
        </div>
    </section><!--/#contact-messages-->

    <%@ include file="admin-footer.jsp" %>  

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/wow.min.js"></script>
</body>
</html>
