import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class CourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        String name = req.getParameter("name");
        String regno = req.getParameter("regno");
        String course = req.getParameter("course");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/student_portal?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
    "root", "root"
);

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO courses(name, regno, course) VALUES (?,?,?)"
            );
            ps.setString(1, name);
            ps.setString(2, regno);
            ps.setString(3, course);

            ps.executeUpdate();
            con.close();

            res.sendRedirect("course.jsp?success=true");

        } catch (Exception e) {
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace(out);
        }
    }
}
