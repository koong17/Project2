<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

 <c:if test="${ result == 1 }">
 	<meta http-equiv="Refresh" content="0; url=${ referer }" />
</c:if>
<c:if test="${ result == -1 }">
	<script type="text/javascript">
		<!--
			alert('아이디나 비밀번호가 틀렸습니다.');
		//-->
	</script>
 	<meta http-equiv="Refresh" content="0; url=login.go" />
</c:if>  
