<div class="container" style="margin-top: 100px;">
	<h2>Departments</h2>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Department</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="dep in departments">
				<td>{{dep.departmentName}}</td>
				<td><a class="btn" href="#/editDepartment/{{dep.departmentId}}">
 <i class="fa fa-pencil"></i></a></td>
			</tr>
		</tbody>
	</table>
	 <div class=" btn btn-group btn-primary">
        <a class="anchorButton" style="color: white;" href="#/addDepartment">Add Department</a>
      </div>
</div>