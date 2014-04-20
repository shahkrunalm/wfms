<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Designation List - wfms</title>

<%@ include file="header.jsp"%>
<script type="text/javascript">
function edit(designationId){
	document.getElementById("designationId").value = designationId;
	document.getElementById("edit-designation-form").submit();
}
function deleteDesignation(designationId){
	var confirmation = confirm("Are you sure you want to delete this designation detail ?");
	if(confirmation){
		document.getElementById("deleteDesignationId").value = designationId;
		document.getElementById("delete-designation-form").submit();
	}
}
function changeStatus(designationId, status){
	var cnfm = false;
	if(status==1){
		cnfm = confirm("You are going to de-active this designation id "+designationId+", are you sure ?");
	}else {
		cnfm = confirm("You are going to active this designation id "+designationId+", are you sure ?");
	}
	if(cnfm){
		$.ajax({url:"./DesignationController?action=changeStatus?designationId="+designationId+"&status="+status, success:function(result){
			alert(result);
			$("#status").html(result);
		}});
	}
}
</script>
</head>
<body>
	<%
		List<Designation> designationList = (List<Designation>) request
				.getAttribute("designationList");
	%>
	<%@ include file="menu.jsp"%>
	<%--<%@ include file="check-permission.jsp" %> --%>
	<form name="edit-designation-form" id="edit-designation-form" action="./DesignationController" method="post">
		<input type="hidden" name="action" value="edit">
		<input type="hidden" name="designationId" id="designationId">
	</form>
	<form name="delete-designation-form" id="delete-designation-form" action="./DesignationController" method="post">
		<input type="hidden" name="action" value="delete">
		<input type="hidden" name="designationId" id="deleteDesignationId">
		<input type="hidden" name="status" value="<%=request.getParameter("status")%>">
	</form>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>View Designation List</h4></td>
						</tr>
					</table>
					<table>
						<tr>
							<td><a href="./DesignationController?action=view&status=1">active</a>
								| <a href="./DesignationController?action=view&status=0">de-active</a>
								| <a href="./DesignationController?action=view&status=-1">view all</a></td>
						</tr>
					</table>
					<%
						if (designationList.size() == 0) {
					%>
					<table border="0" width="100%">
						<tr>
							<td><div class="boldred">No record available.</div></td>
						</tr>
					</table>
					<%
						} else {
					%>
					<table border="0" width="100%" id="table-5">
						<tr>
							<th>Sr. No.</th>
							<th>Designation Name</th>
							<th>No. of Employees</th>
							<th>Edit</th>
							<th>Delete</th>
							<th>Status</th>
						</tr>
						<%
							int i = 0;
								for (Designation designation : designationList) {
						%>
						<tr>
							<td align="center"><%=++i%></td>
							<td align="center"><%=designation.getDesignationName()%></td>
							<td align="center"><%=designation.getUsers().size()%></td>
							<td align="center"><a href="javascript:edit(<%=designation.getDesignationId()%>)" title="click here to edit designation detail">edit</a></td>
							<td align="center"><a href="javascript:deleteDesignation(<%=designation.getDesignationId()%>)" title="click here to delete designation detail">delete</a></td>
							<td align="center">
								<%
									if (designation.getStatus() == 1) {
								%><a href="javascript:changeStatus(<%=designation.getDesignationId()%>,<%=designation.getStatus()%>)" title="click here to update status"><div class="green">active</div></a>
								<%
									} else {
								%><div class="red">de-active</div>
								<%
									}
								%>
							</td>
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
	<%@ include file="footer.jsp"%>
</body>
</html>