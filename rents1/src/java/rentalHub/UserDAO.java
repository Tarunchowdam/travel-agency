package rentalHub;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    // JDBC URL, username, and password of MySQL server
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/rentalhub";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "Tarun@184";

    // SQL queries
    private static final String SELECT_USER_BY_ID = "SELECT * FROM user WHERE userId = ?";
    private static final String UPDATE_USER = "UPDATE user SET name=?, email=?, address=?, city=?, phone=?, active=? WHERE userId=?";

    public User getUserById(int userId) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        User user = null;

        try {
            // Establish a connection
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Create a prepared statement
            preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, userId);

            // Execute the query
            resultSet = preparedStatement.executeQuery();

            // Process the result set
            if (resultSet.next()) {
                // Populate the User object with data from the result set
                user = new User();
                user.setUserId(resultSet.getInt("userId"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setAddress(resultSet.getString("address"));
                user.setCity(resultSet.getString("city"));
                user.setPhone(resultSet.getString("phone"));
                user.setPwd(resultSet.getString("pwd"));
                user.setActive(resultSet.getString("active"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        } finally {
            // Close resources in the reverse order of their creation to avoid resource leaks
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return user;
    }

    public boolean updateUser(User user) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER)) {

            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getAddress());
            preparedStatement.setString(4, user.getCity());
            preparedStatement.setString(5, user.getPhone());
            preparedStatement.setString(6, user.getActive());
            preparedStatement.setInt(7, user.getUserId());

            int rowsAffected = preparedStatement.executeUpdate();

            // Check if the update was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database errors
            return false;
        }
    }
}
