<%@ page import="java.util.List" %>
<%@ page import="rentalHub.Enquiry" %>
<%@ page import="rentalHub.EnquiryDao" %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Accept | RentalHub</title>

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
        <style>
    .feedback-container {
        display: flex;
        flex-direction: column;
    }

    .feedback-item {
        border: 1px  #ccc;
        padding: 10px;
        margin-bottom: 10px;
    }

    .user-info {
        font-weight: bold;
        margin-bottom: 5px;
    }

    .message {
        margin-top: 5px;
    }
</style>

    </head><!--/head-->

    <body>
      <%@ include file="header.jsp" %>

    
<%
    List<Enquiry> feedbackList = EnquiryDao.getFeedback();
%>

<section id="feedback" class="container">
    <div class="center">
        <h1>Feedback</h1>

        <%-- Check if there are feedback entries --%>
        <% if (!feedbackList.isEmpty()) { %>

            <%-- Display feedback entries --%>
            <div class="feedback-container">
                <% for (Enquiry feedback : feedbackList) { %>
                    <div class="feedback-item">
                        <div class="user-info">
                          
                            
                        </div>
                        <div class="message">
                            <%= feedback.getMessage() %><br>
                        </div>
                    </div>
                <% } %>
            </div>

        <% } else { %>

            <div class="alert alert-info" role="alert">
                <strong>No feedback entries available.</strong>
            </div>

        <% } %>
    </div>
</section>



       <%@ include file="footer.jsp" %>  

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/wow.min.js"></script>
</body>
</html>
