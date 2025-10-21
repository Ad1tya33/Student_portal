<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Course Registration</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: #f5f7fa;
      font-family: 'Poppins', sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .card {
      padding: 40px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.2);
      width: 400px;
    }
  </style>
</head>
<body>
  <div class="card">
    <h3 class="mb-3 text-center">📘 Course Registration</h3>
    <form action="addCourse" method="post">
      <input type="text" name="name" class="form-control mb-3" placeholder="Enter Name" required>
      <input type="text" name="regno" class="form-control mb-3" placeholder="Register Number" required>
      <input type="text" name="course" class="form-control mb-3" placeholder="Course Name" required>
      <button class="btn btn-primary w-100">Submit</button>
    </form>
    <% if(request.getParameter("success")!=null){ %>
      <p class="text-success mt-3">✅ Successfully Added!</p>
    <% } %>
  </div>
</body>
</html>
