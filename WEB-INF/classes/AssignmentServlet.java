import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AssignmentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        String name = req.getParameter("name");
        String title = req.getParameter("title");
        String link = req.getParameter("link");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal?useSSL=false", "root", "root");
            PreparedStatement ps = con.prepareStatement("INSERT INTO assignments(name, title, link) VALUES (?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, title);
            ps.setString(3, link);
            ps.executeUpdate();
            out.println("<h3>✅ Assignment Uploaded Successfully!</h3>");
            con.close();
        } catch(Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
