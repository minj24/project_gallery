<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//페이지 차단 액션 추가 (회원 전용 페이지)
	if (session.getAttribute("login") == null) {
		response.sendRedirect("LoginForm.jsp");
	}
String email = (String)session.getAttribute("login");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>갤러리 신청</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$("#btn_chancel").click(function() {
		location.href("Main.jsp");
	});
	
	$("#myForm").submit(function () {
		alert("갤러리 신청이 완료되었습니다.");
	});
	
});
	
</script>
</head>
<body>
	<div style="width: 950px; margin: auto;">
		<c:import url="Menu2.jsp"></c:import>

		<h4 class="text-center">
			<strong>갤러리 신청</strong>
		</h4>
		<hr>
		<div align="center">

			<!-- 신청란 영역 -->
			<br> <br>
			<form action="Gallery_upload.jsp"  id="myForm" class="form-inline" method="post" enctype="multipart/form-data" >
				<div class="row">
					<div class="col-xs-6" align="center">작가이메일</div>
					<div class="col-xs-6" align="left">
						<input type="text"  id="email" name="email" value="<%=email%>" readonly="readonly">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-xs-6" align="center">작품명</div>
					<div class="col-xs-6" align="left">
						<input type="text"  id="artName" name="artName">
					</div>
				</div>

				<br>
				<div class="row">
					<div class="col-xs-6" align="center">작품사진</div>
					<div class="col-xs-6" align="left">
						<input type="file" id="art_picture" name="art_picture">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-xs-6" align="center">작가사진</div>
					<div class="col-xs-6" align="left">
						<input type="file" id="art_meeber_picture" name="art_meeber_picture">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-xs-6" align="center">작품소개</div>
					<div class="col-xs-6" align="left">
						<textarea id="art_intro"  name="art_intro" style="width:450px; height:300px;" ></textarea>
					</div>
				</div>
				
				<div class="form-group" style="padding-top: 10px">

					<div class="col-sm-offset-2 col-sm-10" style="width: 150px;">
						<button type="submit" class="btn btn-default">신청</button>
						<button type="reset" class="btn btn-default">취소</button>
					</div>
				</div>
			</form>
		</div>


	</div>
	
</body>
</html>