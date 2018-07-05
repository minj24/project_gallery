<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.test.*"%>
<%
if(session.getAttribute("login")==null){
	response.sendRedirect("LoginForm.jsp");
}
	if(session.getAttribute("admin")==null){
		response.sendRedirect("Logout.jsp");
	}
	
	StringBuilder sb = new StringBuilder();
	AdminDAO dao = new AdminDAO();

	String[] witakArray = { "탈락", "수락", "수락대기","신청대기" };
	for (Bid_witak_enroll bwe : dao.witakList()) {
		

		sb.append(String.format("<tr>"));
		sb.append(String.format("<td>%s</td>", bwe.getName()));
		sb.append(String.format("<td>%s</td>", bwe.getArt_name()));
		sb.append(String.format("<td>%s</td>", bwe.getWitak_date()));
		sb.append(String.format("<td>%s</td>", bwe.getHope_price()));
		sb.append(String.format("<td>%s</td>",	witakArray[Integer.parseInt(bwe.getWitak_agree())]));
		
		sb.append(String.format("<td><a href=\"Admin3_1.jsp?art_id=%s\">수정</a></td>",
				bwe.getArt_id()));
		sb.append(String.format("</tr>"));

	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>경매 위탁 신청 목록</title>

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
			<div>
				<p>경매 위탁 신청 내역</p>
				<table class="table table-hover">
					<tr>
						<th>작가명</th>
						<th>작품명</th>
						<th>위탁날짜</th>
						<th>희망가격</th>
						<th>경매위탁수락여부</th>
						<th></th>
					</tr>

					
					<%=sb.toString()%>
				</table>
			</div>
		</div>
	</div>