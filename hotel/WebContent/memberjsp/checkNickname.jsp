<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hotel.tikki.member.model.*" %>
<%
   String nickname = request.getParameter("nickname");

   System.out.print(nickname);
   StringBuffer str = new StringBuffer();
   str.append("<?xml version='1.0' encoding='utf-8'?>");
   str.append("<root>");
   MemberDAO dao = MemberDAO.getInstance();
   int result = dao.joinConfirmNick(nickname);
   
   System.out.print(result);
   if( result == -1) { 
      str.append("true");
   } else {
      str.append("false");
   }
   
   str.append("<nickname>" + nickname + "</nickname>");
   str.append("</root>");
   
   response.setContentType("text/xml;charset=utf-8");
   response.getWriter().write(str.toString());
   System.out.print(str.toString());
%>