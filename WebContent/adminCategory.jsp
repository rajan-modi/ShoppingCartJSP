<%@taglib prefix="my" uri="/WEB-INF/mytag.tld" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category</title>
<script type="text/javascript">
	function addText()
	{
		document.getElementById("updateDivId").innerHTML = "Category ID <input type='text' name='catid'>";
		document.getElementById("updateDivName").innerHTML = "Category Name <input type='text' name='catName'>";
		document.getElementById("submit").value = "Insert";
		document.getElementById("Add").style.display="none";
		document.getElementById("Update").style.display="none";
		document.getElementById("Delete").style.display="none";
	}
	function updateText()
	{
		document.getElementById("updateDivName").innerHTML = "New Category Name <input type='text' name='catName'>";
		document.getElementById("submit").value = "Update";
		document.getElementById("Add").style.display="none";
		document.getElementById("Update").style.display="none";
		document.getElementById("Delete").style.display="none";
	}
	function deleteText()
	{
		
		document.getElementById("submit").value = "Delete";
		document.getElementById("Add").style.display="none";
		document.getElementById("Update").style.display="none";
		document.getElementById("Delete").style.display="none";
		
	}

</script>
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
		<tr><td><h1 align="center">Please select the Category</h1></td></tr>
		<tr>
			<td align="center">
				<form action="CategoryAdmin">
					<table>
							<tr>
								<td colspan="3"><my:getCat displayType="dropdown"></my:getCat></td>
							</tr>
							<tr>
								<td colspan="3"> <div id="updateDivId" ></div> </td>
							</tr>	
							<tr>
								<td colspan="3"> <div id="updateDivName"></div> </td>
							</tr>
							<tr>
								<td> <input type="button" id = "Add" name="Add"    value="Add"    onclick="addText()">     </td>
								<td> <input type="button" id ="Update" name="Update" value="Update" onclick="updateText()">  </td>
								<td> <input type="button" id = "Delete" name="Delete" value="Delete" onclick="deleteText()"> 	</td>
							</tr>
							<tr>
								<td><input type="submit" id="submit" name="submit" value="submit" ></td>
							</tr>			
					</table>
				</form>
					
			</td>
		</tr>
		<jsp:include page="footer.jsp"></jsp:include>
</table>

</body>
</html>