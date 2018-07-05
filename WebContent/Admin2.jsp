<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.test.*"%>
<%
	if (session.getAttribute("login") == null) {
		response.sendRedirect("LoginForm.jsp");
	}

	request.setCharacterEncoding("UTF-8");
	StringBuilder sb = new StringBuilder();
	AdminDAO dao = new AdminDAO();

	String[] agreeArray = { "탈락", "수락", "대기" };
	for (Gallery g : dao.galleryList()) {

		sb.append(String.format("<tr>"));
		sb.append(String.format("<td>%s</td>", g.getName()));
		sb.append(String.format("<td>%s</td>", g.getArt_name()));
		sb.append(String.format("<td>%s</td>", g.getGallery_date()));
		sb.append(String.format("<td>%s</td>",agreeArray[Integer.parseInt(g.getGallery_agree())]));
		sb.append(String.format("<td><a href=\"Admin2_1.jsp?art_id=%s\">수정</a></td>",g.getArt_id()));

		sb.append(String.format("</tr>"));

	}
%>




<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>갤러리 신청 목록</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">


</head>
<body>
	<div style="width: 950px; margin: auto;">
		<c:import url="Menu.jsp"></c:import>
		<h4 class="text-center">
			<strong>관리자</strong>
		</h4>
		<hr>
		<br>

		<div class="col-xs-3" align="center">
			<p>
				<a href="Admin1.jsp">회원 정보 관리</a>
			</p>
			<p>
				<a href="Admin2.jsp">갤러리 신청 목록</a>
			</p>
			<p>
				<a href="Admin3.jsp">경매 위탁 신청 목록</a>
			</p>
			<p>
				<a href="Admin4.jsp">응찰 내역</a>
			</p>
			<p>
				<a href="Admin5.jsp">낙찰 내역</a>
			</p>

		</div>
		<div class="col-xs-9">
			<p>갤러리 신청 목록</p>
			<table class="table table-hover">
				<tr>
					<th>이름</th>
					<th>작품명</th>
<!-- 					<th>작품번호</th> 
 -->					<th>신청날짜</th>
					<th>갤러리수락여부</th>
					<th></th>
				</tr>
				<%=sb.toString()%>
			</table>

		</div>
	</div>