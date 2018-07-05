<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jstl/core" %>
<%@ page import="com.test.*" %>

<%
request.setCharacterEncoding("UTF-8");
//데이터 수신
String email = request.getParameter("EMAIL");
String name = request.getParameter("NAME");
String pw = request.getParameter("PW");
String ssn = request.getParameter("SSN");
String phone = request.getParameter("PHONE");
String birthday = request.getParameter("BIRTHDAY");
String member_intro = request.getParameter("member_intro");

//DB 액션  -> add() 메소드 호출
Member m = new Member();
m.setEmail(email);
m.setPw(pw);
m.setName(name);
m.setBirthday(birthday);
m.setSsn(ssn);
m.setPhone(phone);
m.setMember_intro(member_intro);


GalleryDAO dao = new GalleryDAO();
dao.memberadd(m);

//강제 페이지 전환
response.sendRedirect("Main.jsp");
%>