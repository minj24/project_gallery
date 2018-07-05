<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div style="width: 950px; margin: auto;">
<c:import url="Menu2.jsp"></c:import>
	
		<h4 class="text-center">
			<strong>LOGOUT</strong>
		</h4>
	
	<div align="center">
	<br><br>
	<h3>로그아웃 되었습니다.</h3>
	<br>
	<form method="post" action="LoginForm.jsp">
			
			<p><input type="submit" value="로그인 화면으로 이동" style="width: 150px;"></p>
		</form>
	</div>
	
	
		
	
</div>
</body>
</html>
