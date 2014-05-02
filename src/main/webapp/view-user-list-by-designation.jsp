<%@page import="com.wfms.util.Constants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View user list by designation - wfms</title>

<%@ include file="header.jsp"%>
<script type="text/javascript">
function edit(userId){
	document.getElementById("userId").value = userId;
	document.getElementById("edit-user-form").submit();
}
function deleteUser(userId){
	var confirmation = confirm("Are you sure you want to delete this user detail ?");
	if(confirmation){
		document.getElementById("deleteUserId").value = userId;
		document.getElementById("delete-user-form").submit();
	}
}
function changeStatus(userId, status){
	var cnfm = false;
	if(status==1){
		cnfm = confirm("You are going to de-active this user id "+userId+", are you sure ?");
	}else {
		cnfm = confirm("You are going to active this user id "+userId+", are you sure ?");
	}
	if(cnfm){
		$.ajax({url:"./UserController?action=changeStatus?userId="+userId+"&status="+status, success:function(result){
			alert(result);
			$("#status").html(result);
		}});
	}
}
</script>
</head>
<body>
	<%
		List<User> userList = (List<User>) request
				.getAttribute("userList");
	%>
	<%@ include file="menu.jsp"%>
	<%--<%@ include file="check-permission.jsp" %> --%>
	<form name="edit-user-form" id="edit-user-form" action="./UserController" method="post">
		<input type="hidden" name="action" value="edit">
		<input type="hidden" name="userId" id="userId">
	</form>
	<form name="delete-user-form" id="delete-user-form" action="./UserController" method="post">
		<input type="hidden" name="action" value="delete">
		<input type="hidden" name="userId" id="deleteUserId">
		<input type="hidden" name="status" value="<%=request.getParameter("status")%>">
	</form>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View User List</h4></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><a href="./UserController?action=by_designation&status=1&designationId=<%=request.getParameter("designationId")%>" title="click here to view active list">active</a>
								| <a href="./UserController?action=by_designation&status=0&designationId=<%=request.getParameter("designationId")%>" title="click here to view de-active list">de-active</a>
								| <a href="./UserController?action=by_designation&status=-1&designationId=<%=request.getParameter("designationId")%>" title="click here to view all">view all</a></td>
						</tr>
						<tr><td>&nbsp;</td></tr>
					</table>
					<%
						if (userList.size() == 0) {
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
							<th>User Name</th>
							<th>Name</th>
							<th>User Type</th>
							<th>Edit</th>
							<th>Delete</th>
							<th>Status</th>
						</tr>
						<%
							int i = 0;
								for (User u : userList) {
						%>
						<tr>
							<td align="center"><%=++i%></td>
							<td align="center">
							<a href="./UserController?action=detail&userId=<%=u.getUserId()%>"
							 	title="click here to view user detail">
							<%=u.getUsername()%></a></td>
							<td align="center"><a href="./UserController?action=detail&userId=<%=u.getUserId()%>"
							 	title="click here to view user detail"><%=u.getFirstName()%> <%=u.getLastName()%></a></td>
							<td align="center"><%=u.getUserType()%></td>
							<td align="center">edit</td>
							<td align="center">delete</td>
							<td align="center">
								<%
									if (u.getStatus() == Constants.ACTIVE) {
								%><div class="green">active</div>
								<%
									} else {
								%><div class="red">de-active</div>
								<%
									}
								%>
							</td>
							<!-- 
							<td align="center"><a href="javascript:edit(<%=u.getUserId()%>)" title="click here to edit user detail">edit</a></td>
							<td align="center"><a href="javascript:deleteUser(<%=u.getUserId()%>)" title="click here to delete user detail">delete</a></td>
							<td align="center">
								<%
									if (u.getStatus() == 1) {
								%><a href="javascript:changeStatus(<%=u.getUserId()%>,<%=u.getStatus()%>)" title="click here to update status"><div class="green">active</div></a>
								<%
									} else {
								%><div class="red">de-active</div>
								<%
									}
								%>
							</td>
							-->
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