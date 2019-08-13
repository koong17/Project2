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
	
	<!-- hs CSS -->
	<link href="/hotel/css/hs.css?after" rel="stylesheet">
	
	
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- datePicker -->
	<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script> -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="/hotel/js/daterangepicker.js"></script>
	<link rel="stylesheet" type="text/css" href="/hotel/css/daterangepicker.css?after" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
	
	<!-- Hyesoo JavaScript -->
	<script src="/hotel/js/hidden.js"></script>
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
					<option selected >인원수</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
			</select></td>
			
			<!-- 검색 submit 버튼 -->
			<td class='m'><div>
 			<button class="btn btn-primary" id="searchbtn" onclick="">검색</button></div></td>
 			</tr>
 		</table>
			
		</ul> 
		<!-- </form> 예약바 끝 -->
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

  
  <!--  kakaologout js -->
  <script src="js/inho.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

</body>

</html>
