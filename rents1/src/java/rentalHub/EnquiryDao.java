package rentalHub;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;


public class EnquiryDao {
    
    // Add an enquiry to the database
    public static void addEnquiry(Enquiry enquiry) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Get a database connection
            connection = ConnectionProvider.getConnection();

            // SQL query to insert an enquiry
            String sql = "INSERT INTO Enquiry (userId, type, message, status) VALUES (?, ?, ?, ?)";

            // Create a prepared statement
            preparedStatement = connection.prepareStatement(sql);

            // Set the parameters for the prepared statement
            preparedStatement.setInt(1, enquiry.getUserId());
            preparedStatement.setString(2, enquiry.getType());
            preparedStatement.setString(3, enquiry.getMessage());
            preparedStatement.setString(4, enquiry.getStatus());

            // Execute the query
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception (log, throw, etc.)
        } finally {
            // Close the resources
            try {
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
    }

 public static List<Enquiry> getFeedback() {
        List<Enquiry> feedbackList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Get a database connection
            connection = ConnectionProvider.getConnection();

            // SQL query to retrieve feedback entries
            String sql = "SELECT * FROM Enquiry WHERE type = 'Feedback'";

            // Create a prepared statement
            preparedStatement = connection.prepareStatement(sql);

            // Execute the query
            resultSet = preparedStatement.executeQuery();

            // Process the result set
            while (resultSet.next()) {
                int enquiryid = resultSet.getInt("enquiryid");
                int userId = resultSet.getInt("userId");
                String type = resultSet.getString("type");
                String message = resultSet.getString("message");
                String status = resultSet.getString("status");

                // Create Enquiry object and add to the list
                Enquiry enquiry = new Enquiry(enquiryid, userId, type, message, status);
                feedbackList.add(enquiry);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception (log, throw, etc.)
        } finally {
            // Close the resources
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

        return feedbackList;
    }
 
  
}