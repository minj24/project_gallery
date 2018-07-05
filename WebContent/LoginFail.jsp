<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>로그인</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<div style="width: 950px; margin: auto;">
		<c:import url="Menu2.jsp"></c:import>


		<h4 class="text-center">
			<strong>LOGIN_FAIL</strong>
		</h4>

		<div align="center">

			<!-- 로그인 메일 & 패스워드 영역 -->

			<br><br>

			<h3>로그인 실패</h3>
			<br>
			<form method="post" action="LoginForm.jsp">
				
					<div class="col-sm-offset-2 col-sm-8">
						<input type="submit" value="로그인 화면으로 이동" style="width: 150px;">
					</div>
				
			</form>
		</div>
	</div>
</body>
</html>
