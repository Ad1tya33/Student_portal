import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/upload")
@MultipartConfig(
    fileSizeThreshold = 0,
    maxFileSize = 10 * 1024 * 1024,        // 10 MB
    maxRequestSize = 20 * 1024 * 1024      // 20 MB
)
public class UploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        try {
            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();

            filePart.write(uploadPath + File.separator + fileName);

            // save metadata in MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal?useSSL=false&allowPublicKeyRetrieval=true",
                "root", "root");
            PreparedStatement ps = con.prepareStatement("INSERT INTO documents(filename) VALUES (?)");
            ps.setString(1, fileName);
            ps.executeUpdate();
            con.close();

            response.sendRedirect("vault.jsp?success=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("vault.jsp?error=" + e.getMessage());
        }
    }
}
