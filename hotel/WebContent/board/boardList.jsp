<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>HOTEL TIKKI</title>

  <!-- Bootstrap core CSS -->
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../css/modern-business.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.html">TIKKI</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="about.html">호텔소개</a> <!-- About 에 contact map-->
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" aria-haspopup="true" aria-expanded="false">
              객실소개
            </a><!--  포트폴리오1 -> single portfolio item -->
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="information/Deluxe.html">Deluxe</a>
              <a class="dropdown-item" href="information/GrandDeluxe.html">Grand Deluxe</a>
              <a class="dropdown-item" href="information/SuiteRoom.html">Suite Room</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="full-width.html">예약</a> <!-- full width -->
          </li>
          <li class="nav-item">
            <a class="nav-link" href="board.jsp">고객문의</a> <!--  포트폴리오1 수정 -->
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- ./nav -->

  <!-- Page Content -->
  <div class="container" height="1000px">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">고객문의
      <small>HOTEL TIKKI에 대해 궁금한 점을 물어보세요.</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">고객문의</li>
    </ol>
	

		<table class="table table-hover table table-striped" width="80%"> 
		<!-- table-hover클래스는 마우스를 올리면 회색이 생기게
		table-striped클래스는 홀수번째 테이블에 회색이 생겨있게-->
		<!-- table table-bordered 이 클래스는 테이블의 선 그어주기--> 
		
			<tr> 
				<th width="10%">번호</th> 
				<th width="75%">제목</th> 
				<th width="15%">작성자</th>
			</tr> 
			
			<tr> 
				<td>1</td> 
				<td>aa</td> 
				<td>aa</td>
			</tr> 
			
			
			<tr> 
				<td>2</td> 
				<td>b</td> 
				<td>b</td>
			</tr> 
			
			
			<tr> 
				<td>3</td> 
				<td>c</td> 
				<td>c</td>
			</tr> 
			
		</table> 
	
		
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
	    <a href=""></a>


  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
