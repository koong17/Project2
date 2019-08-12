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

<jsp:include page="/navigation.jsp"/>

  <!-- Page Content -->
  <div class="container">

    
	    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">예약 관리
      <small>모든 예약 내역을 확인할 수 있습니다.</small>
    </h1>



    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.go">Home</a>
      </li>
      <li class="breadcrumb-item active">예약 관리</li>
    </ol>
    
     <!-- 검색 div -->
    
    <form class="form-inline" action="rsrvSearchList.admin" method="get" style="float: right;">
    		<select name="rsrvOption" class="form-control">
    			<option value="RSRV_NICK" selected>닉네임</option>
    			<option value="RSRV_NUM">예약번호</option>
    		</select>
    		<input type="text" name="search" class="form-control"  value="">&nbsp;
    		<input type="submit" class="btn btn-success" value="검색"> 
    		
    </form>
    
	<!-- 본문 -->    

   <c:if test="${ count == 0 }">
      <br><br>
      <h2><center>예약 내역이 없습니다.</center></h2>
   </c:if>
   
   <c:if test="${ count > 0 }">   
      <br><br>
      <table width="500" cellpadding="0" cellspacing="0"
         align="center" class="table">
         <tr height="30">
            <td align="center" >예약 번호</td>
            <td align="center" >객실 번호</td>
            <td align="center" >체크인</td>
            <td align="center" >체크아웃</td>
            <td align="center" >예약 인원</td>
            <td align="center" >예약자 닉네임</td>
            <td align="center" >확정 여부</td>
          </tr>
            
      <c:forEach var="list"  items="${ list }">          
      
         <tr height="30">
            
            <td align="center" width="100">
               <c:out value="${ list.rsrv_num }" /> <!-- 예약 번호 -->
            </td>
            
            <td align="center" width="100">
               <c:out value="${ list.room_num }" /> <!-- 객실 번호 -->
            </td>
            
            <td align="center" width="100">${ list.check_in } <!-- 체크인 -->
            </td>
            
            <td align="center" width="100">
               <c:out value="${ list.check_out }" /> <!-- 체크아웃-->
            </td>
            
            <td align="center" width="100">
               <c:out value="${ list.rsrv_ppl }" /> <!-- 예약 인원-->
            </td>
            
            <td align="center" width="100">
               <c:out value="${ list.rsrv_nick }" /> <!-- 예약자 닉네임-->
            </td>
            
            <td align="center" width="100">
               <c:out value="${ list.rsrv_status }" /> <!-- 확정 여부-->
            </td>
            
            <td align="center" width="100">
               <input type="button" value="확정변경" onclick=
               	"document.location.href='rsrvUpdate.admin?rsrv_num=${ list.rsrv_num }&pageNum=${ pageNum }&rsrv_status=${ list.rsrv_status }'">
            </td>
            
            
  
         </tr>
         
      </c:forEach>
      
      </table>
   </c:if>
   
   <!-- 페이지 번호 -->
   <nav aria-label="Page navigation example">
	<ul class="pagination">
    <c:if test="${ count > 0 }"> <!--  전체 페이지의 수를 연산 -->
     
          <c:set  var="pageCount"  value="${ count / pageSize + (count % pageSize ==0 ? 0 : 1) }" />  <!-- 5 -->
         <c:set  var="startPage"  value="${ 1 }" />  <!-- 차후 수정!! -->
         <c:set  var="pageBlock"  value="${ 5 }" />
         
         
         <fmt:parseNumber var="result"  value="${ currentPage / pageBlock }" integerOnly="true" /> <!-- 1 -->
         <c:if  test="${ currentPage % pageBlock != 0 }" > 
            <c:set var="startPage" value="${ result * pageBlock + 1}" /> <!-- 1 * 6 -->
         </c:if>
         
         <c:if  test="${ currentPage % pageBlock == 0 }" >  
            <c:set var="startPage" value="${ (result - 1) * pageBlock + 1 }" />  <!-- -1 * --> 
         </c:if>
      
         <c:set  var="endPage"  value="${ startPage + pageBlock -1 }" />

         <c:if test="${ endPage > pageCount }" > 
            <c:set  var="endPage"  value="${ pageCount }" />
         </c:if>
         
         <c:if test="${startPage >5 }">
			<li class="page-item"><a class="page-link"
				href="rsrvSearchList.admin?rsrvOption=${ rsrvOption }&search=${ search }&pageNum=${ startPage-5  }"> Previous </a></li>
		</c:if>

        <c:forEach var="i" begin="${startPage }" end="${ endPage }">
			<li class="page-item"><a class="page-link"
				href="rsrvSearchList.admin?rsrvOption=${ rsrvOption }&search=${ search }&pageNum=${i}">${ i } </a></li>
		</c:forEach>
      
      	<c:if test="${ endPage < pageCount-1 }">
			<li class="page-item"><a class="page-link"
				href="rsrvSearchList.admin?rsrvOption=${ rsrvOption }&search=${ search }&pageNum=${ startPage+5 }"> Next </a></li>
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