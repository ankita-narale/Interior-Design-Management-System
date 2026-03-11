package controller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

protected void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException{

String username=request.getParameter("username");
String password=request.getParameter("password");

if(username.equals("admin") && password.equals("admin123")){

HttpSession session=request.getSession();
session.setAttribute("admin","true");

response.sendRedirect("AdminServlet");

}else{

response.sendRedirect("login.jsp?msg=error");

}

}
}
