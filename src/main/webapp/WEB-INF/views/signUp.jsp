<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SignUp RipperFit</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/signUpStyle.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
</head>

<body ng-app="RipperFit">
	<div class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid ">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><b>RipperFit</b></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="login"><i class="fa fa-sign-in"
							aria-hidden="true"></i>LogIn</a></li>
					<li>&nbsp;&nbsp;&nbsp;</li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</div>
	<div class="container" style="margin-top: 70px;">
		<div class="col-xs-2"></div>
		<div class="col-xs-8">
			<h3 class="text-center">Sign up now</h3>
			<hr />
			<form name="userForm" ng-submit="getFormDetails(user)"
				ng-controller="signUpCtrl">
				<div class="row">
					<div class="col-xs-6 form-group"
						ng-class="{ 'has-error' : userForm.fname.$invalid && !userForm.fname.$pristine }">
						<label for="fname">First name</label> <input type="text"
							name="fname" placeholder="First name" class="form-control"
							ng-model="user.firstName" required /> <span
							ng-show="userForm.fname.$invalid && !userForm.fname.$pristine"
							class="help-block">You First name is required.</span>
					</div>
					<div class="col-xs-6 form-group">
						<label for="lname">Last name</label> <input type="text"
							name="lname" placeholder="Last name" class="form-control"
							ng-model="user.lastName" />
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 form-group">
						<label for="gender">Gender</label>
						<div class="radio">
							<label> <input type="radio" name="gender" value="Male"
								ng-model="user.gender" required> Male
							</label>
						</div>
						<div class="radio">
							<label> <input type="radio" name="gender" value="Female"
								ng-model="user.gender" required> Female
							</label>
						</div>
					</div>
					<div class="col-xs-6 form-group"
						ng-class="{'has-error': userForm.phoneNumber.$invalid && userForm.phoneNumber.$error.number}">
						<label for="phoneNumber">Phone</label><input type="number"
							class="form-control" ng-minlength="10" ng-maxlength="10"
							name="phoneNumber" placeholder="Contact Number"
							ng-model="user.phoneNumber" required> <span
							class="help-block"
							ng-show=" userForm.phoneNumber.$error.required && userForm.phoneNumber.$error.number">
							Valid phone number is required </span> <span class="help-block"
							ng-show="(userForm.phoneNumber.$invalid && (userForm.phoneNumber.$error.minlength || userForm.phoneNumber.$error.maxlength) && userForm.phoneNumber.$dirty) ">
							phone number should be 10 digits </span>
					</div>
				</div>
				<div class="row">
					<div class=" col-xs-12 form-group"
						ng-class="{ 'has-error' : userForm.email.$invalid && !userForm.email.$pristine }">
						<label>Email</label> <input type="email" name="email"
							class="form-control" ng-model="user.email">
						<p ng-show="userForm.email.$invalid && !userForm.email.$pristine"
							class="help-block">Enter a valid email.</p>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 form-group"
						ng-class="{'has-error': userForm.password.$invalid && !userForm.password.$pristine}">
						<label for="password">Password</label> <input type="password"
							id="password" name="password" placeholder="Password"
							ng-minlength="6" class="form-control" ng-model="user.password"
							ng-required> <span class="help-block"
							ng-show="userForm.password.$invalid && !userForm.password.$pristine">
							Password should be 6 digits minimum </span>
					</div>
					<div class="col-xs-6 form-group">
						<label for="confirm_password">Confirm Password</label> <input
							type="password" id="confirm_password" name="confirm_password"
							password-verify="user.password" ng-model="user.confirm_password"
							placeholder="Confirm Password" class="form-control" required>
						<span class="help-block"
							ng-show="userForm.confirm_password.$invalid && !userForm.password.$pristine && userForm.confirm_password.$error.passwordVerify">
							Password do not match </span>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 form-group">
						<label for="form-designation">Designation</label> <select
							class="form-control" id="form-designation"
							ng-init="getDesignations()" ng-model="user.designation"
							ng-options="designation as designation.designationName for designation in designationDetails "
							requireds>
							<option value="" disabled selected hidden>Designation</option>
						</select>
						<p class="help-block designation"></p>
					</div>
					<div class="col-xs-6 form-group">
						<label for="form-organization">Organization</label> <select
							class="form-control" id="form-organization"
							ng-init="getAllOrganizations()" ng-model="user.organization"
							ng-options="organization as organization.organizationName for organization in organizationDetails "
							required>
							<option value="" disabled selected hidden>Organization</option>
						</select>
						<p class="help-block organization"></p>
					</div>
				</div>
				<button type="submit" class="btn btn-primary"
					ng-disabled="userForm.$invalid" style="margin-bottom: 70px;">Submit</button>
			</form>
		</div>
	</div>
	</div>
	<footer class="footer text-center"
		style="position: absolute; bottom: 0 !important; width: 100%; background-color: #f8f8f8; border-top: 1.5px solid #e7e7e7; padding: 17px">
		<p style="margin: 0;">
			&copy;2016 RipperFit. All Rights Reserved| Designed by <b>VARAAS</b>
		</p>
	</footer>
	<!-- Javascript -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- <script src="resources/js/jquery.backstretch.min.js"></script> -->
	<script src="resources/js/controllers.js"></script>
</body>
</html>
