<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Send Message</title>
</head>
<body>


<!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  Launch demo modal
</button> -->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Email Artist ${msg}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

					<form action="sendMessage" method="post" id="contact-form"
						role="form">
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
							<button type="button" class="btn btn-primary btn-user btn-block" data-dismiss="modal">Close</button>
						</div>
					</form>

				</div>
      <div class="modal-footer">
       
      </div>
    </div>
  </div>
</div>

</body>
</html>