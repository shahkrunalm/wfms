<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>add city</title>
<%@ include file="header.jsp" %>
</head>
<script type="text/javascript">
$().ready(function() {
	$("#add-city-form").validate({
		errorClass: "my-error-class",
		rules: {
			cityName: "required",
			stateId: "required"
		},
		messages:
    	{
			stateId: " please select state"
    	}
	});
});
</script>
<body>
<%@ include file="menu.jsp" %>
<%-- <%@ include file="check-permission.jsp" %> --%>
<% 
List<State> stateList = (List<State>) application.getAttribute("stateList");
%>
<div id="wrapper">
<div id="page">
<div id="content">
<div class="box">
<table id="table-page-heading" border="0">
<tr>
<td><h4>add city</h4></td>
</tr>
</table>
<form name="add-city-form" id="add-city-form" action="add-city-action" method="post">
<table width="100%">
<tr>
	<td class="bold" width="10%">select state</td>
	<td>
	<select name="stateId" id="stateId" >
		<option value="">select</option>
		<%
			for(State state : stateList){
				%><option value="<%=state.getStateId()%>"><%=state.getStateName()%></option><% 
			}
		%>
	</select>
	</td>
</tr>
<tr>	
	<td class="bold">city name</td>
	<td><input name="cityName" id="cityName" /></td>
</tr>
<tr>	
	<td>&nbsp;</td>
	<td><input type="submit" value="add city"/></td>
</tr>
</table>
</form>
</div>
</div>
</div>
<br class="clearfix" />
</div>
<%@ include file="footer.jsp" %>
</body>
</html>