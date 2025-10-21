<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Student Portal Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      height: 100vh;
      background: linear-gradient(120deg, #0072ff, #00c6ff);
      display: flex;
      justify-content: center;
      align-items: center;
      font-family: 'Poppins', sans-serif;
    }
    .card {
      background: #fff;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 0 15px rgba(0,0,0,0.2);
      text-align: center;
      width: 350px;
    }
  </style>
</head>
<body>
  <div class="card">
    <h2 class="mb-3">🎓 Student Portal</h2>
    <form action="login" method="post">
      <input type="text" name="username" class="form-control mb-3" placeholder="Enter Username" required>
      <input type="password" name="password" class="form-control mb-3" placeholder="Enter Password" required>
      <button class="btn btn-primary w-100">Login</button>
    </form>
    <% if(request.getParameter("error")!=null){ %>
      <p class="text-danger mt-3">❌ Invalid Username or Password!</p>
    <% } %>
  </div>
</body>
</html>
