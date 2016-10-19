<div class="container" style="margin-top: 100px;">
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<h2>Add Request</h2>
			<br>
			<form>
				<div class="form-group">
					<label class="sr-only" for="">Resource</label> <select class="form-control"
						id="form-designation" ng-init="getResources()"
						ng-model="request.resource"
						ng-options="resource as resource.resourceName for resource in resourceDetails ">
						<option value="" disabled selected hidden>Select Resource</option>
					</select>
</br>
					<div class="form-group">
						<label for="">Resource priority</label>
						
						<div class="form-check">
							<label class="form-radio-label"><input type="radio"
								class="form-check-input" value="high"
								ng-model="request.priority"> High </label> <label><input
								type="radio" class="form-check-input" value="medium"
								ng-model="request.priority"> Medium</label> <label><input
								type="radio" class="form-check-input" value="low"
								ng-model="request.priority"> Low </label>
						</div>
					</div>
					<div class="form-group">
						<label for="">Detail Description</label>
						<textarea class="form-control" ng-model="request.des">                     
       </textarea>
					</div>
					<div class="text-center">
					<button type="submit" class="btn btn-default btn-primary" ng-click="getFormDetails(request)">Add Request</button>
				</div>
			
				</div>
			</form>
		</div>
	</div>
</div>