/*signUp.controller('logoutCtrl',function($scope,$http,$window){
	
	$scope.logout = function() {
	$http({
		method: 'POST',
		url: "/RipperFit/employee/logout",
		headers: {
			'Content-Type': 'application/json'
		}
	}).then( function (){
		$window.location.href = '/RipperFit/login';
	}, function (){ 
		alert("Registration failed!!");
	});
	
	}
	
});*/

signUp.controller('signUpCtrl', function($scope, $http, $window, $filter){

	$scope.getDesignations=function()
	{
	$http({
		method: 'GET',
		url: "/RipperFit/role/getDesignations",
		headers: {
			'Content-Type': 'application/json'
		}
	}).then( function (response){
		$scope.designationDetails = response.data; 
	}, function (){ 
		alert("No designations found");
	});
	}
	$scope.logout = function() {
		$http({
			method: 'POST',
			url: "/RipperFit/employee/logout",
			headers: {
				'Content-Type': 'application/json'
			}
		}).then( function (){
			$window.location.href = '/RipperFit/login';
		}, function (){ 
			alert("Registration failed!!");
		});
		
		}
	$scope.getFormDetails=function(user) {

		$scope.email="";
		$scope.userDetails=angular.copy(user);
		$scope.userDetails = {
			"employeeId": "",
			"email": $scope.userDetails.email,
			"organization": null,
			"password": $scope.userDetails.password,
			"firstName": $scope.userDetails.firstName,
			"lastName": $scope.userDetails.lastName,
			"dateOfBirth": $scope.userDetails.dateOfBirth,
			"gender": $scope.userDetails.gender,
			"contactNumber": $scope.userDetails.contactNumber,
			"address": $scope.userDetails.address,
			"designation" : null,
			"profilePicture" :null
		};

		$http({
			method: 'POST',
			url: "/RipperFit/employee/addEmployee",
			data: $scope.userDetails,
			headers: {
				'Content-Type': 'application/json'
			}
		}).then( function (){
		
			$scope.email = $scope.userDetails.email;
			$http({
				method: 'POST',
				url: "/RipperFit/mail/registrationMail",
				data: $scope.email,
				headers: {
					'Content-Type': 'application/json'
				}
			}).then( function (){
				$window.location.href = '/RipperFit/mailController';
			}, function (){ 
				alert("Registration failed!!");
			});
		});
	}
	
	$scope.login = function(user){

		$scope.loginDetails=angular.copy(user);

		$http({
			method: 'POST',
			url: "/RipperFit/employee/login",
			data: $scope.loginDetails,
			headers: {
				'Content-Type': 'application/json'
			}
		}).then( function (response){
			$scope.employeeDetails = response.data;
			var str = $filter('uppercase')($scope.employeeDetails.designation.designationName);
			if(str == "ADMIN") {
				$window.location.href = '/RipperFit/admin';
			} else if(str == "HELPDESK") {
				$window.location.href = '/RipperFit/helpdesk';
			} else {
				$window.location.href = '/RipperFit/employee';
			}
		}, function (){ 
			alert("Wrong username and password!!");
		});
	}
});