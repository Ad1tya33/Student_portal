<%@ page import="java.io.*, java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Document Vault</title>
<style>
body { background:#f4f7fa; font-family:Segoe UI; }
.container { width:60%; margin:50px auto; background:white; padding:25px; border-radius:8px; box-shadow:0 0 10px rgba(0,0,0,0.1); }
h2 { text-align:center; color:#333; }
input[type=file]{width:100%; margin:10px 0;}
button {
  background:#198754; color:white; border:none; border-radius:5px;
  padding:10px; width:100%; cursor:pointer;
}
button:hover{background:#157347;}
table { width:100%; border-collapse:collapse; margin-top:20px; }
th,td{border:1px solid #ccc; padding:8px; text-align:center;}
th{background:#0d6efd; color:white;}
.success {color:green; text-align:center;}
.error {color:red; text-align:center;}
</style>
</head>
<body>
<div class="container">
<h2>📁 Document Vault</h2>

<form action="upload" method="post" enctype="multipart/form-data">
  <input type="file" name="file" required>
  <button type="submit">Upload Document</button>
</form>

<%
String uploadPath = application.getRealPath("") + File.separator + "uploads";
File uploadDir = new File(uploadPath);
if (!uploadDir.exists()) uploadDir.mkdir();

if ("POST".equalsIgnoreCase(request.getMethod())) {
    try {
        javax.servlet.http.Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        filePart.write(uploadPath + File.separator + fileName);

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/student_portal?useSSL=false&allowPublicKeyRetrieval=true",
            "root","root");
        PreparedStatement ps = con.prepareStatement("INSERT INTO documents(filename) VALUES (?)");
        ps.setString(1, fileName);
        ps.executeUpdate();
        con.close();

        out.println("<p class='success'>✅ File uploaded successfully!</p>");
    } catch(Exception e){
        out.println("<p class='error'>❌ Error: "+ e.getMessage() +"</p>");
    }
}
%>

<h3>📜 Uploaded Files</h3>
<table>
<tr><th>ID</th><th>File Name</th><th>Uploaded On</th></tr>
<%
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/student_portal?useSSL=false&allowPublicKeyRetrieval=true",
        "root","root");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM documents ORDER BY upload_date DESC");
    while(rs.next()){
        out.println("<tr><td>"+rs.getInt("id")+"</td><td>"+rs.getString("filename")+"</td><td>"+rs.getTimestamp("upload_date")+"</td></tr>");
    }
    con.close();
}catch(Exception e){
    out.println("<tr><td colspan='3' style='color:red;'>"+e.getMessage()+"</td></tr>");
}
%>
</table>

<a href="dashboard.jsp"><button style="background:#0d6efd;margin-top:15px;">⬅ Back to Dashboard</button></a>
</div>
</body>
</html>
