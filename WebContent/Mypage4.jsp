<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "com.test.*" %>
<%
	//페이지 차단 액션 추가 (회원 전용 페이지)
	if (session.getAttribute("login") == null) {
		response.sendRedirect("LoginForm.jsp");
	}
%>
<%
StringBuilder sb = new StringBuilder();
GalleryDAO dao = new GalleryDAO();
String email = (String)session.getAttribute("login");
String[] array = {"탈락", "수락", "대기"};
for(BidList b : dao.bidinsert(email)){
	sb.append("<tr>\r\n");
	sb.append(String.format("<td>%s</td>", b.getRownum()));
	sb.append(String.format("<td>%s</td>", b.getArt_name()));
	sb.append(String.format("<td>%s</td>", b.getGallery_date()));
	sb.append(String.format("<td>%s</td>", array[b.getGallery_agree()]));
	sb.append("</tr>");
}

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>경매 위탁 신청</title>
<link href="css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<div style="width: 950px; margin: auto;">
		<c:import url="Menu2.jsp"></c:import>
		<h4 class="text-center">
			<strong>My Page</strong>
		</h4>
		<hr>
		<br>

		<div class="col-xs-3" align="center">
			<p><a href="Mypage1.jsp">개인 정보 관리</a></p>
			<p><a href="Mypage2.jsp">응찰내역</a></p>
			<p><a href="Mypage3.jsp">낙찰내역</a></p>
			<p><a href="Mypage4.jsp">갤러리 신청</a></p>
		</div>


		<div class="col-xs-9">
			<div>
				<p>갤러리 신청 내역</p>
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>작품명</th>
						<th>날짜</th>
						<th>수락여부</th>
					</tr>

				<%=sb.toString() %>


				</table>
			</div>








		</div>









	</div>
</body>
</html>