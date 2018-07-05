<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그아웃 액션
session.removeAttribute("login");
session.removeAttribute("artist");
session.removeAttribute("admin");

//강제 페이지 전환
response.sendRedirect("LogoutForm.jsp");
%>