package model;

import java.util.Date;

public class Feedback {

private int id;
private String customerName;
private String email;
private int rating;
private String comments;
private Date feedbackDate;

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

public int getRating() {
return rating;
}

public void setRating(int rating) {
this.rating = rating;
}

public String getComments() {
return comments;
}

public void setComments(String comments) {
this.comments = comments;
}

public Date getFeedbackDate() {
return feedbackDate;
}

public void setFeedbackDate(Date feedbackDate) {
this.feedbackDate = feedbackDate;
}

}