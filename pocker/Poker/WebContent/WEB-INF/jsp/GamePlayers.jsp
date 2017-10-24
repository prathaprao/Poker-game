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
	margin-top: 60px;
}
/* .rotatee40{ */
/*     -ms-transform: rotate(-20deg); /* IE 9 */ */
/*     -webkit-transform: rotate(-20deg); /* Chrome, Safari, Opera */ */
/*     transform: rotate(-20deg); */
    
/*     } */
    
/*     .rotatee20{ */
/*     -ms-transform: rotate(-10deg); /* IE 9 */ */
/*     -webkit-transform: rotate(-10deg); /* Chrome, Safari, Opera */ */
/*     transform: rotate(-10deg); */
/*     } */
    
/*     .rotate{ */
/*     padding-bottom:40px; */
/*     } */
    
/*     .rotate20{ */
/*     -ms-transform: rotate(10deg); /* IE 9 */ */
/*     -webkit-transform: rotate(10deg); /* Chrome, Safari, Opera */ */
/*     transform: rotate(10deg); */
/*     } */
    
/*     .rotate40{ */
/*     -ms-transform: rotate(20deg); /* IE 9 */ */
/*     -webkit-transform: rotate(20deg); /* Chrome, Safari, Opera */ */
/*     transform: rotate(20deg); */
/*     } */
    
.centered-form .panel{
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}
</style>
</head>
<body>
<div class="container"><c:forEach items="${playCards}" var="playCards">

        <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-8 col-sm-offset-2 col-md-offset-2">
        
        	<div class="panel panel-default">
        		
			 			<div class="panel-body">
			 			
			    		<div class="row" style="height:60px;">
			    		<c:forEach items="${playCards.value}" var="imgname">
			    		
            						<img src="${pageContext.request.contextPath}/Images/${imgname}" class="img-responsive col-md-2" alt="No Image">
            			
						
			    		</c:forEach>
			    			</div>
			    		
	
			    						    		
			    			</div>

<div class="panel-heading">
			    		<h3 class="panel-title" align="center">Player Name - ${playCards.key} </h3>
			    		
			 			</div>
	
			    	</div><br>
	    		</div>
    		</div>
    		 </c:forEach>
    		<form role="form" action="/Poker/Online-Games/" method="post" id="gsummary">
    		<input type="text" name="uname" id="uname" class="form-control input-sm" style="display:none;" value="${winner}">

    		</form>
    			    			<div class="row">
			    				<div class="col-md-5 col-md-offset-4">
			    					<div class="form-group">
			                <input type="submit"  id="rregister" value="DEAL" class="btn btn-info btn-block btn-lg">
			    					</div>
			    				</div>

			    			</div>	
    	</div>

    
    <script>
    $("#rregister").click(function(){
   	 $('#gsummary').attr('action', '/Poker/' + '${gname1}' + '/Summary');
   	 $('#gsummary').submit();
    });
 
    
    
    </script>
</body>
</html>