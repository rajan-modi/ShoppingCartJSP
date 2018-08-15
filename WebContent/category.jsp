<%@taglib prefix="my" uri="/WEB-INF/mytag.tld" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category</title>
</head>
<body>
<%
String unm =(String) session.getAttribute("username");
if(unm == null)
				{
					response.sendRedirect("welcome.jsp?msg=5");
					return;		//stop the execution of rest of page
				}
%>
<table width="100%" border="1" align="center">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<tr>
			<td align="center">
					<my:getCat displayType="link"></my:getCat>
			</td>
		</tr>
		<jsp:include page="footer.jsp"></jsp:include>
</table>

</body>
</html>
