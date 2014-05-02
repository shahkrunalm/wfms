<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compose Message - wfms</title>
<%@ include file="header.jsp" %>
</head>
<script type="text/javascript">
$().ready(function() {
	$("#send-message-form").validate({
		errorClass: "my-error-class",
		rules: {
			msgTo: "required",
			subject: "required",
			content: "required",
		}
	});
});
</script>
<body>
<%@ include file="menu.jsp" %>
<%
String msgTo = null;
msgTo = (String) request.getAttribute("msgTo");
if(msgTo==null){
	msgTo = "";
}
%>
<div id="wrapper">
<div id="page">
<div id="content">
<div class="box">
<table id="table-page-heading" border="0">
<tr>
<td><h4>Compose Message</h4></td>
</tr>
</table>
<form name="send-message-form" id="send-message-form" action="./MessageController" method="post">
<table border="0" width="100%">
<tr><td width="10%" class="bold">To <span class="boldred">*</span></td><td><input value="<%=msgTo%>" name="msgTo" id="msgTo" /></td></tr>
<tr><td class="bold">Subject <span class="boldred">*</span></td><td><input name="subject" id="subject" /></td></tr>
<tr><td class="bold">Content <span class="boldred">*</span></td><td><textarea rows="5" cols="25" name="content" id="cntnt"></textarea></td></tr>
<tr><td></td><td><input type="hidden" name="action" value="compose"><input type="submit" value="Send Message" />&nbsp;&nbsp;<input type="reset" value="Reset"/></td></tr>
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