<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, model.Booking, model.Payment, model.Feedback" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>

body{
font-family:Arial;
background:lightgray;
}

.navbar{
background:darkslategray;
color:white;
padding:15px;
display:flex;
justify-content:space-between;
width:100.50%;
}

.navbar a{
color:goldenrod;
margin-left:15px;
text-decoration:none;
font-weight:bold;
}

.container{
width:100%;
margin:20px auto;
background:lightpink;
padding:20px;
border-radius:10px;
}

.cards{
display:flex;
gap:20px;
margin-bottom:20px;
}

.card{
flex:1;
background:darkblue;
color:white;
padding:20px;
border-radius:8px;
text-align:center;
}

table{
width:100%;
border-collapse:collapse;
margin-top:20px;
}

th,td{
border:1px solid black;
padding:8px;
text-align:center;
}

th{
background:darkblue;
color:white;
}

.btn{
padding:5px 10px;
text-decoration:none;
color:white;
border-radius:4px;
}
div{
    
}

.approve{background:green;}
.reject{background:red;}
.delete{background:black;}

</style>

</head>

<body>


<div class="navbar">

<h2>Admin Dashboard</h2>

<div>
<a href="AdminServlet">Dashboard</a>
<a href="index.jsp">Home</a>
</div>

</div>


<div class="container">


<!-- DASHBOARD CARDS -->

<div class="cards">

<div class="card">
Total Bookings<br>
${totalBookings}
</div>

<div class="card">
Total Revenue<br>
₹ ${totalAmount}
</div>

<div class="card">
Total Designs<br>
${totalDesigns}
</div>

<div class="card">
Total Payments<br>
${totalPayments}
</div>

</div>

<h3>Highest Selling Design</h3>
<hr>
<div style="background: linear-gradient(to right,lightcoral,palevioletred);
    padding:20px;border-radius:10px;text-align:center;">

<img src="images/<%=request.getAttribute("highestImage")%>"
width="200">

<h2><%=request.getAttribute("highestName")%></h2>

<p>
Category : <%=request.getAttribute("highestCategory")%><br>
Room : <%=request.getAttribute("highestRoom")%><br>
Style : <%=request.getAttribute("highestStyle")%><br>
Price : ₹ <%=request.getAttribute("highestPrice")%><br>

</p>

</div>
<hr>
<br><br>

<!-- SEARCH -->

<form method="get" action="AdminServlet">

<input type="text" name="search"
placeholder="Search by customer name">

<select name="status">

<option value="All">All</option>
<option value="Pending">Pending</option>
<option value="Approved">Approved</option>
<option value="Rejected">Rejected</option>

</select>

<button type="submit">Search</button>

</form>



<h3>Bookings</h3>

<table>

<tr>
<th>No.</th>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Phone</th>
<th>Date</th>
<th>Time</th>
<th>Total</th>
<th>Discount</th>
<th>Final</th>
<th>Status</th>
<th>Action</th>

</tr>

<%

List<Booking> bookings =
(List<Booking>)request.getAttribute("bookingsList");
int seq=1;
if(bookings!=null){

for(Booking b:bookings){

%>

<tr>
<td><%= seq++ %></td>
<td><%=b.getId()%></td>
<td><%=b.getCustomerName()%></td>
<td><%=b.getEmail()%></td>
<td><%=b.getPhone()%></td>
<td><%=b.getAppointmentDate()%></td>
<td><%=b.getTimeSlot()%></td>
<td>₹ <%=b.getTotalAmount()%></td>
<td>₹ <%=b.getDiscount()%></td>
<td>₹ <%=b.getFinalAmount()%></td>
<td><%=b.getStatus()%></td>

<td>

<a class="btn approve"
href="AdminServlet?action=approve&id=<%=b.getId()%>">
Approve
</a>

<a class="btn reject"
href="AdminServlet?action=reject&id=<%=b.getId()%>">
Reject
</a>



</td>

</tr>

<%

}}

%>

</table>



<h3>Payments</h3>

<table>

<tr>
<th>No.</th>
<th>ID</th>
<th>Booking ID</th>
<th>Amount</th>
<th>Method</th>
<th>Date</th>
</tr>

<%

List<Payment> payments =
(List<Payment>)request.getAttribute("paymentsList");
int seqPay=1;
if(payments!=null){

for(Payment p:payments){

%>

<tr>
<td><%= seqPay++ %></td>
<td><%=p.getId()%></td>
<td><%=p.getBookingId()%></td>
<td>₹ <%=p.getAmount()%></td>
<td><%=p.getMethod()%></td>
<td><%=p.getPaymentDate()%></td>

</tr>

<%

}}

%>

</table>



<h3>Feedback</h3>

<table>

<tr>
<th>No.</th>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Rating</th>
<th>Comments</th>
<th>Date</th>
</tr>

<%
List<Feedback> feedbacks = (List<Feedback>) request.getAttribute("feedbackList");
int seqFb = 1; // start sequence from 1
if(feedbacks != null){
    for(Feedback f: feedbacks){
        String ratingText = "";
        switch(f.getRating()){
            case 5: ratingText="Excellent"; break;
            case 4: ratingText="Very Good"; break;
            case 3: ratingText="Good"; break;
            case 2: ratingText="Average"; break;
            case 1: ratingText="Poor"; break;
            default: ratingText="Not Rated";
        }
%>

<tr>
<td><%= seqFb++ %></td>
<td><%=f.getId()%></td>
<td><%=f.getCustomerName()%></td>
<td><%=f.getEmail()%></td>
<td><%= ratingText %></td>
<td><%=f.getComments()%></td>
<td><%=f.getFeedbackDate()%></td>

</tr>

<%

}}

%>

</table>


</div>

</body>
</html>