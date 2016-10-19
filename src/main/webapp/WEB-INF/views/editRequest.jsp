<div class="container" style="margin-top: 100px;">
	<h2>Edit Request</h2>
	<form class="form-horizontal" role="form">
			
			<div class="form-group">
					<label class="col-lg-3 control-label">Resource:</label>
					<div class="col-lg-8">
						<input class="form-control" type="text" ng-model="request.resource.resourceName" readonly>
					</div>
				</div>
			
				<div class="form-group">
					<label class="col-lg-3 control-label">Current Approval Level:</label>
					<div class="col-lg-8">
						<input class="form-control" type="text"
							ng-model="request.currentApprovalLevel" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Priority:</label>
					<div class="col-lg-8">
						<input class="form-control" type="text"
							ng-model="request.priority">
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Status:</label>
					<div class="col-lg-8">
						<input class="form-control" type="text"
							ng-model="request.status" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Description:</label>
					<div class="col-lg-8">
						<input class="form-control" type="text"
							ng-model="request.message">
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-3 control-label">Request Date :</label>
					<div class="col-lg-8">
						<input class="form-control" type="text"
							ng-model="request.requestDate" readonly>
					</div>
				</div>
				<!-- <div class="form-group">
					<label class="col-md-3 control-label">Designation:</label>
					<div class="col-md-8">
						<input class="form-control" type="text"
							ng-model="employeeDetails.designation.designationName" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">Organization:</label>
					<div class="col-md-8">
						<input class="form-control" type="text"
							ng-model="employeeDetails.organization.organizationName" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">Password:</label>
					<div class="col-md-8">
						<input class="form-control" type="password"
							ng-model="employeeDetails.password" readonly>
					</div>
				</div> -->

				<div class="form-group">
					<label class="col-md-3 control-label"></label>
					<div class="col-md-8">
						<input type="button" class="btn btn-primary" value="Save Changes"
							ng-click="UpdateData(request)"> <span></span> <input
							type="reset" class="btn btn-default" value="Cancel">
					</div>
				</div>
			</form>
</div>