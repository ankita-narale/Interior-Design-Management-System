<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Design" %>

<%
    List<Design> designs = (List<Design>) request.getAttribute("designsList");
    String category = request.getParameter("category");
    
    String style = request.getParameter("style");
    String range = request.getParameter("range");

    if(category == null) category = "";
    if(style == null) style = "";
    if(range == null) range = "";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Design Gallery</title>

<style>

body{
    margin:0;
    font-family:'Segoe UI', sans-serif;
    background:url("gallery.jpg");
    background-size:cover;
    background-attachment:fixed;
}

.nav-btn {
    background: darkslategrey;
    color: white;
    padding: 8px 15px;
    border-radius: 5px;
    text-decoration: none;
    font-weight: bold;
}

.nav-btn:hover {
    background: lightseagreen;
}
.page-header{
    display:flex;
    align-items:center;
    gap:10px;
    padding-left:20px;
    background:darkcyan;
}
h1{
    padding-left: 300px;
    color:white;
}

.filter-container{
    width:85%;
    margin:auto;
    background:lightcyan;
    padding:20px;
    border-radius:10px;
    box-shadow:0px 5px 15px gray;
    text-align:center;
    display:flex;
    
}

select{
    padding:10px;
    margin:10px;
    width:200px;
    border-radius:6px;
    border:1px solid silver;
    font-weight:bold;
    background-color:aliceblue;
}

.gallery{
    width:90%;
    margin:30px auto;
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(250px,1fr));
    gap:20px;
}

.card{
    background:white;
    border-radius:12px;
    box-shadow:0px 6px 12px silver;
    text-align:center;
    padding-bottom:15px;
}

.card img{
    width:100%;
    height:200px;
    object-fit:cover;
}

.price{
    color:crimson;
    font-weight:bold;
}

.book-btn{
    background-color:darkslategrey;
    color:white;
    padding:8px 12px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    margin:5px;
}

.cart-btn{
    background-color:lightseagreen;
    color:white;
    padding:8px 12px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    margin:5px;
}


</style>
</head>

<body>
    <br>
<div class="page-header">
    <a href="index.jsp" class="nav-btn">Back</a>
    <a href="cart.jsp" class="nav-btn">Next</a>
<h1>Interior Design Gallery </h1>
</div>
    <br><br>

<div class="filter-container">
<form action="DesignServlet" method="get">

<select name="category" onchange="this.form.submit()">
<option value="">Category</option>
<option value="Residential" <%= category.equals("Residential") ? "selected" : "" %>>Residential</option>
<option value="Commercial" <%= category.equals("Commercial") ? "selected" : "" %>>Commercial</option>
<option value="Educational" <%= category.equals("Educational") ? "selected" : "" %>>Educational</option>
</select>



<select name="style" onchange="this.form.submit()">
<option value="">Style</option>
<option value="Modern" <%= style.equals("Modern") ? "selected" : "" %>>Modern</option>
<option value="Classic" <%= style.equals("Classic") ? "selected" : "" %>>Classic</option>
<option value="Luxury" <%= style.equals("Luxury") ? "selected" : "" %>>Luxury</option>
<option value="Minimalist" <%= style.equals("Minimalist") ? "selected" : "" %>>Minimalist</option>
</select>

<select name="range" onchange="this.form.submit()">
<option value="">Price Range</option>
<option value="low" <%= range.equals("low") ? "selected" : "" %>>Below 50,000</option>
<option value="mid" <%= range.equals("mid") ? "selected" : "" %>>50,000 - 1,00,000</option>
<option value="high" <%= range.equals("high") ? "selected" : "" %>>Above 1,00,000</option>
</select>

</form>
</div>

<div class="gallery">

<% 
if(designs != null && designs.size() > 0){
   for(Design d : designs){ 
%>

<div class="card">
<img src="images/<%= d.getImage() %>">
<h3><%= d.getName() %></h3>
<div class="price">₹ <%= d.getPrice() %></div>
<p><%= d.getDescription() %></p>

<form action="CartServlet" method="post">
<input type="hidden" name="designId" value="<%= d.getId() %>">
<button type="submit" class="cart-btn">Add to Cart</button>
</form>

<form action="booking.jsp" method="get">
<input type="hidden" name="designId" value="<%= d.getId() %>">
<button type="submit" class="book-btn">Book Now</button>
</form>

</div>

<% 
   }
} else { 
%>

<h2 style="text-align:center;color:red;">No designs found for selected filters</h2>

<% } %>

</div>

</body>
</html>