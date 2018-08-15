package mypack;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProductAdmin")
public class ProductAdmin extends HttpServlet 
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try {
			Connection con = (Connection) getServletContext().getAttribute("con");
			PreparedStatement insertStmt;
			PreparedStatement updateStmt;
			PreparedStatement deleteStmt;
			
			String btn = request.getParameter("submit");
			String catid  = request.getParameter("categoryid");
			String productid = request.getParameter("productid");  //one in the drop down
			String prodid = request.getParameter("prodid");		//one entered by the user
			String prodName = request.getParameter("prodname");		//one entered by the user
			
			if(btn.equals("Delete"))
				{
					System.out.println("deleted");
					
					deleteStmt = con.prepareStatement("delete from product where productid = ?");
					deleteStmt.setString(1, productid);
					deleteStmt.executeUpdate();
				}
			if(btn.equals("Update"))
				{
					updateStmt = con.prepareStatement("update product set productname = ? where productid = ?");
					updateStmt.setString(1, prodName);
					updateStmt.setInt(2, Integer.parseInt(productid));
					updateStmt.executeUpdate();
				}
			if(btn.equals("Insert"))
				{
					insertStmt = con.prepareStatement("insert into product(productid,productname,catid) values(?,?,?)");
					insertStmt.setInt(1, Integer.parseInt(prodid));
					insertStmt.setString(2, prodName);
					insertStmt.setInt(3, Integer.parseInt(catid));
					insertStmt.executeUpdate();
				}
			response.sendRedirect("adminProduct.jsp");
			} catch (SQLException e) {
			e.printStackTrace();
			}
	}
}
