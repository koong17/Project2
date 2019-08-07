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
  <link href="/hotel/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/hotel/css/modern-business.css?after" rel="stylesheet">
  
  <!-- board 전용 css -->
  <link href="/hotel/css/boardForm.css?after" rel="stylesheet">
  
  <!-- 모든 페이지에 들어가야 함 -->
  <link href="/hotel/vendor/bootstrap/css/inho.css?after" rel="stylesheet">
</head>


<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index.go">TIKKI</a>
      <c:if test="${ sessionScope.id == null}">
      <a class="navbar-login" href="login.go">로그인</a>
      <a class="navbar-login" href="join.go">회원가입</a>
      </c:if>
      <c:if test="${ sessionScope.id != null}">
      <a class="navbar-login" href="logout.go"><small>로그아웃</small></a>
      </c:if>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <a class="nav-link" href="information/about.html">호텔소개</a> <!-- About 에 contact map-->
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" aria-haspopup="true" aria-expanded="false">
              객실소개
            </a><!--  포트폴리오1 -> single portfolio item -->
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
              <a class="dropdown-item" href="/hotel/reservation/room1detail.html">room1</a>
              <a class="dropdown-item" href="/hotel/reservation/room2detail.html">room2</a>
              <a class="dropdown-item" href="/hotel/reservation/room3detail.html">room3</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/hotel/reservation/reservation.html">예약</a> <!-- full width -->
          </li>
          <li class="nav-item">
            <a class="nav-link" href="list.do">고객문의</a> <!--  포트폴리오1 수정 -->
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <!-- ./nav -->

  <!-- Page Content -->
  <div class="container" style="min-height:793px">
   <center><br>
   

   <form>
      <table cellspacing = "0" cellpadding = "0" 
       align="center" class="table-content">
       

         
         <tr height="30">
            <td align="center" width = "20" >글번호</td>
            <td align="center" width = "10"> ${ vo.board_num }</td>
            <td align="center" width = "20" >글제목</td>
            <td align="center" width = "150">${ vo.board_title } </td>
            <td align="center" width = "20" >작성자</td>
            <td align="center" width = "30">${ vo.board_nick } </td>
            
         </tr>


         <tr>
            <td height="300" width = "1000" colspan="20"><pre>${ vo.board_content }</pre></td>
         </tr>
         
         <%-- <c:when test="${not empty param.cmnt_content}">
         <tr>
            <td height="300" width = "1000" colspan="20"><pre>${ vo.cmnt_content }</pre></td>
         </tr>
         </c:when>
         
         <c:otherwise>
          
         </c:otherwise> --%>
         
         <tr height ="30">
            <td colspan="6" align="right" >
            <input type="button" class="btn btn-primary btn-lg" value="글수정" onclick="document.location.href='updateForm.do?board_num=${ vo.board_num }&pageNum=${ pageNum }'"> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type ="button" class="btn btn-primary btn-lg" value ="글삭제" onclick="document.location.href='deleteForm.do?board_num=${ vo.board_num }&pageNum=${ pageNum }'">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type = "button" class="btn btn-primary btn-lg" value ="목록 보기" onclick="document.location.href='list.do?pageNum=${ pageNum }'"> 
            </td>
         </tr>
      </table>
   </form>
   </center>
   
   
  </div>
  <!-- /.container -->
s
  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; Your Website 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="/hotel/vendor/jquery/jquery.min.js"></script>
  <script src="/hotel/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
