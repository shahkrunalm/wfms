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
		User u = (User) request.getAttribute("user");
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
							if (u != null) {
						%>
						<tr>
							<td width="15%" class="bold">User Name</td>
							<td><%=u.getUsername()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Name</td>
							<td><%=u.getFirstName()%> <%=u.getLastName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Gender</td>
							<td><%=u.getGender()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Address</td>
							<td><%=u.getAddress().getStreet()%>, 
								<%=u.getAddress().getCity()%>, 
								<%=u.getAddress().getState()%>,
								<%=u.getAddress().getCountry()%> - <%=u.getAddress().getZipcode()%>
							</td>
						</tr>
						<tr>
							<td width="15%" class="bold">Mobile</td>
							<td><%=u.getContact().getMobile()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Home Phone</td>
							<td><%=u.getContact().getHomePhone()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Contact Name</td>
							<td><%=u.getContact().getEmergencyContactName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Contact Number</td>
							<td><%=u.getContact().getEmergencyContactNo()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Email</td>
							<td><%=u.getContact().getPersonalEmail()%></td>
						</tr>
						<%if(u.getProject()!=null){ %>
						<tr>
							<td width="15%" class="bold">Project Name</td>
							<td><%=u.getProject().getProjectName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Delivery Manager</td>
							<td><%=u.getProject().getDeliveryManager().getFirstName()%> <%=u.getProject().getDeliveryManager().getLastName()%> (<%=u.getProject().getDeliveryManager().getUsername()%>)</td>
						</tr>
						<tr>
							<td width="15%" class="bold">Project Manager</td>
							<td><%=u.getProject().getProjectManager().getFirstName()%> <%=u.getProject().getProjectManager().getLastName()%> (<%=u.getProject().getProjectManager().getUsername()%>)</td>
						</tr>
						<%} %>
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