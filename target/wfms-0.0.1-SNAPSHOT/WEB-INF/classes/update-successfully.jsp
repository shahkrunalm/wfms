<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update successfully - wfms</title>
<%@ include file="header.jsp"%>
</head>
<%@ include file="menu.jsp"%>
<%-- <%@ include file="check-permission.jsp" %> --%>
<%
	String entity = (String) request.getParameter("entity");
%>
<body>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>Update Successful</h4></td>
						</tr>
					</table>
					<table width="100%">
						<tr>
							<td><%=entity%> details updated successfully.</td>
						</tr>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>