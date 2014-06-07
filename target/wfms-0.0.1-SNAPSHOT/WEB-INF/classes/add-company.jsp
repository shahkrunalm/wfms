<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Company - wfms</title>
<%@ include file="header.jsp"%>
</head>
<script type="text/javascript">
	$()
			.ready(
					function() {
						$("#add-company-form")
						
						
								.validate(
										{
											errorClass : "my-error-class",
											rules : {
												companyName : "required",
												countryId: "required",
												stateId: "required",
												cityId: "required",
												street: "required",
												zipcode: "required",
												workPhone: "required",
												emergencyContactName: "required",
												website: {
													required: true,
													url: true
												},
												personalEmail: {
													required: true,
													email: true
												}
												
											},
											messages : {
												countryId: " please select country",
												stateId: " please select state",
												cityId: " please select city"
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
%>
<%-- <%@ include file="check-permission.jsp" %> --%>
<body>
	<div id="wrapper">
		<div id="page">
			<div id="content">
				<div class="box">
					<table id="table-page-heading" border="0">
						<tr>
							<td><h4>Add Company</h4></td>
						</tr>
					</table>
					<form action="./CompanyController" name="add-company-form"
						id="add-company-form" method="post">
						<input type="hidden" name="action" value="add" />
						<table width="100%">
							<tr>
								<td class="bold" width="15%">Company Name</td>
								<td><input name="companyName" id="companyName" placeholder="enter company name"></td>
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
								<td class="bold">Phone No</td>
								<td><input name="workPhone" id="workPhone" placeholder="enter phone"></td>
							</tr>
							<tr>
								<td class="bold">Contact Name</td>
								<td><input name="emergencyContactName" id="emergencyContactName" placeholder="enter contact name"></td>
							</tr>
							<tr>
								<td class="bold">Website</td>
								<td><input name="website" id="website" placeholder="enter web site"></td>
							</tr>
							<tr>
								<td class="bold">Email</td>
								<td><input name="personalEmail" id="personalEmail" placeholder="enter email"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><input type="submit" value="Add Company" /></td>
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