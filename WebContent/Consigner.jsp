<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.test.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//페이지 차단 액션 추가 (관리자 전용 페이지)
	if (session.getAttribute("login") == null) {
		response.sendRedirect("LoginForm.jsp");
		}
	
%>
<% 
String name = (String)session.getAttribute("login");
GalleryDAO dao = new GalleryDAO();
 name= dao.name(name);

StringBuilder sb = new StringBuilder();
String email= (String)session.getAttribute("login");
Bid_witak_enroll b = new Bid_witak_enroll();
 for(Art a : dao.artList(email)){
		sb.append(String.format("<option value=\"%s\">%s</option>", a.getArt_name(), a.getArt_name()));
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#myForm").submit(function(){
		return true;
	});
	
});
</script>
</head>
<body>
	<div style="width: 950px; margin: auto;">
		<c:import url="Menu2.jsp"></c:import>
		<h4 class="text-center">
			<strong>경매 위탁 신청</strong>
		</h4>
		<hr>
		<div align="center">

			<!-- 신청란 영역 -->
			<br> <br>

		<form action = "ConsignerInsert.jsp" method="post" id="myForm">
				<div class="row">
					<p class="col-xs-6" align="center" >작가이름</p>
					<%=name %>
				<br>
				<br>
				</div>
		
				<div class="row">
					<p class="col-xs-6" align="center">희망가격</p>
					<p class="col-xs-6" align="left">
						<input type="text" class="form-control" id="hope_price" name="hope_price" required="required">
					</p>
				</div>
			
			<br>		
			
				<div class="row">
					<p class="col-xs-6" align="center">희망작품</p>
					<p class="col-xs-6" align="left">
						
						<select name="art_name">
						<%=sb.toString() %>
					</select>
					</p>
				</div>

			<br>


			<!-- 버튼 -->
				<div class="form-group">

					<div class="col-sm-offset-2 col-sm-10" style="width: 150px;">
						<input type="submit" class="btn btn-default" value="신청">
						<input type="button" class="btn btn-default" value="취소">
					</div>
				</div>
			</form>
		</div>		
			
	</div>

</body>
</html>