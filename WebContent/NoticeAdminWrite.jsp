<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ page import="com.test.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 
<script type="text/javascript">
$(document).ready(function(){
	  
$("#btn").click(function(){
 
       $("#myForm").attr("action", "NoticeInsert.jsp");
       $("#myForm").submit();
    });
$("#btn-turn").click(function(){  
	 $("#myForm").attr("action", "Notice.jsp");
	 $("#myForm").submit();
});
});
</script>
</head>
<body>
<div style="width: 950px; margin: auto;">
		<c:import url="Menu2.jsp"></c:import>
		<h4 class="text-center">
			<strong>NOTICE</strong>
		</h4>
		<hr>
		<div align="center" >
 
 

   <form method="post" id="myForm"> 
   <table>
    <tr>
     <td>제목 </td>
     <td><input type="text" id="n_title" name="n_title" style="width:500px; height:30px;" maxlength="50"></td>
    </tr>
    <tr>
    <td><br></td>
    </tr>
     <tr>
     <td>내용 </td>
     <td><textarea id="n_contents"  name="n_contents" style="width:500px; height:500px;" ></textarea></td>
    </tr>
   </table>
  
			<div class="col-sm-offset-2 col-sm-10" >
			<button type="submit" id = "btn" class="btn btn-default">등록</button>
			<button type="reset" id= "btn-turn" class="btn btn-default">취소</button>
			</div>
	
	</form>
  
 
 
</div>
</div>
</body>
</html>