package controller;

import dao.DBConnection;
import model.Design;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DesignServlet")
public class DesignServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Design> designs = new ArrayList<>();

        String category = request.getParameter("category");
        String room = request.getParameter("room");
        String style = request.getParameter("style");
        String range = request.getParameter("range");

        try (Connection con = DBConnection.getConnection()) {

            String sql = "SELECT * FROM designs WHERE 1=1";

            if (category != null && !category.isEmpty())
                sql += " AND category=?";

            if (room != null && !room.isEmpty())
                sql += " AND room=?";

            if (style != null && !style.isEmpty())
                sql += " AND style=?";

            if (range != null && !range.isEmpty()) {
                if (range.equals("low"))
                    sql += " AND price < 50000";
                else if (range.equals("mid"))
                    sql += " AND price BETWEEN 50000 AND 100000";
                else if (range.equals("high"))
                    sql += " AND price > 100000";
            }

            PreparedStatement ps = con.prepareStatement(sql);

            int index = 1;

            if (category != null && !category.isEmpty())
                ps.setString(index++, category);

            if (room != null && !room.isEmpty())
                ps.setString(index++, room);

            if (style != null && !style.isEmpty())
                ps.setString(index++, style);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

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

                designs.add(d);
            }

            request.setAttribute("designsList", designs);
            request.getRequestDispatcher("designs.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}