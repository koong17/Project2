<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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

<!-- Bootstrap core JavaScript -->
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../vendor/jquery/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>

<!-- datePicker -->
<!-- <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css" />

<!-- 
<script src="https://code.jquery.com/jquery-3.2.1.js" > </script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js" ></script> 
-->


<!-- Hyesoo JavaScript -->
<script src="../js/hidden.js"></script>
</head>
<body>
<!-- 예약 바 -->
		<!-- <form action="reservation.html" method="post" name="reservationForm"> -->
		<ul class="breadcrumb">
		<table class="marginAuto"><tr>
			<!-- 체크인 -->
			<td class="m" >
			<!-- 	<input type="text" class="form-control" value="체크인"  id="checkIn" name="checkIn" >  -->
			
            <div class='input-group date' id='datetimepicker6'>
                <input type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            
        </div>
			</td>
			<!-- 체크아웃 -->
			<td class="m">
			<!-- <div class="input-group date" >
				<input type="text" class="form-control" value="체크아웃" id="checkOut" name="checkIn" > 
				<span class="input-group-addon"> 
				<span class="glyphicon glyphicon-calendar">
				</span></span>
			</div> -->
            <div class='input-group date' id='datetimepicker7'>
                <input type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
        </div>
			</td>
	
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
</body>
</html>