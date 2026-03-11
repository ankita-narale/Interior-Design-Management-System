<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Design" %>

<%
List<Design> cart = (List<Design>) session.getAttribute("cart");
double total = 0;
int itemCount = 0;

if(cart != null){
    itemCount = cart.size();
    for(Design d : cart){
        total += d.getPrice();
    }
}

/* AUTO DISCOUNT LOGIC */
double discount = 0;

if(itemCount >= 3){
    discount = 15;   // 15% discount if 3 or more items
}else if(itemCount == 2){
    discount = 10;   // 10% discount if 2 items
}

double finalAmount = total - (total * discount / 100);
%>

<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart</title>

<style>
body{
    font-family:Arial;
    background:url("bedroom1.jpg");
    background-size:cover;
}
.container{
    width:800px;
    margin:50px auto;
    background:lightcyan;
    padding:30px;
    border-radius:15px;
    box-shadow:0 5px 20px gray;
}
table{
    width:100%;
    border-collapse:collapse;
}
th,td{
    padding:12px;
    border:1px solid #ccc;
    text-align:center;
}
th{
    background:darkslategray;
    color:white;
}
.total{
    background:#e8f5e9;
    font-weight:bold;
}
button{
    padding:10px 15px;
    background:darkslategray;
    color:white;
    border:none;
    border-radius:6px;
    cursor:pointer;
}
button:hover{
    background:black;
}
.back{
    background:#777;
}
</style>
</head>

<body>
<div class="container">

<h2>Your Shopping Cart</h2>

<% if(cart == null || cart.isEmpty()){ %>
    <h3>Your cart is empty!</h3>
<% } else { %>

<table>
<tr>
<th>Image</th>
<th>Name</th>
<th>Price</th>
<th>Remove</th>
</tr>

<% for(Design d : cart){ %>
<tr>
<td><img src="images/<%= d.getImage() %>" width="100"></td>
<td><%= d.getName() %></td>
<td>₹ <%= d.getPrice() %></td>
<td>
<form action="RemoveCartServlet" method="post">
<input type="hidden" name="designName" value="<%= d.getName() %>">
<button type="submit">Remove</button>
</form>
</td>
</tr>
<% } %>

<tr class="total">
<td colspan="2">Total</td>
<td colspan="2">₹ <%= total %></td>
</tr>

<tr class="total">
<td colspan="2">Discount (<%= discount %>%)</td>
<td colspan="2">- ₹ <%= total * discount / 100 %></td>
</tr>

<tr class="total">
<td colspan="2">Final Amount</td>
<td colspan="2">₹ <%= finalAmount %></td>
</tr>

</table>

<br>

<a href="booking.jsp">
<button>Proceed to Booking</button>
</a>

<a href="designs.jsp">
<button class="back">Back</button>
</a>

<% } %>

</div>
</body>
</html>