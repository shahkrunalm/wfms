<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View User Detail - wfms</title>

</head>
<%@ include file="header.jsp"%>
<body>
	<%@ include file="menu.jsp"%>
	<%-- <%@ include file="check-permission.jsp" %> --%>
	<%
		User user = (User) request.getAttribute("user");
	%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View User Detail</h4></td>
						</tr>
					</table>
					<table width="100%" border="0">
						<%
							if (user != null) {
						%>
						<tr>
							<td width="15%" class="bold">User Name</td>
							<td><%=user.getUsername()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Name</td>
							<td><%=user.getFirstName()%> <%=user.getLastName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Gender</td>
							<td><%=user.getGender()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Address</td>
							<td><%=user.getAddress().getStreet()%>, 
								<%=user.getAddress().getCity()%>, 
								<%=user.getAddress().getState()%>,
								<%=user.getAddress().getCountry()%> - <%=user.getAddress().getZipcode()%>
							</td>
						</tr>
						<tr>
							<td width="15%" class="bold">Mobile</td>
							<td><%=user.getContact().getMobile()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Home Phone</td>
							<td><%=user.getContact().getHomePhone()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Contact Name</td>
							<td><%=user.getContact().getEmergencyContactName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Contact Number</td>
							<td><%=user.getContact().getEmergencyContactNo()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Email</td>
							<td><%=user.getContact().getPersonalEmail()%></td>
						</tr>
					</table>
					<%
						} else
							out.print("  Invalid user id");
					%>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>