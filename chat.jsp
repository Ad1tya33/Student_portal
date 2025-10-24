<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat & Notifications</title>
<style>
body { background:#f5f7fa; font-family:Segoe UI; }
.container {
  width:50%; margin:40px auto; background:white; padding:20px;
  border-radius:8px; box-shadow:0 0 10px rgba(0,0,0,0.1);
}
h2{text-align:center;}
.chatbox {
  height:300px; border:1px solid #ccc; border-radius:5px;
  overflow-y:auto; padding:10px; background:#fafafa;
}
.message { margin:8px 0; }
.sent { text-align:right; color:#0d6efd; }
.received { text-align:left; color:#198754; }
input { width:80%; padding:8px; }
button { padding:8px 15px; background:#0d6efd; color:white; border:none; border-radius:5px; }
</style>
</head>
<body>
<div class="container">
  <h2>💬 Chat & Notifications</h2>
  <div class="chatbox" id="chat"></div>
  <input type="text" id="msg" placeholder="Type message...">
  <button onclick="sendMsg()">Send</button>
  <a href="dashboard.jsp"><button style="margin-top:10px;width:100%;background:#198754;">⬅ Back</button></a>
</div>
<script>
function sendMsg(){
  let msg=document.getElementById("msg").value;
  if(!msg) return;
  let c=document.getElementById("chat");
  c.innerHTML+=`<div class='message sent'>You: ${msg}</div>`;
  setTimeout(()=>c.innerHTML+=`<div class='message received'>Teacher: Got it! 👍</div>`,1000);
  document.getElementById("msg").value="";
}
</script>
</body>
</html>
