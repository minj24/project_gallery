<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String gallery_apply = (String)session.getAttribute("gallery_apply");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>메인 페이지</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	var gallery_apply = "<%=gallery_apply%>";
	if($("gallery_apply").val()=="1"){
		alert("갤러리 신청 되었습니다.");
	}
});
</script>
</head>
<body>
	<div style="width: 950px; margin: auto;">
		<c:import url="Menu2.jsp"></c:import>

		<div id="myCarousel" class="carousel slide">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- 회전광고판 항목 -->
			<div class="carousel-inner">
				<div class="active item">
					<img src="Main1.png" style="width: 100%;" style="height:80px">
				</div>
				<div class="item">
					<img src="Main2.jpg" style="width: 100%;" style="height:80px">
				</div>
				<div class="item">
					<img src="Main3.png" style="width: 100%;" style="height :80px">
				</div>
			</div>
			
			<!-- 회전광고판 탐색 -->
			<!-- 회전광고판 탐색 -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel"
				data-slide="next">&rsaquo;</a>
		</div>
	</div>
</body>
</html>