<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add User - wfms</title>
<%@ include file="header.jsp"%>
</head>
<script type="text/javascript">
	$()
			.ready(
					function() {
						$("#add-user-form")
								.validate(
										{
											errorClass : "my-error-class",
											rules : {
												firstName : "required",
												username : {
													required : true,
													minlength : 5,
													remote : {
														url : "./UserController?action=userExists",
														type : "get",
														data : {
															username : function() {
																return $(
																		"#username")
																		.val();
															}
														}
													}
												}
											},
											messages : {
												username : {
													remote : jQuery.validator
															.format(" someone already has that username, please try another")
												}
											}
										});
					});

	$(function() {
		$("#birthDate").datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : "dd-mm-yy",
			minDate : "-780m +0w",
			maxDate : "-144m +0w"
		});
	});
</script>
<%@ include file="menu.jsp"%>
<%-- <%@ include file="check-permission.jsp" %> --%>
<body>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>Add User</h4></td>
						</tr>
					</table>
					<form action="./UserController" name="add-user-forms"
						id="add-user-forms" method="post">
						<input type="hidden" name="action" value="add" />
						<table width="100%">
							<tr>
								<td class="bold" width="15%">User Name</td>
								<td><input id="username" name="username"
									placeholder="enter user name"></td>
							</tr>
							<tr>
								<td class="bold">First Name</td>
								<td><input id="firstName" name="firstName"
									placeholder="enter first name"></td>
							</tr>
							<tr>
								<td class="bold">Last Name</td>
								<td><input id="lastName" name="lastName"
									placeholder="enter last name"></td>
							</tr>
							<tr>
								<td class="bold">User Type</td>
								<td><select name="userType" id="userType">
										<option value="admin">Admin</option>
										<option value="manager">Manager</option>
										<option value="employee">Employee</option>
								</select></td>
							</tr>
							<tr>
								<td class="bold">Email</td>
								<td><input id="birthDate" name="birthDate"
									placeholder="enter birth date"></td>
							</tr>
							<tr>
								<td class="bold">Designation</td>
								<td><select name="designation">
										<option value="Trainee">Trainee</option>
										<option value="Trainee">Software Engineer</option>
										<option value="Trainee">Sr. Software Engineer</option>
										<option value="Trainee">System Analyst</option>
										<option value="Trainee">Sr. System Analyst</option>
										<option value="Trainee">Technical Architect</option>
										<option value="Trainee">Sr. Technical Architect</option>
										<option value="Trainee">Quality Engineer</option>
										<option value="Trainee">Sr. Quality Engineer</option>
										<option value="Trainee">Project Manager</option>
										<option value="Trainee">Delivery Manager</option>
										<option value="Trainee">Delivery Head</option>
								</select></td>
							</tr>
							<tr>
								<td></td>
								<td><input type="submit" value="Add User"></td>
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