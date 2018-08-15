package mypack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetUserServlet")
public class GetUserServlet extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		System.out.println("checking user availability");
		try {
			String unm  = request.getParameter("username");
			Connection con=null;
			System.out.println(unm);
			
				if((Connection) getServletContext().getAttribute("con") == null)
				{
				System.out.println("Sign up connection con=null");
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer","root","root");
				ServletContext context = getServletContext();
				context.setAttribute("con", con);
				}
				else
				{
				con=(Connection) getServletContext().getAttribute("con");	
				}
				
			PreparedStatement ps =  con.prepareStatement("select * from login1 where username=?");
			ps.setString(1, unm);
			ResultSet rs =  ps.executeQuery();
			PrintWriter out = response.getWriter();
			if(rs.next())
				{	
					out.println("<p>Username Exist</p>");
				}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
