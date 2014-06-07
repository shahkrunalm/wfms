<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Cities - wfms</title>

<%@ include file="header.jsp" %>
</head>
<body>
<%
List<City> cityList = (List<City>) request.getAttribute("cityList");
%>
<%@ include file="menu.jsp" %>
<div id="wrapper">
<div id="page">
<div id="content">
<div class="box">
<table id="table-page-heading" border="0">
<tr>
<td><h4>View Cities</h4></td>
</tr>
</table>
					<table>
						<tr>
							<td><a href="./CityController?action=view&status=1" title="click here to view active list">active</a>
								| <a href="./CityController?action=view&status=0" title="click here to view de-active list">de-active</a>
								| <a href="./CityController?action=view&status=-1" title="click here to view all">view all</a></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>

<%
if(cityList.size()==0){
	%>
							<table border="0" width="100%">
						<tr>
							<td><div class="boldred">No city available.</div></td>
						</tr>
					</table>
	<%
}else{
	%>
	<table border="0" width="100%" id="table-5">
	<tr>
		<td class="bold" align="center">Sr. No.</td>
		<td class="bold">State Name</td>
		<td class="bold">City Name</td>
		<td class="bold" align="center">Status</td>
	</tr>
	<% 
	int i = 0;
	for(City city : cityList){
		%>
			<tr>
				<td align="center" width="12%"><%=++i%></td>
				<td><%=city.getState().getStateName()%></td>
				<td><%=city.getCityName()%></td>
				<td align="center" width="12%">
				<%if(city.getStatus()==1){%><span class="green">active</span><%}else{%><span class="red">de-active</span><%}%></td>
			</tr>
		<%
	}
}
%>
</table>
</div>
</div>
</div>
<br class="clearfix" />
</div>
<%@ include file="footer.jsp" %>
</body>
</html>