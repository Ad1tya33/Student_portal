<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resume Builder</title>
<style>
body { background:#f4f7fa; font-family:Segoe UI; }
.container { width:50%; margin:50px auto; background:white; padding:20px; border-radius:8px; box-shadow:0 0 10px rgba(0,0,0,0.1); }
h2 { text-align:center; }
label { display:block; margin:8px 0 5px; }
input, textarea { width:100%; padding:8px; border:1px solid #ccc; border-radius:4px; }
button { margin-top:10px; width:100%; padding:10px; background:#198754; color:white; border:none; border-radius:5px; }
</style>
</head>
<body>
<div class="container">
<h2>📄 Resume Builder</h2>
<form onsubmit="makeResume(event)">
  <label>Name:</label><input id="name">
  <label>Email:</label><input id="email">
  <label>Skills:</label><textarea id="skills"></textarea>
  <label>Experience:</label><textarea id="exp"></textarea>
  <button type="submit">Download Resume</button>
</form>
<a href="dashboard.jsp"><button style="background:#0d6efd;margin-top:10px;">⬅ Back</button></a>
</div>
<script>
function makeResume(e){
  e.preventDefault();
  let data=`Name: ${name.value}\nEmail: ${email.value}\nSkills:\n${skills.value}\nExperience:\n${exp.value}`;
  let blob=new Blob([data],{type:"text/plain"});
  let a=document.createElement("a");
  a.href=URL.createObjectURL(blob);
  a.download="Resume.txt";
  a.click();
}
</script>
</body>
</html>
