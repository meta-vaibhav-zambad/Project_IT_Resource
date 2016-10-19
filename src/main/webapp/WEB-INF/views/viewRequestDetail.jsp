<div class="container" style="margin-top: 100px;">
	<div class="row">
	
			<h2>Resource Request Detail</h2>
			<br>
			<form>
				<div class="form-group">
					<label for="">Resource Requested is {{requests.resource.resourceName}}</label> 
				<div class="form-group">
					<label for=""><span class="label label-primary">{{requests.priority}}Priority</span></label>
			
				</div>
				<div class="form-group">
					<label for="">Request is  {{requests.status}}</label>
					
				</div>
				<div class="form-group">
					<label for="">{{requests.message}}</label>
					
				</div>
				
			<div class = "panel panel-default" id="comment">
   <div class ="panel-heading">Comment</div>
   
   
   
   <ul class = "list-group">
      <li class = "list-group-item" ng-repeat="comment in comments">
     <div class="row" >
     <div class="col-lg-2">
     <div class="commenterImage">
               <img class="img img-circle" src={{comment.employee.profilePicture}} alt="image" width=80px height=80px />
       </div>
     
     </div>
     <div class=col-lg-10>
     <div class="row">
    <h3>{{comment.employee.firstName}} {{comment.employee.lastName}}</h3>
     </div>
     
     <div class="row">
 <h4><p>{{comment.comments}}</p></h4> 
     </div>
     <div class="row">
 {{comment.date}}
     </div>
    
     </div>
     </div>
      </li>
     
     
   </ul>

</div>
			</form>
			
				<form ng-controller="addCommentCtrl">
				<div class="form-group">
					<label for="">Write Comment</label>
					<textarea class="form-control" ng-model="commentBox.comments" >                     
                </textarea>
				</div>

				<input type="button" class=" btn btn-info text-center" ng-click="getCommentDetails(commentBox,requests)" value="Add Comments" />
				</form>
	
</div>
