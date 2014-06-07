<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Project - wfms</title>
<%@ include file="header.jsp"%>
</head>
<script type="text/javascript">
	$().ready(function() {
		$("#add-project-form").validate({
			errorClass : "my-error-class",
			rules : {
				companyId: "required",
				projectName : "required"
			},
			messages : {
				companyId: " please select company",
				projectName : " please enter project name"
			}
		});
		
		$(function() {
			$("#startDate").datepicker({
				changeMonth : true,
				changeYear : true,
				dateFormat : "dd-mm-yy",
			});
		});
		
		$(function() {
			$("#endDate").datepicker({
				changeMonth : true,
				changeYear : true,
				dateFormat : "dd-mm-yy",
			});
		});
	});
</script>
<body>
	<%@ include file="menu.jsp"%>
	<%
		List<Company> companyList = (List<Company>) application
				.getAttribute("activeCompanyList");
	
		List<User> dmList = (List<User>) application
				.getAttribute("activeDMList");
	
		List<User> pmList = (List<User>) application
				.getAttribute("activePMList");
	%>
	<%-- <%@ include file="check-permission.jsp" %> --%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>Add Project</h4></td>
						</tr>
					</table>
					<form name="add-project-form" id="add-project-form"
						action="./ProjectController" method="post">
						<input type="hidden" name="action" value="add" />
						<table width="100%">
							<tr>
								<td class="bold" width="10%">Select Company</td>
								<td><select name="companyId" id="companyId">
										<option value="">select</option>
										<%
											for (Company company : companyList) {
										%><option value="<%=company.getCompanyId()%>"><%=company.getCompanyName()%></option>
										<%
											}
										%>
								</select></td>
							</tr>
							<tr>
								<td class="bold" width="15%">Project Name</td>
								<td><input name="projectName" id="projectName"
									placeholder="enter project name" /></td>
							</tr>
							<tr>
								<td class="bold" width="15%">Project Short Name</td>
								<td><input name="projectShortName" id="projectShortName"
									placeholder="enter project short name" /></td>
							</tr>
							<tr>
								<td class="bold" width="15%">Description</td>
								<td><input name="projectDescription" id="projectDescription"
									placeholder="enter project description" /></td>
							</tr>
							<tr>
								<td class="bold" width="15%">Expected Start Date</td>
								<td><input name="startDate" id="startDate"
									placeholder="enter start date" /></td>
							</tr>
							<tr>
								<td class="bold" width="15%">Expected End Date</td>
								<td><input name="endDate" id="endDate"
									placeholder="enter end date" /></td>
							</tr>
							<tr>
								<td class="bold" width="10%">Delivery Manager</td>
								<td>
									<select name="dmUserId" id="dmUserId">
										<%
											for (User u : dmList) {
										%><option value="<%=u.getUserId()%>"><%=u.getFirstName()%> <%=u.getLastName()%> (<%=u.getUsername()%>)</option>
										<%
											}
										%>
									</select>
								</td>
							</tr>
							<tr>
								<td class="bold" width="10%">Project Manager</td>
								<td>
									<select name="pmUserId" id="pmUserId">
										<%
											for (User u : pmList) {
										%><option value="<%=u.getUserId()%>"><%=u.getFirstName()%> <%=u.getLastName()%> (<%=u.getUsername()%>)</option>
										<%
											}
										%>
									</select>
								</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><input type="submit" value="Add Project" /></td>
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