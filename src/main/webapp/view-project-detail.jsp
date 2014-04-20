<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Project Detail - wfms</title>

</head>
<%@ include file="header.jsp"%>
<body>
	<%@ include file="menu.jsp"%>
	<%-- <%@ include file="check-permission.jsp" %> --%>
	<%
		Project project = (Project) request.getAttribute("project");
	%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View Project Detail</h4></td>
						</tr>
					</table>
					<table width="100%" border="0">
						<%
							if (project != null) {
						%>
						<tr>
							<td width="15%" class="bold">Company Name</td>
							<td><%=project.getCompany().getCompanyName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Project Name</td>
							<td><%=project.getProjectName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Project Short Name</td>
							<td><%=project.getProjectShortName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Description</td>
							<td><%=project.getProjectDescription()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Delivery Manager</td>
							<td><%=project.getDeliveryManager().getFirstName()%> <%=project.getDeliveryManager().getLastName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Project Manager</td>
							<td><%=project.getProjectManager().getFirstName()%> <%=project.getProjectManager().getLastName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Start Date</td>
							<td><%=com.wfms.util.Utility.getOnlyDate(project.getExpectedStartDate())%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">End Date</td>
							<td><%=com.wfms.util.Utility.getOnlyDate(project.getExpectedEndDate())%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Stories</td>
							<td>
								<%
									if (project.getStories().size() == 0) {
								%><div class="red">No
									record found</div> <%
 	}
 %>
							</td>
						</tr>
						<%
							if (project.getStories().size() > 0) {
						%>
						<tr>
							<td colspan="2">
								<table border="0" width="100%">
									<tr>
										<td align="center">Sr. No.</td>
										<td>Story Name</td>
										<td align="center">View Task</td>
										<td align="center">Add Task</td>
										<td align="center">Edit</td>
										<td align="center">Delete</td>
										<td align="center">Status</td>
									</tr>

									<%
										int i = 0;
												for (Story story : project.getStories()) {
									%>
									<tr>
										<td align="center"><%=++i%></td>
										<td><a
											href="./StoryController?action=detail&storyId=<%=story.getStoryId()%>"
											title="click here to view story detail"><%=story.getStoryName()%></a></td>
										<td align="center">view (<%=story.getTasks().size()%>)
										</td>
										<td align="center"><a
											href="add-task.jsp?storyId=<%=story.getStoryId()%>"
											title="click here to add taks">add</td>
										<td align="center">edit</td>
										<td align="center">delete</td>
										<td align="center"><%=story.getStatus()%></td>
									</tr>
									<%
										}
									%>
								</table>
							</td>
						</tr>
						<%
							}
						%>
					</table>
					<%
						} else
							out.print("  Invalid project id");
					%>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>