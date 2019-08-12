<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
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
<link href="/hotel/vendor/bootstrap/css/bootstrap.min.css?after"
	rel="stylesheet">

<!-- Custom styles for this template -->

<link href="/hotel/css/modern-business.css?after" rel="stylesheet">

<!-- board 전용 css -->
<link href="/hotel/css/boardForm.css?after" rel="stylesheet">

<!-- 모든 페이지에 들어가야 함 -->
<link href="/hotel/vendor/bootstrap/css/inho.css?after" rel="stylesheet">

<!-- Bootstrap core JavaScript -->
<script src="/hotel/vendor/jquery/jquery.min.js"></script>
<script src="/hotel/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</head>

<script>
    
    
    
    // Perform an asynchronous HTTP (Ajax) request.
    // 비동기 통신 Ajax를 Setting한다.
    $.ajaxSetup({
        type:"POST",
        async:true,
        dataType:"json",
        error:function(xhr) {
            console.log("error html = " + xhr.statusText);
        }
    });
    
    $(document).ready(function() {
        $("#commentWrite").on("click", function() {
        	console.log("click");
            $.ajax({
                url:"/hotel/cmntWriteForm.do",
                // data:{}에서는 EL을 ""로 감싸야 한다. 이외에는 그냥 사용한다.
                data:{
                    cmnt_content:$("#cmnt_content").val(),
                    board_num:"${ vo.board_num }"
                },
                beforeSend:function() {
                    console.log("시작 전...");
                },
                complete:function() {
                    console.log("완료 후...");
                },
                success:function(data) {            // 서버에 대한 정상응답이 오면 실행, callback
                    if(data.result == 1) {            // 쿼리 정상 완료, executeUpdate 결과
                        console.log("comment가 정상적으로 입력되었습니다.");
                        $("#cmnt_content").val("");
                        showHtml(data.comments); // selectComments() 결과
                    }
                }
            })
        });
        
        readComments();
    });
    
    function updateCmnt(input_cmnt_num) {
        $.ajax({
            url:"/hotel/cmntUpdate.do",
            // data:{}에서는 EL을 ""로 감싸야 한다. 이외에는 그냥 사용한다.
            data:{
            	cmnt_num: input_cmnt_num,
            	board_num: "${ vo.board_num }",
            	cmnt_content: $("#cmnt_update_content").val()
            },
            beforeSend:function() {
                console.log("시작 전...");
            },
            complete:function() {
                console.log("완료 후...");
            },
            success:function() {            // 서버에 대한 정상응답이 오면 실행, callback
                console.log("comment가 정상적으로 수정되었습니다.");
                readComments();
            }
        });
    }
    
    function readComments() {
        $.ajax({
            url:"/hotel/cmntReadForm.do",
            data:{
                board_num:"${ vo.board_num }"
            },
            beforeSend:function() {
                console.log("읽어오기 시작 전...");
            },
            complete:function() {
                console.log("읽어오기 완료 후...");
            },
            success:function(data) {
                console.log("comment를 정상적으로 조회하였습니다.");
                showHtml(data);
                
                let position = $("#showComment table tr:last").position();
                // $('html, body').animate({scrollTop : position.top}, 400);  // 두 번째 param은 스크롤 이동하는 시간
            }
        });
    }
    
    function updateCmntRead(input_cmnt_num) {
        $.ajax({
            url:"/hotel/cmntReadForm.do",
            data:{
                board_num:"${ vo.board_num }"
            },
            beforeSend:function() {
                console.log("읽어오기 시작 전...");
            },
            complete:function() {
                console.log("읽어오기 완료 후...");
            },
            success:function(data) {
                console.log("comment를 정상적으로 조회하였습니다.");
                updateCmntForm(data, input_cmnt_num);
                
                let position = $("#showComment table tr:last").position();
                // $('html, body').animate({scrollTop : position.top}, 400);  // 두 번째 param은 스크롤 이동하는 시간
            }
        });
    }
 
    function showHtml(data) {
        let html = "<table class='table2' style='margin-top: 10px;'><tbody>";
        $.each(data, function(index, vo) {
            html += "<tr align='center'>";
            html += "<td width='30px'>" + vo.cmnt_num + "</td>";
            html += "<td width='80px'>" + vo.cmnt_nick + "</td>";
            console.log(vo.cmnt_nick);
            html += "<td align='left' width='450px'>" + vo.cmnt_content + "</td>";
            let presentDay = vo.cmnt_date.substring(5, 10);

            html += "<td width='50px'>" + presentDay + "</td>";
            if( vo.cmnt_nick == '${nick}' || '${nick}'=='god') { // 관리자 닉네임으로 바꿀 것

             	console.log('들어왔습니다.');
             	html +=  "<td width='140px'><input type='button' value='수정' class='btn btn-secondary' onclick='updateCmntRead("+ vo.cmnt_num +")'>"
             	+" &nbsp;<input type='button' value='삭제' class='btn btn-secondary' onclick='deleteCmnt("+ vo.cmnt_num +")' ></td>";
            }
            html += "</tr>";
        });
        html += "</tbody></table>";
        
        $("#showComment").html(html);
        $("#commentContent").val("");
        $("#commentContent").focus();
    }
    
    function updateCmntForm(data, input_cmnt_num) {
    	 let html = "<table class='table2' style='margin-top: 10px'><tbody>";
         $.each(data, function(index, vo) {
        	 if(input_cmnt_num == vo.cmnt_num){
        		 html += "<tr align='center'>";
        		 html += "<td height='30' width = '1000' colspan='6'>";
        		 html += "<div class='input-group' role='group' aria-label='...' style='margin-top: 10px; width: 100%;'>";
				 html += "<c:if test='${sessionScope.nick != null}'>";
				 html += "<textarea class='form-control' rows='3' id='cmnt_update_content' placeholder='댓글을 입력하세요.' style='width: 100%;'></textarea>";
				 html += "<input type='button' class='btn btn-secondary button-right-fix' value='댓글 수정' onclick='updateCmnt("+vo.cmnt_num+")''>";
				 html += "</c:if></div></td>";
        	 } else {
	             html += "<tr align='center'>";
	             html += "<td width='40px'>" + vo.cmnt_num + "</td>";
	             html += "<td width='80px'>" + vo.cmnt_nick + "</td>";
	             console.log(vo.cmnt_nick);
	             html += "<td align='left' width='700px'>" + vo.cmnt_content + "</td>";
	             let presentDay = vo.cmnt_date.substring(5, 10);
	             html += "<td width='70px'>" + presentDay + "</td>";
	             if( vo.cmnt_nick == "zi") { // 관리자 닉네임으로 바꿀 것
	              	console.log('들어왔습니다.');
	              	
	              	html +=  "<td width='200px'><input type='button' value='수정' class='btn btn-secondary' onclick='updateCmntRead("+ vo.cmnt_num +")'>"
	              	+" &nbsp;<input type='button' value='삭제' class='btn btn-secondary' onclick='deleteCmnt("+ vo.cmnt_num +")' ></td>";
	             }
	             html += "</tr>";
        		 
        	 }
         });
         html += "</tbody></table>";
         
         $("#showComment").html(html);
         // $("#commentContent").val("");
         $("#commentContent").focus();
    }
    
    function deleteCmnt(input_cmnt_num) {
        $.ajax({
            url:"/hotel/cmntDelete.do",
            // data:{}에서는 EL을 ""로 감싸야 한다. 이외에는 그냥 사용한다.
            data:{
            	cmnt_num: input_cmnt_num,
            	board_num: "${ vo.board_num }"
            },
            beforeSend:function() {
                console.log("시작 전...");
            },
            complete:function() {
                console.log("완료 후...");
            },
            success:function() {            // 서버에 대한 정상응답이 오면 실행, callback
                console.log("comment가 정상적으로 삭제되었습니다.");
                readComments();
            }
        });
    }

    
