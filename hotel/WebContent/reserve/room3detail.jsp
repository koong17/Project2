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

</head>

<body>
<jsp:include page="/navigation2.jsp"/>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			Suite
		</h1>

		<!-- 경로 -->
		<!-- <ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="reservation.html"
				style="color: #007bff;">예약 페이지로 돌아가기</a></li>
			<li class="breadcrumb-item active">객실 상세보기</li>
		</ol> -->

		<!-- Portfolio Item Row -->
		<div class="row">

			<div class="col-md-8">
				<img class="img-fluid" src="/hotel/img/suite.jpg" alt="">
			</div>

			<div class="col-md-4">
				<p>
				<h4 style="font-style:italic;">"HOTEL TIKKI 스위트 룸에서 펼쳐지는 잊지 못할 순간"</h4>
				</p>
				그림처럼 펼쳐지는 도심 전경을 바라보며 즐기는 여유로운 휴식. 더 이그제큐티브 라운지에서의 다채로운 다이닝과 객실에서 즐기는 로맨틱한 와인, 그리고 레이트 체크아웃으로 보다 느긋하고 풍성한 하루를 선사합니다.<br>
				※스위트룸은 전화 예약만 가능합니다. <br>
				<br> <b>문의전화</b> | 02-1234-5678<br> <br>

				<div align="center">
					<a href="reserve.to" class="btn btn-outline-primary btn-block">예약 하기</a>
				</div>

				<!-- Room info 넣어야하면 주석 풀어서 쓰기.. 아래 내용은 룸1 인포라 다시 넣든지 말든지 해야함 -->

				<!-- <h3 class="my-3">ROOM INFO</h3>
				<ul>
					<li>체크인 : 오후 3시 이후</li>
					<li>체크아웃 : 낮 12시</li>
					<li>숙박 예정일 1일 전 18시까지는 위약금 없음</li>
				</ul>
				<hr>
				<ul>
					<li>55인치 TV</li>
					<li>50~100Mbps 초고속 유·무선 인터넷(Wifi)</li>
					<li>커피·티 무료 제공</li>
					<li>엑스트라 베드 1개 추가 36,300원/1박</li>
				</ul>
				<hr>
				<ul>
					<li>객실에서 즐기실 수 있는 다양한 룸서비스 메뉴가 준비되어 있습니다.</li>
					<li>식사, 음료 | 24시간 서비스</li>
					<li>중식, 일식 | 점심 12:00~14:00, 저녁 18:00~21:30</li>
				</ul> -->
			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	<p>
	
	<jsp:include page="/footer.jsp"/>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
