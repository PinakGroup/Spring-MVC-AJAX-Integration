<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- Spring security taglibs--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!doctype html>
<html>
<head>
<title>Spring MVC + AJAX Integration</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/table.css">
</head>
<body>
	<header style="text-align: center; font-size: 21px">Validations
		in Spring MVC using AJAX</header>
	<br>

	<form id="validationForm">
		<div class="springajax" style="width: 450px; height: 500px;">
			<table>
				<tr>
					<td colspan="2">Registration Details</td>
				</tr>
				<tr>
					<td>Name</td>
					<td><input type="text" placeholder="FirstName LastName" onblur="checkNameForEmpty()"
						id="name" name="name"
						title="(Must contain only characters and spaces)">&nbsp;<font
						color="red">*</font><br>
						<div style="color: red" id="name_blank_result"></div>
					</td>
				</tr>
				<tr>
					<td>Nick Name</td>
					<td><input type="text" placeholder="" id="nickName"
						name="nickName"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" id="password" name="password" onblur="checkPasswordForEmpty()"
						title="(Must contain at least 1 Capital Letter, 1 digit, and 1 special symbol)">&nbsp;<font
						color="red">*</font><br>
						<div style="color: red" id="password_blank_result"></div>
						<div style="color: red" id="password_pattern_result"></div>
					</td>
				</tr>
				<tr>
					<td>Repeat Password</td>
					<td><input type="password" id="repeatPassword" onblur="checkRepeatPasswordForEmpty()"
						name="repeatPassword" title="(Must be exactly same as above)">&nbsp;<font
						color="red">*</font><br>
						<div style="color: red" id="repeat_password_blank_result"></div>
						<div style="color: red" id="repeat_password_match_result"></div>
					</td>
				</tr>
				<tr>
					<td>Email ID</td>
					<td><input type="email" id="emailId" name="emailId" onblur="checkEmailIdForEmpty()"
						placeholder="someone@somedomain.com">&nbsp;<font
						color="red">*</font><br>
						<div style="color: red" id="email_id_blank_result"></div>
						<div style="color: red" id="email_id_pattern_result"></div>
					</td>
				</tr>
				<tr>
					<td>Mobile Number</td>
					<td><input type="text" id="mobileNumber" name="mobileNumber" onblur="checkMobileNumberForEmpty()"
						title="(Must contain only 10 digits)" placeholder="0123456789">&nbsp;<font
						color="red">*</font><br>
						<div style="color: red" id="mobile_number_blank_result"></div>
					</td>
				</tr>
				<tr>
					<td>Gender</td>
					<td><input type="radio" name="gender" value="Male">Male&nbsp;&nbsp;&nbsp;
						<input type="radio" name="gender" value="Female">Female <input
						type="radio" name="gender" value="Other">Other
						&nbsp;&nbsp;<font color="red">*</font></td>
				</tr>
				<tr>
					<td>Select State</td>
					<td><select name="state" id="state"
						onblur="getCitiesForSelectedState(); checkStateForEmpty();">
							<option value="Select State">Select State</option>
							<c:forEach items="${stateList}" var="stateList">
								<option value="${stateList.stateName}">${stateList.stateName}</option>
							</c:forEach>
					</select>&nbsp;<font color="red">*</font><br>
					<div style="color: red" id="state_blank_result"></div>
					</td>
				</tr>
				<tr>
					<td>Select City</td>
					<td><select id="city" name="city" onblur="checkCityForEmpty()">
							<option value="Select City">Select City</option>
					</select>&nbsp;<font color="red">*</font><br>
					<div style="color: red" id="city_blank_result"></div>
					</td>
				</tr>
				<tr>
					<td>Postal Code</td>
					<td><input type="text" id="postalCode" name="postalCode" onblur="checkPostalCodeForEmpty()"
						placeholder="123456" title="(Must contain only 6 digits)">&nbsp;<font
						color="red">*</font><br>
						<div style="color: red" id="postal_code_blank_result"></div>
						<div style="color: red" id="postal_code_pattern_result"></div>	
					</td>
				</tr>
				<tr>
					<td>Select Country</td>
					<td><select id="country" name="country" onblur="checkCountryForEmpty()">
							<option value="Select Country">Select Country</option>
							<c:forEach items="${countryList}" var="countryList">
								<option value="${countryList.countryName}">${countryList.countryName}</option>
							</c:forEach>
					</select>&nbsp;<font color="red">*</font><br>
					<div style="color: red" id="country_blank_result"></div>
					</td>
				</tr>
			</table>
			<br> &nbsp;&nbsp;&nbsp;<font color="red" size="3px;">*
				Indicates Required Fields.</font>
			<div align="center">
				<input type="submit" value="Submit Details"> <input
					type="reset" value="Clear Form" id="reset" name="reset">
			</div>
			<div id="loading"></div>
		</div>
		<br> <br> <br>
	</form>
	<div align="justify">
		<div id="submitedDetails"></div>
	</div>
	<div align="center">
		<a href="${pageContext.request.contextPath}/">Go Back to Main Menu</a>
	</div>
	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/example1.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/example3.js"></script>
	<script type="text/javascript">
		$('#validationForm')
				.submit(
						function(e) {
							/* display loading image until reponse from server */
							$('#loading')
									.html(
											'<img src="./resources/img/ajax-loader.gif">');

							/* read form field values */
							var name = $('#name').val();
							var nickName = $('#nickName').val();
							var password = $('#password').val();
							var repeatPassword = $('#repeatPassword').val();
							var emailId = $('#emailId').val();
							var mobileNumber = $('#mobileNumber').val();
							var gender = $("form input[type='radio']:checked")
									.val();
							var state = $('#state').val();
							var city = $('#city').val();
							var postalCode = $('#postalCode').val();
							var country = $('#country').val();

							/* make AJAX call to post data to server */
							$
									.post(
											'./example3/submitDetailsToServer?name='
													+ name + '&nickName='
													+ nickName + '&password='
													+ password
													+ '&repeatPassword='
													+ repeatPassword
													+ '&emailId=' + emailId
													+ '&mobileNumber='
													+ mobileNumber + '&gender='
													+ gender + '&state='
													+ state + '&city=' + city
													+ '&postalCode='
													+ postalCode + '&country='
													+ country,
											function(response) {

												/* check whether reponse is null */
												if (response != null) {
													$('#submitedDetails')
															.html(
																	'<font color="green">'
																			+ response
																			+ '</font>');
												} else {
													$('#submitedDetails')
															.html(
																	'<font color="red">Form submission failed.</font>');
												}

												/* display AJAX response from server */
												$('#submitedDetails')
														.html(
																'<br><font color="green">'
																		+ response
																		+ '</font><br>');

												/* clear form fields after getting response from the server*/
												$('#name').val('');
												$('#nickName').val('');
												$('#password').val('');
												$('#repeatPassword').val('');
												$('#emailId').val('');
												$('input[type=radio]').prop(
														"checked", false);
												$('#state').val('Select State');
												$('#city').val('Select City');
												$('#postalCode').val('');
												$('#country').val(
														'Select Country');

												/* remove loading image */
												$('#loading').html('');
											});
							e.preventDefault(); // prevent actual form submit
						});

		/* reset values of form fields */
		$('#reset').click(function(e) {
			/* reset form fields */
			$('#name').val('');
			$('#nickName').val('');
			$('#password').val('');
			$('#repeatPassword').val('');
			$('#emailId').val('');
			$('input[type=radio]').prop("checked", false);
			$('#state').val('Select State');
			$('#city').val('Select City');
			$('#postalCode').val('');
			$('#country').val('Select Country');
			$('#submitedDetails').html('');
			
			/* reset validation errors */
		});
		
		function checkNameForEmpty() {
			var name = $('#name').val();

			$.post("./example3/validate/checkNameForEmpty", {
				name : name
			}, function(result) {
				if (result == 'EMPTY') {
					$('#name_blank_result').html('Enter your name');
				} else {
					$('#name_blank_result').html('');
				}
			});
		}
		
		function checkPasswordForEmpty() {
			var password = $('#password').val();

			$.post("./example3/validate/checkPasswordForEmpty", {
				password : password
			}, function(result) {
				if (result == 'EMPTY') {
					$('#password_blank_result').html('Enter password');
				} else {
					$('#password_blank_result').html('');
				}
			});
		}
		
		function checkRepeatPasswordForEmpty() {
			var repeatPassword = $('#repeatPassword').val();

			$.post("./example3/validate/checkRepeatPasswordForEmpty", {
				repeatPassword : repeatPassword
			}, function(result) {
				if (result == 'EMPTY') {
					$('#repeat_password_blank_result').html('Enter repeat password');
				} else {
					$('#repeat_password_blank_result').html('');
				}
			});
		}
		
		function checkEmailIdForEmpty() {
			var emailId = $('#emailId').val();

			$.post("./example3/validate/checkEmailIdForEmpty", {
				emailId : emailId
			}, function(result) {
				if (result == 'EMPTY') {
					$('#email_id_blank_result').html('Enter email id');
				} else {
					$('#email_id_blank_result').html('');
				}
			});
		}
		
		function checkMobileNumberForEmpty() {
			var mobileNumber = $('#mobileNumber').val();

			$.post("./example3/validate/checkMobileNumberForEmpty", {
				mobileNumber : mobileNumber
			}, function(result) {
				if (result == 'EMPTY') {
					$('#mobile_number_blank_result').html('Enter mobile number');
				} else {
					$('#mobile_number_blank_result').html('');
				}
			});
		}
		
		function checkStateForEmpty() {
			var state = $('#state').val();

			$.post("./example3/validate/checkStateForEmpty", {
				state : state
			}, function(result) {
				if (result == 'EMPTY') {
					$('#state_blank_result').html('Select state');
				} else {
					$('#state_blank_result').html('');
				}
			});
		}
		
		function checkCityForEmpty() {
			var city = $('#city').val();

			$.post("./example3/validate/checkCityForEmpty", {
				city : city
			}, function(result) {
				if (result == 'EMPTY') {
					$('#city_blank_result').html('Select city');
				} else {
					$('#city_blank_result').html('');
				}
			});
		}
		
		function checkPostalCodeForEmpty() {
			var postalCode = $('#postalCode').val();

			$.post("./example3/validate/checkPostalCodeForEmpty", {
				postalCode : postalCode
			}, function(result) {
				if (result == 'EMPTY') {
					$('#postal_code_blank_result').html('Enter postal code');
				} else {
					$('#postal_code_blank_result').html('');
				}
			});
		}
		
		function checkCountryForEmpty() {
			var country = $('#country').val();

			$.post("./example3/validate/checkCountryForEmpty", {
				country : country
			}, function(result) {
				if (result == 'EMPTY') {
					$('#country_blank_result').html('Select country');
				} else {
					$('#country_blank_result').html('');
				}
			});
		}
	</script>
</body>
</html>
