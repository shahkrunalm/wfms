<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Designation - wfms</title>
<%@ include file="header.jsp"%>
</head>
<script type="text/javascript">
	$().ready(function() {
		$("#add-designation-form").validate({
			
			errorClass : "my-error-class",
			rules : {
					designationName : {
						required : true, 
						remote : {
							url : "./DesignationController?action=exists",
							type : "get",
							data : {
								designationName : function() {
									return $(
											"#designationName")
											.val();
								}
							}
						}
					}
			},
			messages : {
						designationName : {
						remote : jQuery.validator
								.format(" designation already exists.")
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
							<td><h4>Add Designation</h4></td>
						</tr>
					</table>
					<form action="./DesignationController" name="add-designation-form"
						id="add-designation-form" method="post">
						<input type="hidden" name="action" value="add" />
						<table width="100%">
							<tr>
								<td class="bold" width="15%">Designation Name</td>
								<td><input name="designationName" id="designationName" placeholder="enter designation"/></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><input type="submit" value="Add Designation" /></td>
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