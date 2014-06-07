<%@page import="com.wfms.util.Utility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Message - wfms</title>
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
<td><h4>View Message</h4></td>
</tr>
</table>
<table>
<tr><td>
<a href="./MessageController?action=inbox" title="click here to go to inbox">inbox</a> | 
<a href="./MessageController?action=sent" title="click here to go to sent">sent</a>
</td></tr>
<tr><td>&nbsp;</td></tr>
</table>
<%
if(msg!=null){%>
<table width="100%">
<tr>	
	<td width="10%" class="bold">From</td>
	<td><%=msg.getMsgFrom()%> </td>
</tr>
<tr>	
	<td width="10%" class="bold">To</td>
	<td><%=msg.getMsgTo()%> </td>
</tr>
<tr>	
	<td class="bold">Date</td>
	<td><%=Utility.getFormattedDate(msg.getDateTime())%></td>
</tr>
<tr>	
	<td class="bold">Subject</td>
	<td><%=msg.getSubject()%></td>
</tr>
<tr>	
	<td class="bold" valign="top">Content</td>
	<td><%=msg.getContent()%></td>
</tr>
</table>
<%}else{ %>No message available <%} %>
</div>
</div>
</div>
<br class="clearfix" />
</div>
<%@ include file="footer.jsp" %>

</body>
</html>