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

<!-- Bootstrap core CSS -->
<link href="/hotel/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/hotel/css/modern-business.css?after" rel="stylesheet">

<!-- minjee.css -->
<link href="/hotel/css/minjee.css?after" rel="stylesheet">

<style>
#f {
	min-height: 1000px;
}
</style>
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

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			예약 확인 <small>Reservation Confirm</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item active">변경사항이 있으신가요?</li>
			<li class="breadcrumb-item"><a href="reserveForm.jsp"
				style="color: #007bff;">돌아가기</a></li>
		</ol>

		<!-- 예약확인 -->
		<div align="center">
			<ol class="breadcrumb">
				<li class="breadcrumb-item" style="margin: auto;"><b><h3>HOTEL
							TIKKI</h3></b>예약정보<br>
					<hr>
					<div>
						<b>체크 인</b> (db가져옴)<br> <b>체크아웃</b> (db가져옴)<br> <b>숙박일수</b>
						(db가져옴)<br> <b>투숙인원</b> (db가져옴)<br> <b>객실타입</b> (db가져옴)<br>
					</div>
					<hr> <b>객실/패키지</b><br> (룸타입(Deluxe) db가져옴) / 객실타입(db가져옴)<br>
					<br> <img src="../img/koong.jpg" width="300"><br> (선택한
					방 img) <br>
					<hr> <br> <b><h4>요금합계 (계산결과)</h4></b><br></li>
			</ol>
		</div>

		<!-- 유의사항 등 넣으려면 이쪽에 넣기 -->
		<br>
		
		<!-- 예약저장 버튼 -->
		<div class="aa aa-button reservation-wrap reservation-button"
			align="center">
			<a href="../index.html" class="button">예약 저장</a>
		</div>

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2019</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
