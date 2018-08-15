<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
		
<%String mode = "user"; 
  String amode = "admin";
%>	
		<tr>
			<td align="center">
				<table cellpadding="5" cellspacing="5">
						 <tr>
						 		<td><a href="welcome.jsp">Home</a></td>
						 		<%
									if(session.getAttribute("username") == null)
										{
								%>
						 		<td><a href="registration.jsp">NewUserRegistration</a></td>
						 		
						 		<%
										}
									if(session.getAttribute("username") != null && session.getAttribute("usermode").equals(mode))
										{
								%>
								<td><a href = 'category.jsp'>Back to Shopping</a></td>
								<td><a href="cart.jsp">View cart</a></td>
								<td><a href="Logout">Logout</a></td>
								<%
										}
									if(session.getAttribute("username") != null && session.getAttribute("usermode").equals(amode))
									{
								%>
								<td><a href="adminProduct.jsp">Product Page</a></td>
								<td><a href="Logout">Logout</a></td>
								<%
									}
						
								%>
						 </tr>
				</table>
			</td>
		</tr>