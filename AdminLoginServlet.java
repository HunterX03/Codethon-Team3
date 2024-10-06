package AdminLogin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Get admin credentials from the form
        String adminId = request.getParameter("adminId");
        String password = request.getParameter("password");
        
        //Initialize database connection variables
        String url = "jdbc:mysql://localhost:3306/yourdatabase";
        String dbUsername = "root"; // Your DB username
        String dbPassword = "password"; // Your DB password*/
        
        try {
             //Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establish the connection
            Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
            
            // Prepare the SQL query
            String query = "SELECT * FROM admin WHERE admin_id = ? AND password = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, adminId);
            pstmt.setString(2, password);
            
             //Execute the query
            ResultSet rs = pstmt.executeQuery();
            
             //Check if the credentials are valid
            if (rs.next()) {
                response.sendRedirect("AdminDashboard.jsp");
            } else {
                out.println("<h2>Invalid Admin ID or Password</h2>");
            }
            
            //Close connections
            rs.close();
            pstmt.close();
            con.close();
            
       } catch (Exception e) {
            e.printStackTrace();
            out.println("<h2>Error connecting to the database!</h2>");
       }
    }
}
