<!DOCTYPE html>
<html>
<head>
<title>Admin Login</title>

<style>
body {
    font-family: Arial, sans-serif;
    background-image: url('adminimg.jpg');
    background-size: cover;
    background-repeat: no-repeat;
}


.login-box{
width:350px;
margin:120px auto;
padding:30px;
background:lightgray;
border-radius:10px;
box-shadow:0 0 10px gray;
text-align:center;
}

input{
width:90%;
padding:10px;
margin:10px;
}

button{
padding:10px 20px;
background:darkcyan;
color:white;
border:none;
border-radius:5px;
cursor:pointer;
width:97%;
margin-left:7px;
}

button:hover{
background:black;
}
.back-btn {
    display: block;
    margin-top: 15px;
    background: darkslategray;
    text-decoration: none;
    color: white;
    padding: 8px 15px;
    border-radius: 5px;
    text-align: center;
    width:88%;
    margin-left:10px;
}
.back-btn:hover {
    background: darkslategray;
}
</style>

</head>

<body>

<div class="login-box">

<h2>Admin Login</h2>

<form action="LoginServlet" method="post">

<input type="text" name="username" placeholder="Enter Username" required>

<input type="password" name="password" placeholder="Enter Password" required>

<br>

<button type="submit">Login</button><br>

<a href="index.jsp" class="back-btn">Back to Home</a>

</form>

</div>

</body>
</html>