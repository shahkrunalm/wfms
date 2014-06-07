<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.bloodbank.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/two_column_style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/ui-lightness/jquery-ui-1.8.20.custom.css" />
<script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.8.20.custom.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.min.js" type="text/javascript"></script>
<title>Welcome to wfms</title>
</head>
<script type="text/javascript">
$().ready(function() {
	$("#login-form").validate({
		errorClass: "my-error-class",
		rules: {
			username: "required",
			password: "required"
		}
	});
});
</script>
<body>
<%
User user = null;
user = (User) session.getAttribute("user");
%>
<div id="wrapper">
<div id="page">
<div id="content">
	<div class="box">
		<a href="index.jsp">home</a> |
		<a href="about us">about us</a> |
		<a href="">contact us</a> | 
<%
if(user!=null){
	if(user.getUserType()==1){
		%><a href="admin-dashboard.jsp" title="click here to go to dashboard">dashboard</a> | <% 
	}else{
		%><a href="user-dashboard.jsp" title="click here to go to dashboard">dashboard</a> | <%
	}
	%><a href="logout-action">logout</a> <%
}else{
	%><a href="donor-registration.jsp">donor registration</a><% 
}
%>
<br><br>
		<img src="images/user_dashboard.jpg" height="31%" width="100%" />
</div>

</div> <!-- div content end -->
<%
if(user==null){
%>
<div id="sidebar">
	<div class="box">
	<form name="login-form" id="login-form" action="login-action" method="post">
		<table border="0" width="100%" id="table-5">
			<tr>
				<td align="left" class="bold">login</td>
			</tr>
		</table>
		<table border="0" width="100%">
			<tr>
				<td class="bold">&nbsp;username</td>
			</tr>
			<tr>
				<td>&nbsp;<input name="username" id="username" /></td>
			</tr>
			<tr>
				<td class="bold">&nbsp;password</td>
			</tr>
			<tr>
				<td>&nbsp;<input type="password" name="password" id="password" /></td>
			</tr>
			<tr>
				<td>&nbsp;<input type="submit" value="login"/></td>
			</tr>
		</table>
		</form>
	</div>
</div> <!-- div sidebar end -->
<%}else{ %>
<div id="sidebar">
	<div class="box">
	<img src="images/give_blood.jpg" height="35%" width="100%"/>
	</div>
</div> <!-- div sidebar end -->
<%} %>
<br class="clearfix" />
</div> <!-- div page end -->
</div> <!-- div wrapper end -->
<%@ include file="footer.jsp" %>
</body>
</html>