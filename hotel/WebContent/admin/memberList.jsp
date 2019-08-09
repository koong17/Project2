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
  <div class="container">

    
	    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">회원관리페이지
      <small>회원을 관리하고 조회할 수 있습니다.</small>
    </h1>



    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.go">Home</a>
      </li>
      <li class="breadcrumb-item active">회원정보 관리</li>
    </ol>
    
    <!-- 검색 div -->
    
    <form class="form-inline" action="memberSearchList.admin" method="get" style="float: right;">
    		<select name="searchOption" class="form-control">
     			<option value="id" selected>아이디</option>
    			<option value="nick">닉네임</option>
    			<option value="phone">전화번호</option> 
    		</select>
    		<input type="text" name="search" class="form-control"  value="">&nbsp;
    		<input type="submit" class="btn btn-success" value="검색"> 
    		
    </form>
    
	<!-- 본문 -->    

   <c:if test="${ count == 0 }">
      <br><br>
      <h2><center>회원정보 관리에 저장된 회원이 없습니다.</center></h2>
   </c:if>
   
   <c:if test="${ count > 0 }">   
      <br><br>
      <table width="500" cellpadding="0" cellspacing="0"
         align="center" class="table">
         <tr height="30">
            <td align="center" >회원 닉네임</td>
            <td align="center" >회원 이메일</td>
            <td align="center" >회원 전화번호</td>
            <td align="center" >회원 비밀번호</td>
          </tr>
            
      <c:forEach var="list"  items="${ list }">          
      
         <tr height="30">
            
            <td align="center" width="100">
               <c:out value="${ list.nickname }" /> <!-- 회원닉네임 -->
            </td>
            
            <td align="center" width="200">
            	<a href="memberList.do?id=${list.id }&pageNum=${ currentPage }">${ list.id } <!-- 회원이메일 --></a> 
            </td>
            
            <td align="center" width="100">${ list.phone } <!-- 회원전화번호 -->
            </td>
            
            <td align="center" width="100">
               <c:out value="${ list.password }" /> <!-- 회원비밀번호-->
            </td>
  
         </tr>
         
      </c:forEach>
      
      </table>
   </c:if>
   
   <!-- 글쓰기 버튼 필요한지 안한지 모름 -->
<%--    <c:if test="${ sessionScope.nick != null }">
   <button class="btn btn-primary btn-lg" id="button-right-fix2"
			onclick="window.location='writeForm.do?pageNum=${ pageNum }'">글쓰기</button>
   </c:if> --%>
   
   
   <!-- 페이지 번호 -->
   <nav aria-label="Page navigation example">
	<ul class="pagination">
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
         
         <c:if test="${startPage >5 }">
			<li class="page-item"><a class="page-link"
				href="list.do?pageNum=${ startPage-5  }"> Previous </a></li>
		</c:if>

   
        
         <c:forEach var="i" begin="${startPage }" end="${ endPage }">
			<li class="page-item"><a class="page-link"
				href="list.do?pageNum=${i}">${ i } </a></li>
		 </c:forEach>
      

      
      	<c:if test="${ endPage < pageCount }">
			<li class="page-item"><a class="page-link"
				href="list.do?pageNum=${ startPage+5 }"> Next </a></li>
		</c:if>
   </c:if>
   </ul>
   </nav>

  </div>
  <!-- /.container -->




  <!-- Footer -->
  <footer class="py-5 bg-dark" id="hotel-footer-fix">
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