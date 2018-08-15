package mypack;

import java.io.IOException;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Payment")
public class Payment extends HttpServlet
{
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	 {
		    HttpSession session = request.getSession();
			int balance = (Integer) session.getAttribute("balance");
			String cardNo1 = request.getParameter("cardno");
			String cardNo2 = "987654321";
			String cvv = request.getParameter("cvv");
			String expiry = request.getParameter("expiry");
			System.out.println(cardNo1+" "+cvv+"    "+expiry+"  "+balance);

			try
			{
				Registry rg = LocateRegistry.getRegistry();
				MasterCardI ref;
				ref = (MasterCardI)rg.lookup("CardValidate");
				int i = ref.validate(cardNo1,cardNo2,expiry,Integer.parseInt(cvv),balance);
				if(i==0)
					response.sendRedirect("status.jsp?msg=0");
				if(i==1)
					response.sendRedirect("status.jsp?msg=1");
				if(i==2)
					response.sendRedirect("status.jsp?msg=2");
				if(i==3)
					response.sendRedirect("status.jsp?msg=3");
			}
			catch (NotBoundException e) {
				e.printStackTrace();
			}
	}
}
