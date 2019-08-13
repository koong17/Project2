<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>  
<<<<<<< HEAD

=======
>>>>>>> origin/minjee
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
  
  <!-- footer가 아래에 위치할 수있도록 고정한다. -->

  
</head>

<body>

<jsp:include page="/navigation.jsp"/>

  <!-- Page Content -->
  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">고객문의
      <small>HOTEL TIKKI에 대해 궁금한 점을 물어보세요.</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.go">Home</a>
      </li>
      <li class="breadcrumb-item active">고객문의</li>
    </ol>
    
<!-- 본문 -->    
    


   <c:if test="${ count == 0 }">   
      <h2><center>게시판에 저장된 글이 없습니다.</center></h2>
   </c:if>
      
   <c:if test="${ count > 0 }">   
      <table width="700" cellpadding="0" cellspacing="0"
         align="center" class="table">
         <tr height="30">
            <td align="center" width="50">번 호</td>
            <td align="center" width="50">제 목</td>
            <td align="center" width="50">작성자</td>
            
      <c:forEach var="list" items="${ list }">          
      
         <tr height="30">
            <td align="center" width="50">
               <c:out value="${list.board_num}" />
            </td>
            <td width="250">
         
             <a href="content.do?board_num=${list.board_num }&pageNum=${ currentPage }">
                  ${ list.board_title } <c:if test="${ list.cmnt_count != 0 }">(${ list.cmnt_count })</c:if></a> 
            </td>
            <td align="center" width="100">${ list.board_nick }</td>
         </tr>
      </c:forEach>
      </table>
   </c:if>
   <c:if test="${ sessionScope.nick != null }">
   <button class="btn btn-primary btn-lg" id="button-right-fix2"
			onclick="window.location='writeForm.do?pageNum=${ pageNum }'">글쓰기</button>
   </c:if>
   
   
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
      

      
      	<c:if test="${ endPage < pageCount-1 }">
			<li class="page-item"><a class="page-link"
				href="list.do?pageNum=${ startPage+5 }"> Next </a></li>
		</c:if>
   </c:if>
   </ul>
   </nav>

  </div>
  <!-- /.container -->




<jsp:include page="/footer.jsp"/>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>