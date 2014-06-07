<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.wfms.model.*, java.util.*"%>
<div id="wrapper">
	<div id="page">
		<div id="content">
			<div class="box">
				<%
					User user = null;
					user = (User) session.getAttribute("userssn");
					if (user == null) {
				%>
				<a href="login.jsp" title="click here to login">login</a>

				<%
					} else {
				%><table border="0" width="100%">
					<tr>
						<td>
							<%	out.print("Welcome back, " + user.getUsername()); %>
						</td>
						<td align="right"><%
							if (user.getDesignation().getDesignationId() == 1) {
						%><a href="dm-dashboard.jsp" title="click here to go to dashboard">dashboard</a>
							| <%
							} else if (user.getDesignation().getDesignationId() == 2) {
						%><a href="admin-dashboard.jsp" title="click here to go to dashboard">dashboard</a>
							| <%
							} else if (user.getDesignation().getDesignationId() == 3) {
						%><a href="pm-dashboard.jsp" title="click here to go to dashboard">dashboard</a>
							| <%
							} else if (user.getDesignation().getDesignationId() == 4) {
						%><a href="pl-dashboard.jsp" title="click here to go to dashboard">dashboard</a>
							| <%
							} else if (user.getDesignation().getDesignationId() == 5) {
						%><a href="developer-dashboard.jsp"
							title="click here to go to dashboard">dashboard</a> | <%
							}
						%> <a href="./UserController?action=logout">logout</a></td>
					</tr>
				</table>
				<%
					}
				%>
			</div>
		</div>
	</div>
	<br class="clearfix" />
</div>
