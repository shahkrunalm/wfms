<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Task - wfms</title>
<%@ include file="header.jsp"%>
</head>
<script type="text/javascript">
	$().ready(function() {
		$("#add-task-form").validate({
			errorClass : "my-error-class",
			rules : {
				taskName : "required"
			},
			messages : {
				taskName : " please enter task name"
			}
		});
	});
</script>
<body>
	<%@ include file="menu.jsp"%>
	<%-- <%@ include file="check-permission.jsp" %> --%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>Add Task</h4></td>
						</tr>
					</table>
					<form name="add-task-form" id="add-task-form"
						action="./TaskController" method="post">
						<input type="hidden" name="storyId"
							value="<%=request.getParameter("storyId")%>" /> <input
							type="hidden" name="action" value="add" />
						<table width="100%">
							<tr>
								<td class="bold" width="15%">Task Name</td>
								<td><input name="taskName" id="taskName"
									placeholder="enter task name" /></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><input type="submit" value="Add Task" /></td>
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