package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.List;
import model.Design;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

HttpSession session = request.getSession();
List<Design> cart = (List<Design>) session.getAttribute("cart");

if(cart == null || cart.isEmpty()){
response.sendRedirect("cart.jsp");
return;
}

try{

String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String appointmentDate = request.getParameter("appointment_date");
String timeSlot = request.getParameter("time_slot");
String address = request.getParameter("address");
String notes = request.getParameter("notes");

double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
double finalAmount = Double.parseDouble(request.getParameter("finalAmount"));
double discount = Double.parseDouble(request.getParameter("discount"));

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/interiordb","root","Java@123");

String query = "INSERT INTO bookings "
+ "(customer_name,email,phone,appointment_date,time_slot,total_amount,discount,final_amount,address,notes,status) "
+ "VALUES (?,?,?,?,?,?,?,?,?,?,?)";

PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);

ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,phone);
ps.setString(4,appointmentDate);
ps.setString(5,timeSlot);
ps.setDouble(6,totalAmount);
ps.setDouble(7,discount);
ps.setDouble(8,finalAmount);
ps.setString(9,address);
ps.setString(10,notes);
ps.setString(11,"Pending");

ps.executeUpdate();

ResultSet rs = ps.getGeneratedKeys();

if(rs.next()){
int bookingId = rs.getInt(1);
session.removeAttribute("cart");
response.sendRedirect("payment.jsp?bookingId="+bookingId);
}

con.close();

}catch(Exception e){
e.printStackTrace();
response.sendRedirect("booking.jsp?error=Booking Failed. Try Again.");
}

}
}