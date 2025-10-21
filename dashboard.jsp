<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Student Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: #f5f7fa;
      font-family: 'Poppins', sans-serif;
    }
    .navbar {
      background: #0072ff;
      color: white;
    }
    .navbar-brand {
      font-weight: bold;
      color: white !important;
    }
    .card {
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
      transition: transform 0.2s ease-in-out;
      border-radius: 12px;
    }
    .card:hover {
      transform: translateY(-5px);
    }
    .btn-custom {
      background-color: #0072ff;
      color: white;
      border-radius: 8px;
      font-weight: 500;
    }
    .btn-custom:hover {
      background-color: #005cd6;
      color: white;
    }
  </style>
</head>
<body>

  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark px-3">
    <span class="navbar-brand">Welcome, <%= request.getParameter("user") %> 👋</span>
    <div class="ms-auto">
      <a href="index.jsp" class="btn btn-light btn-sm">Logout</a>
    </div>
  </nav>

  <!-- Main Content -->
  <div class="container py-5">
    <div class="row text-center">

      <div class="col-md-3 mb-3">
        <div class="card p-4">
          <h5>📚 View Courses</h5>
        </div>
      </div>

      <div class="col-md-3 mb-3">
        <div class="card p-4">
          <h5>🧾 Assignments</h5>
        </div>
      </div>

      <div class="col-md-3 mb-3">
        <div class="card p-4">
          <h5>🎓 Resume Builder</h5>
        </div>
      </div>

      <div class="col-md-3 mb-3">
        <div class="card p-4">
          <h5>💬 Feedback</h5>
        </div>
      </div>

      <!-- Course Registration Card -->
      <div class="col-md-3 mb-3">
        <div class="card p-4">
          <h5>📝 Course Registration</h5>
          <a href="course.jsp" class="btn btn-custom mt-3">Register Now</a>
        </div>
      </div>

    </div>
  </div>

</body>
</html>
