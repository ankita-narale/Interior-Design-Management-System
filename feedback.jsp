<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Feedback Page</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-image: url('feedback.jpg');
    background-size: cover;
    background-repeat: no-repeat;
}

.container {
    width: 450px;
    margin: 50px auto;
    padding: 30px;
    background: rgba(255,255,255,0.9);
    border-radius:12px;
    box-shadow:0 5px 20px black;
}

h2 {
    text-align: center;
}

input, textarea, select {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    border-radius: 6px;
    border: 1px solid lightgray;
}

button {
    width: 100%;
    padding: 10px;
    background: lightgreen;
    color: black;
    border: none;
    cursor: pointer;
}

.back-btn {
    background: pink;
}
</style>
</head>

<body>

<div class="container">
<h2>Give Your Feedback</h2>

<form action="FeedbackServlet" method="post">

    Name:
    <input type="text" name="name" required>

    Email:
    <input type="email" name="email" required>

    Comments:
    <textarea name="comments" rows="4" placeholder="Write your feedback..." required></textarea>

    Rating:
    <select name="rating" required>
        <option value="">Select Rating</option>
        <option value="5">Excellent</option>
        <option value="4">Very Good</option>
        <option value="3">Good</option>
        <option value="2">Average</option>
        <option value="1">Poor</option>
    </select>

    <button type="submit">Submit Feedback</button>
</form>

<br>

<a href="index.jsp">
    <button class="back-btn">Back to Home</button>
</a>

</div>

</body>
</html>