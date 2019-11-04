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
  <script src="/hotel/vendor/jquery/jquery.min.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>

<body>

<jsp:include page="/navigation2.jsp"/>
	
  <!-- Page Content -->
  <div class="container" style="height: 500px; text-align: center;">
  <a id="kakaopay-btn" style="cursor: pointer; width: 120px; height: 51px; display: inline-block; margin-top: 200px; background-image: url(/hotel/img/payment_medium.png);"></a>
	<script>
      $(document).ready(function(){
         $('#kakaopay-btn').on('click', kakaopay);
      })
      
      let popup;
      let timer;
      
      function kakaopay(e){
         e.preventDefault();
         $.ajax({
            url : 'http://ec2-15-164-228-53.ap-northeast-2.compute.amazonaws.com:8080/hotel/pay',
            type : 'GET',
            success : function(res){
               res = JSON.parse(res);
               console.log(res.next_redirect_pc_url);
               popup = window.open(res.next_redirect_pc_url, '카카오 결제', 'width=450, height=600, status=no, toolbar=no, location=no, top=200, left=200');
               timer = setInterval(function(){
                  if(popup.closed){
                     location.href="http://ec2-15-164-228-53.ap-northeast-2.compute.amazonaws.com:8080/hotel/index.go"
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
  <script src="/hotel/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>