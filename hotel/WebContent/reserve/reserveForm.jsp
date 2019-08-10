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
<link href="/hotel/css/hs.css?after" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="/hotel/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/hotel/css/modern-business.css?after" rel="stylesheet">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
	href="/hotel/vendor/bootstrap/css/style.css?after" />

<!-- Bootstrap core JavaScript -->
<script src="/hotel/vendor/jquery/jquery.js"></script>
<script src="/hotel/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>

<!-- datePicker -->
<!-- <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css?after" />
</head>

<!-- 
<script src="https://code.jquery.com/jquery-3.2.1.js" > </script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js" ></script> 
-->


<!-- Hyesoo JavaScript -->
<script src="/hotel/js/hidden.js"></script>

</head>

<body>

	<jsp:include page="/navigation.jsp"/>


	<!-- Page Content -->
	<div class="container" id="f">

		<!-- Page Head -->
		<h1 class="mt-4 mb-3">예약 Reservation</h1>
		<!-- 예약 바 -->
		<ul class="breadcrumb">
		<table><tr>
			<!-- 체크인 -->
			<div class ='col-md-3'>
            <div class='input-group date ' id='datetimepicker6'>
                <input type="text" class="form-control" placeholder="체크인" id="checkIn" />
                <span class="input-group-addon">
               		<span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div></div>
			<!-- 체크아웃 -->
			<div class ='col-md-3'>
            <div class='input-group date' id='datetimepicker7'>
                <input type='text' class="form-control" placeholder="체크아웃" id="checkOut" />
                 <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
     	   </div></div>
     	   
     	    
			<!-- 인원수 -->
			<td class='m'>
			<select class="browser-default custom-select" id="peopleNum" required="required">
					<option selected >인원수</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
			</select></td>
			
			<!-- 검색 submit 버튼 -->
			<td class='m'><div>
 			<button class="btn btn-primary" id="searchbtn">검색</button></div></td>
 		</tr></table>
		</ul> 
		<!-- </form> -->
	</div>
	
	<script>
	    $.ajaxSetup({
	        type:"POST",
	        async:true,
	        dataType:"json",
	        error:function(xhr) {
	            console.log("error html = " + xhr.statusText);
	        }
	    });
	
		$(document).ready(function(){
			$("#searchbtn").click(function() {
				// $("#showShow").show();
				if($("#checkIn").val() != "" && $("#checkOut").val() != "" && $("#peopleNum").val() != "인원수") {
					 $.ajax({
			            url:"/hotel/reserveForm.to",			//"/hotel/cmntUpdate.do"
			            
			            				// data:{}에서는 EL을 ""로 감싸야 한다. 이외에는 그냥 사용한다.
			            data:{ 			// 사용할 data 다 넣기 ex)cmnt_num: input_cmnt_num, board_num: "${ vo.board_num }", cmnt_content: $("#cmnt_update_content").val()
			            	checkIn: $("#checkIn").val(),
			            	checkOut: $("#checkOut").val(),
			            	peopleNum: $("#peopleNum").val()
			            },
			            beforeSend:function() {
			                console.log("시작 전...");
			            },
			            complete:function() {
			                console.log("완료 후...");
			            },
			            success:function(data) {            // 서버에 대한 정상응답이 오면 실행, callback
			                console.log("comment가 정상적으로 수정되었습니다.");
			            	
			                show(data);
			            	// view 영역의 것들
			            }
			        });
				} else {
					alert("정보를 전부 입력해야 합니다.");
				}
			});
		});
		
		function show(data) {
			let html = "";
			html += '<ol class="breadcrumb"><li class="breadcrumb-item active">현재 이용 가능 객실</li></ol>';
			
			$.each(data, function(index, roomNum ) {
				console.log(roomNum);
				if(roomNum=='1') {
					html += '<div class="row"><div class="col-md-7"><a href="room1detail.jsp"> <img';
					html += ' class="img-fluid rounded mb-3 mb-md-0" src="/hotel/img/koong.jpg" alt="">';
					html += '</a></div><div class="col-md-5"><h3>Deluxe</h3><p>그냥 그냥 디럭스</p>';
					html += '<a class="btn btn-primary" href="confirmForm.to?checkIn='+$( '#checkIn' ).val()+'&checkOut='+$( "#checkOut" ).val()+'&peopleNum='+$("#peopleNum").val()+'&nick='+'${ sessionScope.nick }'+'&roomType=deluxe">예약하기';
					html += '<span class="glyphicon glyphicon-chevron-right"></span></a></div></div>';
				} else if(roomNum=='2') {
					html += '<div class="row"><div class="col-md-7"><a href="room1detail.jsp"> <img';
					html += ' class="img-fluid rounded mb-3 mb-md-0" src="/hotel/img/koong.jpg" alt=""></a></div>';
					html += '<div class="col-md-5"><h3>Grand Deluxe</h3><p>좋은 좋은 디럭스</p>';
					html += '<a class="btn btn-primary" href="confirmForm.to?checkIn='+$( '#checkIn' ).val()+'&checkOut='+$( "#checkOut" ).val()+'&peopleNum='+$( "#peopleNum" ).val()+'&nick='+'${ sessionScope.nick}'+'&roomType=grand">예약하기';
					html += '<span class="glyphicon glyphicon-chevron-right"></span></a></div></div>';
				} else if(roomNum=='3') {
					html += '<div class="row"><div class="col-md-7"><a href="room3detail.jsp"> <img class="img-fluid rounded mb-3 mb-md-0" src="/hotel/img/koong.jpg" alt=""></a></div><div class="col-md-5"><h3>Suite Room</h3><p>제일 제일 좋은 룸</p><a class="btn btn-primary" href="confirmForm.to?checkIn='+$( '#checkIn' ).val()+'&checkOut='+$( "#checkOut" ).val()+'&peopleNum='+$( "#peopleNum" ).val()+'&nick='+'${ sessionScope.nick}'+'&roomType=suite">예약하기<span class="glyphicon glyphicon-chevron-right"></span></a></div></div>';
				}
				html += '<hr>';
			});
			console.log(html);
			$("#showShow").html(html);
			
		}
			
	</script>
	<!-- 예약 바 끝 -->
	
	<!-- 객실정보 -->
	<div class="container" id="showShow" >
