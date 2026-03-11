<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Design" %>

<%
List<Design> cart = (List<Design>) session.getAttribute("cart");
String error = request.getParameter("error");

double total = 0;
int itemCount = 0;

if(cart != null){
    itemCount = cart.size();
    for(Design d : cart){
        total += d.getPrice();
    }
}

double discount = 0;

if(itemCount >= 3){
    discount = 15;      // 15% discount for 3 or more
}else if(itemCount == 2){
    discount = 10;      // 10% discount for 2 designs
}

double finalAmount = total - (total * discount / 100);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Booking Page</title>

<style>
body{
    font-family: 'Segoe UI', sans-serif;
    background:url("bookings.jpg");
    background-size:cover;
    background-position:center;
    margin:0;
}

.container{
    width:900px;
    margin:50px auto;
    background:lightgray;
    padding:35px;
    border-radius:15px;
    box-shadow:0 8px 25px rgba(0,0,0,0.3);
}

h2{
    text-align:center;
    margin-bottom:25px;
    color:darkslategray;
}

.summary{
    background:lavender;
    padding:20px;
    border-radius:10px;
    margin-bottom:25px;
    font-size:16px;
}

.summary p{
    margin:8px 0;
}

.final{
    font-size:20px;
    color:green;
}

input,select,textarea{
    width:100%;
    padding:12px;
    margin:10px 0;
    border-radius:8px;
    border:1px solid lightgrey;
    font-size:14px;
}

textarea{
    resize:none;
    height:80px;
}

button{
    width:100%;
    padding:14px;
    background:darkslategray;
    color:white;
    border:none;
    border-radius:8px;
    font-size:16px;
    cursor:pointer;
    margin-top:10px;
}

button:hover{
    background:black;
}

.back-btn{
    background:darkgray;
}

.back-btn:hover{
    background:darkslategray;
}

.error{
    color:red;
    font-weight:bold;
    margin-bottom:15px;
    text-align:center;
}
</style>
</head>

<body>
<div class="container">

<h2>Booking Summary</h2>

<% if(error != null){ %>
    <div class="error"><%= error %></div>
<% } %>

<% if(cart != null && cart.size() > 0){ %>

<div class="summary">
    <p>Total Designs Selected: <b><%= itemCount %></b></p>
    <p>Total Amount: ₹ <b><%= total %></b></p>
    <p>Discount Applied: <b><%= discount %>%</b></p>
    <p class="final">Final Payable Amount: ₹ <%= finalAmount %></p>
</div>

<form action="BookingServlet" method="post">

<input type="hidden" name="totalAmount" value="<%= total %>">
<input type="hidden" name="finalAmount" value="<%= finalAmount %>">
<input type="hidden" name="discount" value="<%= discount %>">

<input type="text" name="name" placeholder="Full Name" required>
<input type="email" name="email" placeholder="Email Address" required>
<input type="text" name="phone" placeholder="Phone Number" required>

<label>Appointment Date</label>
<input type="date" name="appointment_date" required>

<label>Preferred Time Slot</label>
<select name="time_slot" required>
<option>10:00 AM - 12:00 PM</option>
<option>12:00 PM - 2:00 PM</option>
<option>2:00 PM - 4:00 PM</option>
<option>4:00 PM - 6:00 PM</option>
</select>

<textarea name="address" placeholder="Project Address" required></textarea>
<textarea name="notes" placeholder="Special Requirements"></textarea>

<button type="submit">Confirm Booking</button>

</form>

<br>

<a href="cart.jsp">
    <button class="back-btn">⬅ Back to Cart</button>
</a>

<% } else { %>

<h3 style="text-align:center;">No Designs Selected</h3>
<br>
<a href="index.jsp">
    <button>Go to Home</button>
</a>

<% } %>

</div>
</body>
</html>