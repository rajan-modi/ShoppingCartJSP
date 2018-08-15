<%@page import="java.io.IOException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product</title>
</head>
<body>			
<% 
		String catid = request.getParameter("catid");
		try {		
			Connection con = (Connection) getServletContext().getAttribute("con");
			PreparedStatement ps =  con.prepareStatement("select * from product where catid=?");
			ps.setInt(1,Integer.parseInt(catid));
			ResultSet rs =  ps.executeQuery();	
%>
<table width="100%" border="2" align="center">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<tr>
			<td align="center">	
			<form action="AddToCart">
					<table border="5">
<%
						while(rs.next())
							{
%>							
								<tr>	
									<td> <%=rs.getString(2) %>	</td>
									<td> <img src="images/<%=rs.getString(3) %>" height="100" width="100">	</td>
									<td> <%=rs.getInt(4) %>	</td>
									<td> <input type="checkbox" name="chk" value= <%=rs.getInt(1) %> > </td>
								</tr>
<%  
							}
			} catch (SQLException | IOException e) {
				e.printStackTrace();
			} 
%>	
						<tr><td colspan="3"><input type="submit" value = "AddtoCart" ></td></tr>							
					</table>
			</form>
			</td>
		</tr>
		<jsp:include page="footer.jsp"></jsp:include>
</table>
</body>
</html>
	