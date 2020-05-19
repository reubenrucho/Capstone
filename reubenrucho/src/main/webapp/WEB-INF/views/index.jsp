<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Home</title>

<!-- Bootstrap core CSS -->
<link href="static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="static/css/heroic-features.css" rel="stylesheet">

</head>

<body>
	
	<jsp:include page="header.jsp"/>
	
	<!-- Page Content -->
	<div class="container">

		<!-- Jumbotron Header -->
		<header class="jumbotron my-4">
			<h1 class="display-3">Welcome To Van Gogh Art Galore!</h1>
			<p class="lead">Created an account to get started in order to upload your masterpiece.</p>
			
			<c:if test="${not empty loggedInUser}">
				
			</c:if>
			
			<c:choose>
			<c:when test="${empty loggedInUser}">					
				<a href="login" class="btn btn-primary btn-lg">Get Started</a>	
			</c:when>
					
				<c:otherwise>
			  		<a href="profile" class="btn btn-primary btn-lg">Go To Profile</a>
			  		<a href="market" class="btn btn-primary btn-lg">Market</a>
			 	</c:otherwise>
			</c:choose>
		</header>

		<!-- Page Features -->
		<div class="row text-center">

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="static/images/art/Shower below the Summit.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title">Thirty-six Views of Mt. Fuji - Shower below the Summit</h4>
						<p class="card-text">From "Fugaku Sanju-rokkei" ("Thirty-six Views of Mt. Fuji"), "Yamashita, Shirasame". Red Mt. Fuji. Lightning flashes below the summit.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="static/images/art/The Great Wave.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title">Thirty-six Views of Mt.Fuji - The Great Wave</h4>
						<p class="card-text">From the series "Fugaku Sanju Rokkei" ("Thirty-six Views of Mt.Fuji"). The big waves off the coast of Kanagawa dwarf are pulling at the small boats, making the people cling to them in fear. Mt. Fuji is seen in the distance.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="static/images/art/Thirty-six Views of Mt.Fuji - Red Fuji.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title">Thirty-six Views of Mt.Fuji - Red Fuji</h4>
						<p class="card-text">From "Fugaku Sanju Rokkei" ("Thirty-six Views of Mt.Fuji"). "Gaifu, Kaisei" ("Fine Wind, Clear Weather").</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card h-100">
					<img class="card-img-top" src="static/images/art/Sekiya.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title">Thirty-six Views of Mt.Fuji - Sekiya</h4>
						<p class="card-text">"Fugaku Sanju-Rokkei" ("Thirty-six Views of Mt.Fuji"). Sekiya near the Sumida river.
					    </p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Find Out More!</a>
					</div>
				</div>
			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2019</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="static/vendor/jquery/jquery.min.js"></script>
	<script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
