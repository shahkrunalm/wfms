<%@page import="com.wfms.util.Constants"%>
<%@page import="com.wfms.util.Utility"%>
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
							<td width="15%" class="bold">Project Name</td>
							<td><%=story.getProject().getProjectName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Story Name</td>
							<td><%=story.getStoryName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Story Description</td>
							<td><%=story.getDescription()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Created By</td>
							<td><%=story.getCreatedBy()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Created On</td>
							<td><%=com.wfms.util.Utility.getOnlyDate(story.getCreatedOn())%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Tasks</td>
							<td>
							<%if(story.getTasks().size()==0){ %>No record found |<%} %> <a href="add-task.jsp?storyId=<%=story.getStoryId() %>"
											title="click here to add task">add task</a>
							</td>
						</tr>
						<%if(story.getTasks().size()>0){ %>
						<tr>
							<td colspan="2">
								<table border="0" width="100%">
									<tr>
										<td align="center" class="bold">Sr. No.</td>
										<td class="bold">Task Name</td>
										<td align="center" class="bold">Created By</td>
										<td align="center" class="bold">Created On</td>
										<td align="center" class="bold">Assign To</td>
										<td align="center" class="bold">Status</td>
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
										<td align="center">
											<%=task.getCreatedBy() %>
										</td>
										<td align="center"><%=Utility.getOnlyDate(task.getCreatedOn()) %></td>
										
										<td align="center">
										<%
											if(task.getUser()!=null){
												%><a href="./UserController?action=detail&userId=<%=task.getUser().getUserId()%>"
							 						title="click here to view user detail"><%=task.getUser().getUsername()%></a>
												<%
											} else {
												%><a href="./TaskController?action=assign_task&taskId=<%=task.getTaskId()%>">assign</a><% 
											}
										%>
										</td>
										<td align="center">
										<%
											if(task.getStatus() == Constants.OPEN)
												out.print("Open");
											else if(task.getStatus() == Constants.IN_PROGRESS)
												%><div class="green">In Progress<%
											else if(task.getStatus() == Constants.BLOCKED)
												%><div class="red">Blocked<%
											else if(task.getStatus() == Constants.CLOSED)
												out.print("Closed");
											else
												out.print("-");
										%>
										</td>
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