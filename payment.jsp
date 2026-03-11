<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
String bookingId = request.getParameter("bookingId");
String customerName = "";
double finalAmount = 0;
String status = "";
String error = request.getParameter("error");

if(bookingId != null){
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/interiordb","root","Java@123");

        PreparedStatement ps = con.prepareStatement(
            "SELECT customer_name, final_amount, status FROM bookings WHERE id=?");

        ps.setInt(1, Integer.parseInt(bookingId));
        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            customerName = rs.getString("customer_name");
            finalAmount = rs.getDouble("final_amount");
            status = rs.getString("status");
        }

        con.close();

    }catch(Exception e){
        e.printStackTrace();
    }
}else{
    response.sendRedirect("index.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment Page</title>

<style>
body{
    font-family:Arial;
    background:url("paymentimg.jpg");
    background-size:cover;
    background-position:center;
}

.container{
    width:500px;
    margin:80px auto;
    background:lightgray;
    padding:30px;
    border-radius:10px;
    box-shadow:0 5px 15px black;
}

input, select{
    width:100%;
    padding:10px;
    margin:8px 0;
    border-radius:6px;
    border:1px solid silver;
}

button{
    width:100%;
    padding:12px;
    background:royalblue;
    color:white;
    border:none;
    border-radius:6px;
    font-weight:bold;
    cursor:pointer;
}

.error{
    color:red;
    font-weight:bold;
}
.back-btn {
    display: block;
    margin-top: 15px;
    background: darkcyan;
    text-decoration: none;
    color: white;
    padding: 8px 15px;
    border-radius: 5px;
    text-align: center;
    width:94%;
    margin-right:10px;
}
.back-btn:hover {
    background: darkslategray;
}

</style>
</head>
<body>

<div class="container">

<h2>Payment for Booking ID: <%= bookingId %></h2>

<p>Customer: <b><%= customerName %></b></p>
<p>Final Payable Amount: <b>₹ <%= finalAmount %></b></p>

<% if("Paid".equalsIgnoreCase(status)){ %>
    <h3 style="color:green;">Already Paid ✅</h3>
<% } else { %>

<% if(error != null){ %>
    <div class="error"><%= error %></div>
<% } %>

<form action="PaymentServlet" method="post">
<input type="hidden" name="bookingId" value="<%= bookingId %>">

<label>Payment Method:</label>
<select name="payment_method" required>
<option value="">Select Method</option>
<option>Credit Card</option>
<option>Debit Card</option>
<option>UPI</option>
<option>Netbanking</option>
<option>Wallet</option>
</select>

<label>Enter Password:</label>
<input type="password" name="password" required>

<button type="submit">Pay Now</button>

<a href="index.jsp" class="back-btn">Back to Home</a>
</form>

<% } %>

</div>
</body>
</html>