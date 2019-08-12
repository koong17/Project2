<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>HOTEL TIKKI</title>
<!-- Google font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
   rel="stylesheet">

<!-- hs CSS -->
<link href="/hotel/css/hs.css?after" rel="stylesheet">

<!-- Bootstrap core CSS -->
<link href="/hotel/vendor/bootstrap/css/bootstrap.min.css?after" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/hotel/css/modern-business.css?after" rel="stylesheet">

<!-- Custom stlylesheet -->
<link type="text/css" rel="stylesheet"
   href="/hotel/vendor/bootstrap/css/style.css?after" />

<!-- Bootstrap core JavaScript -->
<script src="/hotel/vendor/jquery/jquery.js"></script>
<script src="/hotel/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>

<!-- Hyesoo JavaScript -->
<script src="/hotel/js/hidden.js"></script>

</head>

<body>

   <jsp:include page="/navigation.jsp"/>


   <!-- Page Content -->
   <div class="container" id="f">

      <!-- Page Head -->
      <h1 class="mt-4 mb-3">예약 확인</h1>
   
   <!-- 객실정보 -->
   <div class="container" id="showShow" >

      <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="index.go">Home</a></li>
         <li class="breadcrumb-item active">나의 예약 현황 목록</li>
      </ol>
         
      <%-- <c:if test="${ count == 0 }">   
         <h2><center>예약 내역이 존재하지 않습니다.</center></h2>
      </c:if> --%>
      <c:forEach var="list"  items="${ list }">
         <div class="row">
            <div class="col-md-7">
               <c:if test="${ list.price == '200000' }">
	               <a href="room1detail.to"> 
	               <img class="img-fluid rounded mb-3 mb-md-0" src="/hotel/img/deluxe.jpg" alt=""></a>
               </c:if>
               <c:if test="${ list.price == '300000' }">
	               <a href="room2detail.to"> 
	               <img class="img-fluid rounded mb-3 mb-md-0" src="/hotel/img/grand.jpg" alt=""></a>
               </c:if>
               <c:if test="${ list.price == '500000' }">
	               <a href="room3detail.to"> 
	               <img class="img-fluid rounded mb-3 mb-md-0" src="/hotel/img/suite.jpg" alt=""></a>
               </c:if>
            </div>
            <div class="col-md-5">
               <h3>예약번호&nbsp;&nbsp;<c:out value="${ list.rsrv_num }" /></h3>
               <p>
                  <table >
                     <tr>
                     	<td style="text-align:left;"><b>룸타입</b></td>
                     	<td width="20"></td>
                     	<td width="30"></td><td style="text-align:left;">${ list.room_type }</td>
                     </tr>
                     <tr><td style="text-align:left;"><b>체크 인</b></td> <td width="20"></td><td width="30"></td><td >${ list.check_in }</td></tr>
                     <tr><td style="text-align:left;"><b>체크아웃</b></td> <td width="20"></td><td width="30"></td><td>${ list.check_out }</td></tr>
                     <tr><td style="text-align:left;"><b>숙박일수</b></td> <td width="20"></td><td width="30"></td><td style="text-align:left;">${ list.check_date } 박</td></tr>
                     <tr><td style="text-align:left;"><b>투숙인원</b></td> <td width="20"></td><td width="30"></td><td style="text-align:left;">${ list.rsrv_ppl } 명</td></tr>
                     <tr><td style="text-align:left;"><b>객실금액</b></td> <td width="20"></td><td width="30"></td><td >KRW ${ list.price }</td></tr>
                     <tr><td style="text-align:left;"><b>예약현황</b></td> <td width="20"></td><td width="30"></td><td style="text-align:left;"> 
                           <c:if test="${ list.rsrv_status == 'n' }"> 예약대기</c:if>
                           <c:if test="${ list.rsrv_status == 'y' }"> 예약완료</c:if>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="4" align="center">
                           <div style="margin-top: 20px;">
                               <c:if test="${ list.rsrv_status == 'n' }">
                                     <input type="button" value="예약취소" class="btn btn-outline-danger btn-block" onclick="document.location.href='reserveDelete.to?rsrv_num=${ list.rsrv_num }'">
                              </c:if>
                           </div>
                        </td>
                     </tr>
                  </table>
               </div>
               
            </div>
            <hr>
         </c:forEach>
         </div>
      </div>
      
   <!-- 객실정보 끝-->

   <jsp:include page="/footer.jsp"/>

</body>

</html>