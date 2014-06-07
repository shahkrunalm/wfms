<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add User - wfms</title>
<%@ include file="header.jsp"%>
</head>
<script type="text/javascript">
	$()
			.ready(
					function() {
						$("#add-user-form")
						
						
								.validate(
										{
											errorClass : "my-error-class",
											rules : {
												firstName : "required",
												lastName : "required",
												designationId : "required",
												street : "required",
												zipcode : "required",
												mobile : "required",
												homePhone : "required",
												emergencyContactNo : "required",
												emergencyContactName : "required",
												cityId : "required",
												countryId: "required",
												stateId: "required",
												personalEmail: "required",
												birthDate: "required",
												username : {
													required : true,
													minlength : 5,
													remote : {
														url : "./UserController?action=exists",
														type : "get",
														data : {
															username : function() {
																return $(
																		"#username")
																		.val();
															}
														}
													}
												}
											},
											messages : {
												countryId: " please select country",
												stateId: " please select state",
												cityId: " please select city",
												username : {
													remote : jQuery.validator
															.format(" someone already has that username, please try another")
												}
											}
										});

						$(function() {
							$("#birthDate").datepicker({
								changeMonth : true,
								changeYear : true,
								dateFormat : "dd-mm-yy",
								minDate : "-780m +0w",
								maxDate : "-144m +0w"
							});
						});

						$("#countryId")
								.change(
										function() {
											countryId = $("#countryId").val();
											if (!isNaN(countryId)
													&& countryId != "") {
												$
														.ajax({
															url : "./StateController?action=getStateList&countryId="
																	+ countryId,
															success : function(
																	result) {
																var x = document
																		.getElementById("stateName");
																x.length = 0;
																var str = result
																		.split(":");
																var len = str.length - 1;
																for (var i = 0; i < len; i++) {
																	var option = document
																			.createElement("option");
																	option.text = str[i];
																	option.value = str[i];
																	try {
																		x
																				.add(
																						option,
																						x.options[null]);
																	} catch (e) {
																		x
																				.add(
																						option,
																						null);
																	}
																}
															}
														});
											}
										});

						$("#countryId")
								.change(
										function() {
											countryId = $("#countryId").val();
											if (!isNaN(countryId)
													&& countryId != "") {
												$
														.ajax({
															url : "./StateController?action=getStateList&countryId="
																	+ countryId,
															success : function(
																	result) {
																var x = document
																		.getElementById("stateId");
																x.length = 0;
																var str = result
																		.split(":");
																var len = str.length - 1;
																for (var i = 0; i < len; i++) {
																	var option = document
																			.createElement("option");
																	option.value = str[i];
																	i++;
																	option.text = str[i];

																	try {
																		x
																				.add(
																						option,
																						x.options[null]);
																	} catch (e) {
																		x
																				.add(
																						option,
																						null);
																	}
																}
															}
														});
											}
										});

						$("#stateId")
								.change(
										function() {
											stateId = $("#stateId").val();
											if (!isNaN(stateId)
													&& stateId != "") {
												$
														.ajax({
															url : "./CityController?action=getCityList&stateId="
																	+ stateId,
															success : function(
																	result) {
																var x = document
																		.getElementById("cityId");
																x.length = 0;
																var str = result
																		.split(":");
																var len = str.length - 1;
																for (var i = 0; i < len; i++) {
																	var option = document
																			.createElement("option");
																	option.value = str[i];
																	i++;
																	option.text = str[i];

																	try {
																		x
																				.add(
																						option,
																						x.options[null]);
																	} catch (e) {
																		x
																				.add(
																						option,
																						null);
																	}
																}
															}
														});
											}
										});
					});
</script>
<%@ include file="menu.jsp"%>
<%
	List<Country> countryList = (List<Country>) application
			.getAttribute("activeCountryList");
	List<Designation> designationList = (List<Designation>) application
.getAttribute("activeDesignationList");
%>
<%-- <%@ include file="check-permission.jsp" %> --%>
<body>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>Add User</h4></td>
						</tr>
					</table>
					<form action="./UserController" name="add-user-forms"
						id="add-user-form" method="post">
						<input type="hidden" name="action" value="add" />
						<table width="100%">
							<tr>
								<td class="bold" width="20%">User Name</td>
								<td><input id="username" name="username"
									placeholder="enter user name"></td>
							</tr>
							<tr>
								<td class="bold">First Name</td>
								<td><input id="firstName" name="firstName"
									placeholder="enter first name"></td>
							</tr>
							<tr>
								<td class="bold">Last Name</td>
								<td><input id="lastName" name="lastName"
									placeholder="enter last name"></td>
							</tr>
							<tr>
								<td class="bold">Gender</td>
								<td>
									<input type="radio" name="gender" value="male" checked/> male 
									<input type="radio" name="gender" value="female"/> female
								</td>
							</tr>
							<tr>
								<td class="bold">User Type</td>
								<td><select name="designationId" id="designationId">
										<%
											for (Designation designation : designationList) {
										%><option value="<%=designation.getDesignationId()%>"><%=designation.getDesignationName()%></option>
										<%
											}
										%>
								</select></td>
							</tr>
							<tr>
								<td class="bold">Birth date</td>
								<td><input id="birthDate" name="birthDate"
									placeholder="enter birth date"></td>
							</tr>
							<tr>
								<td class="bold" width="15%">Address</td>
								<td><input name="street" id="street" placeholder="enter address"></td>
							</tr>
							<tr>
								<td class="bold" width="10%">Select Country</td>
								<td><select name="countryId" id="countryId">
										<option value="">select</option>
										<%
											for (Country country : countryList) {
										%><option value="<%=country.getCountryId()%>"><%=country.getCountryName()%></option>
										<%
											}
										%>
								</select></td>
							</tr>
							<tr>
								<td class="bold">State Name</td>
								<td><select name="stateId" id="stateId">
										<option value="">select</option>
								</select></td>
							</tr>
							<tr>
								<td class="bold">City Name</td>
								<td><select name="cityId" id="cityId">
										<option value="">select</option>
								</select></td>
							</tr>
							<tr>
								<td class="bold">Zipcode</td>
								<td><input name="zipcode" id="zipcode" placeholder="enter zipcode"></td>
							</tr>
							<tr>
								<td class="bold">Mobile No</td>
								<td><input name="mobile" id="mobile" placeholder="enter mobile no"></td>
							</tr>
							<tr>
								<td class="bold">Home Phone No</td>
								<td><input name="homePhone" id="homePhone" placeholder="enter home phone no"></td>
							</tr>
							<tr>
								<td class="bold">Emergency Contact No</td>
								<td><input name="emergencyContactNo" id="emergencyContactNo" placeholder="enter emergency contact no"></td>
							</tr>
							<tr>
								<td class="bold">Emergency Contact Name</td>
								<td><input name="emergencyContactName" id="emergencyContactName" placeholder="enter contact name"></td>
							</tr>
							<tr>
								<td class="bold">Email</td>
								<td><input name="personalEmail" id="personalEmail" placeholder="enter email"></td>
							</tr>
							
							<tr>
								<td></td>
								<td><input type="submit" value="Add User"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<br class="clearfix" />
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>