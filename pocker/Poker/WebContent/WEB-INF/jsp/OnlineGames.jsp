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
<title>Pocker Game</title>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script> 
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">


<style>
body{
    background-color: #525252;
}
 .centered-form{ 
 	margin-top: 40px; 
}

.centered-form .panel{
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}


.funkyradio div {
  clear: both;
  overflow: hidden;
}

.funkyradio label {
  width: 100%;
  border-radius: 3px;
  border: 1px solid #D1D3D4;
  font-weight: normal;
}

.funkyradio input[type="radio"]:empty,
.funkyradio input[type="checkbox"]:empty {
  display: none;
}

.funkyradio input[type="radio"]:empty ~ label,
.funkyradio input[type="checkbox"]:empty ~ label {
  position: relative;
  line-height: 2.5em;
  text-indent: 3.25em;
  margin-top: 2em;
  cursor: pointer;
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}

.funkyradio input[type="radio"]:empty ~ label:before,
.funkyradio input[type="checkbox"]:empty ~ label:before {
  position: absolute;
  display: block;
  top: 0;
  bottom: 0;
  left: 0;
  content: '';
  width: 2.5em;
  background: #D1D3D4;
  border-radius: 3px 0 0 3px;
}

.funkyradio input[type="radio"]:hover:not(:checked) ~ label,
.funkyradio input[type="checkbox"]:hover:not(:checked) ~ label {
  color: #888;
}

.funkyradio input[type="radio"]:hover:not(:checked) ~ label:before,
.funkyradio input[type="checkbox"]:hover:not(:checked) ~ label:before {
  content: '\2714';
  text-indent: .9em;
  color: #C2C2C2;
}

.funkyradio input[type="radio"]:checked ~ label,
.funkyradio input[type="checkbox"]:checked ~ label {
  color: #777;
}

.funkyradio input[type="radio"]:checked ~ label:before,
.funkyradio input[type="checkbox"]:checked ~ label:before {
  content: '\2714';
  text-indent: .9em;
  color: #333;
  background-color: #ccc;
}

.funkyradio input[type="radio"]:focus ~ label:before,
.funkyradio input[type="checkbox"]:focus ~ label:before {
  box-shadow: 0 0 0 3px #999;
}

.funkyradio-default input[type="radio"]:checked ~ label:before,
.funkyradio-default input[type="checkbox"]:checked ~ label:before {
  color: #333;
  background-color: #ccc;
}



.funkyradio-success input[type="radio"]:checked ~ label:before,
.funkyradio-success input[type="checkbox"]:checked ~ label:before {
  color: #fff;
  background-color: #5cb85c;
}

.funkyradio-primary input[type="radio"]:checked ~ label:before,
.funkyradio-primary input[type="checkbox"]:checked ~ label:before {
  color: #fff;
  background-color: #5cb85c;
}




</style>
</head>
<body>
<div class="container">
        <div class="row">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4 centered-form">
