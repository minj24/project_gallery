<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jstl/core" %>
<%@ page import="com.test.*" %>

<%
request.setCharacterEncoding("UTF-8");
//데이터 수신
String n_title = request.getParameter("n_title");
String n_contents = request.getParameter("n_contents");

NoticeDAO dao = new NoticeDAO();
//DB 액션  -> add() 메소드 호출
Notice n = new Notice();
n.setN_title(n_title);
n.setN_contents(n_contents);




dao.noticeInsert(n);

//강제 페이지 전환
response.sendRedirect("Notice.jsp");
%>