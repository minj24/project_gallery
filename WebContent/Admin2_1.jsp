<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.test.*"%>
<%
	String login = (String) session.getAttribute("login");
if(session.getAttribute("login")==null){
	response.sendRedirect("LoginForm.jsp");
}
	if(session.getAttribute("admin")==null){
		response.sendRedirect("Logout.jsp");
	}

	String art_id = request.getParameter("art_id");

	StringBuilder sb = new StringBuilder();

	AdminDAO dao = new AdminDAO();
	String[] agreeArray = {"탈락", "수락", "대기"};
	Gallery ag = dao.gList(art_id);

	sb.append(String.format("<tr>"));
	sb.append(String.format("<td>%s</td>", ag.getName()));
	sb.append(String.format("<td>%s</td>", ag.getArt_name()));
	sb.append(String.format("<td>%s</td>", ag.getGallery_date()));
	sb.append(String.format("<td><select id=\"gallery_agree\">"));
	for(int i=0; i<agreeArray.length; i++) {
		sb.append(String
				.format("<option value=\"%s\" %s>", i, (i==Integer.parseInt(ag.getGallery_agree())) ? "selected=selected": ""));
		sb.append(String.format("%s</option>", agreeArray[i]));
	}
	sb.append(String.format("</select></td>"));
	
	sb.append(String.format("</tr>"));
	String gallery_agree = ag.getGallery_agree();
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

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){

	$(".gallery_agree").find("option[value='<%=gallery_agree%>']").attr("selected", "selected");
	
	$("#btn").click(function(){
	   var agree = $("#gallery_agree option:selected").val();
		var art_id = "<%=art_id%>";
			$("#myForm").attr("action", "AgreeUpdate.jsp?art_id=" + art_id+"&gallery_agree="+agree);

			$("#myForm").submit();
		});
	});
</script>


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
		<div class="col-xs-9" align="center">
			<form method="post" id="myForm">

				<div>
					<p align="left">갤러리 신청 목록 수정</p>

					<table class="table table-hover">
						<tr>
							<th>날짜</th>
							<th>이름</th>
							<th>작품명</th>
							<th>수락여부</th>
						</tr>
						<%=sb.toString()%>

					</table>

				</div>
			</form>
		</div>
		<div class="col-xs-7" align="center">
			<p id="btn" style="cursor: pointer; color: blue">수정완료</p>
		</div>
	</div>
</body>
</html>