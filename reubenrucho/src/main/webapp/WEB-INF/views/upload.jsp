<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Artwork Submission Form</title>
</head>
<body>

<!-- Button trigger modal 
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#staticBackdrop">
  Launch static backdrop modal
</button> -->

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Artwork Submission Form</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

					<form:form action="artupload" method="post" modelAttribute="artCollection" enctype="multipart/form-data">
						
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-default">Name</span>
							</div>
							<form:input path="name" type="text" class="form-control" aria-label="Default"
								aria-describedby="inputGroup-sizing-default" placeholder="artwork name" required="true"/>
						</div>

						<hr>

						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text">Description</span>
							</div>
							<form:textarea path="description" class="form-control" aria-label="With textarea" required="true"></form:textarea>
						</div>
						
						<hr>
						
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-default">Dimension</span>
							</div>
							<form:input path="dimension" type="text" class="form-control" placeholder="height x width" aria-label="Default"
								aria-describedby="inputGroup-sizing-default" required="true"/>
						</div>
						
						<hr>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Price $</span>
							</div>
							<form:input path="price" type="text" class="form-control"
								aria-label="Amount (to the nearest dollar)" required="true"/>
							<div class="input-group-append">
								<span class="input-group-text">.00</span>
							</div>
						</div>
						
						<hr>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<label class="input-group-text" for="inputGroupSelect01">Medium</label>
							</div>
							<form:select path="medium" class="custom-select" id="inputGroupSelect01">
								<option selected>Choose...</option>
								<option>Oil</option>
								<option>Acrylic</option>
								<option>Watercolor</option>
								<option>Gouache</option>
								<option>Tempera</option>
								<option>Digital</option>
								<option>Pen and Ink</option>
								<option>Color pencils</option>
								<option>Markers</option>
								<option>Color pencils</option>
								<option>Mixed media</option>
								<option>Airbrush</option>
								<option>Mural</option>
								<option>Block printing</option>
								<option>Etching</option>
								<option>Lithography</option>							
								<option>gold leafing</option>
							</form:select>
						</div>
						
						<hr>

						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Upload</span>
							</div>
							<div class="custom-file">
								<input name="file" type="file" class="custom-file-input"
									id="inputGroupFile01" required="true"> <label class="custom-file-label"
									for="inputGroupFile01">Choose artwork</label>
							</div>
						</div>
						
						<div class="form-group">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						<button type="submit"  class="btn btn-primary">Upload</button>				
						</div>

					</form:form>

					

		</div>
      <div class="modal-footer">
    <!-- <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
    <!-- <a href="profile"><button type="submit"  class="btn btn-primary">Upload</button></a> -->
      </div>
    </div>
  </div>
</div>

</body>
</html>