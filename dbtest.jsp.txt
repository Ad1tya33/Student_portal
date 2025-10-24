<%@ page import="java.sql.*" %>
<html>
<body>
<%
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/student_portal?useSSL=false&allowPublicKeyRetrieval=true",
        "root", "root");
    out.println("<h2 style='color:green;'>✅ Database Connected Successfully!</h2>");
    con.close();
} catch (Exception e) {
    out.println("<h2 style='color:red;'>❌ Error: " + e.getMessage() + "</h2>");
}
%>
</body>
</html>
