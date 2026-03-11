<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Interior Design Booking & Management System</title>

<style>

body{
    margin:0;
    font-family: 'Segoe UI', sans-serif;
    background-color: whitesmoke;
}

/* ===== NAVIGATION BAR ===== */
.navbar{
    background-color: darkslategray;
    padding:15px 60px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}
.navbar .logo{
    color:white;
    font-size:22px;
    font-weight:bold;
}
.navbar ul{
    list-style:none;
    display:flex;
    gap:25px;
    margin:0;
}
.navbar ul li a{
    color:white;
    text-decoration:none;
    font-size:15px;
}
.navbar ul li a:hover{
    color:gold;
}
.admin-btn{
    padding:8px 18px;
    border-radius:20px;
    background-color: lightseagreen;
    color:black;
    text-decoration:none;
    font-weight:bold;
}

/* ===== HERO SECTION ===== */
.hero{
    height:500px;
    background-image: url("interior.jpg");
    background-size:cover;
    background-position:center;
    display:flex;
    justify-content:center;
    align-items:center;
    text-align:center;
    color:white;
}
.hero h1{
    font-size:45px;
    margin-bottom:15px;
}
.hero p{
    font-size:18px;
}
.hero a{
    display:inline-block;
    margin-top:20px;
    padding:10px 20px;
    background-color: lightgray;
    color:black;
    text-decoration:none;
    border-radius:6px;
    font-weight:bold;
}

/* ===== SECTION STYLE ===== */
.section{
    padding:70px 80px;
}
.section h2{
    text-align:center;
    margin-bottom:40px;
    color:darkslategray;
}
.grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:25px;
}
.card{
    background-color:white;
    border-radius:12px;
    overflow:hidden;
    box-shadow: 5px 5px 15px gray;
}
.card img{
    width:100%;
    height:200px;
    object-fit:cover;
}
.card-content{
    padding:20px;
    text-align:center;
}
.card-content h3{
    margin:10px 0;
    color:darkslategray;
}
.card-content p{
    font-size:14px;
    color:dimgray;
}
.card-content a{
    display:inline-block;
    margin-top:10px;
    padding:8px 14px;
    background-color: darkslategray;
    color:white;
    border-radius:6px;
    text-decoration:none;
}
.card-content a:hover{
    background-color: gold;
    color:black;
}

/* ===== WHY CHOOSE US ===== */
.features{
    background-color: darkslategray;
    color:white;
    text-align:center;
    padding:60px 20px;
}
.features h2{
    margin-bottom:25px;
}

/* ===== DESIGN PROCESS ===== */
.process{
    background-color: whitesmoke;
    text-align:center;
    padding:60px 20px;
}
.process h2{
    margin-bottom:30px;
}
.process-step{
    display:inline-block;
    margin:10px 20px;
    padding:15px 20px;
    background-color:white;
    border-radius:8px;
    box-shadow: 4px 4px 10px gray;
}

/* FOOTER */


</style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<div class="navbar">
    <div class="logo">UrbanNest Interiors</div>

    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="designs.jsp">Designs</a></li>
        <li><a href="feedback.jsp">Feedback</a></li>
    </ul>
    

    <a href="login.jsp" class="admin-btn">Admin Login</a>
</div>

<!-- ===== HERO SECTION ===== -->
<div class="hero">
    <div class="hero-content">
        <h1>Transforming Spaces Into Elegant Living Experiences</h1>
        <p>Professional Interior Designs with Affordable Prizes with Budget</p>
        <a href="designs.jsp">Your Designs</a>
    </div>
</div>

<!-- ===== DESIGN STYLES ===== -->
<div class="section">
    <h2>Our Design Styles</h2>
    <div class="grid">
        <div class="card">
            <img src="modern.jpg">
            <div class="card-content">
                <h3>Modern</h3>
                <p>Sleek, clean and smart living spaces.</p>
            </div>
        </div>

        <div class="card">
            <img src="classic.jpg">
            <div class="card-content">
                <h3>Classic</h3>
                <p>Timeless elegance with detailed craftsmanship.</p>
            </div>
        </div>

        <div class="card">
            <img src="luxury.jpg">
            <div class="card-content">
                <h3>Luxury</h3>
                <p>Premium interiors with high-end aesthetics.</p>
            </div>
        </div>

        <div class="card">
            <img src="minimalist.jpg">
            <div class="card-content">
                <h3>Minimalist</h3>
                <p>Simple, elegant and clutter-free spaces.</p>
            </div>
        </div>
    </div>
</div>

<!-- ===== WHY CHOOSE US ===== -->
<div class="features">
    <h2>Why Choose Us</h2>
    <p>✔ 200+ Projects Successfully Completed</p>
    <p>✔ 100% Client Satisfaction</p>
    <p>✔ Experienced Professional Designers</p>
    <p>✔ Affordable and Transparent Pricing</p>
</div>

<!-- ===== DESIGN PROCESS ===== -->
<div class="process">
    <h2>Our Design Process</h2>
    <div class="process-step">Consultation</div>
    <div class="process-step">Planning</div>
    <div class="process-step">Design & Execution</div>
    <div class="process-step">Final Delivery</div>
</div>
<footer style="background:#222; color:white; padding:1px; text-align:center; margin-top:0px;">
    <p style="font-size:14px;">
        © 2026 UrbanNest Interiors | Designed & Developed By 
        <strong>Ankita</strong> & <strong>Samiksha</strong>
    </p>

</footer>

</body>
</html>