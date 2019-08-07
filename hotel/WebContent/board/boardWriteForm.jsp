<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>HOTEL TIKKI</title>

  <!-- Bootstrap core CSS -->
  <link href="/hotel/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet">

  <!-- Custom styles for this template -->
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
  <div class="container" style="height: 800px">

	<!-- 내용 채우기 -->
	
	<form action = "writePro.do" method="post" name = "writeform" onsubmit="return writeSave()">
		<input type="hidden" name="board_nick" value="${ sessionScope.nick }" >
		
		<table>
		
		<tr><td width="200"><h1 class="mt-4 mb-3">&emsp;글쓰기</h1></td></tr>
		
		<!-- <tr> 
			<td width="70" align = "center"> <label for="board_nick"> 닉 네 임</label></td>
			<td width="730">
			<input type="text" class="form-control" size= "10" maxlength="10" name ="board_nick" placeholder="닉네임을 입력하세요">
			</td>
		</tr>  -->
		<tr> <!-- 제목 -->
			<td width="70" align = "center" required> 제  목</td>
			<td width="730">
			<input type="text" class="form-control" size= "35" maxlength="30" 
			name ="board_title" placeholder="제목을 입력하세요">
			</td>
		</tr>
		<!--  --------------------------------------------------------------------------------------------- -->
		<tr>
			<td width="70" align = "center"> 내  용</td>
			<td width="730"><textarea class="form-control" rows="15" cols="80" name ="board_content" ></textarea>
			</td>
		</tr>
	</table>
			
		<br>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
  		<input type="button" class="btn btn-primary btn-lg" 
  		onclick="document.location.href='list.do?pageNum=${ pageNum }'" value="목록가기"></input>
  		
 	    <button type="submit" class="btn btn-primary btn-lg" id="button-right-fix">제출</button>

		
		
	</form>
	

  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/hotel/vendor/jquery/jquery.min.js"></script>
  <script src="/hotel/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
