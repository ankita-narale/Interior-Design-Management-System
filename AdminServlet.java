package controller;

import dao.DBConnection;
import model.Booking;
import model.Design;
import model.Payment;
import model.Feedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

String action = request.getParameter("action");
String idParam = request.getParameter("id");
String statusFilter = request.getParameter("status");
String search = request.getParameter("search");

try(Connection con = DBConnection.getConnection()){

// ---------------- ACTIONS ----------------

if("approve".equals(action) && idParam!=null){
PreparedStatement ps = con.prepareStatement(
"UPDATE bookings SET status=? WHERE id=?");

ps.setString(1,"Approved");
ps.setInt(2,Integer.parseInt(idParam));
ps.executeUpdate();

response.sendRedirect("AdminServlet");
return;
}

if("reject".equals(action) && idParam!=null){
PreparedStatement ps = con.prepareStatement(
"UPDATE bookings SET status=? WHERE id=?");

ps.setString(1,"Rejected");
ps.setInt(2,Integer.parseInt(idParam));
ps.executeUpdate();

response.sendRedirect("AdminServlet");
return;
}

if("deleteBooking".equals(action) && idParam!=null){
PreparedStatement ps = con.prepareStatement(
"DELETE FROM bookings WHERE id=?");

ps.setInt(1,Integer.parseInt(idParam));
ps.executeUpdate();

response.sendRedirect("AdminServlet");
return;
}


// ---------------- BOOKINGS ----------------

List<Booking> bookingsList = new ArrayList<>();

String bookingSql = "SELECT * FROM bookings WHERE 1=1";

if(statusFilter!=null && !statusFilter.equals("All") && !statusFilter.trim().isEmpty()){
bookingSql += " AND status=?";
}

if(search!=null && !search.trim().isEmpty()){
bookingSql += " AND customer_name LIKE ?";
}

bookingSql += " ORDER BY id DESC";

PreparedStatement psBooking = con.prepareStatement(bookingSql);

int index=1;

if(statusFilter!=null && !statusFilter.equals("All") && !statusFilter.trim().isEmpty()){
psBooking.setString(index++,statusFilter);
}

if(search!=null && !search.trim().isEmpty()){
psBooking.setString(index++,"%"+search+"%");
}

ResultSet rsBooking = psBooking.executeQuery();

while(rsBooking.next()){

Booking b = new Booking();

b.setId(rsBooking.getInt("id"));
b.setCustomerName(rsBooking.getString("customer_name"));
b.setEmail(rsBooking.getString("email"));
b.setPhone(rsBooking.getString("phone"));
b.setAppointmentDate(rsBooking.getString("appointment_date"));
b.setTimeSlot(rsBooking.getString("time_slot"));
b.setTotalAmount(rsBooking.getDouble("total_amount"));
b.setDiscount(rsBooking.getDouble("discount"));
b.setFinalAmount(rsBooking.getDouble("final_amount"));
b.setAddress(rsBooking.getString("address"));
b.setNotes(rsBooking.getString("notes"));
b.setStatus(rsBooking.getString("status"));

bookingsList.add(b);
}


// ---------------- DESIGNS ----------------

List<Design> designList = new ArrayList<>();

ResultSet rsDesign = con.createStatement().executeQuery(
"SELECT * FROM designs ORDER BY id DESC");

while(rsDesign.next()){

Design d = new Design();

d.setId(rsDesign.getInt("id"));
d.setCategory(rsDesign.getString("category"));
d.setRoom(rsDesign.getString("room"));
d.setStyle(rsDesign.getString("style"));
d.setImage(rsDesign.getString("image"));
d.setName(rsDesign.getString("name"));
d.setPrice(rsDesign.getDouble("price"));
d.setDescription(rsDesign.getString("description"));

designList.add(d);
}


// ---------------- PAYMENTS ----------------

List<Payment> paymentList = new ArrayList<>();

ResultSet rsPayment = con.createStatement().executeQuery(
"SELECT * FROM payments ORDER BY id DESC");

while(rsPayment.next()){

Payment p = new Payment();

p.setId(rsPayment.getInt("id"));
p.setBookingId(rsPayment.getInt("booking_id"));
p.setAmount(rsPayment.getDouble("amount"));
p.setMethod(rsPayment.getString("payment_method"));
p.setPaymentDate(rsPayment.getTimestamp("payment_date"));

paymentList.add(p);
}


// ---------------- FEEDBACK ----------------

List<Feedback> feedbackList = new ArrayList<>();

ResultSet rsFeedback = con.createStatement().executeQuery(
"SELECT * FROM feedback ORDER BY id DESC");

while(rsFeedback.next()){

Feedback f = new Feedback();

f.setId(rsFeedback.getInt("id"));
f.setCustomerName(rsFeedback.getString("customer_name"));
f.setEmail(rsFeedback.getString("email"));
f.setRating(rsFeedback.getInt("rating"));
f.setComments(rsFeedback.getString("comments"));
f.setFeedbackDate(rsFeedback.getDate("feedback_date"));

feedbackList.add(f);
}




// ---------------- DASHBOARD ----------------

request.setAttribute("totalBookings",bookingsList.size());

double totalRevenue = paymentList.stream()
.mapToDouble(Payment::getAmount)
.sum();

request.setAttribute("totalAmount",totalRevenue);

request.setAttribute("totalDesigns",designList.size());
request.setAttribute("totalPayments",paymentList.size());

// -------- Highest Selling Design --------

String highestName = "No Data";
String highestCategory = "";
String highestRoom = "";
String highestStyle = "";
String highestImage = "";
double highestPrice = 0;
int highestCount = 0;

String highestSQL =
"SELECT d.name, d.category, d.room, d.style, d.image, d.price, COUNT(b.id) as total " +
"FROM bookings b JOIN designs d ON b.id = d.id " +
"GROUP BY d.id " +
"ORDER BY total DESC LIMIT 1";

PreparedStatement psHighest = con.prepareStatement(highestSQL);
ResultSet rsHighest = psHighest.executeQuery();

if(rsHighest.next()){

highestName = rsHighest.getString("name");
highestCategory = rsHighest.getString("category");
highestRoom = rsHighest.getString("room");
highestStyle = rsHighest.getString("style");
highestImage = rsHighest.getString("image");
highestPrice = rsHighest.getDouble("price");

}

request.setAttribute("highestName", highestName);
request.setAttribute("highestCategory", highestCategory);
request.setAttribute("highestRoom", highestRoom);
request.setAttribute("highestStyle", highestStyle);
request.setAttribute("highestImage", highestImage);
request.setAttribute("highestPrice", highestPrice);
request.setAttribute("highestCount", highestCount);



// ---------------- SEND DATA ----------------

request.setAttribute("bookingsList",bookingsList);
request.setAttribute("designList",designList);
request.setAttribute("paymentsList",paymentList);
request.setAttribute("feedbackList",feedbackList);

request.getRequestDispatcher("admin.jsp").forward(request,response);

}

catch(Exception e){
e.printStackTrace();
response.sendRedirect("login.jsp?msg=error");
}

}
}