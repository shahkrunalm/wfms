<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Story - wfms</title>
<%@ include file="header.jsp"%>
</head>
<script type="text/javascript">
	$().ready(function() {
		$("#add-story-form").validate({
			errorClass : "my-error-class",
			rules : {
				projectId: "required",
				storyName : "required"
			},
			messages : {
				projectId: " please select project",
				storyName : " please enter story name"
			}
		});
	});
</script>
<body>
	<%@ include file="menu.jsp"%>
	<%
		List<Project> projectList = (List<Project>) application
				.getAttribute("activeProjectList");
	%>
	<%-- <%@ include file="check-permission.jsp" %> --%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>Add Story</h4></td>
						</tr>
					</table>
					<form name="add-story-form" id="add-story-form"
						action="./StoryController" method="post">
						<input type="hidden" name="action" value="add" />
						<table width="100%">
							<tr>
								<td class="bold" width="10%">Select Project</td>
								<td><select name="projectId" id="projectId">
										<option value="">select</option>
										<%
											for (Project project : projectList) {
										%><option value="<%=project.getProjectId()%>"><%=project.getProjectName()%></option>
										<%
											}
										%>
								</select></td>
							</tr>
							<tr>
								<td class="bold" width="15%">Story Name</td>
								<td><input name="storyName" id="storyName"
									placeholder="enter story name" /></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><input type="submit" value="Add Story" /></td>
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