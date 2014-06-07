<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Lead dashboard - wfms</title>
</head>
<%@ include file="header.jsp"%>
<body>
	<%@ include file="menu.jsp"%>
	<%@ include file="default-description.jsp"%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<%if(user.getProject()!=null){ %>
				<div id="inner_content">
					<div class="inner_box">
						Story: <a href="add-story.jsp" title="click here to add story">add</a> | 
						<a href="./StoryController?action=view-stories-by-project&status=-1&projectId=<%=((User) session.getAttribute("userssn")).getProject().getProjectId()%>" title="click here to view stories">view</a>
					</div>
				</div>
				<div id="inner_content">
					<div class="inner_box">
						Task: <a href="./TaskController?action=my_task"
							title="click here to view task assign to you">view</a>
					</div>
				</div>
				<%} %>
				<div id="inner_content">
					<div class="inner_box">
						Message: <a href="compose-message.jsp"
							title="click here to compose message">compose</a> | <a
							href="./MessageController?action=inbox"
							title="click here to go to inbox">inbox</a> | <a
							href="./MessageController?action=sent"
							title="click here to go to sent">sent</a>
					</div>
				</div>
				<div id="inner_content">
					<div class="inner_box">
						profile: <a
							href="./UserController?action=detail&userId=<%=((User) session.getAttribute("userssn")).getUserId()%>"
							title="click here to view profile">view</a> | <a
							href="change-password.jsp" title="click here to change password">change
							password</a>
					</div>
				</div>
			</div>
			<br class="clearfix" />
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>