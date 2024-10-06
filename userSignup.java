/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author VORJA
 */
public class signupInfoServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get parameters from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String name = request.getParameter("name");
        String phoneno = request.getParameter("phoneno");

        // Database connection
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Get a connection to the database
            connection = DBConnection.getConnection();

            // SQL query to insert the data
            String query = "INSERT INTO users (username, password, email, name, phoneno) VALUES (?, ?, ?, ?, ?)";
            
            statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password); // You should hash the password for security
            statement.setString(3, email);
            statement.setString(4, name);
            statement.setString(5, phoneno);

            // Execute the query
            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                // Redirect to login page if sign up is successful
                response.sendRedirect("login.jsp");
            } else {
                // In case of error, redirect to signup page
                response.sendRedirect("signup.jsp?error=true");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp?error=true");
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
