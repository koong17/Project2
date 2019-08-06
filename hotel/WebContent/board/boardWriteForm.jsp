<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>HOTEL TIKKI</title>

  <!-- Bootstrap core CSS -->
  <link href="/hotel/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/hotel/css/modern-business.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.html">TIKKI</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="about.html">호텔소개</a> <!-- About 에 contact map-->
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" aria-haspopup="true" aria-expanded="false">
              객실소개
            </a><!--  포트폴리오1 -> single portfolio item -->
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="information/Deluxe.html">Deluxe</a>
              <a class="dropdown-item" href="information/GrandDeluxe.html">Grand Deluxe</a>
              <a class="dropdown-item" href="information/SuiteRoom.html">Suite Room</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="full-width.html">예약</a> <!-- full width -->
          </li>
          <li class="nav-item">
            <a class="nav-link" href="board.jsp">고객문의</a> <!--  포트폴리오1 수정 -->
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- ./nav -->

  <!-- Page Content -->
  <div class="container" style="height: 700px">

	<!-- 내용 채우기 -->
	<center><b>글쓰기</b></center><br>
	<form action = "writePro.do" method="post" name = "writeform" onsubmit="return writeSave()">
	
		<table width='400' border='1' cellspacing='0' cellpadding='0' align="center">
		
		<tr>
			<td align = "right" colspan="2" >
			<a href = "boardList.jsp"> 글목록 보기</a>
			</td>
		</tr>
		<tr>
			<td width="70" align = "center"> 닉 네 임</td>
			<td width="330"><input type="text" size= "10" maxlength="10" name ="board_nick"></td>
		</tr>
		<tr>
			<td width="70" align = "center"> 제  목</td>
			<td width="330">
			<!-- 	답변인것에 대한 처리 -->
			
			<input type= "text" size = "40" maxlength="50" name = "board_title"></td>
		</tr>
		<!--  --------------------------------------------------------------------------------------------- -->
		<tr>
			<td width="70" align = "center"> 내  용</td>
			<td width="330"><textarea rows="13" cols="40" name = "board_content"></textarea></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
			<input type = "submit" value = "글쓰기">
			<input type= "reset" value = "다시작성">
			<input type ="button" value = "목록보기" onclick="window.location='boardList.jsp' ">
		</tr>
		</table>
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
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
