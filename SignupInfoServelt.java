package auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SignupInfoServlet extends HttpServlet{
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		HttpSession session=req.getSession();		//Session for storing credentials from Signup page
		session.setAttribute("username",username);
		session.setAttribute("password",password);
		
		resp.sendRedirect("login.jsp");			//sending session object(credentials) to login page
		
	}
}
