package rentalHub;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserService {

    public List<String> getUserIDsFromDatabase() {
        List<String> userIDs = new ArrayList<>();

        try {
            // Establish a database connection (replace these details with your database configuration)
            String jdbcUrl = "jdbc:mysql://localhost:3306/rentalhub";
            String username = "root";
            String password = "Tarun@184";

            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(jdbcUrl, username, password)) {
                // Query to retrieve user IDs from the User table
                String query = "SELECT userId FROM user";
                try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(query)) {

                    // Fetch user IDs and add them to the list
                    while (resultSet.next()) {
                        userIDs.add(resultSet.getString("userId"));
                    }
                    // Close resources
                }
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return userIDs;
    }
}
