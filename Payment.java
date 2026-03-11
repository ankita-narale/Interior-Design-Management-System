package model;

import java.sql.Timestamp;

public class Payment {

private int id;
private int bookingId;
private double amount;
private String method;
private Timestamp paymentDate;

public int getId() {
return id;
}

public void setId(int id) {
this.id = id;
}

public int getBookingId() {
return bookingId;
}

public void setBookingId(int bookingId) {
this.bookingId = bookingId;
}

public double getAmount() {
return amount;
}

public void setAmount(double amount) {
this.amount = amount;
}

public String getMethod() {
return method;
}

public void setMethod(String method) {
this.method = method;
}

public Timestamp getPaymentDate() {
return paymentDate;
}

public void setPaymentDate(Timestamp paymentDate) {
this.paymentDate = paymentDate;
}

}