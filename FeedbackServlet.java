package controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {

    private static final String URL = "jdbc:mysql://localhost:3306/interiordb";
    private static final String USER = "root";
    private static final String PASSWORD = "Java@123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameters (NO bookingId now)
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String comments = request.getParameter("comments");
        String ratingStr = request.getParameter("rating");

        // Validate required fields
        if (name == null || name.isEmpty() ||
            email == null || email.isEmpty() ||
            comments == null || comments.isEmpty() ||
            ratingStr == null || ratingStr.isEmpty()) {

            response.getWriter().println("<h3>Error: All fields are required!</h3>");
            return;
        }

        try {
            int rating = Integer.parseInt(ratingStr);

            // Connect to DB
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);

            // Insert feedback (NO booking_id column)
            String sql = "INSERT INTO feedback (customer_name, email, comments, rating, feedback_date) VALUES (?, ?, ?, ?, NOW())";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, comments);
            ps.setInt(4, rating);

            int inserted = ps.executeUpdate();
            con.close();

            if (inserted > 0) {
                response.sendRedirect("feedback_success.jsp");
            } else {
                response.getWriter().println("<h3>Error: Feedback could not be saved!</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Database Error Occurred!</h3>");
        }
    }
}