<!-- 
		<ol class="breadcrumb">
			<li class="breadcrumb-item active">현재 이용 가능 객실</li>
		</ol>

		room1
		<div class="row">
			<div class="col-md-7">
				<a href="room1detail.jsp"> <img
					class="img-fluid rounded mb-3 mb-md-0" src="../img/koong.jpg" alt="">
				</a>
			</div>
			<div class="col-md-5">
				<h3>Deluxe</h3>
				<p>그냥 그냥 디럭스</p>
				<a class="btn btn-primary" href="reserveConfirmForm.jsp">예약하기
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
		/.row

		<hr>

		room2
		<div class="row">
			<div class="col-md-7">
				<a href="room2detail.jsp"> <img
					class="img-fluid rounded mb-3 mb-md-0" src="../img/koong.jpg" alt="">
				</a>
			</div>
			<div class="col-md-5">
				<h3>Grand Deluxe</h3>
				<p>좋은 좋은 디럭스</p>
				<a class="btn btn-primary" href="reserveConfirmForm.jsp">예약하기
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
		/.row

		<hr>

		room3
		<div class="row">
			<div class="col-md-7">
				<a href="room3detail.jsp"> <img
					class="img-fluid rounded mb-3 mb-md-0" src="../img/koong.jpg" alt="">
				</a>
			</div>
			<div class="col-md-5">
				<h3>Suite Room</h3>
				<p>제일 제일 좋은 룸</p>
				<a class="btn btn-primary" href="reserveConfirmForm.jsp">예약하기
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div> -->
	</div>
	<!-- 객실정보 끝-->

	<jsp:include page="/footer.jsp"/>

</body>

</html>
