<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="resources/js/jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="resources/js/angular.js"></script>
</head>
<body ng-app="signUp">
	<h1>Hi You are signed in successfully</h1>
	<a href="/RipperFit/"> Home </a>
	<div ng-controller="logoutCtrl">
		<input type="button" value="logout" ng-click="logout()" />
	</div>

	<!-- Javascript -->
	<script src="resources/js/jquery-1.11.1.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery.backstretch.min.js"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="resources/js/applications.js"></script>
	<script src="resources/js/controllers.js"></script>
</body>


</html>