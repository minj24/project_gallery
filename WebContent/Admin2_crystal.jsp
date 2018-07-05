<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%
	//페이지 차단 액션 추가 (회원 전용 페이지)
	if (session.getAttribute("login") == null) {
		response.sendRedirect("LoginForm.jsp");
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
		<c:import url="Menu2.jsp"></c:import>
		<h2 class="text-center">
			<strong>마이 페이지</strong>
		</h2>
		<hr>
		<br>

		<div class="col-xs-3" align="center">
			<p><a href="Admin1.jsp">회원 정보 관리</a></p>
			<p><a href="Admin2.jsp">갤러리 신청 목록</a></p>
			<p><a href="Admin3.jsp">경매 위탁 신청 목록</a></p>
			<p><a href="Admin4.jsp">응찰 내역</a></p>
			<p><a href="Admin5.jsp">낙찰 내역</a></p>

		</div>
		<div class="col-xs-9" >
			<div>
				<h3>갤러리 신청 목록- 수정</h3>
				<table class="table table-hover">
			<tr>
				<th>번호</th>
				<th>날짜</th>
				<th>이름</th>
				<th>작품명</th>
				<th>수락여부</th>
			</tr>

			<tr>
				<td>1</td>
				<td>2015-05-01</td>
				<td>김길동</td>
				<td>해바라기</td>
				<td>
				<select id="Rank">
				
				<option value="1">O</option>
				<option value="2">X</option> 
			</select>
			</td>
			</tr>
				</table>
				<h4><a href="Admin2.jsp">수정 완료</a></h4>
			</div>
		</div>
	</div>