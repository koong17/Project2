<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hotel.tikki.member.model.*" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>HOTEL TIKKI</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="vendor/bootstrap/css/inho.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css" rel="stylesheet">
<script src="js/inho.js"></script>
</head>
<c:if test="${ sessionScope.id != null}">
	<c:redirect url="index.go" />
</c:if>
<body>
	<!------ Include the above in your HEAD tag ---------->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.go">TIKKI</a> <a
				class="navbar-login" href="login.go">로그인</a> <a
				class="navbar-login" href="join.go">회원가입</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="about.html">호텔소개</a>
						<!-- About 에 contact map--></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" aria-haspopup="true"
						aria-expanded="false"> 객실소개 </a>
					<!--  포트폴리오1 -> single portfolio item -->
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="portfolio-item.html">room1</a> <a
								class="dropdown-item" href="portfolio-item.html">room1</a> <a
								class="dropdown-item" href="portfolio-item.html">room3</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						href="full-width.html">예약</a> <!-- full width --></li>
					<li class="nav-item"><a class="nav-link"
						href="portfolio-1-col.html">고객문의</a> <!--  포트폴리오1 수정 --></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- ./nav -->
	<header>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('img/koong.jpg'); height: 765px;">
          <div class="carousel-login d-none d-md-block">
          	<div class="container" align="center">
				<div class="rows" style="margin-top: 20px;" >
					<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
						<form role="form" action="loginPro.go" name="loginform" method="post">
							<fieldset>
								<h2>TIKKI에 오신 것을 환영합니다.</h2>
								<!-- <hr class="colorgraph"> -->
								<c:if test="${ result == -1 }">
									<script type="text/javascript">
										alert("아이디나 비밀번호가 틀렸습니다.");
									</script>
								</c:if>
								<div class="form-group">
									<input type="email" name="email" id="email"
										class="form-control input-lg" placeholder="Email Address" required="required">
								</div>
								<div class="form-group">
									<input type="password" name="password" id="password"
										class="form-control input-lg" placeholder="Password"  required="required">
								</div>
								<!-- <span class="button-checkbox">
							<button type="button" class="btn" data-color="info">Remember Me</button>
		                    <input type="checkbox" name="remember_me" id="remember_me" checked="checked" class="hidden">
							<a href="" class="btn btn-link pull-right">Forgot Password?</a>
						</span> -->
								<!-- <hr class="colorgraph"> -->
								<div class="row">
									<div class="col-xs-6 col-sm-6 col-md-6">
										<input type="submit" class="btn btn-lg btn-success btn-block"
											value="로그인">
									</div>
									<div class="col-xs-6 col-sm-6 col-md-6">
										<a href="join.go" class="btn btn-lg btn-primary btn-block">회원가입</a>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
          </div>
        </div>
      </div>
  </header>
  
   <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>
 
</body>
</html>