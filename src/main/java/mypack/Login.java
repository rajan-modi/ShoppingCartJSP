package mypack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet 
{
	public void init()
	{
		Connection con=null;
		try {
			ServletConfig config = getServletConfig();
			String driver = config.getInitParameter("Driver");
			String url = config.getInitParameter("URL");
			String username = config.getInitParameter("Username");
			String password = config.getInitParameter("Password");
				if((Connection) getServletContext().getAttribute("con") == null)
					{
					System.out.println("Login connection con=null");
					Class.forName(driver);
					con = DriverManager.getConnection(url,username,password);
					ServletContext context = getServletContext();
					context.setAttribute("con", con);
					}	
				else
					{
					con=(Connection) getServletContext().getAttribute("con");	
					}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		String unm = request.getParameter("username");
		String pwd = request.getParameter("password");

		try {
			Connection con = (Connection) getServletContext().getAttribute("con");
			PreparedStatement ps =  con.prepareStatement("select * from login1 where username = ? and password = ?");
			ps.setString(1, unm);
			ps.setString(2, pwd);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				HttpSession session = request.getSession();		//creating session
				session.setAttribute("username", unm);			//storing username in session
				session.setAttribute("usermode", rs.getString(5));

				if(request.getParameter("chk") != null)
					{
						Cookie cookieUnm = new Cookie("unm", unm);
						Cookie cookiePwd = new Cookie("pwd",pwd);

						response.addCookie(cookieUnm);
						response.addCookie(cookiePwd);
					}
				if(rs.getString(5).equals("user"))			//displaying shopping category for user
					{
						response.sendRedirect("category.jsp");
					}
				else										//displaying admin category to add,delete
					{
						response.sendRedirect("adminCategory.jsp");
					}

			}
			else
			{
				response.sendRedirect("welcome.jsp?msg=1");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@Override
	public void destroy()
	{
		try {
			Connection con = (Connection) getServletContext().getAttribute("con");
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
