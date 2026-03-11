/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao; // must match folder dao

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static Connection connection = null;

    private DBConnection() {}

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        if (connection == null || connection.isClosed()) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/interiordb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
            String username = "root";  // your MySQL username
            String password = "Java@123";      // your MySQL password
            connection = DriverManager.getConnection(url, username, password);
        }
        return connection;
    }

    public static String testConnection() {
        try {
            getConnection();
            return " Database Connected Successfully!";
        } catch (Exception e) {
            e.printStackTrace();
            return "❌ Database Connection Failed! " + e.getMessage();
        }
    }
}/**
 *
 * @author del
 */
