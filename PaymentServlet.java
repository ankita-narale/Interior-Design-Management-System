package controller;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bookingIdStr = request.getParameter("bookingId");
        String paymentMethod = request.getParameter("payment_method");
        String password = request.getParameter("password");

        if (bookingIdStr == null || paymentMethod == null || password == null ||
                bookingIdStr.isEmpty() || paymentMethod.isEmpty() || password.isEmpty()) {

            response.sendRedirect("payment.jsp?bookingId=" + bookingIdStr +
                    "&error=Please fill all fields");
            return;
        }

        int bookingId = Integer.parseInt(bookingIdStr);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/interiordb",
                    "root",
                    "Java@123");

            // Get booking details
            PreparedStatement psCheck = con.prepareStatement(
                    "SELECT final_amount, status FROM bookings WHERE id=?");
            psCheck.setInt(1, bookingId);
            ResultSet rs = psCheck.executeQuery();

            if (!rs.next()) {
                con.close();
                response.sendRedirect("payment.jsp?bookingId=" + bookingId +
                        "&error=Booking not found");
                return;
            }

            double amount = rs.getDouble("final_amount");
            String status = rs.getString("status");

            if ("Paid".equalsIgnoreCase(status)) {
                con.close();
                response.sendRedirect("payment.jsp?bookingId=" + bookingId +
                        "&error=Already Paid");
                return;
            }

            // Insert payment
            PreparedStatement psPayment = con.prepareStatement(
                    "INSERT INTO payments (booking_id, amount, payment_method, payment_date) VALUES (?, ?, ?, NOW())");

            psPayment.setInt(1, bookingId);
            psPayment.setDouble(2, amount);
            psPayment.setString(3, paymentMethod);
            psPayment.executeUpdate();

            // Update booking
            PreparedStatement psUpdate = con.prepareStatement(
                    "UPDATE bookings SET status='Paid' WHERE id=?");

            psUpdate.setInt(1, bookingId);
            psUpdate.executeUpdate();

            con.close();

            response.sendRedirect("payment-success.jsp?bookingId=" + bookingId);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("payment.jsp?bookingId=" + bookingId +
                    "&error=Something went wrong");
        }
    }
}