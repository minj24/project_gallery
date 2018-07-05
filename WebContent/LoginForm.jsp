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

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
   $("#myForm").submit(function(){
      if ($("#email").val()=="" || $("#pw").val()=="") {
         $("#msg").css("display", "inline");
         return false;
      }
      return true;
   });
});
</script>
</head>
<body>

   <div style="width: 950px; margin: auto;">
      <c:import url="Menu2.jsp"></c:import>
      

      <h4 class="text-center">
         <strong>LOGIN</strong>
      </h4>
      
      <form method="post" action="Login.jsp" id="myForm">
         
      <div align="center">

         <!-- 로그인 메일 & 패스워드 영역 -->

         <br> <br>
      
      
            <div class="row">
               <div class="col-xs-6" align="center" style="width: 100px; margin-left: 250px">EMAIL</div>
               <div class="col-xs-6" align="left">
                  <input class="form-control" id="email" type="text" name="email"
                     placeholder="Email">
               </div>
            </div>
         
         <br> <br>

         
            <div class="row">
               <div class="col-xs-6" align="center"style="width: 100px; margin-left: 250px">PASSWORD</div>
               <div class="col-xs-6" align="left">
                  <input class="form-control" id="pw" type="password" name="pw"
                     placeholder="Password">
               </div>
            </div>
         

         <!-- 로그인 버튼 -->
            <br>
            <div class="form-group">
               <div class="col-sm-offset-5 col-sm-10" style="width: 150px;">
                  <input type="submit" style="width: 100px" value="Login">
                  <br><span id="msg" style="color: red; display: none;">ID, PW 항목을 채워야 합니다.</span>
               </div>
            </div>
      </div>
      </form>
   </div>
</body>
</html>