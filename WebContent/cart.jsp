<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Cart</title>
<script type="text/javascript" src="jquery-1.11.2.js"></script>
<script>
			function delProduct(productid)
			{
				//alert(productid);
				$.ajax({
					url: "DeleteProduct",
					type: "get",
					data: "productid="+productid+"",
					success: function (data) {
						//alert(data);
						
						document.getElementById(""+productid+"").style.display="none";
						location.reload();
					},
					error: function (error) {
						alert(error);
					}
					
				});
			}
</script>
</head>
<body>
<%
		HttpSession session2 =  request.getSession();
		ArrayList<String> list = (ArrayList<String>)session.getAttribute("cart");
		String unm = (String) session2.getAttribute("username");
		int balance=0;
		
		if(list  == null)
			{	
%>
<table width="100%" border="2" align="center">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<tr>
			<td align="center" >
				<h3>Welcome <%=unm %></h3>
			</td>
		</tr>
		<tr>
			<td align="center">
				<h2>Sorry your cart is Empty</h2>
			</td>
		</tr>
</table>	
		<%	} 
		else
			{
				try {
						Connection con = (Connection) getServletContext().getAttribute("con");
						Statement ps =  con.createStatement();
						StringBuilder sb = new StringBuilder("Select * from product where productid IN (");
						  boolean added = false;
						  for(String s:list)
						  {
							    if (added)
							    {
							      sb.append(",");
							    }      
							    sb.append("'");
							    sb.append(s);
							    sb.append("'");
							    added = true;
						  }
						  sb.append(")");
							
						  ResultSet rs = ps.executeQuery(sb.toString());					
		%>
<table width="100%" border="2" align="center">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<tr>
			<td align="center" colspan="4">
				<h3>Welcome <%=unm %></h3>
			</td>
		</tr>
		<tr>
			<td align="center" >
				<table border="5">
						<tr>
								<td> ProductName </td>
								<td>	Image  </td>
								<td> Price </td>
								<td> Delete </td>
						</tr>
		<%
						while(rs.next())
						{
						balance = balance + Integer.parseInt(rs.getString(4));
		%>
						<tr id=<%=rs.getInt(1)%>>
						<td><%=rs.getString(2) %></td>
						<td> <img src="images/<%=rs.getString(3) %>" height="100px" width="100px">	</td>
						<td><%=rs.getInt(4) %></td>
						<td><input type="button" value="Remove" onclick="delProduct(<%=rs.getInt(1)%>)"></td>
						</tr>
		<%
						}
		%>
						<tr> <td colspan="3"> Total = <%=balance %>  </td> </tr>
		<%
						
						session2.setAttribute("balance", balance);
		%>
						
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="4">		
				<h1>Enter the card details for payment</h1>
			</td>
		</tr>
		<tr>
			<td align="center">
			
							<form action="Payment">
								<table border="5">
									<tr>
										<td>
												Card NO: 
										</td>
										<td>	
												<input type='text' name='cardno'>
										</td>
									</tr>
									<tr>
										<td>
												CVV:     
										</td>
										<td>
												<input type='password' name='cvv'>
										</td>
									</tr>
									<tr>
										<td>
												Expiry: 
										</td>
										<td>
												<input type='text' name='expiry'>
										</td>
									</tr>
									<tr>
										<td colspan="2">
												<input type='submit' value='Pay'>
										</td>
									</tr>
								</table>
							</form>
			</td>
		</tr>
		<jsp:include page="footer.jsp"></jsp:include>	
	</table>
		<%
				} catch (SQLException | IOException e) 
				{
					e.printStackTrace();
				} 
			}
		%>
			
</body>
</html>