<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hotel.tikki.member.model.*" %>
<%
	String email = request.getParameter("email");

	System.out.print(email);
	StringBuffer str = new StringBuffer();
	str.append("<?xml version='1.0' encoding='utf-8'?>");
	str.append("<root>");
	MemberDAO dao = MemberDAO.getInstance();
	int result = dao.joinConfirmID(email);
	
	System.out.print(result);
	if( result == -1) { 
		str.append("true");
	} else {
		str.append("false");
	}
	
	str.append("<email>" + email + "</email>");
	str.append("</root>");
	
	response.setContentType("text/xml;charset=utf-8");
	response.getWriter().write(str.toString());
%>