<%@ page import="rentalHub.Enquiry" %>
<%@ page import="rentalHub.EnquiryDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Retrieve parameters from the form submission
    String enquiryIdStr = request.getParameter("enquiryId");
    int enquiryId = Integer.parseInt(enquiryIdStr);
    String replyMessage = request.getParameter("replyMessage");

    // Validate the input (you may add more validation logic as needed)

    // Create an Enquiry object for the reply
    Enquiry reply = new Enquiry();
    reply.setEnquiryId(enquiryId);  // Assuming Enquiry has a method to set enquiryId
    reply.setReplyMessage(replyMessage);

    // Update the Enquiry with the reply in the database using EnquiryDAO
    EnquiryDAO enquiryDAO = new EnquiryDAO();
    boolean replySuccess = enquiryDAO.replyToEnquiry(reply);

    if (replySuccess) {
%>

    <html>
    <head>
        <title>Reply Submitted</title>
    </head>
    <body>
        <h1>Reply Submitted Successfully</h1>
        <p>Your reply has been successfully submitted.</p>
        <a href="view-enquiries.jsp">Back to Enquiries</a>
    </body>
    </html>

<%
    } else {
%>

    <html>
    <head>
        <title>Error</title>
    </head>
    <body>
        <h1>Error</h1>
        <p>There was an error submitting the reply. Please try again later.</p>
        <a href="view-enquiries.jsp">Back to Enquiries</a>
    </body>
    </html>

<%
    }
%>
