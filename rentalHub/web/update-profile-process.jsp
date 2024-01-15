<%@ page import="rentalHub.UserDAO" %>
<%@ page import="rentalHub.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<%
// Get userId from the session
String userIdStr = (String) session.getAttribute("userid");

// Check if userId is not null
if (userIdStr != null && !userIdStr.isEmpty()) {
    // Convert userId to integer
    int userId = Integer.parseInt(userIdStr);

    // Retrieve user data based on userId
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserById(userId);

    // Check if user is not null
    if (user != null) {
        // Get updated user information from the form parameters
        String updatedName = request.getParameter("name");
        String updatedEmail = request.getParameter("email");
        String updatedPhone = request.getParameter("phone");
        String updatedAddress = request.getParameter("address");
        String updatedCity = request.getParameter("city");
        String updatedActive = request.getParameter("active");
        // Add similar lines for other fields

        // Update user object with new information
        user.setName(updatedName);
        user.setEmail(updatedEmail);
        user.setPhone(updatedPhone);
        user.setAddress(updatedAddress);
        user.setCity(updatedCity);
        user.setActive(updatedActive);
        // Add similar lines for other fields

        // Update user information in the database
        boolean updateSuccess = userDAO.updateUser(user);

        if (updateSuccess) {
            // If the update is successful, redirect to the updated profile page
            response.sendRedirect("view-profile.jsp?message=Profile updated successfully");
        } else {
            // If the update fails, display an error message
%>
            <div class="alert alert-danger" role="alert">
                Error updating profile. Please try again.
            </div>
<%
        }
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
