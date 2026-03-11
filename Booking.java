package model;

public class Booking {

private int id;
private String customerName;
private String email;
private String phone;
private String appointmentDate;
private String timeSlot;
private double totalAmount;
private double discount;
private double finalAmount;
private String address;
private String notes;
private String status;


/* GETTERS AND SETTERS */

public int getId() {
return id;
}

public void setId(int id) {
this.id = id;
}

public String getCustomerName() {
return customerName;
}

public void setCustomerName(String customerName) {
this.customerName = customerName;
}

public String getEmail() {
return email;
}

public void setEmail(String email) {
this.email = email;
}

public String getPhone() {
return phone;
}

public void setPhone(String phone) {
this.phone = phone;
}

public String getAppointmentDate() {
return appointmentDate;
}

public void setAppointmentDate(String appointmentDate) {
this.appointmentDate = appointmentDate;
}

public String getTimeSlot() {
return timeSlot;
}

public void setTimeSlot(String timeSlot) {
this.timeSlot = timeSlot;
}

public double getTotalAmount() {
return totalAmount;
}

public void setTotalAmount(double totalAmount) {
this.totalAmount = totalAmount;
}

public double getDiscount() {
return discount;
}

public void setDiscount(double discount) {
this.discount = discount;
}

public double getFinalAmount() {
return finalAmount;
}

public void setFinalAmount(double finalAmount) {
this.finalAmount = finalAmount;
}

public String getAddress() {
return address;
}

public void setAddress(String address) {
this.address = address;
}

public String getNotes() {
return notes;
}

public void setNotes(String notes) {
this.notes = notes;
}

public String getStatus() {
return status;
}

public void setStatus(String status) {
this.status = status;
}

}