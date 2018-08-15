package mypack;

import java.io.IOException;
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

@WebServlet("/Signup")
public class Signup extends HttpServlet 
{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NullPointerException{
		User obj = (User) request.getSession().getAttribute("obj");
		String unm = obj.getUsername();
		String pwd = obj.getPassword();
		String phoneno = obj.getPhoneno();
		String emailid = obj.getEmailid();
		String usermode = obj.getUsermode();
		System.out.println(unm+pwd+phoneno+emailid+usermode);
		PreparedStatement insertStmt;
		PreparedStatement ps=null;
		Connection con=null;
		
			System.out.println("signup called"+unm);

		if((Connection) getServletContext().getAttribute("con") == null)
		{
		System.out.println("Sign up connection con=null");
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/customer","root","root");
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			ServletContext context = getServletContext();
		context.setAttribute("con", con);
		}
		else
		{
		con=(Connection) getServletContext().getAttribute("con");
		}

		try {
			ps =  con.prepareStatement("select * from login1 where username = ?");
			ps.setString(1, unm);

			insertStmt = con.prepareStatement("INSERT INTO login1 values(?,?,?,?,?)");
			insertStmt.setString(1, unm);
			insertStmt.setString(2, pwd);
			insertStmt.setString(3, phoneno);
			insertStmt.setString(4, emailid);
			insertStmt.setString(5, usermode);

			ResultSet rs = ps.executeQuery();
			System.out.println("Hello");
			if(rs.next())
			{
				System.out.println(rs.getString(1)+rs.getString(2)+rs.getString(3));
				response.sendRedirect("registration.jsp?msg=6");
				return;
			}
			else
			{
				int i = insertStmt.executeUpdate();
				if(i==1)
				{
					response.sendRedirect("welcome.jsp?msg=3");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
