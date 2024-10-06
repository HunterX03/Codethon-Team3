/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
//import javax.servlet.annotation.  ;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author VORJA
 */
public class login_auth extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get email and password from the form
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate the login credentials and get user details
        User user = validateUser(email, password);

        if (user != null) {
            // Set user details as request attributes
            request.setAttribute("username", user.getUsername());
            request.setAttribute("email", user.getEmail());
            request.setAttribute("phoneno", user.getPhoneNo());
            request.setAttribute("userId", user.getUserId());

            // Forward to welcome.jsp with user details
            RequestDispatcher dispatcher = request.getRequestDispatcher("welcome.jsp");
            dispatcher.forward(request, response);
        } else {
            // Redirect back to login with an error message
            request.setAttribute("errorMessage", "Invalid email or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }  

    // Method to validate user from the database and return user details
    private User validateUser(String email, String password) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            // Get database connection
            connection = DBConnection.getConnection();

            // SQL query to check for matching email and password and retrieve user details
            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
            statement = connection.prepareStatement(query);
            statement.setString(1, email);
            statement.setString(2, password); // Ensure that this password is hashed if hashing is used

            // Execute the query
            resultSet = statement.executeQuery();

            // If there is a matching record, return user details
            if (resultSet.next()) {
                int userId = resultSet.getInt("user_id");
                String username = resultSet.getString("username");
                String phoneNo = resultSet.getString("phoneno");

                // Return a new User object containing the user's details
                return new User(userId, username, email, phoneNo);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null; // Return null if no matching user is found
    }
}
