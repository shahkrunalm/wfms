<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Country List - wfms</title>

<%@ include file="header.jsp"%>
<script type="text/javascript">
function edit(countryId){
	document.getElementById("countryId").value = countryId;
	document.getElementById("edit-country-form").submit();
}
</script>
</head>
<body>
	<%
		List<Country> countryList = (List<Country>) request
				.getAttribute("countryList");
	%>
	<%@ include file="menu.jsp"%>
	<%--<%@ include file="check-permission.jsp" %> --%>
	<form name="edit-country-form" id="edit-country-form" action="./CountryController" method="post">
		<input type="hidden" name="action" value="edit">
		<input type="hidden" name="countryId" id="countryId">
	</form>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View Country List</h4></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><a href="./CountryController?action=view&status=1">active</a>
								| <a href="./CountryController?action=view&status=0">de-active</a>
								| <a href="./CountryController?action=view">view all</a></td>
						</tr>
					</table>
					<%
						if (countryList.size() == 0) {
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
							<th>Country Name</th>
							<th>No. of States</th>
							<th>Edit</th>
							<th>Delete</th>
							<th>Status</th>
						</tr>
						<%
							int i = 0;
								for (Country country : countryList) {
						%>
						<tr>
							<td align="center"><%=++i%></td>
							<td align="center"><%=country.getCountryName()%></td>
							<td align="center"><%=country.getStates().size()%></td>
							<td align="center"><a href="javascript:edit(<%=country.getCountryId()%>)" title="click here to edit country detail">edit</a></td>
							<td align="center">delete</td>
							<td align="center">
								<%
									if (country.getStatus() == 1) {
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