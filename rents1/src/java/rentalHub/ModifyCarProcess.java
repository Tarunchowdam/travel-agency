package rentalHub;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import static rentalHub.ConnectionProvider.conn;

@WebServlet(name = "ModifyCarProcess", urlPatterns = { "/ModifyCarProcess" })
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 5, // 5 MB
        maxRequestSize = 1024 * 1024 * 5 * 5 // 25 MB
)
public class ModifyCarProcess extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DATA_DIRECTORY = "images" + File.separator + "cars" + File.separator;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            String regNo = "", carType = "", carImage = "", description = "", rentalPrice = "", active = "";

            boolean isMultipart = request.getContentType() != null && request.getContentType().toLowerCase().startsWith("multipart/");

            if (!isMultipart) {
                return;
            }

            String uploadFolder = getServletContext().getRealPath("") + File.separator + DATA_DIRECTORY;

            for (Part part : request.getParts()) {
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
                    }
                }
            }

            try (Connection conn = ConnectionProvider.getConnection();
                    PreparedStatement ps = conn.prepareStatement(
                            "UPDATE Car "
                                    + "SET carType  = ?, carImage  = ?, description  = ?, rentalPrice = ?, active = ? "
                                    + "WHERE regNo = ?")) {
                ps.setString(1, carType);
                ps.setString(2, carImage);
                ps.setString(3, description);
                ps.setFloat(4, Float.parseFloat(rentalPrice));
                ps.setString(5, active);
                ps.setString(6, regNo);

                ps.executeUpdate();
                response.sendRedirect("car-modified.jsp");
            } catch (SQLException ex) {
                handleSQLException(ex, response);
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
        response.sendRedirect("admin.jsp?message=SQL error occurred during modification. Check the console for details.");
        if (conn != null) {
            try {
                conn.rollback();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private void handleGeneralException(Exception ex, HttpServletResponse response) throws IOException {
        ex.printStackTrace();
        response.sendRedirect("admin.jsp?message=An error occurred. Check the console for details.");
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
