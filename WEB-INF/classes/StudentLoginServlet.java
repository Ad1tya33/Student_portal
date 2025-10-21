import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class StudentLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        String user = req.getParameter("username");
        String pass = req.getParameter("password");

        try {
            // ✅ 1. Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // ✅ 2. Connect to MySQL Database
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal?useSSL=false&serverTimezone=UTC",
                "root", "root"
            );

            // ✅ 3. Prepare SQL Query
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE username=? AND password=?"
            );
            ps.setString(1, user);
            ps.setString(2, pass);

            // ✅ 4. Execute Query
            ResultSet rs = ps.executeQuery();

            // ✅ 5. Redirect Based on Result
            if (rs.next()) {
                res.sendRedirect("dashboard.jsp?user=" + user);
            } else {
                res.sendRedirect("index.jsp?error=true");
            }

            // ✅ 6. Close connection
            con.close();

        } catch (Exception e) {
            // Show any errors on screen for debugging
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(out);
        }
    }
}
