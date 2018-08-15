<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Preview</title>
</head>
<body>
<jsp:useBean id="obj" class="mypack.User" scope="application" />
<jsp:setProperty property="*" name="obj"/>

<form action="Signup" method="post">
	<table border="2" align="center">
			<tr>
				<td>Username</td>
				<td>  <jsp:getProperty property="username" name="obj"></jsp:getProperty> </td>
			</tr>
			<tr>
				<td>Phone Number</td>
				<td> <jsp:getProperty property="phoneno" name="obj"/></td>
			</tr>
			<tr>
				<td>Email ID</td>
				<td> <jsp:getProperty property="emailid" name="obj"/> </td>
			</tr>
			<tr>
				<td>User Mode</td>
				<td> <jsp:getProperty property="usermode" name="obj"/> </td>
			</tr>
			<tr>
				<td><input type="submit" value="Confirm" ></td>
				
			</tr>
	</table>
	
</form>
</body>
</html>