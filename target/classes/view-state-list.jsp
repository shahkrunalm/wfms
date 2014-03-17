<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View State List - wfms</title>

<%@ include file="header.jsp"%>
</head>
<body>
	<%
		List<State> stateList = (List<State>) request
				.getAttribute("stateList");
	%>
	<%@ include file="menu.jsp"%>
	<%--<%@ include file="check-permission.jsp" %> --%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View State List</h4></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><a href="./StateController?action=view&status=1">active</a>
								| <a href="./StateController?action=view&status=0">de-active</a>
								| <a href="./StateController?action=view">view all</a></td>
						</tr>
					</table>
					<%
						if (stateList.size() == 0) {
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
							<th>State Name</th>
							<th>No. of Cities</th>
							<th>Edit</th>
							<th>Delete</th>
							<th>Status</th>
						</tr>
						<%
							int i = 0;
								for (State state : stateList) {
						%>
						<tr>
							<td align="center"><%=++i%></td>
							<td align="center"><%=state.getStateName()%></td>
							<td align="center"><%=state.getCities().size()%></td>
							<td align="center">edit</td>
							<td align="center">delete</td>
							<td align="center">
								<%
									if (state.getStatus() == 1) {
								%><div class="green">active</div>
								<%
									} else {
								%><div class="red">de-active</div>
								<%
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