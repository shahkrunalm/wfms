<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.wfms.model.*, java.util.*"%>
<%
	User U = null;
	U = (User) session.getAttribute("userssn");
	if (U != null && U.getPassword().equals("wfms@123")) {
%>
<div id="wrapper">
	<div id="page">
		<div id="content">
			<div class="box">
				<div class="alert alert-warning">Warning !!! Please change
					your default password.</div>
			</div>
		</div>
	</div>
	<br class="clearfix" />
</div>
<%
	}
%>

