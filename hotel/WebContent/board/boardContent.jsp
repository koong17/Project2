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
  <div class="container" style="min-height: 700px">
	<center><b>상세보기 페이지</b><br>
	<form>
		<table width = "500" border = "1" cellspacing = "0" cellpadding = "0" 
		bgcolor = "${ bodyback_c }" align="center">
			
			<tr height="30">
				<td align="center" width = "125" >글번호</td>
				<td align="center" width = "125"> ${ vo.board_num }</td>
				
				<td align="center" width = "125" >작성자</td>
				<td align="center" width = "125">${ vo.board_nick }</td>
			</tr>
			<tr height="30">
				<td align="center" width = "125" >글제목</td>
				<td align="center" width = "125">${ vo.board_title } </td>
				
				<td align="center" width = "125" >작성일</td>
				<td align="center" width = "125">${ vo.board_date }</td>
			</tr>
			<tr height="150">
				<td align="center" width = "125" colspan="4"><pre>${ vo.board_content }</pre></td>
			</tr>
			
			<tr height ="30">
				<td colspan="4" align="right" >
				<input type="button" value="글수정" onclick="document.location.href='updateForm.do?num=${ vo.board_num }&pageNum=${ pageNum }'"> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type ="button" value ="글삭제" onclick="document.location.href='deleteForm.do?num=${ vo.board_num }&pageNum=${ pageNum }'">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type = "button" value ="목록 보기" onclick="document.location.href='list.do?pageNum=${ pageNum }'"> 
				</td>
			</tr>
		</table>
	</form>
	</center>
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
