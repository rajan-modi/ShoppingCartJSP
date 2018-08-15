package mypack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetProduct")
public class GetProduct extends HttpServlet
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try {
			String catid  = request.getParameter("catId");
			System.out.println(catid);
			Connection con = (Connection)getServletContext().getAttribute("con");
			PreparedStatement ps =  con.prepareStatement("select * from product where catid=?");
			
			ps.setInt(1, Integer.parseInt(catid));
			
			ResultSet rs =  ps.executeQuery();
			//System.out.println(rs.getString(1));
			PrintWriter out = response.getWriter();
			
			out.println("<select name='productid'>");
			while(rs.next())
			{
				out.println("<option value='"+rs.getInt(1)+"'>");	
				out.println(""+rs.getString(2)+"");
				out.println("</option>");
			}
			out.println("</select>");
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
