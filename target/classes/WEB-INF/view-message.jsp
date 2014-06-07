<%@page import="com.etender.utility.Utility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view message - etender</title>
</head>
<%@ include file="header.jsp" %>
<body>
<%@ include file="menu.jsp" %>
<%
Message msg = (Message) request.getAttribute("msg");
%>
<div id="wrapper">
<div id="page">
<div id="content">
<div class="box">
<table id="table-page-heading" border="0">
<tr>
<td><h4>view message</h4></td>
</tr>
</table>
<table>
<tr><td>
<a href="inbox" title="click here to go to inbox">inbox</a> |
<%
if(user.getUserType()==1){
	%><a href="admin-dashboard" title="click here to go to dashboard">dashboard</a><% 
}else{
	%><a href="user-dashboard" title="click here to go to dashboard">dashboard</a><%
}
%>
</td></tr>
<tr><td>&nbsp;</td></tr>
</table>
<%
if(msg!=null){%>
<table width="100%">
<tr>	
	<td width="10%" class="bold">from</td>
	<td><%=msg.getMessageFrom()%> </td>
</tr>
<tr>	
	<td width="10%" class="bold">to</td>
	<td><%=msg.getMessageTo()%> </td>
</tr>
<tr>	
	<td class="bold">date</td>
	<td><%=Utility.getFormattedDate(msg.getMessageOn())%></td>
</tr>
<tr>	
	<td class="bold">subject</td>
	<td><%=msg.getSubject()%></td>
</tr>
<tr>	
	<td class="bold" valign="top">content</td>
	<td><%=msg.getContent()%></td>
</tr>
</table>
<%}else{ %>no message available <%} %>
</div>
</div>
</div>
<br class="clearfix" />
</div>
<%@ include file="footer.jsp" %>

</body>
</html>