<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.test.*"%>
<%
	//페이지 차단 액션 추가 (회원 전용 페이지)
	if (session.getAttribute("login") == null) {
		response.sendRedirect("LoginForm.jsp");
	}
%>
<%
	request.setCharacterEncoding("UTF-8");
	String searchValue = request.getParameter("searchValue");
	 String imgSource = request.getContextPath() + "/upload";

   StringBuilder sb = new StringBuilder();
   ArtistDAO dao = new ArtistDAO();
   if(searchValue==null){
	   for (Artist a : dao.artistList()) {
           

	         sb.append(String.format("<div style=\"float:left; padding-right: 20px\">"));
	         sb.append(String.format("<table class=\"table table-hover\" style=\"border:solid 3px; \">"));
	         sb.append(String.format("<tr>"));
	sb.append(String
			.format("<td><img src=\"%s\" style=\"width:200px;height:150px; padding-right: 20px\"></td>",
					imgSource + "/" + a.getArt_member_pictire()));
	sb.append(String.format("</table>"));
	
	sb.append(String
			.format("<td style=\"vertical-align: top; padding: 20px;\"><div><b>작가 이름 :</b>%s</div>",
					a.getName()));
	sb.append(String
			.format("<div style=\"vertical-align: top; padding: 20px; padding-top: 30px\"><a href=\"Artist.jsp?email=%s\">상세보기</a></div></td>",
					a.getEmail()));
	sb.append(String.format("</div>"));
    
    sb.append(String.format("</tr>"));
    sb.append(String.format("</div>"));
}
	   }else{
		   for (Artist a : dao.artList(searchValue)) {
	           
			      sb.append(String.format("<div style=\"float: left;\">"));
			      sb.append(String.format("<table class=\"test\">"));
			      sb.append(String.format("<tr>"));
			      sb.append(String.format("<td><img src=\"%s\" style=\"width:200px;height:150px;\"></td>",imgSource +"/"+ a.getArt_member_pictire()));
			      sb.append(String.format("<td style=\"vertical-align: top; padding: 20px;\"><div>%s</div>",a.getName()));
			      sb.append(String.format("<div><a href=\"Artist.jsp?email=%s\">상세보기</a></div></td>",a.getEmail()));      
			      sb.append(String.format("</tr>"));
			      sb.append(String.format("</table>"));
			      sb.append(String.format("</div>"));
			   }
	   }
	   
		
		if(searchValue==null){
			searchValue="";
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

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script type="text/javascript">
   $(document).ready(function() {
      $(".detail").click(function() {
         $(location).attr("href", "Artist.jsp");
      });

   });
</script>
</head>
<body>
	<div style="width: 950px; margin: auto;">

		<c:import url="Menu2.jsp"></c:import>

		<h4 class="text-center">
			<strong>화가 리스트</strong>
		</h4>
		<hr>
		<br>
		<%=sb.toString()%>
		<div style="clear: left;"></div>
		<!-- 검색 부분 -->
		 <form method="post" id="myForm" >
		<div class="dropdown" align="right" style="width: 1110px">
			<select><option>검색기준</option>
				<option>작가명</option>
			</select>


			<p >
               검색단어* <input type="text" name="searchValue" id="searchValue" value="<%=searchValue %>">
               <input type="submit" value="검색">
            </p>
		</div>
		</form>

	</div>
</body>
</html>