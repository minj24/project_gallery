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
	String login = (String) session.getAttribute("login");
	

	String art_id = request.getParameter("art_id");

	StringBuilder sb = new StringBuilder();

	AdminDAO dao = new AdminDAO();
	
	String[] witakArray = { "탈락", "수락", "수락대기","신청대기" };
	
	Bid_witak_enroll bwe = dao.wList(art_id);

	sb.append(String.format("<tr>"));
	sb.append(String.format("<td>%s</td>", bwe.getName()));
	sb.append(String.format("<td>%s</td>", bwe.getArt_name()));
	sb.append(String.format("<td>%s</td>", bwe.getWitak_date()));
	sb.append(String.format("<td>%s</td>", bwe.getHope_price()));
	sb.append(String.format("<td><select id=\"witak_agree\">"));
	for(int i=0; i<witakArray.length; i++) {
		sb.append(String
				.format("<option value=\"%s\" %s>", i, (i==Integer.parseInt(bwe.getWitak_agree())) ? "selected=selcted": ""));
		sb.append(String.format("%s</option>", witakArray[i]));
	}
	sb.append(String.format("</select></td>"));
	sb.append(String.format("</tr>"));
	
	int hope_price = bwe.getHope_price();
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert title here</title>

<link href="css/bootstrap.min.css" rel="stylesheet">

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
	
	$("#btn").click(function(){
		var art_id = "<%=art_id%>";
		var hope_price = "<%=hope_price%>";
		var witak_agree = $("#witak_agree option:selected").val();
			$("#myForm").attr("action", "WitakUpdate.jsp?art_id=" + art_id + "&hope_price="+hope_price + "&witak_agree=" + witak_agree);

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
					<p align="left">위탁 신청 목록 수정</p>

					<table class="table table-hover">
						<tr>
							<th>작가명</th>
							<th>작품명</th>
							<th>위탁날짜</th>
							<th>희망가격</th>
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