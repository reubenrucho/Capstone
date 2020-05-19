<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<!-- Footer
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      End of Footer -->

	<div class="modal fade" id="add-images">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				
				<!-- Modal body -->
				<div class="modal-body">
					
					<form method="POST" action="addimages"
						enctype="multipart/form-data">
						<h4>Add Image</h4>
						<img id="output_image" class="col-md-12" />
						<div class="control-group">
							<div class="controls">
								<input type="file" name="file" class="form-control"
									onchange="preview_image(event)"> <input type="hidden"
									name="id" value="${user_account.id}">
							</div>
						</div>
						<div class="control-group">
							<br>
							<div class="controls">
								<button type="submit" class="btn btn-default">Upload</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</form>
				
				</div>
			</div>

		</div>
	</div>
	
	

	<div class="modal fade" id="forgot">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<!-- Modal body -->
				<div class="modal-body">
					<section class="forget-password-page account">
						<div class="container">
							<div class="row col-md-6">
								<h2 class="text-center">Welcome Back</h2>
								
								<form action="request-passord-reset" method="post"
									class="text-left clearfix">
									<p>Please enter the email address for your account. A
										verification code will be sent to you. Once you have received
										the verification code, you will be able to choose a new
										password for your account.</p>
									<div class="form-group">
										<input type="email" name="email" class="form-control"
											id="exampleInputEmail1" placeholder="Account email address">
									</div>
									<div class="text-left">
										<button type="submit" class="btn btn-main text-center">Request
											password reset</button>
										<button type="button"
											class="btn btn-main btn-medium btn-danger"
											data-dismiss="modal">Close</button>
									</div>
								</form>
							
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Main Js File -->
    <script src="static/js/script.js"></script>

	<script type="text/javascript">
     function preview_image(event) 
     {
      var reader = new FileReader();
      reader.onload = function()
      {
       var output = document.getElementById('output_image');
       output.classList.add("preview");
       output.src = reader.result;
      }
      reader.readAsDataURL(event.target.files[0]);
     }
     </script>


</body>
</html>