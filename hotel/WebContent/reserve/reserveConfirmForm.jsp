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
<jsp:include page="/navigation.jsp"/>

	<!-- Page Content -->
	<div class="container" id="f">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			예약 확인 <small>Reservation Confirm</small>
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item active">변경사항이 있으신가요?</li>
			<li class="breadcrumb-item"><a href="reserve.to"
				style="color: #007bff;">돌아가기</a></li>
		</ol>

		<!-- 예약확인 -->
		<div align="center">
			<ol class="breadcrumb">
				<li class="breadcrumb-item" style="margin: auto;"><b><h3>HOTEL
							TIKKI</h3></b>예약정보<br>
					<hr>
					<div>
						<table >
							<tr><td style="text-align:right;"><b>체크 인</b></td> <td width="20"></td><td >${ checkIn }</td></tr>
							<tr><td style="text-align:right;"><b>체크아웃</b></td> <td width="20"></td><td>${ checkOut }</td></tr>
							<tr><td style="text-align:right;"><b>객실금액</b></td> <td width="20"></td><td>KRW ${ priceview }</td></tr>
							<tr><td style="text-align:right;"><b>숙박일수</b></td> <td width="20"></td><td style="text-align:center;">${ checkDate } 박</td></tr>
							<tr><td style="text-align:right;"><b>투숙인원</b></td> <td width="20"></td><td style="text-align:center;">${ peopleNum } 명</td></tr>
						</table>
					</div>
					<hr> <b>객실</b><br> ${ roomType } <br>
					<br> <img src="/hotel/img/koong.jpg" width="300">
					<hr> <br> <b><h4>총 예약금액 </h4><h5>KRW ${ total }</h5></b><br></li>
			</ol>
		</div>

		<!-- 유의사항 등 넣으려면 이쪽에 넣기 -->
		<br>
		
		<!-- 예약저장 버튼 -->
		<div class="aa aa-button reservation-wrap reservation-button"
			align="center">
			<form action="reserveMypage.to">
				<input type="hidden" name="roomNum" value='${ roomNum }'>
				<input type="hidden" name="checkIn" value='${ checkIn }'>
				<input type="hidden" name="checkOut" value='${ checkOut }'>
				<input type="hidden" name="peopleNum" value='${ peopleNum }'>
				<input type="hidden" name="nickname" value='${ sessionScope.nick }'>
				<input type="submit" class="button" value="예약 완료">
			</form>
		</div>

	</div>
	<!-- /.container -->

<jsp:include page="/footer.jsp"/>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
