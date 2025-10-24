<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course Management</title>
<style>
body {
  font-family: Arial, sans-serif;
  background: #f2f4f8;
  margin: 0; padding: 0;
}
.container {
  width: 50%;
  margin: 40px auto;
  background: #fff;
  padding: 20px;
  box-shadow: 0 0 10px rgba(0,0,0,0.2);
  border-radius: 8px;
}
h2 { text-align: center; color: #333; }
label { display:block; margin:10px 0 5px; }
input, textarea {
  width:100%; padding:8px; margin-bottom:10px;
  border:1px solid #ccc; border-radius:4px;
}
button {
  width:100%; background:#28a745; color:white;
  border:none; padding:10px; border-radius:4px;
  cursor:pointer;
}
button:hover { background:#218838; }
table {
  width:100%; border-collapse:collapse; margin-top:20px;
}
th, td { border:1px solid #ccc; padding:8px; text-align:center; }
th { background:#28a745; color:white; }
</style>
</head>
<body>
<div class="container">
<h2>📚 Course Management</h2>
<form method="post">
  <label>Course Name</label>
  <input type="text" name="course_name" required>
  <label>Instructor</label>
  <input type="text" name="instructor" required>
  <label>Credits</label>
  <input type="number" name="credits" min="1" max="6" required>
  <button type="submit">Save Course</button>
</form>

<%
String course = request.getParameter("course_name");
String instructor = request.getParameter("instructor");
String credits = request.getParameter("credits");

if(course != null && instructor != null && credits != null){
  try{
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/student_portal?useSSL=false&allowPublicKeyRetrieval=true",
        "root","root");
      PreparedStatement ps = con.prepareStatement(
        "INSERT INTO courses(course_name,instructor,credits) VALUES(?,?,?)");
      ps.setString(1, course);
      ps.setString(2, instructor);
      ps.setInt(3, Integer.parseInt(credits));
      ps.executeUpdate();
      con.close();
      out.println("<p style='color:green;'>✅ Course added successfully!</p>");
  }catch(Exception e){
      out.println("<p style='color:red;'>❌ Error: " + e.getMessage() + "</p>");
  }
}
%>

<h3>📋 Current Courses</h3>
<table>
<tr><th>ID</th><th>Name</th><th>Instructor</th><th>Credits</th></tr>
<%
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
      "jdbc:mysql://localhost:3306/student_portal?useSSL=false&allowPublicKeyRetrieval=true",
      "root","root");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM courses");
    while(rs.next()){
        out.println("<tr><td>"+rs.getInt("id")+"</td><td>"+rs.getString("course_name")+"</td><td>"+rs.getString("instructor")+"</td><td>"+rs.getInt("credits")+"</td></tr>");
    }
    con.close();
}catch(Exception e){
    out.println("<tr><td colspan='4' style='color:red;'>"+e.getMessage()+"</td></tr>");
}
%>
</table>

<a href="dashboard.jsp"><button style="background:#007bff;margin-top:10px;">⬅ Back to Dashboard</button></a>
</div>
</body>
</html>
