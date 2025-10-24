import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AttendanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        String name = req.getParameter("name");
        int total = Integer.parseInt(req.getParameter("total"));
        int attended = Integer.parseInt(req.getParameter("attended"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/student_portal?useSSL=false&allowPublicKeyRetrieval=true",

                "root", "root");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO attendance(name,total_classes,attended_classes) VALUES(?,?,?)");
            ps.setString(1, name);
            ps.setInt(2, total);
            ps.setInt(3, attended);
            ps.executeUpdate();

            out.println("<h3>✅ Attendance recorded successfully!</h3>");
            con.close();
        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
        }
    }
}
