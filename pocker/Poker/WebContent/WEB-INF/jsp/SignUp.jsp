<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">
<meta property="og:type" content="website">
<meta property="og:title" content="">
<meta property="og:description" content="">
<meta property="og:url" content="">
<meta property="og:image" content="">
<meta property="og:site_name" content="">
<meta name="Description" content="Login in | Retail App" >
<title>Pocker | Register Game</title>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">


<style>
body{
    background-color: #525252;
}
.centered-form{
	margin-top: 60px;
}

.centered-form .panel{
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}
</style>
</head>
<body>
<div class="container">
        <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
        	<div class="panel panel-default">
        		<div class="panel-heading">
			    		<h3 class="panel-title">New Game Addition </h3>
			 			</div>
			 			<div class="panel-body">
			    		<form role="form" action="/Poker/Online-Games/" method="post">


			    		
			    			
			    			<div class="form-group">
			    				<input type="text" name="gname" id="gname" class="form-control input-sm" placeholder="Name of the Game">
			    			</div>
			    				<div class="form-group">
			    				<input type="text" name="gcards" id="gcards" class="form-control input-sm" placeholder="Number of Cards ( between 4 to 9)">
			    			</div>
			    						    			<div class="row">
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			                <input type="number" name="gmin" id="gmin" class="form-control input-sm" placeholder="Min Players">
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="number" name="gmax" id="gmax" class="form-control input-sm" placeholder="Max Players">
			    					</div>
			    				</div>
			    			</div>
			    			
<!-- 			    			<div class="form-group"> -->
<!-- 			    				<input type="number" name="gname" id="gname" class="form-control input-sm" placeholder="Min number of Players"> -->
<!-- 			    			</div> -->
			    			
<!-- 			    			<div class="form-group"> -->
<!-- 			    				<input type="number" name="gname" id="gname" class="form-control input-sm" placeholder="Max number of Players"> -->
<!-- 			    			</div> -->
			    			
			    						    			<div class="row">
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			                <input type="submit"  id="rregister" value="Register" class="btn btn-info btn-block">
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="submit" name="rgames" id="rgames" value="Registered Games" class="btn btn-info btn-block"> 
			    					</div>
			    				</div>
			    			</div>
			    			<div class="row form-group" style="display:none;" id="msgInfo">
			    			<label id="lblmsg" align="center" class="form-control" style="color:red;">Game Added Successfully</label>
			    			</div>
			    			</div>


			    		</form>
			    	</div>
	    		</div>
    		</div>
    	</div>
    </div>
    
    <script>
    $("#rregister").click(function(){
    	 $("#msgInfo").hide();
    	this.blur();
    	if($("#gname").val().length <= 0){
    		alert("Please provide Game Name");
    		return false;
    	}
    	if($("#gcards").val().length <= 0){
    		alert("Please provide number of Cards");
    		return false;
    	}
    	
    	if($("#gcards").val().length > 0 && ($("#gcards").val() < 4 || $("#gcards").val() > 9)){
    		alert("Please provide card numbers between 4 and 9");
    		return false;
    	}
    	
    	event.preventDefault();
    	
    	$.post("/Poker/RegisterGame/",
    	 {
    			gname: $("#gname").val(),
    			gmin:  $("#gmin").val(),
    			gmax:  $("#gmax").val(),
    			gcards: $("#gcards").val()
    	 },
    	
    	 function(data,status){
    		 if ( data == "success"){
    			 $("#msgInfo").show();
    		 }
    	 }
       );
    });
 
    
    
    </script>
</body>
</html>