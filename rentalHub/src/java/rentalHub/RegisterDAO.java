package rentalHub;

import java.sql.*;

public class RegisterDAO {

    private final String jdbcUrl = "jdbc:mysql://localhost:3306/rentalhub";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "Tarun@184";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Error loading MySQL JDBC driver");
        }
    }

   public boolean registerUser(String name, String email, String address, String city, String phone, String password, String active)
        throws SQLException {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    boolean registrationSuccess = false;

    try {
        connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);

        String query = "INSERT INTO user (name, email, address, city, phone, pwd, active) VALUES (?, ?, ?, ?, ?, ?, ?)";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, name);
        preparedStatement.setString(2, email);
        preparedStatement.setString(3, address);
        preparedStatement.setString(4, city);
        preparedStatement.setString(5, phone);
        preparedStatement.setString(6, password);
        preparedStatement.setString(7, active);

        int rowsAffected = preparedStatement.executeUpdate();
        registrationSuccess = rowsAffected > 0;
    } finally {
        closeResources(preparedStatement, connection);
    }

    return registrationSuccess;
}

    private void closeResources(Statement statement, Connection connection) {
        try {
            if (statement != null) {
                statement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
