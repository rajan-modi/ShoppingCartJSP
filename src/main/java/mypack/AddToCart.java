package mypack;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String arr[] = request.getParameterValues("chk");
		HttpSession session1 = request.getSession();
		ArrayList<String> list = (ArrayList<String>)session1.getAttribute("cart");
		if(list  == null)
		{
			list = new ArrayList<String>();
		}
		
		for(String s:arr)
		{
			list.add(s);
		}
		session1.setAttribute("cart", list);
		String s = (String)session1.getAttribute("username");
		System.out.println(s + list);
		
		try {
			response.sendRedirect("category.jsp");		
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
