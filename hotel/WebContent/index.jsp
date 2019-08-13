<%@ page language="java" contentType="text/html; charset=UTF-8"
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

<jsp:include page="navigation.jsp"/>
 

  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('img/hotel1.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>TIKKI</h3>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('img/hotel2.jpg')">
          <div class="carousel-caption d-none d-md-block">
          <h3>TIKKI</h3>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('img/hotel3.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>TIKKI</h3>
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
        <img class="img-fluid rounded" src="/hotel/img/tikki.png" alt="">
      </div>
    </div>
  </div>
  <!-- /.container -->
  <p>

  <jsp:include page="footer.jsp"/>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  <!--  kakaologout js -->
  <script src="js/inho.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</body>

</html>
