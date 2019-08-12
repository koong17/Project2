<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>  

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

  
  <!--  kakao api -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>

<body>

<jsp:include page="/navigation.jsp"/>

  <!-- Page Content -->
  <div class="container">
  <a id="kakaopay-btn"></a>
	<script>
      $(document).ready(function(){
         $('#kakaopay-btn').on('click', kakaopay);
      })
      
      let popup;
      let timer;
      
      function kakaopay(e){
         e.preventDefault();
         var cseq = $('#cseq').val();
         var rseq = $('#rseq').val();
         $.ajax({
            url : 'http://localhost:8080/pay?cseq=' + cseq + '&rseq=' + rseq,
            type : 'GET',
            success : function(res){
               res = JSON.parse(res);
               console.log(res.next_redirect_pc_url);
               popup = window.open(res.next_redirect_pc_url, '카카오 결제', 'width=400, height=600, status=no, toolbar=no, location=no, top=200');
               timer = setInterval(function(){
                  if(popup.closed){
                     location.href="http://localhost/user/reserve/myreserve"
                  }
               }, 1000)
            }
         })
         
         
      }
      </script>
  </div>
  <!-- /.container -->




<jsp:include page="/footer.jsp"/>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>