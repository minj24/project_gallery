<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.test.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   //페이지 차단 액션 추가 (회원 전용 페이지)
   if (session.getAttribute("login") == null) {
      response.sendRedirect("LoginForm.jsp");
   }
%>
<%

String name = (String)session.getAttribute("login");
GalleryDAO dao = new GalleryDAO();
 name= dao.name(name);
 
String email = (String)session.getAttribute("login");
String phone = (String)session.getAttribute("login");
String BIRTHDAY = (String)session.getAttribute("login");
String member_intro = (String)session.getAttribute("login");
member_intro = dao.member_intro(member_intro);
phone = dao.phone(phone);
BIRTHDAY = dao.BIRTHDAY(BIRTHDAY);

if(member_intro == null){
   member_intro = "자기소개서를 입력해주세요";
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
         <strong>My Page</strong>
      </h4>
      <hr>


      <br>



         <div class="col-xs-3" align="center">
         <p><a href="Mypage1.jsp">개인 정보 관리</a></p>
         <p><a href="Mypage2.jsp">응찰내역</a></p>
         <p><a href="Mypage3.jsp">낙찰내역</a></p>
         <p><a href="Mypage4.jsp">갤러리 신청</a></p>
      </div>


      <div class="col-xs-9">
      <!-- <div><p>개인 정보 수정</p></div> -->

         <div align="center" style="padding-top: 20px">

            <!-- 신청란 영역 -->
               <form action = "MypageUpdate.jsp" method="post" id="myForm">
         
               <div class="col-xs-4" align="center">이름</div>
               <div class="col-xs-5" align="center">   
                  <%=name %>
               </div>
         
            
            <br> <br>



               <div class="col-xs-4" align="center">이메일</div>
               <div class="col-xs-5" align="center">
                  <%=email %>
               </div>
         
            <br> <br>



            
               <div class="col-xs-4" align="center">비밀번호</div>
               <div class="col-xs-5" align="center">
                     <input type="text" class="form-control" id="PW" name="PW">
               </div>
         
            <br> <br>
         
               <div class="col-xs-4" align="center">주민번호</div>
               <div class="col-xs-5" align="center">
                  ***********
               </div>
            

            <br> <br>
            
               <div class="col-xs-4" align="center">연락처</div>
               <div class="col-xs-5" align="center">
                  <input type="text" class="form-control" value="<%=phone%>"id="PHONE" name="PHONE">
               </div>
            
            
            <br> <br>
            <br> <br>
            
               <div class="col-xs-4" align="center">생년월일</div>
               <div class="col-xs-5" align="center">
                  <%=BIRTHDAY %>
               </div>
               
               <br> <br>
               <br> <br>
         
         <div class="col-xs-4" align="center">자기소개</div>
         <div class="col-xs-5" align="center">
         <input type="text" class="form-control" value="<%=member_intro%>"id="member_intro" name="member_intro">
               </div>
               
               <br> <br>
               <br> <br>
            <!-- 버튼 -->
         
               <div class="col-sm-offset-2 col-sm-10" >
                  <button type="submit" class="btn btn-default">수정</button>
                  <button type="submit" class="btn btn-default">취소</button>
               </div>
               </form>
         </div>

      </div>

   </div>
</body>
</html>