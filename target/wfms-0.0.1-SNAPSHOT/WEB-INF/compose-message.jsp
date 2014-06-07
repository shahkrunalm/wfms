<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>compose message - etender</title>
<%@ include file="header.jsp" %>
</head>
<script type="text/javascript">
$().ready(function() {
	$("#send-message-form").validate({
		errorClass: "my-error-class",
		rules: {
			messageTo: {
				required: true, email: true
			},
			subject: "required",
			cntnt: "required",
		}
	});
});
</script>
<body>
<%@ include file="menu.jsp" %>
<%
String messageTo = null;
messageTo = (String) request.getAttribute("messageTo");
if(messageTo==null){
	messageTo = "";
}
%>
<div id="wrapper">
<div id="page">
<div id="content">
<div class="box">
<table id="table-page-heading" border="0">
<tr>
<td><h4>send message</h4></td>
</tr>
</table>
<form name="send-message-form" id="send-message-form" action="send-message-action" method="post">
<table border="0" width="100%">
<tr><td width="10%" class="bold">to <span class="boldred">*</span></td><td><input value="<%=messageTo%>" name="messageTo" id="messageTo" /></td></tr>
<tr><td class="bold">subject <span class="boldred">*</span></td><td><input name="subject" id="subject" /></td></tr>
<tr><td class="bold">content <span class="boldred">*</span></td><td><textarea rows="5" cols="25" name="cntnt" id="cntnt"></textarea></td></tr>
<tr><td></td><td><input type="submit" value="send message" />&nbsp;&nbsp;<input type="reset" value="reset"/></td></tr>
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