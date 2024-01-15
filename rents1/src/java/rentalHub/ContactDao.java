package rentalHub;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ContactDao {

    // Adjust this method based on your database schema
    public boolean saveContact(Contact contact) {
        String sql = "INSERT INTO ContactMessages (user_id, team, name, email, message) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = ConnectionProvider.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Assuming getUserId returns a String, adjust based on your database schema
            preparedStatement.setString(1, contact.getUserId());
            preparedStatement.setString(2, contact.getTeam());
            preparedStatement.setString(3, contact.getName());
            preparedStatement.setString(4, contact.getEmail());
            preparedStatement.setString(5, contact.getMessage());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            // Log the exception or throw a custom exception
            throw new RuntimeException("Error saving contact to the database", e);
        }
    }
}
