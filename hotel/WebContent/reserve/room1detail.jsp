<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
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
<jsp:include page="/navigation.jsp"/>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			Deluxe
		</h1>

		<!-- 룸 상세 페이지 - 예약하는 도중에만 볼 수 있는게 아니므로 일단 경로는 뺐음 -->
		<!-- <ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="reservation.html" style="color: #007bff;">예약
					페이지로 돌아가기</a></li>
			<li class="breadcrumb-item active">객실 상세보기</li>
		</ol> -->

		<!-- Portfolio Item Row -->
		<div class="row">

			<div class="col-md-8">
				<img class="img-fluid" src="/hotel/img/deluxe.jpg" alt="">
			</div>

			<div class="col-md-4">
				<p>
				<h4 style="font-style:italic;">"디럭스 룸은 편안하고 안락한 공간을 효율적으로 구성했습니다."</h4>
				</p>
				<br> 글로벌 럭셔리 호텔 디자이너 피터 리미디오스가 디자인한 '시대를 아우르는 모던함'을 만나보십시오. 요트
				콘셉트로 구성한 프라이빗 바와 세계적인 수준의 침구류와 함께 생애 최고의 휴식을 경험해보시기 바랍니다.<br> <br>
				<b>문의전화</b> | 02-1234-5678<br> <br>

				<div class="aa aa-button reservation-wrap reservation-button"
					align="center">
					<a href="reserve.to" class="button">예약 하기</a>
				</div>

				<!-- Room info 넣어야하면 주석 풀어서 쓰기.. -->

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
