package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import java.util.List;
import model.Design;
import dao.DBConnection;
import java.sql.*;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String designIdStr = request.getParameter("designId");
        if(designIdStr == null || designIdStr.isEmpty()){
            response.sendRedirect("designs.jsp"); // nothing to add
            return;
        }

        int designId = Integer.parseInt(designIdStr);

        // Get session cart or create new
        HttpSession session = request.getSession();
        List<Design> cart = (List<Design>) session.getAttribute("cart");
        if(cart == null){
            cart = new ArrayList<>();
        }

        // Fetch design details from database
        try (Connection con = DBConnection.getConnection()){
            PreparedStatement ps = con.prepareStatement("SELECT * FROM designs WHERE id=?");
            ps.setInt(1, designId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Design d = new Design(
                        rs.getInt("id"),
                        rs.getString("category"),
                        rs.getString("room"),
                        rs.getString("style"),
                        rs.getString("image"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("description")
                );

                cart.add(d); // add to session cart
            }
        } catch(Exception e){
            e.printStackTrace();
        }

        session.setAttribute("cart", cart);

        // redirect to cart page
        response.sendRedirect("cart.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}