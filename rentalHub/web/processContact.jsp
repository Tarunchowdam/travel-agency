<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="rentalHub.ContactDao" %>
<%@ page import="rentalHub.Contact" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>

<%
    // Retrieve form data
    String userId = request.getParameter("userId");

    // userId is already a String, no need to parse it
    int userIdInt = 0; // Default value, update as needed

    if (userId != null && !userId.isEmpty()) {
        userIdInt = Integer.parseInt(userId);
    }

    String team = request.getParameter("team");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    // Perform basic validation
    if (userIdInt == 0 || team == null || name == null || email == null || message == null) {
        response.sendRedirect("contact.jsp"); // Redirect to the contact form if data is missing
    } else {
        // Create a Contact object
        Contact contact = new Contact();
        contact.setUserId(String.valueOf(userIdInt)); // Convert to String
        contact.setTeam(team);
        contact.setName(name);
        contact.setEmail(email);
        contact.setMessage(message);

        // Save the contact information to the database
        ContactDao contactDao = new ContactDao();
        boolean success = contactDao.saveContact(contact);

        if (success) {
            // Successful submission
            response.sendRedirect("enquiry.jsp");
        } else {
            // Error in saving to the database
            response.sendRedirect("error.jsp");
        }
    }
%>
