<div class="container" style="margin-top: 100px;">
	<h2>Resource request of {{requests[0].employee.firstName}}</h2>
	<table class="table table-bordered" ng-controller="getLocationCtrl">
		<thead>
			<tr>

				<th>Resource</th>
				<th>Requestor</th>
				<th>Request Priority</th>
				<th>Request Status</th>
				<th>Actions</th>

			</tr>
		</thead>
		<tbody>
		
			<tr ng-click="clickable(request.requestId)"  ng-repeat="request in requests">
		
				<td>{{request.resource.resourceName}}</td>
				<td>{{request.employee.firstName +" "+
					request.employee.lastName}}</td>
				<td>{{request.priority}}</td>
				<td><span class="label label-{{request.color}}">{{request.status}}</span></td>
				<td><a href="" data-toggle="tooltip" data-placement="top"
					title="Edit Request!" style="color: black"><i
						class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp&nbsp<a href="#/deleteRequest/{{request.requestId}}"
					data-toggle="tooltip" data-placement="bottom"
					title="Delete Request!" style="color: black"><i
						class="fa fa-trash" aria-hidden="true"></i></a></i>&nbsp&nbsp</td>
			</tr>
			
		
		</tbody>
	</table>
</div>