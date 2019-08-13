<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="/hotel/vendor/bootstrap/css/inho.css?after" rel="stylesheet">
 <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="../index.go">TIKKI</a>
      <c:if test="${ sessionScope.id == null }">
      <a class="navbar-login" href="../login.go" style="margin-right: 15px"><small>로그인</small></a>
      <a class="navbar-login" href="../join.go"><small>회원가입</small></a>
      </c:if>
      <c:if test="${ sessionScope.id != null && sessionScope.kakaonick == null}">
	      <a class="navbar-login" href="../logout.go" style="margin-right: 15px"><small>로그아웃</small></a>
	      <div>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown">
					<a class="navbar-login dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" aria-haspopup="true"
						aria-expanded="false"><small>${sessionScope.nick}님 페이지 </small> </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="../update.go">회원수정</a>
							<a class="dropdown-item" href="../updatePassword.go">비밀번호수정</a>  
							<a class="dropdown-item" href="../delete.go">회원탈퇴</a> 
							<a class="dropdown-item" href="../mypage.to?nickname=${ sessionScope.nick }">예약확인</a>
						</div>
					</li>
				</ul>
	      </div>	
      </c:if>
      <c:if test="${ sessionScope.kakaonick != null}">
      	<a class="navbar-login" href="../logout.kakao" onclick="kakaologout()"><small>카카오 로그아웃</small></a>
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
            <a class="nav-link" href="/hotel/information/about.jsp">호텔소개</a> <!-- About 에 contact map-->
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" aria-haspopup="true" aria-expanded="false">
              객실소개
            </a><!--  포트폴리오1 -> single portfolio item -->
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="/hotel/room1detail.to">Deluxe</a>
              <a class="dropdown-item" href="/hotel/room2detail.to">Grand Deluxe</a>
              <a class="dropdown-item" href="/hotel/room3detail.to">Suite</a>
            </div>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="../reserve.to">예약</a> 
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../list.do">고객문의</a> 
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- ./nav -->
  