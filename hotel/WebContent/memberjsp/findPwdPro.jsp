<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${ result == -1}">
	<script type="text/javascript">
	<!--
		alert('메일이 존재하지 않습니다.');
	//-->
	</script>
	<meta http-equiv="Refresh" content="0; url=find.go" />
</c:if>
<c:if test="${ result == 1}">
	<script type="text/javascript">
	<!--
		alert('메일이 발송되었습니다.');
	//-->
	</script>
	<meta http-equiv="Refresh" content="0; url=login.go" />
</c:if>
