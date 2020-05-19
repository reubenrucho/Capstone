<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- Bootstrap core CSS -->
<link href="static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="static/css/heroic-features.css" rel="stylesheet">

</head>
<body>


	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index">Van Gogh</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="index">Home
							<span class="sr-only">(current)</span>
					</a>
					</li>
					
					<c:if test="${not empty loggedInUser}">
					<li class="nav-item"><a class="nav-link" href="profile">Profile</a></li>
					</c:if>
					
					<c:choose>
					
					<c:when test="${empty loggedInUser}">					
					<li class="nav-item"><a class="nav-link" href="login">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="signup">SignUp</a></li>
					</c:when>
					
					<c:otherwise>
			  		<li class="nav-item"><a class="nav-link" href="logout">logout</a></li>
			  		<!-- <li class="nav-item"><a class="nav-link" href="market">Market</a></li> -->
			 		</c:otherwise>
					
					</c:choose>
					
					<li class="nav-item"><a class="nav-link" href="market">Market</a></li> 
					
					<li class="nav-item"><a class="nav-link" href="contact">Contact</a></li>

					<!-- <li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a></li> -->
					
					
				
				</ul>
			</div>
		</div>
	</nav>

<!-- Bootstrap core JavaScript -->
	<script src="static/vendor/jquery/jquery.min.js"></script>
	<script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>