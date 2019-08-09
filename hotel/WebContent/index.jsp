﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="UTF-8">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>HOTEL TIKKI</title>

  <!-- Bootstrap core CSS -->
	<link href="vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet">
	<link href="vendor/bootstrap/css/inho.css?after" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link href="css/modern-business.css?after" rel="stylesheet">
</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.go">TIKKI</a>
      <c:if test="${ sessionScope.id == null }">
      <a class="navbar-login" href="login.go"><small>로그인</small></a>
      <a class="navbar-login" href="join.go"><small>회원가입</small></a>
      </c:if>
      <c:if test="${ sessionScope.id != null && sessionScope.kakaonick == null}">
	      <a class="navbar-login" href="logout.go"><small>로그아웃</small></a>
	      <div>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown">
						<c:if test="${ sessionScope.nick == '관리자' }">
							<a class="navbar-login dropdown-toggle" href="#"
								id="navbarDropdownPortfolio" aria-haspopup="true"
								aria-expanded="false"><small>관리자 페이지</small> </a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownPortfolio">
									<a class="dropdown-item" href="memberList.admin">회원정보관리</a>
									<a class="dropdown-item" href="xxx.admin">예약관리</a>
								</div>
						</c:if>
						
						<c:if test="${ sessionScope.nick != '관리자' }">
							<a class="navbar-login dropdown-toggle" href="#"
								id="navbarDropdownPortfolio" aria-haspopup="true"
								aria-expanded="false"><small>${sessionScope.nick}님 페이지 </small> </a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownPortfolio">
									<a class="dropdown-item" href="update.go">회원수정</a>
									<a class="dropdown-item" href="updatePassword.go">비밀번호수정</a>  
									<a class="dropdown-item" href="delete.go">회원탈퇴</a> 
									<a class="dropdown-item" href="portfolio-item.html">예약확인</a>
								</div>
						</c:if>
					</li>
				</ul>
	      </div>	
      </c:if>
      <c:if test="${ sessionScope.kakaonick != null}">
      	<a class="navbar-login" href="logout.kakao" onclick="kakaologout()"><small>카카오 로그아웃</small></a>
      	<div>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown">
					<a class="navbar-login dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" aria-haspopup="true"
						aria-expanded="false"><small>${sessionScope.kakaonick}님 페이지 </small> </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="portfolio-item.html">예약확인</a>
						</div>
					</li>
				</ul>
	      </div>	
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
              <a class="dropdown-item" href="room1detail.html">room1</a>
              <a class="dropdown-item" href="room2detail.html">room2</a>
              <a class="dropdown-item" href="room3detail.html">room3</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="reservation.html">예약</a> <!-- full width -->
          </li>
          <li class="nav-item">
            <a class="nav-link" href="list.do">고객문의</a> <!--  포트폴리오1 수정 -->
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- ./nav -->
  
  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('img/koong.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>사진소개</h3>
            <p>어쩌구저쩌구~~~</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Second Slide</h3>
            <p>This is a description for the second slide.</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Third Slide</h3>
            <p>This is a description for the third slide.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>

  <p>
  <!-- Page Content -->
  <div class="container">

    <!-- Features Section -->
    <div class="row">
      <div class="col-lg-6">
        <h2>팀4</h2>
        <p>테스트임니다</p>
        <ul>
          <li>
            <strong>인ㅎㅗ</strong>
          </li>
          <li>민지</li>
          <li>수아</li>
          <li>지형</li>
          <li>혜수</li>
        </ul>
        <p>내용</p>
      </div>
      <div class="col-lg-6">
        <img class="img-fluid rounded" src="http://placehold.it/700x450" alt="">
      </div>
    </div>
  </div>
  <!-- /.container -->
  <p>

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <!--  kakaologout js -->
  <script src="js/inho.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</body>

</html>
