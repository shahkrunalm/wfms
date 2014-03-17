<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password - wfms</title>
<%@ include file="header.jsp" %>
</head>
<script type="text/javascript">
$().ready(function() {
	$("#change-password-form").validate({
		errorClass: "my-error-class",
		rules: {
			password: { 
                required: true, minlength: 5
          	}, 
          	newPassword: { 
                required: true, minlength: 5
          	},
          	confirmPassword: {
          		 required: true, minlength: 5, equalTo: "#newPassword"
          	}
		}
	});
});
</script>
<body>
<%@ include file="menu.jsp" %>
<div id="wrapper">
<div id="page">
<div id="content">
<div class="box">
<table id="table-page-heading" border="0">
<tr>
<td><h4>Change Password</h4></td>
</tr>
</table>
<%
String code = null;
code = (String) request.getAttribute("code");
if(code!=null){
	if(code.equals("1")){
		%><span class="boldgreen">password changed successfully.</span><% 
	}else if(code.equals("2")){
		%><span class="boldred">your current password and new password are same, please provide new password.</span><%
	}else{
		%><span class="boldred">your current password is invalid, try again</span><%
	}
}
%>
<form name="change-password-form" id="change-password-form" action="./UserController" method="post">
<input type="hidden" name="action" value="changePassword" />
<table width="100%">
<tr>	
	<td class="bold" width="15%">current password</td>
	<td><input name="password" id="password" type="password" placeholder="enter your current password" /></td>
</tr>
<tr>	
	<td class="bold">new password</td>
	<td><input name="newPassword" id="newPassword" type="password" placeholder="enter new password" /></td>
</tr>
<tr>	
	<td class="bold">confirm password</td>
	<td><input name="confirmPassword" id="confirmPassword" type="password" placeholder="enter password again" /></td>
</tr>
<tr>	
	<td>&nbsp;</td>
	<td><input type="submit" value="Change Password" /></td>
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