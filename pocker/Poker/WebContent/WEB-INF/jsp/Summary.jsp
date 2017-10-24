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

.centered-form .panel{
	background: rgba(255, 255, 255, 0.8);
	box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
}
</style>
</head>
<body>
<div class="container">
        <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-1 col-md-offset-3">
        	<div class="panel panel-default">
        		<div class="panel-heading">
			    		<h3 class="panel-title"><b><font color="blue">CONGRATULATIONS ${uname} WON 100 Points</font></b></h3>
			 			</div>
			 			<div class="panel-body"><h4 align="center"> POINTS HISTORY FOR ${gname}</h4>
			    		<table class="table"><thead><tr><th>Player Name</th><th>Points Scored</th></tr></thead>
			    		<tbody>
			    		<c:forEach items="${ulist}" var="ulist">
							<tr><td>${ulist.uname}</td><td> ${ulist.gpoints}</td></tr>
			    		</c:forEach>		
			    	  </tbody></table>		    	
			    	</div>
	    		</div>
    		</div>
    	</div>
    </div>
</body>
</html>