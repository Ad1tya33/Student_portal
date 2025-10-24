<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendance Management</title>
<style>
body {
  background: #f8f9fa;
  font-family: 'Segoe UI', sans-serif;
}
.container {
  width: 50%;
  margin: 50px auto;
  background: #fff;
  padding: 25px;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
}
h2 { text-align:center; color:#333; }
label { display:block; margin:10px 0 5px; }
input {
  width:100%; padding:8px;
  border:1px solid #ccc; border-radius:4px;
}
button {
  width:100%; background:#198754;
  color:white; padding:10px; border:none;
  border-radius:4px; cursor:pointer;
}
button:hover { background:#157347; }
#output {
  margin-top:20px;
  text-align:center;
  font-size:1.2em;
  color:#0d6efd;
}
</style>
</head>
<body>
<div class="container">
  <h2>📊 Attendance Management</h2>
  <form onsubmit="calcAttendance(event)">
    <label>Student Name</label>
    <input type="text" id="name" required>

    <label>Total Classes</label>
    <input type="number" id="total" min="1" required>

    <label>Attended Classes</label>
    <input type="number" id="attended" min="0" required>

    <button type="submit">Check Attendance</button>
  </form>

  <div id="output"></div>

  <a href="dashboard.jsp"><button style="background:#0d6efd;margin-top:10px;">⬅ Back to Dashboard</button></a>
</div>

<script>
function calcAttendance(e){
  e.preventDefault();
  let total = parseInt(document.getElementById("total").value);
  let attended = parseInt(document.getElementById("attended").value);
  let percent = ((attended/total)*100).toFixed(2);
  document.getElementById("output").innerHTML = 
    `🎯 Attendance: ${percent}%`;
}
</script>
</body>
</html>
