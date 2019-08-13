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

<!-- inho CSS -->
<link href="/hotel/vendor/bootstrap/css/inho.css?after" rel="stylesheet">

<!-- minjee.css -->
<link href="/hotel/css/minjee.css?after" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!--  kakao api -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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
							<tr><td style="text-align:left;"><b>체크&emsp;인</b></td> <td width="30"></td><td >${ checkIn }</td></tr>
							<tr><td style="text-align:left;"><b>체크아웃</b></td> <td width="30"></td><td>${ checkOut }</td></tr>
							<tr><td style="text-align:left;"><b>객실금액</b></td> <td width="30"></td><td>KRW ${ priceview }</td></tr>
							<tr><td style="text-align:left;"><b>숙박일수</b></td> <td width="30"></td><td style="text-align:left;">${ checkDate } 박</td></tr>
							<tr><td style="text-align:left;"><b>투숙인원</b></td> <td width="30"></td><td style="text-align:left;">${ peopleNum } 명</td></tr>
						</table>
					</div>
					<hr> 
					<b>객실</b> ${ roomType } <br>
					<br> <img src="${ img }" width="600">
					<hr> <br> <b><h4>총 예약금액 </h4><h5>KRW ${ total }</h5></b><br></li>
			</ol>
		</div>
		
		<!-- 결제 버튼 -->
		<div align="center" style="margin: 30px 0px;">
			<form action="reserveMypage.to">
				<input type="hidden" name="roomNum" value='${ roomNum }'>
				<input type="hidden" name="checkIn" value='${ checkIn }'>
				<input type="hidden" name="checkOut" value='${ checkOut }'>
				<input type="hidden" name="peopleNum" value='${ peopleNum }'>
				<input type="hidden" name="roomType" value='${ roomType }'>
				<input type="hidden" name="nickname" value='${ sessionScope.nick }'>
			  	<a id="kakaopay-btn" style="cursor: pointer; width: 120px; height: 51px; display: inline-block; margin-bottom: -20px; margin-right: 30px; background-image: url(/hotel/img/payment_medium.png);"></a>
				<input type="submit" class="btn btn-outline-primary btn-lg" value="무통장입금">
			</form>
	<script>
      $(document).ready(function(){
         $('#kakaopay-btn').on('click', kakaopay);
      })
      
      let popup;
      let timer;
      
      function kakaopay(e){
         e.preventDefault();
         $.ajax({
            url : 'http://localhost:8080/hotel/pay',
            type : 'GET',
            data : {
            	roomNum: '${ roomNum }',
            	checkIn: '${ checkIn }',
            	checkOut: '${ checkOut }',
            	peopleNum:'${ peopleNum }',
            	roomType: '${ roomType }',
            	nickname: '${ sessionScope.nick }',
            	priceview: '${ priceview }'
            },
            success : function(res){
               res = JSON.parse(res);
               console.log(res.next_redirect_pc_url);
               popup = window.open(res.next_redirect_pc_url, '카카오 결제', 'width=450, height=600, status=no, toolbar=no, location=no, top=200, left=200');
               timer = setInterval(function(){
                  if(popup.closed){
                     location.href="http://localhost:8080/hotel/mypage.to?nickname=${sessionScope.nick}"
                  }
               }, 1000);
            }
         })
      }
      </script>
		</div>

	</div>
	<!-- /.container -->

<jsp:include page="/footer.jsp"/>

</body>

</html>
