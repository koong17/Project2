<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>HOTEL TIKKI</title>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet">

<!-- hs CSS -->
<link href="../css/hs.css" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/modern-business.css" rel="stylesheet">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
	href="../vendor/bootstrap/css/style.css" />

<!-- datePicker -->
<script src="../vendor/jquery/jquery.js"></script>

<!-- Bootstrap core JavaScript -->
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<script type='text/javascript'
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap-datepicker.kr.js"
	charset="UTF-8"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">

<!-- 
<script src="vendor/bootstrap/js/bootstrap.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.2.1.js" > </script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js" ></script> 
-->


<!-- Hyesoo JavaScript -->
<script src="../js/hidden.js"></script>

</head>

<body>

	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.html">TIKKI</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="about.html">호텔소개</a>
						<!-- About 에 contact map--></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 객실소개 </a> <!--  포트폴리오1 -> single portfolio item -->
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="room1detail.jsp">room1</a> <a
								class="dropdown-item" href="room2detail.jsp">room2</a> <a
								class="dropdown-item" href="room3detail.jsp">room3</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="reservation.jsp">예약</a> <!-- full width --></li>
					<li class="nav-item"><a class="nav-link"
						href="../portfolio-1-col.html">고객문의</a> <!--  포트폴리오1 수정 --></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- ./nav -->


	<!-- Page Content -->
	<div class="container" id="f">

		<!-- Page Head -->
		<h1 class="mt-4 mb-3">예약</h1>
		<!-- 예약 바 -->
		<!-- <form action="reservation.html" method="post" name="reservationForm"> -->
		<ul class="breadcrumb">
		<table class="marginAuto"><tr>
			<!-- 체크인 -->
			<td class="m" >
				<input type="text" class="form-control" value="체크인"  id="checkIn" name="checkIn" > 
			</td>
			<!-- 체크아웃 -->
			<td class="m">
			<div class="input-group date" >
				<input type="text" class="form-control" value="체크아웃" id="checkOut" name="checkIn" > 
				<span class="input-group-addon"> 
				<span class="glyphicon glyphicon-calendar">
				</span></span>
			</div></td>
	
			<!-- 인원수 -->
			<td class="m">
			<div>
			<select class="browser-default custom-select">
					<option selected>인원수&nbsp;&nbsp;</option>
					<option value="num1">1</option>
					<option value="num2">2</option>
					<option value="num3">3</option>
					<option value="num3">4</option>
			</select></div></td>
			
			<!-- 검색 submit 버튼 -->
			<td class="m"><div>
 			<button class="btn btn-primary" id="searchbtn">검색</button></div></td>
 		</tr></table>
		</ul> 
		<!-- </form> -->
	</div>
	<script>
			$(document).ready(function(){
				$("#searchbtn").click(function() {
					$("#showShow").show();
				});
			});
		</script>
	<!-- 예약 바 끝 -->

	<!-- /.container -->
	<div class="container" id="showShow" style="display: none;">

		<ol class="breadcrumb">
			<li class="breadcrumb-item active">현재 이용 가능 객실</li>
		</ol>

		<!-- Project One -->
		<div class="row">
			<div class="col-md-7">
				<a href="room1detail.jsp"> <img
					class="img-fluid rounded mb-3 mb-md-0" src="../img/koong.jpg" alt="">
				</a>
			</div>
			<div class="col-md-5">
				<h3>Deluxe</h3>
				<p>그냥 그냥 디럭스</p>
				<a class="btn btn-primary" href="reservation_confirm.jsp">예약하기
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Project Two -->
		<div class="row">
			<div class="col-md-7">
				<a href="room2detail.jsp"> <img
					class="img-fluid rounded mb-3 mb-md-0" src="../img/koong.jpg" alt="">
				</a>
			</div>
			<div class="col-md-5">
				<h3>Grand Deluxe</h3>
				<p>좋은 좋은 디럭스</p>
				<a class="btn btn-primary" href="reservation_confirm.jsp">예약하기
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Project Three -->
		<div class="row">
			<div class="col-md-7">
				<a href="room3detail.jsp"> <img
					class="img-fluid rounded mb-3 mb-md-0" src="../img/koong.jpg" alt="">
				</a>
			</div>
			<div class="col-md-5">
				<h3>Suite Room</h3>
				<p>제일 제일 좋은 룸</p>
				<a class="btn btn-primary" href="reservation_confirm.jsp">예약하기
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
	</div>
	<!-- /.row -->

	<hr>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2019</p>
		</div>
		<!-- /.container -->
	</footer>

</body>

</html>
