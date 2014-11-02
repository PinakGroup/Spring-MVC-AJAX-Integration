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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/table.css">
</head>
<body>
<h2 style="text-align: justify;">Auto-loading of cities when state is selected from drop-down box using AJAX.</h2>

<form action="" method="post">
<div class="springajax" style="width:450px; height:150px;">
	<table>
		<tr>
			<td>Fields</td>
			<td>Details</td>
		</tr>
		<tr>
			<td>Select State</td>
			<td>
				<select>
					<option value="Select State">Select State</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>Select City</td>
			<td>
				<select>
					<option value="Select City">Select City</option>
				</select>
			</td>
		</tr>
	</table><br>
	<div align="center">
		<input type="reset">&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="submit">
	</div>
</div><br><br><br><br><br><br>
<div align="center">
	<a href="${pageContext.request.contextPath}/">Go Back to Main Menu</a>
</div>
</form>
</body>
</html>
