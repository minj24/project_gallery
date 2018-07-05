<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.test.*"%>
<%
	//페이지 차단 액션 추가 (회원 전용 페이지)
	if(session.getAttribute("login")==null){
	response.sendRedirect("LoginForm.jsp");
}
	if(session.getAttribute("admin")==null){
		response.sendRedirect("Logout.jsp");
	}
%>
<%
	String art_id = request.getParameter("art_id");
	StringBuilder sb = new StringBuilder();
	
	AdminDAO dao = new AdminDAO();
	Bid b = dao.bidDetailList(art_id);
		sb.append(String.format("<tr>"));
		sb.append(String.format("<td>%s</td>", b.getBid_date()));
		sb.append(String.format("<td>%s</td>", b.getBid_price()));
		sb.append(String.format("<td>%s</td>", b.getName()));
		sb.append(String.format("</tr>"));

	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>응찰내역</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">


</head>
<body>
	<div style="width: 950px; margin: auto;">
		<c:import url="Menu2.jsp"></c:import>
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
				<p align="left">응찰 상세 내역</p>
				<table class="table table-hover">
					<tr>
						<th>응찰날짜</th>
						<th>응찰가격</th>
						<th>응찰자명</th>
					</tr>
					<%=sb.toString() %>
				</table>
			</div>




		</div>

	</div>
</body>
</html>