<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Story Detail - wfms</title>

</head>
<%@ include file="header.jsp"%>
<body>
	<%@ include file="menu.jsp"%>
	<%-- <%@ include file="check-permission.jsp" %> --%>
	<%
		Story story = (Story) request.getAttribute("story");
	%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View Story Detail</h4></td>
						</tr>
					</table>
					<table width="100%" border="0">
						<%
							if (story != null) {
						%>
						<tr>
							<td width="15%" class="bold">Story Name</td>
							<td><%=story.getStoryName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Story Description</td>
							<td><%=story.getDescription()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Created On</td>
							<td><%=com.wfms.util.Utility.getOnlyDate(story.getCreatedOn())%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Stories</td>
							<td>
							<%if(story.getTasks().size()==0){ %><div class="red">No record found</div> <%} %>
							</td>
						</tr>
						<%if(story.getTasks().size()>0){ %>
						<tr>
							<td colspan="2">
								<table border="0" width="100%">
									<tr>
										<td align="center">Sr. No.</td>
										<td>Task Name</td>
										<td align="center">Edit</td>
										<td align="center">Delete</td>
										<td align="center">Status</td>
									</tr>

									<%
										int i = 0;
											for (Task task : story.getTasks()) {
									%>
									<tr>
										<td align="center"><%=++i%></td>
										<td>
											<a href="./TaskController?action=detail&taskId=<%=task.getTaskId()%>" title="click here to view task detail">
											<%=task.getTaskName()%>
											</a>
										</td>
										<td align="center">edit</td>
										<td align="center">delete</td>
										<td align="center"><%=task.getStatus()%></td>
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
							out.print("  Invalid story id");
					%>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>