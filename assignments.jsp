<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Upload Assignment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background:#f8f9fa;">
<div class="container mt-5">
    <h2 class="text-center mb-4">📝 Upload Assignment</h2>
    
    <form action="uploadAssignment" method="post" class="card p-4 shadow-sm">
        <div class="mb-3">
            <label class="form-label">Student Name</label>
            <input type="text" class="form-control" name="name" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Assignment Title</label>
            <input type="text" class="form-control" name="title" required>
        </div>
        <div class="mb-3">
            <label class="form-label">File Link (Google Drive / URL)</label>
            <input type="text" class="form-control" name="link" required>
        </div>
        <button type="submit" class="btn btn-primary w-100">Submit Assignment</button>
    </form>

    <hr class="my-4">

    <h4 class="mt-4 mb-3">📚 Submitted Assignments</h4>
    <table class="table table-striped">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Title</th>
            <th>File Link</th>
        </tr>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                java.sql.Connection con = java.sql.DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/student_portal?useSSL=false", "root", "root");
                java.sql.Statement stmt = con.createStatement();
                java.sql.ResultSet rs = stmt.executeQuery("SELECT * FROM assignments");
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("title") %></td>
                        <td><a href="<%= rs.getString("link") %>" target="_blank">Open</a></td>
                    </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='4' style='color:red;'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>

    <div class="text-center mt-4">
        <a href="dashboard.jsp" class="btn btn-secondary">⬅ Back to Dashboard</a>
    </div>
</div>
</body>
</html>
