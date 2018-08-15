<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html manifest="demo.appcache">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
<script type="text/javascript">
		function validate()
		{
			var unm = document.getElementById("username").value;
			var pwd = document.getElementById("password").value;
			if(unm == "" || unm == null || pwd == "" || pwd == null) 
			{
				document.getElementById("msg").innerHTML = "user name or password cannot be empty";
				return false;
			}
			return true;
		}
</script>
</head>
<body>
<%
		
		String messege = "";	
		String str = request.getParameter("msg");
		if(str != null && str.equals("1"))
		{
			messege = "Invalid Username or password";
		}
		if(str != null && str.equals("3"))
		{
			messege = "Registration Completed.Please login to shop";
		}
		if(str != null && str.equals("5"))
		{
			messege = "Please login to shop";
		}
		if(str != null && str.equals("6"))
		{
			messege = "Username Exists";
		}

		Cookie arr[] = request.getCookies();
		String unm = "";
		String pwd = "";
		if(arr != null)
		{
			for(Cookie cookie : arr)
			{
				if(cookie.getName().equals("unm"))
				{
					unm = cookie.getValue();
				}
				if(cookie.getName().equals("pwd"))
				{
					pwd = cookie.getValue();
				}
				System.out.println(unm + "  "+ pwd);
			}
		}
%>

<table width="100%" border="2" align="center">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<tr>
			<td align="center">
					<form action="Login" method="post" onsubmit="return validate()">
							<table border="5">
								<tr>
									<td colspan="2">
										<div style="color:red;" id="msg"><%=messege %></div>
									</td>
								</tr>
								<tr>
									<td>Username</td>
									<td><input type="text" name="username" id="username" value=<%=unm %>></td>
								</tr>
								<tr>
									<td>Password</td>
									<td><input type="password" name="password" id="password" value=<%=pwd %>></td>
								</tr>
								<tr>
									<td><input type="submit" value="Login"></td>
									<td>Remember me<input type="checkbox" name="chk" value="chk"></td>
								</tr>
							</table>
					</form>
			</td>
		</tr>
		<jsp:include page="footer.jsp"></jsp:include>
	</table>
</body>
</html>