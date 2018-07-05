<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>회원 페이지</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function(){
	$("#myForm").submit(function(){
		return true;
	});
	
});


$(function() {
    $("#birthday").datepicker({
    	changeYear:true,
    	changeMonth:true,
    	dateFormat:"yy-mm-dd"
    });
});

function ActionPop(){
	alert("회원가입 취소 되었습니다.");
}

</script>

</head>
<body>
	<div style="width: 950px; margin: auto;">
		<c:import url="Menu.jsp"></c:import>

		<h4 class="text-center">
			<strong>회원가입</strong>
		</h4>
		<hr>
		<br>
		<div align="center">

			<!-- 신청란 영역 -->


				<form action = "MemberInsert.jsp" method="post" id="myForm">
				
				<div class="col-xs-6" align="center">이메일(30자 이내)</div>
				<div class="col-xs-6" align="left">
					<input type="text" class="form-control" maxlength="30" id="EMAIL"
						name="EMAIL" required="required">
				</div>
			
			<br> <br>
			
				<div class="col-xs-6" align="center">비밀번호(20자 이내)</div>
				<div class="col-xs-6" align="left">
					<input type="password" class="form-control" maxlength="20" id="PW"
						name="PW" required="required">
				</div>
		
			<br> <br>
			
				<div class="col-xs-6" align="center">이름</div>
				<div class="col-xs-6" align="left">
					<input type="text" class="form-control" id="NAME" name="NAME" required="required">
				</div>
			
			<br> <br>
		
				<div class="col-xs-6" align="center">주민번호</div>
				<div class="col-xs-6" align="left">
					<input type="text" class="form-control" id="SSN" name="SSN" required="required">
				</div>
		
			<br> <br>
		
				<div class="col-xs-6" align="center">연락처</div>
				<div class="col-xs-6" align="left">
					<input type="text" class="form-control" id="PHONE" name="PHONE">
				</div>
				
				<br> <br>
		
				<div class="col-xs-6" align="center">생년월일</div>
				<div class="col-xs-6" align="left">
					<input type="text" class="form-control" id="BIRTHDAY" name="BIRTHDAY" required="required">
				</div>
				<br> <br>
				<div class="col-xs-6" align="center">자기소개</div>
				<div class="col-xs-6" align="left">
					<textarea id="member_intro"  name="member_intro" style="width:443px; height:200px;" required="required"></textarea>
				</div>


			<!-- 버튼 -->
			
				<div class="form-group">

					<div class="col-sm-offset-5 col-sm-10" style="width: 150px; margin-top: 30px">
						<input type="submit" class="btn btn-default" value="가입">
						<a href="Main.jsp"><input type = "button" class="btn btn-default" onclick = "javascript:ActionPop();" value = "취소" ></a>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>