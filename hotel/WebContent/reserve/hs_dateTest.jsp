<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
</head>
��
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <link href="../css/hs.css" rel="stylesheet"> -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css" />

<script type="text/javascript">
	$(function() {
		$('#datetimepicker6').datetimepicker({
			minDate : 'now',
			format : 'YYYY-MM-DD HH:mm:ss'
		});
		$('#datetimepicker7').datetimepicker({
			useCurrent : false, //Important! See issue #1075
			format : 'YYYY-MM-DD HH:mm:ss'
		});
		$('#datetimepicker6').datetimepicker().data('DateTimePicker').format(
				'YYYY-MM-DD');
		$('#datetimepicker7').datetimepicker().data('DateTimePicker').format(
				'YYYY-MM-DD');
		$("#datetimepicker6").on("dp.change", function(e) {
			$('#datetimepicker7').data("DateTimePicker").minDate(e.date);
		});
		$("#datetimepicker7").on("dp.change", function(e) {
			$('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
		});
	});
</script>
<body>
	<div class="container">
		<div class='col-md-5'>
			<div class="form-group">
				<div class='input-group date' id='datetimepicker6'>
					<input type='text' class="form-control" value='check' /> <span
						class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>
		</div>
		<div class='col-md-5'>
			<div class="form-group">
				<div class='input-group date' id='datetimepicker7'>
					<input type='text' class="form-control" value='泥댄�ъ����' /> <span
						class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"></span>
					</span>
				</div>
			</div>
		</div>
	</div>

	<ol class="breadcrumb">
		<li class="breadcrumb-item active">현재 이용 가능 객실</li>
	</ol>
	<div class="row">
		<div class="col-md-7">
			<a href="room1detail.jsp"> <img
				class="img-fluid rounded mb-3 mb-md-0" src="../img/koong.jpg" alt=""></a>
		</div>
		<div class="col-md-5">
			<h3>Deluxe</h3>
			<p>그냥 그냥 디럭스</p>
			<a class="btn btn-primary" href="reservation_confirm.jsp">예약하기<span
				class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-md-7">
			<a href="room2detail.jsp"> <img class ="img-fluid rounded mb-3 mb-md-0" src="../img/koong.jpg" alt=""></a>
		</div>
		<div class="col-md-5">
			<h3>Grand Deluxe</h3>
			<p>좋은 좋은 디럭스</p>
			<a class="btn btn-primary" href="reservation_confirm.jsp">예약하기<span
				class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
	</div>
	<hr>
	<div class="row">
		<div class="col-md-7">
			<a href="room3detail.jsp"> <img class ="img-fluid rounded mb-3 mb-md-0" src="../img/koong.jpg" alt=""></a>
		</div>
		<div class="col-md-5">
			<h3>Suite Room</h3>
			<p>제일 제일 좋은 룸</p>
			<a class="btn btn-primary" href="reservation_confirm.jsp">예약하기<span
				class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
	</div>
	<hr>

</body>
</html>