<!--           <div class="col-md-4 " > -->
        	<div class="panel panel-default">
        		<div class="panel-heading">
			    		<h3 class="panel-title" align="center">Registered Games </h3>
			 			</div>
			 			<div class="panel-body">
			 			
			    		<form role="form" action="/Poker/Online-Games/" method="post">
			    		

			    			 <div class="funkyradio" >
			    			 <c:set var="count" value="0" scope="page" />
			    			 <c:forEach items="${glist}" var="glist">
			    			 <div class="funkyradio-success">
			    			 <c:if test="${count == 0}">
			    			 <input type="radio" name="game" id="radio${count}"  checked/>
			    			 </c:if>
			    			 <c:if test="${count != 0}">
			    			 <input type="radio" name="game" id="radio${count}" />
			    			 </c:if>
			    			 <label for="radio${count}" id="lblradio${count}" name="lblradio${count}">${glist.gname}</label>
			    			 <c:set var="count" value="${count + 1}" scope="page"/>
            
            
        </div>
			    			 </c:forEach>
     
    </div>
			    			
   		</form>
			    	</div>
	    		</div>
    		</div>
    		</div>
    		
    		<div class="row" id="pInfo"><div class="col-md-1"></div>
    		<div class="col-md-5 centered-form">
        	<div class="panel panel-default">
        		<div class="panel-heading">
			    		<h3 class="panel-title" align="center">Number of Players</h3>
			 			</div>
			 			<div class="panel-body">
			    			 <div class="funkyradio" >
			    			 <c:set var="count1" value="0" scope="page" />
			    			 <c:forEach varStatus="loopStatus" begin="${minUsers}" end="${maxUsers}" step="1" >
			    			     <div class="funkyradio-primary">
			    			        <c:if test="${count1 == 0}">
            						<input type="radio" name="Players" id="radiop${loopStatus.index}"  checked/>
            						</c:if>
            						<c:if test="${count1 != 0}">
            						<input type="radio" name="Players" id="radiop${loopStatus.index}" />
            						 </c:if>
            						 <c:set var="count1" value="${count1 + 1}" scope="page"/>
            						<label for="radiop${loopStatus.index}" name="lblradiop${loopStatus.index}" id="lblradiop${loopStatus.index}">${loopStatus.index} Players</label>
        						   
        						 </div>
    							
							</c:forEach>
			    			 
        
    </div>

			    	</div>
	    		</div>
    		</div>
    		
    		<div class="col-md-5">
    		<div class="centered-form">
        	<div class="panel panel-default">
        	
        		<div class="panel-heading">
			    		<h3 class="panel-title" align="center">Player Names</h3>
			 			</div>
			 			<form action="" method="post" name="dealGame" id="dealGame">
			 			<input type="text" name="pcount" style="display:none" id="pcount">
			 			<div class="panel-body" id="pnames">
 							<c:set var="count2" value="0" scope="page" />
 							<c:forEach varStatus="loopStatus" begin="1" end="${maxUsers}" step="1" >
 							<c:set var="count2" value="${count2 + 1}" scope="page"/>
			    			     <div class="form-group" id="divp1">
			    			        <c:if test="${count2 <= minUsers}">
            						<input type="text" name="player${count2}" id="player${count2}" class="form-control input-sm" placeholder="Name of Player ${count2}">
            						</c:if>
            						<c:if test="${count2 > minUsers}">
            						<input style="display:none;" type="text" name="player${count2}" id="player${count2}" class="form-control input-sm" placeholder="Name of Player ${count2}">
            						</c:if>
            						 
            						</div> 
            						
    							
							</c:forEach>
			    	</div></form>
	    		</div>
    		</div>
    		<div align="center">
    		<button type="button" name="dgame" id="dgame" class="btn btn-primary btn-lg">DEAL GAME</button>
    		</div>
    		</div>
    	</div>
    </div>
    
    <script>
    var pcount="${minUsers}";
    var gname="${gname}";
    $("input[name=game]").click(function(){
    	var id = $("input[name='game']:checked").attr('id');
    	gname=$("#lbl"+id).text();
    	$.post("/Poker/GameDetails/",
    	    	 {
    	    			gname: gname
    	    		
    	    	 },
    	    	
    	    	 function(data,status){
    	    		 $("#pInfo").empty();
    	    		 $("#pInfo").append(data);
    	    	 }
    	       );
    	
    });
    $("input[name=Players]").click(function(){
    	var playerCount= $("input[name='Players']:checked").attr('id').split("radiop");
    	pcount=playerCount[1];
    	$("input[type='text']").hide();
    	for (var i = 0; i <= pcount; i++) { 
    		$("#player" + i).show();
    	}
    });
    $("#dgame").click(function(){
    	for (var i = 1; i <= pcount; i++) { 
    		if ($("#player" + i).val().length <=0){
    		   alert("Please provide all Player Names");
    		   this.blur();
    		   return false;
    	    }
    	}
    	$("#pcount").val(pcount);
    	$('#dealGame').attr('action', '/Poker/' + gname.replace(" ","-") + '/getPlayers');
   	    $('#dealGame').submit();
    });
    </script>
</body>
</html>