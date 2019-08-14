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

<!-- hs CSS -->
<link href="/hotel/css/hs.css?after" rel="stylesheet">

<!-- datePicker -->
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script> -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="/hotel/js/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="/hotel/css/daterangepicker.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>

<!-- Hyesoo JavaScript -->
<script src="/hotel/js/hidden.js"></script>

<!-- inho CSS -->
<link href="/hotel/vendor/bootstrap/css/inho.css?after" rel="stylesheet">

<!-- minjee.css -->
<link href="/hotel/css/minjee.css?after" rel="stylesheet">

</head>

<body>

	<jsp:include page="/navigation.jsp"/>


	<!-- Page Content -->
	<div class="container" id="f" style="min-height: 750px;">

		<!-- Page Head -->
		<h1 class="mt-4 mb-3">예약 Reservation</h1>
		<!-- 예약 바 -->
		<ul class="breadcrumb">
		<table><tr>
		
     	   <td class='m'>
 			<div class='input-group date'>
				<input type="text" style="width: 250px;" class="form-control" name="daterange" id="daterange" placeholder="  체크인  -  체크아웃">
			</div></td>
     	   
     	    
			<!-- 인원수 -->
			<td class='m'>
			<select class="browser-default custom-select" style="width: 120px;" id="peopleNum" required="required">
					<option selected="selected" >인원수</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
			</select></td>
			
			<!-- 검색 submit 버튼 -->
			<td class='m'><div>
 			<button class="btn btn-primary" id="searchbtn">검색</button></div></td>
 			</tr>
 		</table>
			
		</ul> 
		<!-- </form> 예약바 끝 -->
 	<!-- 객실정보 -->
			<div id="showShow" ></div>
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
			if( daterange != null && peopleNum != "인원수" ) {
                $('#daterange').val("${daterange}");
                $('#peopleNum').val("${peopleNum}");
                if($( '#daterange' ).val().substr(0,10) == $( '#daterange' ).val().substr(13,23)) {
					alert("체크인 날짜와 체크아웃 날짜가 같습니다. 다시 선택해주세요.");
            	} else if( $("#peopleNum").val() == 1 || $("#peopleNum").val() == 2 || $("#peopleNum").val() == 3 || $("#peopleNum").val() == 4 ) {
					$.ajax({
			            url:"/hotel/reserveForm.to",			//"/hotel/cmntUpdate.do"
			            				// data:{}에서는 EL을 ""로 감싸야 한다. 이외에는 그냥 사용한다.
			            data:{ 			// 사용할 data 다 넣기 ex)cmnt_num: input_cmnt_num, board_num: "${ vo.board_num }", cmnt_content: $("#cmnt_update_content").val()
			            	
			            	daterange: "${daterange}",
			            	peopleNum: "${peopleNum}"
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
					alert("인원수를 입력해야 합니다.");
				}
			}
			
			$("#searchbtn").click(function() {
				console.log($( '#daterange' ).val().substr(0,10));
				console.log($( '#daterange' ).val().substr(13,23));
				if($( '#daterange' ).val().substr(0,10) == $( '#daterange' ).val().substr(13,23)) {
					alert("체크인 날짜와 체크아웃 날짜가 같습니다. 다시 선택해주세요.");
            	} else if($("#daterange").val() != "" && $("#peopleNum").val() != "인원수" && $("#peopleNum").val() != null) {
					 $.ajax({
			            url:"/hotel/reserveForm.to",			//"/hotel/cmntUpdate.do"
			            				// data:{}에서는 EL을 ""로 감싸야 한다. 이외에는 그냥 사용한다.
			            data:{ 			// 사용할 data 다 넣기 ex)cmnt_num: input_cmnt_num, board_num: "${ vo.board_num }", cmnt_content: $("#cmnt_update_content").val()
			            	
			            	daterange: $("#daterange").val(),
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
			if(data.length == 0) {
				html += '<ol class="breadcrumb"><li class="breadcrumb-item active">현재 이용 가능한 객실이 없습니다.</li></ol>';
			} else {
				html += '<ol class="breadcrumb"><li class="breadcrumb-item active">현재 이용 가능 객실</li></ol>';
				$.each(data, function(index, roomNum ) {
					console.log(roomNum);
					if(roomNum=='1') {
						html += '<div class="row"><div class="col-md-7"><a href="room1detail.to">' ;
						html += '<img class="img-fluid rounded mb-3 mb-md-0" src="/hotel/img/deluxe.jpg" alt="">';
						html += '</a></div><div class="col-md-5"><h3>Deluxe</h3><p>그냥 그냥 디럭스</p>';
					    if( ${ sessionScope.id == null} ){
		                     html += '<a href="/hotel/login.go"><button type="button" class="btn btn-primary">예약하기</button></a></div></div>'; //alert("1 로그인 후 이용해 주십시오.");
		                } else {
						html += '<a href="confirmForm.to?checkIn='+$( '#daterange' ).val().substr(0,10)+'&checkOut='+$( '#daterange' ).val().substr(13,23)+'&peopleNum='+$("#peopleNum").val()+'&nick='+'${ sessionScope.nick }'+'&roomType=deluxe"><button type="button" class="btn btn-primary">예약하기</button>';
		                }
						html += '</a></div></div>';
					} else if(roomNum=='2') {
						html += '<div class="row"><div class="col-md-7"><a href="room2detail.to"> <img';
						html += ' class="img-fluid rounded mb-3 mb-md-0" src="/hotel/img/grand.jpg" alt=""></a></div>';
						html += '<div class="col-md-5"><h3>Grand Deluxe</h3><p>좋은 좋은 디럭스</p>';
							if( ${ sessionScope.id == null} ){
								html += '<a href="/hotel/login.go"><button type="button" class="btn btn-primary">예약하기</button></a></div></div>';// alert("2 로그인 후 이용해 주십시오.");
							} else {
								html += '<a href="confirmForm.to?checkIn='+$( '#daterange' ).val().substr(0,10)+'&checkOut='+$( '#daterange' ).val().substr(13,23)+'&peopleNum='+$("#peopleNum").val()+'&nick='+'${ sessionScope.nick }'+'&roomType=grand"><button type="button" class="btn btn-primary">예약하기</button>';
							}
						html += '</a></div></div>';
					} else if(roomNum=='3') {
						html += '<div class="row"><div class="col-md-7"><a href="room3detail.to"> <img';
						html += ' class="img-fluid rounded mb-3 mb-md-0" src="/hotel/img/suite.jpg" alt="">';
						html += '</a></div><div class="col-md-5"><h3>Suite</h3><p>제일 좋은 방</p>';
							if( ${ sessionScope.id == null} ){
								html += '<a href="/hotel/login.go"><button type="button" class="btn btn-primary">예약하기</button></a></div></div>';// alert("3 로그인 후 이용해 주십시오.");
							} else {
								html += '<a href="confirmForm.to?checkIn='+$( '#daterange' ).val().substr(0,10)+'&checkOut='+$( '#daterange' ).val().substr(13,23)+'&peopleNum='+$("#peopleNum").val()+'&nick='+'${ sessionScope.nick }'+'&roomType=suite"><button type="button" class="btn btn-primary">예약하기</button>';
							}
						html += '</a></div></div>';
	
					}
					html += '<hr>';
				});
			}
			console.log(html);
			$("#showShow").html(html);
		}
		
	</script>
	<!-- 예약 바 끝 -->

	<jsp:include page="/footer.jsp"/>

</body>

</html>
