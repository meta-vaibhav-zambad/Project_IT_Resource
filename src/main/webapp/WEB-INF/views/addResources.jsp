<div class="container" style="margin-top: 100px;">
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<h2>Add Resource</h2>
			<br>
			<form>
				<div class="form-group">
					<label for="position">Resource</label> <input type="text"
						class="form-control" id="newPosition" ng-model="resource.resourceName"
						placeholder="Enter New Resource">
				</div>
				<div class="row">
					<div class="form-group col-md-12">
						<label for="form-department">Approval Level</label> <input type="number"
						class="form-control" id="approvalLevel" ng-model="resource.approvalLevel"
						placeholder="Enter Approval Level">
					</div>
				</div>
				<div id="button" class="text-center">
					<button type="submit" class="btn btn-default btn-primary" ng-click="getResourceDetails(resource)">Add Resource</button>
				</div>
			</form>
		</div>
	</div>
	<div class="col-sm-4"></div>
</div>