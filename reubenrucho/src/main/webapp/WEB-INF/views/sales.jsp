<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Sales</title>

  <!-- Custom fonts for this template -->
  <link href="static/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="static/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="static/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
			
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Sales Table</h1>
          <p class="mb-4">lorem ipsum </a>.</p>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Name</th>
                      <th>Dimension</th>
                      <th>Description</th>
                      <th>Medium</th>
                      <th>Sale Date</th>
                      <th>Sold</th>
                    </tr>
                  </thead>            
                  <tbody>
                    <tr>
                      <td>STARRY NIGHT</td>
                      <td>29 x 36 1/4"</td>
                      <td>Vincent van Gogh painted Starry Night in 1889 during his stay at the asylum of Saint-Paul-de-Mausole near Saint-Remy-de-Provence.</td>
                      <td>Oil</td>
                      <td>5/8/2020</td>
                      <td>$100,000,000</td>
                    </tr>
                    <tr>
                      <td>CAFE TERRACE AT NIGHT</td>
                      <td></td>
                      <td>Cafe Terrace at Night was one of the first nocturnal scenes painted by Van Gogh at the time of his stay in Arles.</td>
                      <td>Oil</td>
                      <td>5/8/2020</td>
                      <td>$200,000,000</td>
                    </tr>
                  </tbody>
                   <tfoot>
                    <tr>
                      <th>Name</th>
                      <th>Dimension</th>
                      <th>Description</th>
                      <th>Medium</th>
                      <th>Sale Date</th>
                      <th>Sold</th>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->


    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

	<jsp:include page="footer.jsp" />

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript-->
  <script src="static/vendor/jquery/jquery.min.js"></script>
  <script src="static/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="static/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="static/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="static/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="static/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="static/js/demo/datatables-demo.js"></script>

</body>

</html>
