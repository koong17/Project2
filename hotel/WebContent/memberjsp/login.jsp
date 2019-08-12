<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="hotel.tikki.member.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet">
<link href="vendor/bootstrap/css/inho.css?after" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/modern-business.css?after" rel="stylesheet">
<link href="/hotel/css/boardForm.css?after" rel="stylesheet">
<script src="vendor/jquery/jquery.min.js?after"></script>
<script src="js/inho.js?after"></script>
</head>
<c:if test="${ sessionScope.id != null}">
	<c:redirect url="index.go" />
</c:if>
<body>
<jsp:include page="/navigation.jsp"/>
<header>
	<div class="carousel-inner" role="listbox">
		<!-- Slide One - Set the background image for this slide in the line below -->

<div class="carousel-item active" id="headerheight"
	style="background-image: url('img/koong.jpg');">
<div class="carousel-login d-none d-md-block">
	<div class="container" align="center">
		<div class="rows" style="margin-top: 20px;">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form" action="loginPro.go" name="loginform"
					method="post">
					<fieldset>
						<h2>TIKKI에 오신 것을 <br> 환영합니다.</h2>
						<p>
						<!-- <hr class="colorgraph"> -->
						<div class="form-group">
							<input type="email" name="email" id="email"
								class="form-control input-lg" placeholder="Email Address"
								required="required">
						</div>
						<div class="form-group">
							<input type="password" name="password" id="password"
								class="form-control input-lg" placeholder="Password"
								required="required">
						</div>
						<!-- <span class="button-checkbox">
			<button type="button" class="btn" data-color="info">Remember Me</button>
                  <input type="checkbox" name="remember_me" id="remember_me" checked="checked" class="hidden">
			<a href="" class="btn btn-link pull-right">Forgot Password?</a>
		</span> -->
						<!-- <hr class="colorgraph"> -->
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="submit"
									class="btn btn-success btn-lg btn-block" value="로그인">
							</div>

							<div class="col-xs-6 col-sm-6 col-md-6">
								<a href="join.go" class="btn btn-primary btn-lg btn-block">회원가입</a>
							</div>
							<div style="width: 100%; margin-top: 20px;">
								<a href="https://kauth.kakao.com/oauth/authorize?client_id=ec92d2854a2481b9f4735c5c1164cc8b&redirect_uri=http://10.10.10.177:8080/hotel/oauth&response_type=code" onclick="kakaologinform()">
									<img src="img/kakao_account_login_btn_medium_wide.png" />
								</a>
							</div>
							<div style="width: 100%;" align="center">
								<a class="navbar-login" href="find.go" style="color: white;">비밀번호 잊으셨나요?</a>
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
<jsp:include page="/footer.jsp"/>
	<script src="js/inho.js"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</body>
</html>