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
  <div class="container" style="height: 800px">

	<!-- 내용 채우기 -->
	
	<form action = "updatePro.do" method="post" name = "writeform" onsubmit="return writeSave()">
		<input type="hidden" name="board_num" value="${ vo.board_num }" >
		<input type="hidden" name="pageNum" value="${ pageNum }" >
		<table>
		
		<tr><td width="200"><h1 class="mt-4 mb-3">&emsp;글쓰기</h1></td></tr>
		
		<tr> <!-- 닉네임 -->
			<td width="70" align = "center"> <label for="board_nick"> 닉 네 임</label></td>
			<td width="100">
			<input type="text" class="form-control" size= "10" maxlength="10" name ="board_nick" value="${ vo.board_nick }">
			</td>
		</tr>
		
		<tr> <!-- 제목 -->
			<td width="70" align = "center"> 제  목</td>
			<td width="100">
			<input type="text" class="form-control" size= "35" maxlength="30" 
			name ="board_title" value="${ vo.board_title }">
			</td>
		</tr>
		<!--  --------------------------------------------------------------------------------------------- -->
		
		<tr>
			<td width="70" align = "center"> 내  용</td>
			
			<td width="200">
			<textarea class="form-control-textarea" rows="15" cols="111" name ="board_content" >${ vo.board_content }</textarea>
			</td>
		</tr>
		
	</table>
			
		<br>
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;	
  		<input type="button" class="btn btn-primary" 
  			   onclick="document.location.href='list.do?pageNum=${ pageNum }'" value="목록가기"></input>
  		
 	    <input type="submit" class="btn btn-primary" id="button-right-fix" value="수정"/>

		
		
	</form>
	

  </div>
  <!-- /.container -->

<jsp:include page="/footer.jsp"/>

  <!-- Bootstrap core JavaScript -->
  <script src="/hotel/vendor/jquery/jquery.min.js"></script>
  <script src="/hotel/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
