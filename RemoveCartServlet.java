/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import model.Design;

@WebServlet("/RemoveCartServlet")
public class RemoveCartServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String designName = request.getParameter("designName");

        HttpSession session = request.getSession();
        List<Design> cart = (List<Design>) session.getAttribute("cart");

        if (cart != null) {

            cart.removeIf(d -> d.getName().equals(designName));

            session.setAttribute("cart", cart);
        }

        response.sendRedirect("cart.jsp");
    }
}