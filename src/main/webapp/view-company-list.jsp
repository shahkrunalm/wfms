<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Company List - wfms</title>

<%@ include file="header.jsp"%>
</head>
<body>
	<%
		List<Company> companyList = (List<Company>) request
				.getAttribute("companyList");
	%>
	<%@ include file="menu.jsp"%>
	<%--<%@ include file="check-permission.jsp" %> --%>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View Company List</h4></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><a href="./CompanyController?action=view&status=1" title="click here to view active list">active</a>
								| <a href="./CompanyController?action=view&status=0" title="click here to view de-active list">de-active</a>
								| <a href="./CompanyController?action=view&status=-1" title="click here to view all">view all</a></td>
						</tr>
						<tr><td>&nbsp;</td></tr>
					</table>
					<%
						if (companyList.size() == 0) {
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
							<th>Company Name</th>
							<th>No. of Project</th>
							<th>Edit</th>
							<th>Delete</th>
							<th>Status</th>
						</tr>
						<%
							int i = 0;
								for (Company company : companyList) {
						%>
						<tr>
							<td align="center"><%=++i%></td>
							<td align="center"><a
								href="./CompanyController?action=detail&companyId=<%=company.getCompanyId()%>"
								title="click here to view company detail"><%=company.getCompanyName()%></a></td>
							<td align="center"><%=company.getProjects().size()%></td>
							<td align="center">edit</td>
							<td align="center">delete</td>
							<td align="center">
								<%
									if (company.getStatus() == 1) {
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