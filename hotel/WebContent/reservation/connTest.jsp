<%@page import="hotel.tikki.reserve.model.ReserveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
<meta charset="UTF-8">
<title>JSP</title>
</head>
<body>
<%
	ReserveDAO dao = ReserveDAO.getInstance();
	dao.getConnection();
	
	out.print("board connection success");

%>
</body>
</html>