<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<div class="col-md-1"></div>
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
    		<script>
    		var pcount="${minUsers}";
    		$("input[name=Players]").click(function(){
    	    	var playerCount= $("input[name='Players']:checked").attr('id').split("radiop");
    	    	pcount=playerCount[1];
    	    	$("input[type='text']").hide();
    	    	for (var i = 0; i <= playerCount[1]; i++) { 
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