</script>
<link href="/hotel/css/modern-business.css?after" rel="stylesheet">

<!-- board 전용 css -->
<link href="/hotel/css/boardForm.css?after" rel="stylesheet">

<!-- 모든 페이지에 들어가야 함 -->
<link href="/hotel/vendor/bootstrap/css/inho.css?after" rel="stylesheet">
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.go">TIKKI</a>
      <c:if test="${ sessionScope.id == null}">
      <a class="navbar-login" href="login.go">로그인</a>
      <a class="navbar-login" href="join.go">회원가입</a>
      </c:if>
      <c:if test="${ sessionScope.id != null}">
      <a class="navbar-login" href="logout.go"><small>로그아웃</small></a>
      </c:if>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="information/about.html">호텔소개</a> <!-- About 에 contact map-->
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" aria-haspopup="true" aria-expanded="false">
              객실소개
            </a><!--  포트폴리오1 -> single portfolio item -->
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="/hotel/reservation/room1detail.html">room1</a>
              <a class="dropdown-item" href="/hotel/reservation/room2detail.html">room2</a>
              <a class="dropdown-item" href="/hotel/reservation/room3detail.html">room3</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/hotel/reservation/reservation.html">예약</a> <!-- full width -->
          </li>
          <li class="nav-item">
            <a class="nav-link" href="list.do">고객문의</a> <!--  포트폴리오1 수정 -->
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- ./nav -->

  <!-- Page Content -->
  <div class="container" style="min-height:793px">

	<center>
	
	  
      <!-- Page Heading/Breadcrumbs -->
    <br><br>
    <ol class="breadcrumb2">
      <li class="breadcrumb-item active">Home /</li>
      </li>
      <li class="breadcrumb2-item">
      	<a href="list.do"> &nbsp;회원관리 목록</a>
      </li>
    </ol>
	

	<form>
		<table cellspacing = "0" cellpadding = "0" 
		 align="center" class="table-content">
		 
      <input type="hidden" id=session_nick value=${sessionScope.nick }>
		 
			<!-- ---------------------------------------------------------------------------------------- -->
			
			<tr height="30" width = "1000">
				<td align="center" width = "20" >글번호</td>
				<td align="center" width = "10"> ${ vo.board_num }</td>
				<td align="center" width = "20" >글제목</td>
				<td align="center" width = "150">${ vo.board_title } </td>
				<td align="center" width = "20" >작성자</td>
				<td align="center" width = "30">${ vo.board_nick } </td>
				
			</tr>
			<!-- ---------------------------------------------------------------------------------------- -->

			<tr>
				<td height="300" width = "1000" colspan="6"><pre>${ vo.board_content }</pre></td>
			</tr>
			
			<c:if test="${ sessionScope.id != null && sessionScope.nick == 'god'}">
				<tr>
					<td height="50" width = "1000" colspan="6"> <!-- 원래 pre 있던 자리 -->  <!--  -->
						<div class="input-group" role="group" aria-label="..." style="margin-top: 10px; width: 100%;">
						    <c:if test="${sessionScope.nick != null}">
							    <textarea class="form-control" rows="5" id="cmnt_content" 
							    placeholder="댓글을 입력하세요." style="width: 100%;"></textarea>
							    
						        <input type="button" class="btn btn-secondary button-right-fix" value="댓글 쓰기" id="commentWrite">
						        
						    </c:if>
						 		
						</div>
					</td>
				</tr>	
			</c:if>
			
			<!-- ---------------------------------------------------------------------------------------- -->
			<c:if test="${ vo.cmnt_count != 0 }">
				<tr>
					<td width = "1000" colspan="6">
						
					   <div id="showComment" style="text-align: center;">
					   <!-- 여기에서 댓글읽기 -->
					   </div>
						
					</td>
				</tr>
			</c:if>
			<!-- ---------------------------------------------------------------------------------------- -->
			<!-- 글수정 글삭제 목록보기 버튼 -->
			
			<tr height ="30">
				<td colspan="7" align="right" >
				  <c:if test="${ sessionScope.nick == vo.board_nick || sessionScope.nick == 'god'}">
					<input type="button" class="btn btn-primary" value="글수정" 
						   onclick="document.location.href='updateForm.do?board_num=${ vo.board_num }&pageNum=${ pageNum }'"> 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type ="button" class="btn btn-primary" value ="글삭제" 
						   onclick="document.location.href='deleteForm.do?board_num=${ vo.board_num }&pageNum=${ pageNum }'">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			      </c:if>
					<input type = "button" class="btn btn-primary" value ="목록 보기" onclick="document.location.href='list.do?pageNum=${ pageNum }'"> 
				</td>
			</tr>
			
		</table>
	</form>
	</center>
	
	
  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark" id="hotel-footer-fix-boardContent">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>


</body>

</html>





















