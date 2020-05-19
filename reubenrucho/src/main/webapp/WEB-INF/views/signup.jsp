<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<c:if test="${not empty loggedInUser}">
<c:redirect url="/profile"/>
</c:if>

<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Register</title>

  <!-- Custom fonts for this template-->
  <link href="static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="static/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                ${msg} ${success} ${error} ${expired}
              </div>
              
              <form:form class="user" action="register" modelAttribute="user" method="post">
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <form:input path="firstName" type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="First Name"/>
                  	<form:errors path="firstName" class="text-danger text-center"/>
                  </div>
                  <div class="col-sm-6">
                    <form:input path="lastName" type="text" class="form-control form-control-user" id="exampleLastName" placeholder="Last Name"/>
                  	<form:errors path="lastName" class="text-danger text-center"/>
                  </div>
                </div>
                <div class="form-group">
                  <form:input type="hidden" path="id"/>
                  <form:input path="email" type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Email Address"/>
                  <form:errors path="email" class="text-danger text-center"/>	
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <form:input path="password" type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password"/>
                  	<form:errors path="password" class="text-danger text-center"/>
                  </div>
                  <div class="col-sm-6">
                    <form:input path="password2" type="password" class="form-control form-control-user" id="exampleRepeatPassword" placeholder="Repeat Password"/>
                  	<form:errors path="password2" class="text-danger text-center"/>
                  </div>
                </div>
                <button type="submit" class="btn btn-primary btn-user btn-block">
                  Register Account
                </button>
                <hr>
               <!--  <a href="index.html" class="btn btn-google btn-user btn-block">
                  <i class="fab fa-google fa-fw"></i> Register with Google
                </a>
                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                  <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                </a> -->
              </form:form>
              
              <hr>
              
              <div class="text-center">
                <a class="small" href="index">Home</a>
              </div>
              <div class="text-center">
                <a class="small" href="login">Already have an account? Login!</a>
              </div>
           
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script  src="static/vendor/jquery/jquery.min.js"></script>
  <script  src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script  src="static/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script  src="static/js/sb-admin-2.min.js"></script>

</body>

</html>
