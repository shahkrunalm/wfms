<%@page import="com.wfms.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Task List - wfms</title>

<%@ include file="header.jsp"%>
</head>
<body>
	<%
		List<Task> taskList = (List<Task>) request
				.getAttribute("taskList");
	%>
	<%@ include file="menu.jsp"%>
	<%--<%@ include file="check-permission.jsp" %> --%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View Task List</h4></td>
						</tr>
					</table>
					<%
						if (taskList.size() == 0) {
					%>
					<table border="0" width="100%">
						<tr>
							<td><div class="boldred">No record available.</div></td>
						</tr>
					</table>
					<%
						} else {
					%>
					<table border="0" width="100%" id="table-5">
						<tr>
							<th>Sr. No.</th>
							<th>Task Name</th>
							<th>Edit</th>
							<th>Delete</th>
							<th>Status</th>
						</tr>
						<%
							int i = 0;
								for (Task task : taskList) {
						%>
						<tr>
							<td align="center"><%=++i%></td>
							<td align="center">
							<a href="./TaskController?action=detail&taskId=<%=task.getTaskId()%>"
							   title="click here to view task detail"><%=task.getTaskName()%></a>
							</td>
							<td align="center">edit</td>
							<td align="center">delete</td>
							<td align="center">
								<%
									if (task.getStatus() == Constants.OPEN) {
										out.print("Open");
 									} else if (task.getStatus() == Constants.IN_PROGRESS){
 										out.print("In Progress");
 									} else if (task.getStatus() == Constants.CLOSED){
 										out.print("Closed");
 									} else {
 										out.print("Blocked");
 									}
								 %>
							</td>
						</tr>
						<%
							}
							}
						%>
					</table>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>