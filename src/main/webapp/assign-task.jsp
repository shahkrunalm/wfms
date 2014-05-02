<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign Task - wfms</title>
<%@ include file="header.jsp"%>
</head>
<script type="text/javascript">
	$().ready(function() {
		$("#assign-task-form").validate({
			errorClass : "my-error-class",
			rules : {
				userId : "required"
			},
			messages : {
				userId : " please select user"
			}
		});
		
});
</script>
<body>
	<%@ include file="menu.jsp"%>
	<%
		Task task = (Task) request.getAttribute("task");
	
		List<User> userList = (List<User>) request
				.getAttribute("userList");
	
	%>
	<%-- <%@ include file="check-permission.jsp" %> --%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>Assign Task</h4></td>
						</tr>
					</table>
					<form name="assign-task-form" id="assign-task-form"
						action="./TaskController" method="post">
						<input type="hidden" name="action" value="assign" />
						<input type="hidden" name="taskId" value=<%=task.getTaskId()%> />
						<table width="100%">
							<tr>
								<td class="bold" width="10%">Select Resource</td>
								<td>
									<select name="userId" id="userId">
									
										<%if(userList.size()>0){
											for (User u : userList) {
										%><option value="<%=u.getUserId()%>"><%=u.getFirstName()%> <%=u.getLastName()%> (<%=u.getUsername()%>)</option>
										<%
											}}else %><option value="">No resource available</option><%
										%>
									</select>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><input type="submit" value="Assign" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>