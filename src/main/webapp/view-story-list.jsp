<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Story List - wfms</title>

<%@ include file="header.jsp"%>
</head>
<body>
	<%
		List<Story> storyList = (List<Story>) request
				.getAttribute("storyList");
	%>
	<%@ include file="menu.jsp"%>
	<%--<%@ include file="check-permission.jsp" %> --%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View Story List</h4></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><a href="./ProjectController?action=view&status=1" title="click here to view active list">active</a>
								| <a href="./ProjectController?action=view&status=0" title="click here to view de-active list">de-active</a>
								| <a href="./ProjectController?action=view&status=-1" title="click here to view all">view all</a></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
					<%
						if (storyList.size() == 0) {
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
							<th>Story Name</th>
							<th>Project Name</th>
							<th>Tasks</th>
							<th>Add Task</th>
							<th>Edit</th>
							<th>Delete</th>
							<th>Status</th>
						</tr>
						<%
							int i = 0;
								for (Story story : storyList) {
						%>
						<tr>
							<td align="center"><%=++i%></td>
							<td align="center">
							<a href="./StoryController?action=detail&storyId=<%=story.getStoryId()%>"
							   title="click here to view story detail"><%=story.getStoryName()%></a>
							</td>
							<td align="center"><%=story.getProject().getProjectName()%></td>
							<td align="center"><%=story.getTasks().size()%></td>
							<td align="center"><a href="add-task.jsp?storyId=<%=story.getStoryId() %>"
											title="click here to add task">add</td>
							<td align="center">edit</td>
							<td align="center">delete</td>
							<td align="center">
								<%
									if (story.getStatus() == 1) {
								%><div class="green">active</div> <%
 	} else {
 %><div class="red">de-active</div> <%
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