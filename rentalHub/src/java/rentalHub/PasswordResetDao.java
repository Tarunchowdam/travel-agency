package rentalHub;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.UUID;

public class PasswordResetDao {

    // Database connection provider
    private static ConnectionProvider connectionProvider = new ConnectionProvider();

    // Time limit for the password reset token in minutes
    private static final int RESET_TOKEN_EXPIRATION_MINUTES = 30;

    // SQL queries
    private static final String INSERT_RESET_TOKEN_QUERY = "INSERT INTO password_reset (email, token, expiration_time) VALUES (?, ?, ?)";
    private static final String FIND_EMAIL_BY_TOKEN_QUERY = "SELECT email FROM password_reset WHERE token = ? AND expiration_time > NOW()";

    // Generate a random UUID for the reset token
    public static String generateResetToken(String email) {
        String resetToken = UUID.randomUUID().toString();

        try (Connection connection = connectionProvider.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_RESET_TOKEN_QUERY)) {

            // Set parameters and execute the query
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, resetToken);
            preparedStatement.setTimestamp(3, calculateExpirationTime());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception (log, throw, etc.)
        }

        return resetToken;
    }

    // Validate the reset token and retrieve the associated email
    public static String findEmailByToken(String token) {
        try (Connection connection = connectionProvider.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_EMAIL_BY_TOKEN_QUERY)) {

            // Set parameter and execute the query
            preparedStatement.setString(1, token);
            ResultSet resultSet = preparedStatement.executeQuery();

            // If a matching record is found, return the associated email
            if (resultSet.next()) {
                return resultSet.getString("email");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception (log, throw, etc.)
        }

        return null;
    }

    // Calculate the expiration time for the reset token
    private static Timestamp calculateExpirationTime() {
        long currentTimeMillis = System.currentTimeMillis();
        long expirationTimeMillis = currentTimeMillis + (RESET_TOKEN_EXPIRATION_MINUTES * 60 * 1000);
        return new Timestamp(expirationTimeMillis);
    }
}
