<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%
	//페이지 차단 액션 추가 (회원 전용 페이지)
	if (session.getAttribute("login") == null) {
		response.sendRedirect("LoginForm.jsp");
	}
	if (session.getAttribute("admin") == null) {
		response.sendRedirect("Logout.jsp");
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원 정보 관리</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">


</head>
<body>
	<div style="width: 950px; margin: auto;">
		<c:import url="Menu2.jsp"></c:import>
		<h4 class="text-center">
			<strong>My Page- 수정</strong>
		</h4>
		<hr>
		<br>

		<div class="col-xs-3" align="center">
			<p><a href="Admin1.jsp">회원 정보 관리</a></p>
			<p><a href="Admin2.jsp">갤러리 신청 목록</a></p>
			<p><a href="Admin3.jsp">경매 위탁 신청 목록</a></p>
			<p><a href="Admin4.jsp">응찰 내역</a></p>
			<p><a href="Admin5.jsp">낙찰 내역</a></p>

		</div>
		<div class="col-xs-9" align="center">
			<div>
			
				<table class="table table-hover">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>이메일</th>
				<th>주민번호</th>
				<th>연락처</th>
				<th>등급</th>
			</tr>

			<tr>
				<td>1</td>
				<td>홍길동</td>
				<td>glejfei@naver.com</td>
				<td>879292-2324564</td>
				<td>010-3342-4545</td>
				<td>
				<select id="Rank">
				
				<option value="1">일반</option>
				<option value="2">작가</option>
				<option value="3">관리자</option> 
			</select>
			</td>
			</tr>
			
				</table>
			</div>
		</div>
		<div class="col-xs-7" align="center">
		
			<p>
			<a href="Admin1.jsp" >확인</a>
			</p>
		</div>
	</div>