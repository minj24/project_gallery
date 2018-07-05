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
%>
<%

	String email = request.getParameter("email");

	StringBuilder sb = new StringBuilder();

	AdminDAO dao = new AdminDAO();
	String[] gradeArray = {"관리자", "작가", "일반"};
	Member m = dao.mList(email);

	
	
	sb.append(String.format("<tr>"));
	sb.append(String.format("<td>%s</td>", m.getName()));
	sb.append(String.format("<td>%s</td>", m.getEmail()));
	sb.append(String.format("<td>%s</td>", m.getPhone()));
	sb.append(String.format("<td><select id=\"grade\">"));
	for(int i=0; i<gradeArray.length; i++) {
		sb.append(String
				.format("<option value=\"%s\" %s>", i, (i==Integer.parseInt(m.getGrade())) ? "selected=selcted": ""));
		sb.append(String.format("%s</option>", gradeArray[i]));
	}
	sb.append(String.format("</select></td>"));
	sb.append(String.format("</tr>"));
	
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

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	
	$("#btn").click(function(){
		var email = "<%=email%>";
		var grade = $("#grade option:selected").val();
			$("#myForm").attr("action", "GradeUpdate.jsp?email=" + email+"&grade="+grade);

			$("#myForm").submit();
		});
	});
	
</script>

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
		<div class="col-xs-9" align="center">
			<form method="post" id="myForm">
				<div>
					<p align="left">회원 관리 수정</p>
					<table class="table table-hover">
						<tr>
							<th>이름</th>
							<th>이메일</th>
							<th>연락처</th>
							<th>등급</th>
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