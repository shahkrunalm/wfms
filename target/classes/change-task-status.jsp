<%@page import="com.wfms.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Task Detail - wfms</title>

</head>
<%@ include file="header.jsp"%>
<body>
	<%@ include file="menu.jsp"%>
	<%-- <%@ include file="check-permission.jsp" %> --%>
	<%
		Task task = (Task) request.getAttribute("task");
	%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View Task Detail</h4></td>
						</tr>
					</table>
					<form name="change-task-status" id="change-task-status" action="./TaskController" method="post">
						<input type="hidden" name="action" value="update_task_status" />
						<input type="hidden" name="taskId" value="<%=task.getTaskId()%>" />
					<table width="100%" border="0">
						<%
							if (task != null) {
						%>
						<tr>
							<td width="15%" class="bold">Task Name</td>
							<td><%=task.getTaskName()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Description</td>
							<td><%=task.getDescription()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Created on</td>
							<td><%=com.wfms.util.Utility.getOnlyDate(task.getCreatedOn())%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Created by</td>
							<td><%=task.getCreatedBy()%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Assigned to</td>
							<td><%
								if(task.getUser()!=null){
									out.print(task.getUser().getUsername());
								} else{
									out.print("not assigned | ");
									%><a href="./TaskController?action=assign_task&taskId=<%=task.getTaskId()%>">assign</a><%
								}
								%></td>
						</tr>
						<tr>
							<td width="15%" class="bold">Status</td>
							<td>
								<select name="status">
									<option value="1">Open</option>
									<option value="2">In Progress</option>
									<option value="3">Closed</option>
									<option value="4">Blocked</option>
								</select>
							</td>
						</tr>
						<tr>
								<td>&nbsp;</td>
								<td><input type="submit" value="Update Status" /></td>
							</tr>
					</form>
						<%}else { %>
						<tr>
							<td width="15%" class="bold">Invalid task id</td>
							<td></td>
						</tr>		
						<%} %>
					</table>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>