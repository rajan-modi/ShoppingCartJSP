<%@page import="mypack.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<script type="text/javascript" src="jquery-1.11.2.js"></script>
<script type="text/javascript">
		function validate()
			{
				var unm = document.getElementById("username").value;
				var pwd = document.getElementById("password").value;
				var phno = document.getElementById("phoneno").value;
				var email = document.getElementById("emailid").value;
				var umode = document.getElementById("usermode").value;
				if(unm == "" || unm == null || pwd == "" || pwd == null || phno == "" || phno == null || email == "" || email == null || umode == "" || umode == null) 
				{
					document.getElementById("msg").innerHTML = "Fields marked with * cannot be empty";
					return false;
				}
				return true;
			}
		function checkuser(username)
		{
			//alert(username);
			$.ajax({
						url : "GetUserServlet",
						type: "get",
						data: "username="+username+"",
						success: function (data) {
							//alert(data);
							
							document.getElementById("msg").innerHTML = data;
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
		
		String messege = "";	
		String str = request.getParameter("msg");
		if(str != null && str.equals("6"))
		{
			messege = "Username Exists";
		}
		
		
%>
<table width="100%" border="2" align="center">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<tr>
			<td align="center">
					<form action="preview.jsp" onsubmit="return validate()">
							<table border="5">
								<tr>
									<td colspan="2">
										<div style="color:red;" id="msg"><%=messege %></div>
									</td>
								</tr>
								<tr>
									<td>*Username</td>
									<td><input type="text" name="username" id="username" onblur="checkuser(this.value)"></td>
								</tr>
								<tr>
									<td>*Password</td>
									<td><input type="password" name="password" id="password"></td>
								</tr>
								<tr>
									<td>*PhoneNumber</td>
									<td><input type="text" name="phoneno" id="phoneno"></td>
								</tr>
								<tr>
									<td>*Email ID</td>
									<td><input type="text" name="emailid" id="emailid"></td>
								</tr>
								<tr>
									<td>*User Mode</td>
									<td><input type="text" name="usermode" id="usermode"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" value="Register"></td>
								</tr>
							</table>
					</form>
			</td>
		</tr>
		</table>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>