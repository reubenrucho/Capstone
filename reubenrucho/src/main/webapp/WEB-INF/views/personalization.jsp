<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!------ Include the above in your HEAD tag ---------->

<!-- <link href="static/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css"> -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<!-- <link href="static/css/sb-admin-2.min.css" rel="stylesheet"> -->
<link href="static/css/personalization.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Personalization</title>
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


				<div class="container emp-profile">
					
					<div class="row">
						<div class="col-md-4">
							<div class="profile-img">

								<c:if test="${not empty user_account.image}">
									<img class="media-object user-img"
										src="static/images/profile-images/${user_account.id}/profile/${user_account.image}"
										 alt="Image">
								</c:if>
								<c:if test="${empty user_account.image}">
									<img
										src="static/images/art/art (1).jpeg"
										alt="" />
								</c:if>
								<div class="pull-left text-center">

									<form action="uploadPhoto" method="POST"
										enctype="multipart/form-data">
										<div class="file btn btn-lg btn-primary">
											Change Photo <input onChange="this.form.submit();"
												type="file" name="file" />
										</div>
									</form>
								
								</div>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="profile-head">
								<h5>${user_account.firstName}</h5>
								<h6>${user_account.profession}</h6>
								<p class="proile-rating">
									RANKINGS : <span>8/10</span>
								</p>
								<ul class="nav nav-tabs" id="myTab" role="tablist">
									<li class="nav-item"><a class="nav-link active"
										id="home-tab" data-toggle="tab" href="#home" role="tab"
										aria-controls="home" aria-selected="true">About</a>
									</li>
									<li class="nav-item"><a class="nav-link" id="address-tab"
										data-toggle="tab" href="#address" role="tab"
										aria-controls="address" aria-selected="false">Update Address</a>
									</li>
									<li class="nav-item"><a class="nav-link" id="update-tab"
										data-toggle="tab" href="#update" role="tab"
										aria-controls="update" aria-selected="false">Update Info</a>
									</li>
								</ul>
							</div>
						</div>
						
						<!-- <div class="col-md-2">
							<input type="submit" class="profile-edit-btn" name="btnAddMore"
								value="Edit Profile" />
						</div> -->
						
						

						<a href="delete?id=${user.id}"
							onclick="confirmed(); return false;"
							title="Delete Profile ${user.firstName} ${user.lastName}"
							class="btn btn-default"><button type="button" class="btn btn-primary btn-user btn-block">Delete</button><i class="tf-ion-close"></i> 
						</a>

					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="profile-work">
								<p>Website</p>
								<a href="${user_account.website}">${user_account.website}</a><br />
								<p>SKILLS</p>
								<a href="">${user_account.skills}</a><br /> 
							</div>
						</div>
						<div class="col-md-8">
							<div class="tab-content profile-tab" id="myTabContent">
								<div class="tab-pane fade show active" id="home" role="tabpanel"
									aria-labelledby="home-tab">
									<div class="row">
										<div class="col-md-6">
											<label>User Id</label>
										</div>
										<div class="col-md-6">
											<p>${user_account.id}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Name</label>
										</div>
										<div class="col-md-6">
											<p>${user_account.firstName} ${user_account.lastName}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Email</label>
										</div>
										<div class="col-md-6">
											<p>${user_account.email}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Phone</label>
										</div>
										<div class="col-md-6">
											<p>${user_account.getAddress().phone}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Profession</label>
										</div>
										<div class="col-md-6">
											<p>${user_account.profession}</p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Address</label>
										</div>
										<div class="col-md-6">
											<p>${user_account.getAddress().street} ${user_account.getAddress().city} ${user_account.getAddress().state} ${user_account.getAddress().zip} </p>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<label>Description</label>
										</div>
										<div class="col-md-6">
											<p>${user.description}</p>
										</div>
									</div>
								</div>
								
								<div class="tab-pane fade " id="address" role="tabpanel"
									aria-labelledby="address-tab">
									
									<form:form action="updatecontact" modelAttribute="address" method="post" class="text-left clearfix">
										
										<form:input class="form-control" type="hidden" path="id"
													value="${user_account.id}" />
												<div class="form-group">
													<form:input class="form-control" type="hidden" path="email"
														value="${user_account.email}" />
												</div>
												<div class="form-group">
													<form:input class="form-control" path="phone"
														value="${user_account.getAddress().phone}"
														placeholder="Enter phone" />
												</div>
												<div class="form-group">
													<form:input class="form-control" path="street"
														value="${user_account.getAddress().street}"
														placeholder="Enter Address" />
												</div>
												<div class="form-group">
													<form:input class="form-control" path="city"
														value="${user_account.getAddress().city}"
														placeholder="Enter City" />
												</div>
												<div class="form-group">
													<form:input class="form-control" path="zip"
														value="${user_account.getAddress().zip}"
														placeholder="Enter ZIP" />
												</div>
												<div class="form-group">
													<form:select class="form-control" path="state" id="state"
														required="true">
														<c:choose>
															<c:when test="${empty user_account.getAddress().state}">
																<option value="">Select State</option>
															</c:when>
															<c:otherwise>
																<option value="${user_account.getAddress().state}">
																	${user_account.getAddress().state}</option>
															</c:otherwise>
														</c:choose>
														<c:forEach items="${states}" var="state">
															<option value="${state}">${state.id}</option>
														</c:forEach>
													</form:select>
												</div>
												<div class="text-left">
													<button type="submit"
														class="btn btn-primary btn-user btn-block">Submit</button>
												</div>		
												
									</form:form>
									
								</div>
								
								<div class="tab-pane fade " id="update" role="tabpanel"
									aria-labelledby="update-tab">																
									
									<form:form action="update-user" modelAttribute="user" method="post" class="text-left clearfix" >									
												<form:input type="hidden" path="id"  class="form-control"  value="${user.id}" />
												<div class="form-group">
													<form:input class="form-control" type="text" path="firstName"
														value="${user.firstName}" placeholder="FirstName" />
													<form:errors path="firstName" class="text-danger text-center"/>
												</div>
												<div class="form-group">
													<form:input class="form-control" type="text" path="lastName"
														value="${user.lastName}" placeholder="LastName" />
													<form:errors path="lastName" class="text-danger text-center"/>
												</div>
												<div class="form-group">
													<form:input class="form-control" type="text" path="profession"
														value="${user.profession}" placeholder="Profession" />
													<form:errors path="profession" class="text-danger text-center"/>
												</div>
												<div class="form-group">
													<form:input class="form-control" type="text" path="website"
														value="${user.website}" placeholder="website" />
													<form:errors path="website" class="text-danger text-center"/>
												</div>
												<div class="form-group">
													<form:input class="form-control" type="text" path="skills"
														value="${user.skills}" placeholder="skills" />
													<form:errors path="skills" class="text-danger text-center"/>
												</div>
												<div class="form-group">
													<form:input class="form-control" type="text" path="description"
														value="${user.description}" placeholder="description" />
													<form:errors path="description" class="text-danger text-center"/>
												</div>
												<div class="form-group">
													<form:input type="email" path="email" class="form-control"
													value="${user.email}" placeholder="E-mail" disabled="true" />
													<form:errors path="email" class="text-danger text-center" />
												</div>
												<div class="text-left">
													<button type="submit"
														class="btn btn-primary btn-user btn-block">Submit</button>
												</div>													
									 </form:form>
									  
									  
									
									 

								</div>
								
							</div>
						</div>
					</div>
					
				</div>

			</div>
		</div>
	</div>
</body>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"
	integrity="sha384-6khuMg9gaYr5AxOqhkVIODVIvm9ynTT5J4V1cfthmT+emCG6yVmEZsRHdxlotUnm"
	crossorigin="anonymous"></script>

</html>