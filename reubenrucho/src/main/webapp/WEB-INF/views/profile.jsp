<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Profile</title>

<!-- Custom fonts for this template-->
<link href="static/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="static/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="sidebar.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<jsp:include page="navbar.jsp" />

				<!-- Page Content -->
				<div class="container">

					<!-- Page Heading/Breadcrumbs -->
					<h1 class="mt-4 mb-3">
						${user_account.firstName} ArtWork

						<!-- Topbar Search -->
						<form
							class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
							<div class="input-group">
								<input type="text" class="form-control bg-light border-0 small"
									placeholder="Search for artwork" aria-label="Search"
									aria-describedby="basic-addon2">
								<div class="input-group-append">
									<button class="btn btn-primary" type="button">
										<i class="fas fa-search fa-sm"></i>
									</button>
								</div>
							</div>
						</form>
					</h1>

					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="profile">Profile</a></li>
						<li class="breadcrumb-item active">Portfolio</li>
					</ol>

					<hr>
					
					<c:forEach items="${artCollectionList}" var="art">
						
						<!-- Project Two -->
						<div class="row">
							<div class="col-md-7">


								<a href="#"> <img class="img-fluid rounded mb-3 mb-md-0"
									src="static/images/artfolder/${art.id}/profile/${art.art}" alt="">
								</a>


							</div>
							<div class="col-md-5">
								<h3>${art.name}</h3>
								<p>Description: ${art.description}</p>
								<h3 class="my-3">Project Details</h3>
								<ul>
									<li>Medium: ${art.medium}</li>
									<li>Demension: ${art.dimension}</li>
									<li>Price $ ${art.price}</li>
								</ul>
								
								<a class="btn btn-primary" href="market">Send to Market</a>
								
								<hr>
								
								<form action="deleteArt"  method="post" >
								
								<input type="hidden" name="id" value="${art.id}"/>
								<button type="submit" class="btn btn-primary">Delete MasterPiece</button>
								
								</form>
							
							</div>
						</div>
						<!-- /.row -->

						<hr>
						
					</c:forEach>
				
					<hr>

					<!-- Pagination -->
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
								class="sr-only">Next</span>
						</a></li>
					</ul>

				</div>
				<!-- /.container -->

			</div>
			<!-- End of Main Content -->

			<jsp:include page="footer.jsp" />

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<jsp:include page="logout.jsp" />

	<!-- Bootstrap core JavaScript-->
	<script src="static/vendor/jquery/jquery.min.js"></script>
	<script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="static/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="static/js/sb-admin-2.min.js"></script>

</body>

</html>
