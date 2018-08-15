<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Payment Status</title>
</head>
<body>
<%
		
		String messege = "";	
		String str = request.getParameter("msg");
		if(str != null && str.equals("0"))
		{
			messege = "Payment Fail due to database connectivity problem";
		}
		if(str != null && str.equals("1"))
		{
			messege = "Payment Successful";
		}
		if(str != null && str.equals("2"))
		{
			messege = "Invalid Card Number";
		}
		if(str != null && str.equals("3"))
		{
			messege = "Insufficient Balance";
		}
%>
<table width="100%" border="1" align="center">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<tr>
			<td>
				<div style="color:red; font-size: x-large;"><%=messege %></div>
			</td>
		</tr>
		<jsp:include page="footer.jsp"></jsp:include>
</table>
</body>
</html>