<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="vendor/jquery/jquery.min.js?after"></script>
<script src="js/inho.js"></script>
</head>
<c:if test="${result == -1 }">
	<script type="text/javascript">
	<!--
		alert('인증 코드가 일치하지 않습니다.');
	//-->
	</script>
	<meta http-equiv="Refresh" content="0; url=code.go" />
</c:if>
<c:if test="${result == 1 }">
<body>
	<jsp:include page="/navigation.jsp"/>
	<header>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('img/hotel.jpg'); height: 833px;">
          <div class="carousel-join d-none d-md-block">
          	<div class="container" align="center">
				<div class="rows" style="margin-top: 20px;" >
					<div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
						<form role="form" method="post" name="codePasswordform" action="codePasswordPro.go" onsubmit="return passvalidate();">
							<fieldset>
								<h2>비밀번호 수정</h2>
								<!-- <hr class="colorgraph"> -->
								<div class="form-group">
									<input type="hidden" name="code" value="${ code }">
									<input type="password" name="password2" id="password2"
										class="form-control input-lg" placeholder="Reset Password" required="required" onkeyup="password2validate()" maxlength="16">
									<span id="password2Tag" style="color: white;"></span>
								</div>
								<div class="form-group">
									<input type="password" name="password" id="password"
										class="form-control input-lg" placeholder="Confirm Password" required="required" onkeyup="passwordvalidate()" maxlength="16">
									<span id="passwordTag" style="color: white;"></span>		
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
											value="수정">
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
</body>
</c:if>
</html>