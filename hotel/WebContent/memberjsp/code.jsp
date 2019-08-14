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
<body>
<jsp:include page="/navigation.jsp"/>
<header>
	<div class="carousel-inner" role="listbox">
		<!-- Slide One - Set the background image for this slide in the line below -->

<div class="carousel-item active" id="headerheight"
	style="background-image: url('img/hotel.jpg');">
<div class="carousel-pwd d-none d-md-block">
	<div class="container" align="center">
		<div class="rows" style="margin-top: 20px;">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<form role="form" action="codePro.go" name="codeform"
					method="post">
					<fieldset>
						<h2>인증 코드를 <br> 입력해주세요.</h2>
						<p>
						<!-- <hr class="colorgraph"> -->
						<div class="form-group">
							<input type="text" name="code" id="code"
								class="form-control input-lg" placeholder="code"
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
									class="btn btn-success btn-lg btn-block" value="확인">
							</div>

							<div class="col-xs-6 col-sm-6 col-md-6">
										<input type="reset" class="btn btn-lg btn-primary btn-block" value="취소">
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
</body>
</html>