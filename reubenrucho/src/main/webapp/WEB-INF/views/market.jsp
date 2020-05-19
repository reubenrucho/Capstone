<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Market</title>

  <!-- Bootstrap core CSS -->
  <link href="static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="static/css/modern-business.css" rel="stylesheet">

</head>

<body>

<jsp:include page="header.jsp"/>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Art Galore</h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index">Home</a>
      </li>
      <li class="breadcrumb-item active">Market</li>
    </ol>

<c:forEach items="${artCollectionList}" var="art" >

    <!-- Project Two -->
    <div class="row">
      <div class="col-md-7">
        <a href="#">
          <img class="img-fluid rounded mb-3 mb-md-0" src="static/images/artfolder/${art.id}/profile/${art.art}" alt="">
        </a>
      </div>
      <div class="col-md-5">
        <h3>${art.name}</h3>
        <p>${art.description}</p>
					<h3 class="my-3">Project Details</h3>
					<ul>
						<li>Medium: ${art.medium}</li>
						<li>Dimensions: ${art.dimension}</li>
						<li>Price $ ${art.price}</li>
					</ul>
					<h3 class="my-3">Artist Info</h3>
					<ul>
						<li>Name: ${art.postedBy.firstName} ${art.postedBy.lastName}</li>
						<li>email: ${art.postedBy.email}</li>
						<li>Phone: ${art.postedBy.address.phone}</li>
						<li>Profession: ${art.postedBy.profession}</li>
						<li>Description: ${art.postedBy.description}</li>
					</ul>
					<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#exampleModalCenter">Send message</button>
				</div>
    </div>
    <!-- /.row -->

    <hr>
    
</c:forEach>

    <!-- Pagination -->
    <ul class="pagination justify-content-center">
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">Previous</span>
        </a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">1</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">2</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#">3</a>
      </li>
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
          <span aria-hidden="true">&raquo;</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>

  </div>
  <!-- /.container -->

  <jsp:include page="sendmessage.jsp"/>

  <!-- Bootstrap core JavaScript -->
  <script src="static/vendor/jquery/jquery.min.js"></script>
  <script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>

