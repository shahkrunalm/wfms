<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Manager dashboard - wfms</title>
</head>
<%@ include file="header.jsp"%>
<body>
	<%@ include file="menu.jsp"%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div id="inner_content">
					<div class="box">
						Message: <a href="add-blood-record.jsp"
							title="click here to add blood record">add</a> | <a
							href="view-blood-record-list"
							title="click here to view blood record list">view</a>
					</div>
				</div>
				<div id="inner_content">
					<div class="box">
						Project: <a
							href="./ProjectController?action=view"
							title="click here to view project list">view</a>
					</div>
				</div>
				<div id="inner_content">
					<div class="box">
						profile: <a href="view-profile.jsp"
							title="click here to view profile">view</a> | <a
							href="edit-profile.jsp" title="click here to edit profile">edit</a>
						| <a href="change-password.jsp"
							title="click here to change password">change password</a>
					</div>
				</div>
				<div id="inner_content">
					<div class="box">
						Story: <a href="add-story.jsp" title="click here to add story">add</a>
						| <a href="./StoryController?action=view"
							title="click here to view story list">view</a>
					</div>
				</div>
			</div>
			<br class="clearfix" />
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>