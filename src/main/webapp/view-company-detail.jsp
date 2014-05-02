<%@page import="com.wfms.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Company Detail - wfms</title>

</head>
<%@ include file="header.jsp"%>
<body>
	<%@ include file="menu.jsp"%>
	<%-- <%@ include file="check-permission.jsp" %> --%>
	<%
		Company company = (Company) request.getAttribute("company");
	%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View Company Detail</h4></td>
						</tr>
					</table>
					<table width="100%" border="0">
						<%
							if (company != null) {
						%>
						<tr>
							<td width="15%" class="bold">Company Name</td>
							<td><%=company.getCompanyName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Address</td>
							<td><%=company.getAddress().getStreet()%>, 
								<%=company.getAddress().getCity()%>, 
								<%=company.getAddress().getState()%>,
								<%=company.getAddress().getCountry()%> - <%=company.getAddress().getZipcode()%>
							</td>
						</tr>
						<tr>
							<td width="15%" class="bold">Contact Name</td>
							<td><%=company.getContact().getEmergencyContactName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Work Phone</td>
							<td><%=company.getContact().getWorkPhone()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Website</td>
							<td><%=company.getContact().getWebsite()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Email</td>
							<td><%=company.getContact().getPersonalEmail()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Added On</td>
							<td><%=Utility.getOnlyDate(company.getAddedOn())%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Project</td>
							<td>
							<%if(company.getProjects().size()==0){ %><div class="red">No record found</div> <%} %>
							</td>
						</tr>
						<%if(company.getProjects().size()>0){ %>
						<tr>
							<td colspan="2">
								<table border="0" width="100%">
									<tr>
										<td align="center">Sr. No.</td>
										<td>Project Name</td>
										<td align="center">View Task</td>
										<td align="center">Add Task</td>
										<td align="center">Edit</td>
										<td align="center">Delete</td>
										<td align="center">Status</td>
									</tr>

									<%
										int i = 0;
											for (Project project : company.getProjects()) {
									%>
									<tr>
										<td align="center"><%=++i%></td>
										<td><a
								href="./ProjectController?action=detail&projectId=<%=project.getProjectId()%>"
								title="click here to view project detail"><%=project.getProjectName()%></a></td>
										<td align="center">view (<%=project.getStories().size()%>)</td>
										<td align="center"><a href="add-task.jsp?storyId="
											title="click here to add taks">add</td>
										<td align="center">edit</td>
										<td align="center">delete</td>
										<td align="center"><%=project.getStatus()%></td>
									</tr>
									<%
										}
									%>
								</table>
							</td>
						</tr>
						<%} %>
					</table>
					<%
						} else
							out.print("  Invalid company id");
					%>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>