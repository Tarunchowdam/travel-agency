package rentalHub;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import static rentalHub.ConnectionProvider.getConnection;


@WebServlet(name = "AddCarProcess", urlPatterns = { "/AddCarProcess" })
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 5 * 5 // 25 MB
)
public class AddCarProcess extends HttpServlet {

    private static final String DATA_DIRECTORY = "images" + File.separator + "cars";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            String regNo = "", carType = "", carImage = "", description = "", rentalPrice = "", active = "";

            boolean isMultipart = request.getContentType() != null
                    && request.getContentType().toLowerCase().startsWith("multipart/");

            if (!isMultipart) {
                response.getWriter().println("File upload not found!");
                return;
            }

            String uploadFolder = getServletContext().getRealPath("") + File.separator + DATA_DIRECTORY;

            Collection<Part> parts = request.getParts();

            for (Part part : parts) {
                if (part.getContentType() != null) { // Check if it's a file part
                    String fileName = getFileName(part);
                    String filePath = uploadFolder + File.separator + fileName;
                    File uploadedFile = new File(filePath);
                    carImage = "images" + File.separator + "cars" + File.separator + fileName;
                    part.write(filePath);
                } else {
                    switch (part.getName()) {
                        case "regNo" -> regNo = request.getParameter("regNo");
                        case "carType" -> carType = request.getParameter("carType");
                        case "description" -> description = request.getParameter("description");
                        case "rentalPrice" -> rentalPrice = request.getParameter("rentalPrice");
                        case "active" -> active = request.getParameter("active");
                        default -> {
                            // Handle unexpected parameter
                        }
                    }
                }
            }

            try (Connection conn = getConnection();
                    PreparedStatement ps = conn.prepareStatement(
                            "INSERT INTO car(regNo, carType, carImage, description, rentalPrice, active) VALUES (?, ?, ?, ?, ?, ?) ")) {
                conn.setAutoCommit(false);
                ps.setString(1, regNo);
                ps.setString(2, carType);
                ps.setString(3, carImage);
                ps.setString(4, description != null ? description : "");
                ps.setFloat(5, Float.parseFloat(rentalPrice));
                ps.setString(6, active);

                ps.executeUpdate();
                conn.commit();

                response.sendRedirect("car-added.jsp");
            } catch (NumberFormatException ex) {
                handleNumberFormatException(ex, response);
            } catch (SQLException ex) {
                handleSQLException(ex, response);
            } catch (Exception ex) {
                handleGeneralException(ex, response);
            }

        } catch (Exception ex) {
            handleGeneralException(ex, response);
        }
    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : partHeader.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    private void handleSQLException(SQLException ex, HttpServletResponse response) throws IOException {
    ex.printStackTrace();
    System.out.println("SQL Exception: " + ex.getMessage());
    response.sendRedirect("add-car.jsp?message=SQL error occurred during registration. Check the console for details. Exception: " + ex.getMessage());
}

private void handleGeneralException(Exception ex, HttpServletResponse response) throws IOException {
    ex.printStackTrace();
    System.out.println("General Exception: " + ex.getMessage());
    response.sendRedirect("add-car.jsp?message=An error occurred. Check the console for details. Exception: " + ex.getMessage());
}

    

    private void handleNumberFormatException(NumberFormatException ex, HttpServletResponse response) throws IOException {
        ex.printStackTrace();
        response.sendRedirect("add-car.jsp?message=Invalid rental price format. Check the console for details.");
    }

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
