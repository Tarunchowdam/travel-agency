<%@ page import="java.sql.*, java.io.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<%@ page import="rentalHub.ConnectionProvider" %>
<%@ page import="rentalHub.EnquiryDao" %>
<%@ page import="rentalHub.Enquiry" %>

<%
    // Retrieve form parameters
    String userId = request.getParameter("userId");
    String type = request.getParameter("type");
    String message = request.getParameter("message");
    String status = request.getParameter("status");

    // Create a new Enquiry object
    Enquiry enquiry = new Enquiry();
    enquiry.setUserId(Integer.parseInt(userId));
    enquiry.setType(type);
    enquiry.setMessage(message);
    enquiry.setStatus(status);

    // Insert the enquiry into the database
    EnquiryDao.addEnquiry(enquiry);
    if ("Feedback".equals(type)) {
      response.sendRedirect("feedback.jsp");
   } else {
      // Redirect to another page or show a success message
      response.sendRedirect("index.jsp");
   }
    // Redirect back to the enquiry form page (adjust the URL accordingly)
    //response.sendRedirect("contact.jsp");
%>
