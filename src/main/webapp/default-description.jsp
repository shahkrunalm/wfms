<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.wfms.model.*, java.util.*, com.wfms.util.*"%>
<div id="wrapper">
	<div id="page">
		<div id="content">
			<div class="box">
				<table border="0">
					<tr>
						<td>
						<%
						if(user.getUserType().trim().equals("Admin")) {
						%>
							<img src="images/admin.png" alt="admin image" />
						<%} else if (user.getGender().trim().equals("male")) {%>
							<img src="images/male.png" alt="male image" />
						<%} else { %>
							<img src="images/female.png" alt="female image" />
						<%} %>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td valign="top">
							<table>
								<%
								if (user != null && user.getPassword().equals("wfms@123")) {
								%>
								<tr>
									<td><span class="red">Warning !!!</span> Please change your default password</td>
								</tr>
								<%} %>
								<tr>
									<td><span class="bold">Name : </span><% out.print(user.getFirstName() + " " +user.getLastName()); %></td>
								</tr>
								<tr>
									<td><span class="bold">Designation : </span><% out.print(user.getDesignation().getDesignationName()); %></td>
								</tr>
								<tr>
									<td><span class="bold">Date of joining : </span><% out.print(Utility.getOnlyDate(user.getRegistrationDate())); %></td>
								</tr>
								<tr>
									<td><span class="bold">Last login : </span><%=session.getAttribute("lastLogin")%></td>
								</tr>
							</table>
						
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<br class="clearfix" />
</div>

