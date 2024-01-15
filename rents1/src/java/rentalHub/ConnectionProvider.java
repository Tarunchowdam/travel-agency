package rentalHub;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import static rentalHub.Provider.*;


public class ConnectionProvider {
    static Connection conn;
    static String errorMessage = null;
    public static Connection getConnection() {
        try {
            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            try {
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rentalhub", "root", "Tarun@184");
            } catch (SQLException ex) {
                errorMessage = "Error connecting to SQL Server";
            }
        } catch (ClassNotFoundException ex) {
            errorMessage = "JDBC Driver not found";
        }
        return conn;
    }
}
