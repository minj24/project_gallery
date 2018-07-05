<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ page import = "com.test.*" %>

<%
//데이터 수신
String notice_id = request.getParameter("notice_id");
//데이터베이스 액션
StringBuilder sb = new StringBuilder();


NoticeDAO dao = new NoticeDAO();

Notice n  = dao.List(notice_id);
String contents = n.getN_contents();
	//번호, 이름, 생일,양음력,전번,부서명,직위명,지역명,기본급,수당,급여,삭제

	sb.append(String.format("<tr>\r\n"));
	sb.append(String.format("<td>제목</td>"));
	sb.append(String.format("<td><input type =\"text\" value=\"%s\" id= \"n_title\" name=\"n_title\" style=\"width:500px; height:30px;\" maxlength=\"50\"></td>", n.getN_title() ));
	sb.append(String.format("</tr>\r\n"));
	sb.append(String.format("<tr>\r\n"));
	sb.append(String.format("<td><br></td>"));
	sb.append(String.format("</tr>\r\n"));
	sb.append(String.format("<tr>\r\n"));
	sb.append(String.format("<td>내용</td>"));
	sb.append(String.format("<td><textarea id=\"n_contents\"  name=\"n_contents\" style=\"width:500px; height:500px;\" >%s</textarea></td>", n.getN_contents() ));
	sb.append(String.format("</tr>\r\n"));

%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>공지사항 </title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
 
<script type="text/javascript">
$(document).ready(function(){
	  
$("#btn").click(function(){
    var notice_id = "<%=notice_id%>";
 
       $("#myForm").attr("action", "Nmodify.jsp?notice_id=" + notice_id);
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
  
    <form method = "post"  id = "myForm" class="form-inline" style="padding-top: 100px">

   <table>
 
	<%=sb.toString() %>
   </table>
  
						<div class="col-sm-offset-2 col-sm-10" >
			<button type="submit" id = "btn" class="btn btn-default">수정</button>
			<button type="reset" id= "btn-turn" class="btn btn-default">취소</button>
						</div>
					
	</form>
  

</div>
</div>
</body>
</html>