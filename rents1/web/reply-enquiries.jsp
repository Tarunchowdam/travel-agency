<%@ page import="java.util.List" %>
<%@ page import="rentalHub.Enquiry" %>
<%@ page import="rentalHub.EnquiryDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Enquiries | RentalHub</title>

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

        <%@ include file="admin-header.jsp" %>  
        <!<!-- commen
/%

    // Get the enquiry ID from the request parameter
    String enquiryIdStr = request.getParameter("enquiryId");
    int enquiryId = Integer.parseInt(enquiryIdStr);

    // Retrieve the Enquiry from the database using EnquiryDAO
    EnquiryDAO enquiryDAO = new EnquiryDAO();
    Enquiry enquiry = enquiryDAO.getEnquiryById(enquiryId);

    // Check if the Enquiry exists
    if (enquiry != null) {


    <h1>Reply to Enquiry</h1>
    <p><strong>User ID:</strong> = enquiry.getUserId() %></p>
    <p><strong>Type:</strong> = enquiry.getType() %></p>
    <p><strong>Message:</strong> = enquiry.getMessage() %></p>

    <form action="process-reply.jsp" method="post">
        <input type="hidden" name="enquiryId" value="= enquiryId %>">
        <label for="replyMessage">Reply:</label><br>
        <textarea id="replyMessage" name="replyMessage" rows="4" cols="50"></textarea><br>
        <input type="submit" value="Send Reply">
    </form>



    <p>Error: Enquiry not found.</p>


%/
          -->
          
<div class="container">
    <h2 class="text-center mb-4"> Reply enquiry</h2>
    
    <div>
        <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor justo ac erat semper, eu fermentum leo tincidunt. 
            Sed ullamcorper justo at magna efficitur, sit amet varius risus ullamcorper. Integer vestibulum ligula in justo cursus, 
            nec lacinia nulla ultrices. Vivamus id bibendum mauris. Sed vehicula massa eu neque pharetra bibendum. Donec venenatis 
            dolor sit amet erat congue, a rhoncus lectus dictum. Nunc id orci vel turpis luctus scelerisque vel ac ex. 
            Quisque eget tincidunt libero. Sed ut tincidunt risus. In hac habitasse platea dictumst. In hac habitasse platea dictumst.
        </p>

        <p>
            Vestibulum id bibendum massa. Quisque bibendum, lacus at viverra efficitur, justo nisl tincidunt turpis, ac cursus metus 
            leo vel dolor. Quisque suscipit, dolor in aliquet iaculis, augue felis tincidunt ligula, vel suscipit turpis felis id libero. 
            Sed dapibus ante vel volutpat volutpat. Curabitur efficitur, velit eu fermentum efficitur, tortor dui bibendum sem, vitae 
            varius libero orci eu metus. Fusce luctus, felis vel fermentum tristique, nisl neque malesuada arcu, et tincidunt arcu orci 
            vel nulla. Ut sed metus in odio mollis imperdiet. Nullam elementum justo id orci malesuada, ut tincidunt quam ultrices. 
            Nam accumsan semper tortor, vel aliquam justo dignissim ut.
        </p>
        
        <h4>
            This site is stil Developing Stage by the team TahnkYou
        </h4>
        <!-- Add more content as needed -->

    </div>
</div>
 <%@ include file="admin-footer.jsp" %>  

        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script>
        <script src="js/jquery.isotope.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/wow.min.js"></script>
    </body>
</html>
