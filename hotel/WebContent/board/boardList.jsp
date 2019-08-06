<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
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
  <div class="container" height="1000px">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">고객문의
      <small>HOTEL TIKKI에 대해 궁금한 점을 물어보세요.</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">고객문의</li>
    </ol>
    
    
    
	<center>
		<b>글 목록(전체 글 : ${ count })
		</b>
	
	<table width="700">
		<tr>
			<td align="right">
				<a href="writeForm.do">글쓰기</a>
			</td>
		</tr>
	</table>
	<c:if test="${ count == 0 }">	
		<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다.</td>
			</tr>
		</table>	
	</c:if>
		
	<c:if test="${ count > 0 }">	
		<table width="700" border="1" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30">
				<td align="center" width="50">번 호</td>
				<td align="center" width="50">제 목</td>
				<td align="center" width="50">작성자</td>
				
		<c:forEach var="list"  items="${ list }">    		
		
			<tr height="30">
				<td align="center" width="50">
					<c:out value="${ list.board_num }" />
				</td>
				<td width="250">
		   
		 		<a href="content.do?num=${list.board_num }&pageNum=${ currentPage }">
						${ list.board_title }</a> 
				</td>
				<td align="center" width="100">${ list.board_nick }</a></td>
			</tr>
		</c:forEach>
		</table>
	</c:if>
	
	 <c:if test="${ count > 0 }"> <!--  전체 페이지의 수를 연산 -->
		    <c:set  var="pageCount"  value="${ count / pageSize + (count % pageSize ==0 ? 0 : 1) }" />
			<c:set  var="startPage"  value="${ 1 }" />  <!-- 차후 수정!! -->
			<c:set  var="pageBlock"  value="${ 5 }" />
			
			
			<fmt:parseNumber var="result"  value="${ currentPage / pageBlock }" integerOnly="true" />
			<c:if  test="${ currentPage % pageBlock != 0 }" > 
				<c:set var="startPage" value="${ result * pageBlock + 1 }" />
			</c:if>
			
			<c:if  test="${ currentPage % pageBlock == 0 }" > 
				<c:set var="startPage" value="${ (result - 1) * pageBlock + 1 }" />
			</c:if>
		
			<c:set  var="endPage"  value="${ startPage + pageBlock -1 }" />
	
			<c:if test="${ endPage > pageCount }" >
				<c:set  var="endPage"  value="${ pageCount }" />
			</c:if>
			
			<c:if test="${startPage >5 }" >
				<a href="list.do?pageNum=${ startPage-5  }">[이전] </a>
			</c:if>
	
			<c:forEach  var="i" begin="${startPage }" end="${ endPage }">
				<a href="list.do?pageNum=${i}">[${ i }] </a>
		   </c:forEach>
		
		<c:if test="${ endPage < pageCount }" >
			<a href="list.do?pageNum=${ startPage+5 }">[다음] </a>
		</c:if>
	</c:if>
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
