<div class="container" style="margin-top: 100px;">
	<h2>
		<strong>Approve Request Pool</strong>
	</h2>
	<br>
	<table class="table table-bordered table-responsive" ng-controller="updateRequestCtrl" id="table">
		<thead>
			<tr>
				<th>#</th>
				<th>Requestor</th>
				<th>Resource</th>
				<th>Request Date</th>
				<th>Status</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="request in requestsToApprove">
				<td>{{$index+1}}</td>
				<td>{{request.employee.firstName +"
					"+request.employee.lastName}}</td>
				<td>{{request.resourceRequest.resource.resourceName}}</td>
				<td>{{request.resourceRequest.requestDate}}</td>
				<td><span class="label label-{{request.color}}">{{request.resourceRequest.status}}</span></td>
				<td><a class="btn" ng-click="forwardRequest(request)">
 <i class="fa fa-thumbs-o-up"></i></a>&nbsp<a class="btn" ng-click="rejectRequest(request)">
 <i class="fa fa-trash"></i></a></td>
				<!-- <td><input type=button ng-click="forwardRequest(request)" value="Approve"/> </td> -->
				<!-- <td><input type=button ng-click="rejectRequest(request)" value="Reject"/> </td> -->
			</tr>
		</tbody>
	</table>
	<br>
	<div id="msg">
	<hr>
	<h4>No Request For Approval  Found </h4>
	</div>
	<br>
</div>