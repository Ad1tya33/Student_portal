<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Events & Clubs</title>
<style>
body { background:#eef2f3; font-family:Segoe UI; }
.container {
  width:80%; margin:40px auto;
  display:grid; grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
  gap:20px;
}
.card {
  background:white; padding:15px; border-radius:10px;
  box-shadow:0 2px 6px rgba(0,0,0,0.1);
  transition:0.3s;
}
.card:hover { transform:translateY(-5px); box-shadow:0 4px 12px rgba(0,0,0,0.2);}
h2{text-align:center;}
</style>
</head>
<body>
<h2>🎉 College Events & Clubs</h2>
<div class="container">
  <div class="card"><h3>🏁 Hackathon 2025</h3><p>Join our annual coding event!</p></div>
  <div class="card"><h3>🎭 Drama Club</h3><p>Auditions open every Friday.</p></div>
  <div class="card"><h3>⚽ Sports Week</h3><p>Register for intercollege tournaments.</p></div>
  <div class="card"><h3>🎵 Music Fest</h3><p>Perform, volunteer, or just enjoy!</p></div>
</div>
<a href="dashboard.jsp"><button style="width:100%;margin-top:20px;background:#0d6efd;color:white;padding:10px;border:none;border-radius:5px;">⬅ Back</button></a>
</body>
</html>
