package controller; // must match folder controller

import dao.DBConnection;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TestConnectionServlet")
public class TestConnectionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = DBConnection.testConnection();
        response.setContentType("text/html");
        response.getWriter().println("<h2 style='color:green'>" + status + "</h2>");
    }
}