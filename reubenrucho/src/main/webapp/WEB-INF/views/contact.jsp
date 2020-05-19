<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact</title>
</head>
<body>

<jsp:include page="header.jsp"/>

 <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">Contact
      <small>Subheading</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index">Home</a>
      </li>
      <li class="breadcrumb-item active">Contact</li>
    </ol>

    <!-- Content Row -->
    <div class="row">
      <!-- Map Column -->
      <div class="col-lg-8 mb-4">
        <!-- Embedded Google Map -->
        <iframe width="100%" height="400px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?hl=en&amp;ie=UTF8&amp;ll=37.0625,-95.677068&amp;spn=56.506174,79.013672&amp;t=m&amp;z=4&amp;output=embed"></iframe>
      </div>
      <!-- Contact Details Column -->
      <div class="col-lg-4 mb-4">
        <h3>Contact Details</h3>
        <p>
          1234 Street Place
          <br>St.Louis, MO 63042
          <br>
        </p>
        <p>
          <abbr title="Phone">P</abbr>: (123) 456-7890
        </p>
        <p>
          <abbr title="Email">E</abbr>:
          <a href="mailto:name@example.com">Van.Gogh@gmail.com
          </a>
        </p>
        <!-- <p>
          <abbr title="Hours">H</abbr>: Monday - Friday: 9:00 AM to 5:00 PM
        </p> -->
      </div>
    </div>
    <!-- /.row -->

    <!-- Contact Form -->
    <!-- In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
    <div class="row">
      <div class="col-lg-8 mb-4">
        <h3>Send us a Message ${msg}</h3>

				<form action="sendemail" method="post" id="contact-form" role="form">
					<div class="form-group">
						<input type="text" placeholder="Your Name" class="form-control"
							name="name" id="name" required>
					</div>

					<div class="form-group">
						<input type="email" placeholder="Your Email" class="form-control"
							name="email" id="email" required>
					</div>

					<div class="form-group">
						<input type="text" placeholder="Subject" class="form-control"
							name="subject" id="subject" required>
					</div>

					<div class="form-group">
						<textarea rows="6" placeholder="Message" class="form-control"
							name="message" id="message" required></textarea>
					</div>
					<div id="cf-submit">
						<input type="submit" id="contact-submit"
							class="btn btn-primary btn-user btn-block" value="Submit">
					</div>
				</form>

			</div>

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
  
</body>
</html>