<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jstl/core" %>
<%@ page import="com.test.*" %>
<%
String grade = request.getParameter("grade");
String email = request.getParameter("email");
AdminDAO dao = new AdminDAO();
Member m = new Member();
m.setEmail(email);
m.setGrade(grade);
dao.membermodify(m);

response.sendRedirect("Admin1.jsp");
%>