<%@ page import="java.sql.*, java.util.concurrent.locks.Lock, java.util.concurrent.locks.ReentrantLock, java.net.URLEncoder" %>
<%@ page import="java.net.URLEncoder" %>

<%
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    Lock lock = new ReentrantLock();

    try {
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/rentalhub";
        String username = "root";
        String password = "Tarun@184";

        // Load the JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish a connection
        connection = DriverManager.getConnection(url, username, password);

        // Start transaction
        connection.setAutoCommit(false);

        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String phone = request.getParameter("phone");
        String pwd = request.getParameter("pwd");
        String active = request.getParameter("active");

        // Perform registration logic
        lock.lock(); // Acquire lock to ensure atomicity

        // Check if the email is already registered (database unique constraint)
        String checkEmailQuery = "SELECT COUNT(*) FROM user WHERE email = ?";
        preparedStatement = connection.prepareStatement(checkEmailQuery);
        preparedStatement.setString(1, email);
        resultSet = preparedStatement.executeQuery();
        resultSet.next();
        int emailCount = resultSet.getInt(1);

        if (emailCount == 0) {
            // Email is not registered, proceed with registration
            String registerQuery = "INSERT INTO user (name, email, address, city, phone, pwd, active) VALUES (?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(registerQuery);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, address);
            preparedStatement.setString(4, city);
            preparedStatement.setString(5, phone);
            preparedStatement.setString(6, pwd);
            preparedStatement.setString(7, active);

            preparedStatement.executeUpdate();

            // Commit transaction if successful
            connection.commit();
            response.sendRedirect("login.jsp");
        } else {
            // Email is already registered
            // Rollback transaction and display an error message
            String errorMessage = "An error occurred during registration. Email is already registered  <a href='register.jsp  style='color: black;'>Register</a> with a different email.";
            response.sendRedirect("error.jsp?message=" + URLEncoder.encode(errorMessage, "UTF-8"));
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        // Handle database errors or other exceptions
        if (connection != null) {
            connection.rollback();
        }
        String errorMessage = "An error occurred during registration.";
        String exceptionDetails = e.toString(); // Use e.toString() for more detailed error message
        response.sendRedirect("error.jsp?message=" + URLEncoder.encode(errorMessage, "UTF-8") + "&exceptionDetails=" + URLEncoder.encode(exceptionDetails, "UTF-8"));
    } finally {
        // Release the lock and close resources in the finally block
        lock.unlock();
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
