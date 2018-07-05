<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//데이터 수신(한글 인코딩 추가)
request.setCharacterEncoding("UTF-8");
String email = (String)session.getAttribute("login");
String login = (String)session.getAttribute("login");

//데이터베이스 액션 -> add() 메소드 호출로 대체
GalleryDAO dao = new GalleryDAO();
dao.remove(email); 


session.removeAttribute(email);
session.removeAttribute(login);
 response.sendRedirect("LoginForm.jsp"); 
%>
