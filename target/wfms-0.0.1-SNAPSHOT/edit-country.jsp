<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Country - wfms</title>
<%@ include file="header.jsp"%>
</head>
<script type="text/javascript">
	$().ready(function() {
		$("#edit-country-form").validate({
			
			errorClass : "my-error-class",
			rules : {
					countryName : {
						required : true, 
						remote : {
							url : "./CountryController?action=exists",
							type : "get",
							data : {
								countryName : function() {
									return $(
											"#countryName")
											.val();
								}
							}
						}
					}
			},
			messages : {
						countryName : {
						remote : jQuery.validator
								.format(" country name already exists")
					}
			}
		});
	});
</script>
<%@ include file="menu.jsp"%>
<%-- <%@ include file="check-permission.jsp" %> --%>
<body>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>Edit Country</h4></td>
						</tr>
					</table>
					<form action="./CountryController" name="edit-country-form"
						id="edit-country-form" method="post">
						<input type="hidden" name="action" value="update" />
						<input type="hidden" name="countryId" value="${country.countryId}" />
						<table width="100%">
							<tr>
								<td class="bold" width="15%">Country Name</td>
								<td><input name="countryName" id="countryName" placeholder="enter country name" value="${country.countryName}" /></td>
							</tr>
							<%-- 
							<tr>
								<td class="bold" width="15%">Country Status</td>
								<td>
									<select name="status">
										<option value="1">active</option>
										<option value="0" selected>de-active</option>
									</select>
								</td>
							</tr>
							--%>
							<tr>
								<td>&nbsp;</td>
								<td><input type="submit" value="Update" /></td>
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