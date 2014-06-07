<%@page import="com.wfms.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inbox - wfms</title>

<%@ include file="header.jsp" %>
</head>
<body>
<%
List<Message> messageList = (List<Message>) request.getAttribute("messageList");
%>
<%@ include file="menu.jsp" %>
<div id="wrapper">
<div id="page">
<div id="content">
<div class="box">
<table id="table-page-heading" border="0">
<tr>
<td><h4>Inbox</h4></td>
</tr>
</table>
<table border="0" width="100%" id="table-5">
<%
if(messageList.size()==0){
	%>
		<tr><td>no message available.</td></tr>
	<%
}else{
	%>
	<tr>
		<td class="bold" align="center">Sr. No.</td>
		<td class="bold">From</td>
		<td class="bold">Subject</td>
		<td class="bold" align="center">Date</td>
		<td class="bold" align="center">Status</td>
		<td class="bold" align="center">Delete</td>
	</tr>
	<% 
	int i = 0;
	for(Message message : messageList){
		%>
			<tr>
				<td align="center" width="7%"><%=++i%></td>
				<td width="23%"><%=message.getMsgFrom()%></td>
				<td width="35%"><a href="./MessageController?action=view&messageId=<%=message.getMessageId()%>" title="click here to view message"><%=message.getSubject()%></a></td>
				<td align="center" width="25%"><%=Utility.getFormattedDate(message.getDateTime())%></td>
				<td align="center" width="5%">
					<%if(message.getReadStatus()==-1) {%>
						<img alt="message" src="images/email.png">
					<%}else if(message.getReadStatus()==1) {%>
						<img alt="message" src="images/email_open.png">
					<%} %>
				</td>
				<td align="center" width="5%"><a href="javascript:deleteMessage(<%=message.getMessageId()%>)" title="click here to delete this message"><img alt="delete" src="images/delete.png"></a></td>
			</tr>
		<%
	}
}
%>
</table>
<form action="./MessageController" id="InboxDeleteForm" name="InboxDeleteForm" method="post">
<input name="messageId" type="hidden" id="messageId" />
<input name="action" type="hidden" value="inbox_delete" />
</form>
</div>
</div>
</div>
<br class="clearfix" />
</div>
<script type="text/javascript">
function deleteMessage(id){
	var cnfm = false;
	cnfm = confirm("You are going to delete this message, are you sure ?");
	if(cnfm){
		document.getElementById("messageId").value = id;
		document.getElementById("InboxDeleteForm").submit();
	}
}
</script>
<%@ include file="footer.jsp" %>
</body>
</html>