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

@WebServlet("/CategoryAdmin")
public class CategoryAdmin extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
			try {
				Connection con = (Connection) getServletContext().getAttribute("con");
				PreparedStatement insertStmt;
				PreparedStatement updateStmt;
				PreparedStatement deleteStmt;
				
				String btn = request.getParameter("submit");
				
				if(btn.equals("Delete"))
					{
						System.out.println("deleted");
						String catid = request.getParameter("categoryid");
						deleteStmt = con.prepareStatement("delete from category where catid = ?");
						deleteStmt.setString(1, catid);
						deleteStmt.executeUpdate();
					}
				if(btn.equals("Update"))
					{
					String catid = request.getParameter("categoryid");
					String catName = request.getParameter("catName");
					updateStmt = con.prepareStatement("update category set catName = ? where catid = ?");
					updateStmt.setString(1, catName);
					updateStmt.setInt(2, Integer.parseInt(catid));
					updateStmt.executeUpdate();
					}
				if(btn.equals("Insert"))
					{
					String catid = request.getParameter("catid");
					String catName = request.getParameter("catName");
					insertStmt = con.prepareStatement("insert into category values(?,?)");
					insertStmt.setInt(1, Integer.parseInt(catid));
					insertStmt.setString(2, catName);
					insertStmt.executeUpdate();
				}
				response.sendRedirect("adminCategory.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
