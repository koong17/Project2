<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ result == 1 }">
<script type="text/javascript">
	<!--
		alert('비밀번호가 변경되었습니다.');
	//-->
</script>
<meta http-equiv="Refresh" content="0; url=login.go" />
</c:if>

<c:if test="${ result == -1 }">
<script type="text/javascript">
	<!--
		alert('비밀번호가 일치하지 않습니다.');
	//-->
</script>
<meta http-equiv="Refresh" content="0; url=codePro.go?code=${ code }" />
</c:if>