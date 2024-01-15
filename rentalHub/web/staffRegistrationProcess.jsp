<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="rentalHub.UserService" %>

<%
    try {
        // Retrieve form parameters
        String staffType = request.getParameter("staffType");
        String staffUserId = request.getParameter("staffUserId");

        // Perform basic validation (you might want to add more validation)
        if (staffType == null || staffType.isEmpty() || staffUserId == null || staffUserId.isEmpty()) {
            response.sendRedirect("staff-registration.jsp?message=Please fill in all required fields.");
            return;
        }

        // Establish a database connection (replace these details with your database configuration)
        String jdbcUrl = "jdbc:mysql://localhost:3306/rentalhub";
        String username = "root";
        String password = "Tarun@184";

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {
            // Check if staffUserId already exists
            String checkQuery = "SELECT COUNT(*) AS count FROM staff WHERE userId = ?";
            try (PreparedStatement checkStatement = connection.prepareStatement(checkQuery)) {
                checkStatement.setString(1, staffUserId);
                try (ResultSet resultSet = checkStatement.executeQuery()) {
                    resultSet.next();
                    int count = resultSet.getInt("count");

                    if (count > 0) {
                        response.sendRedirect("error.jsp?message=User ID already registered as staff.");
                        return;
                    }
                }
            }

            // Check if the table has reached the limit (e.g., 5 rows)
            String rowCountQuery = "SELECT COUNT(*) AS rowCount FROM staff";
            try (PreparedStatement rowCountStatement = connection.prepareStatement(rowCountQuery);
                 ResultSet rowCountResultSet = rowCountStatement.executeQuery()) {
                rowCountResultSet.next();
                int rowCount = rowCountResultSet.getInt("rowCount");

                if (rowCount >= 5) {
                    response.sendRedirect("error.jsp?message=Staff registration limit reached. Cannot add more members hiring or closed.");
                    return;
                }
            }

            // Insert the staff information into the Staff table
            String insertQuery = "INSERT INTO staff (staffType, userId) VALUES (?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
                preparedStatement.setString(1, staffType);
                preparedStatement.setString(2, staffUserId);
                preparedStatement.executeUpdate();
            }
        }

        // Redirect to a success page
        response.sendRedirect("admin-welcome.jsp");

    } catch (SQLException e) {
        // Print SQL exception details
        out.println("SQL Exception: " + e.getMessage());
        e.printStackTrace();
        response.sendRedirect("admin.jsp?message=SQL error occurred during registration. Check the console for details.");
    } catch (Exception e) {
        // Print other exceptions
        out.println("Exception: " + e.getMessage());
        e.printStackTrace();
        response.sendRedirect("admin.jsp?message=An error occurred during registration.");
    }
%>
