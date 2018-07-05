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
String imgSource = request.getContextPath() + "/upload";
String art_id = request.getParameter("art_id");
   StringBuilder sb = new StringBuilder();
   GalleryDAO dao = new GalleryDAO();
   
   for (Gallery g : dao.galleryList(art_id)) {
      sb.append(String.format("<div style=\"float: left;\">"));
      sb.append(String.format("<table class=\"test\">"));
      sb.append(String.format("<tr>"));
      sb.append(String.format("<td><img src=\"%s\" style=\"width:500px;height:450px;\"></td>",imgSource +"/"+ g.getArt_picture()));
      sb.append(String.format("<td style=\"vertical-align: top; padding: 20px;\"><div><b>No :</b>%s</div>",g.getArt_id()));
      sb.append(String.format("<div><b>작품명 :</b>%s</div>",g.getName()));
      sb.append(String.format("<div><b>작가명 :</b>%s</div>",g.getArt_name()));
      sb.append(String.format("<div><b>날짜 :</b>%s</div>",g.getGallery_date()));
      sb.append(String.format("<div><b>작품 소개 :</b>%s</div>",g.getArt_intro()));
      sb.append(String.format("</td>"));
      sb.append(String.format("</tr>"));
      sb.append(String.format("</table>"));
      sb.append(String.format("</div>"));
   }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>갤러리 상세 보기</title>
<link href="css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<div style="width: 950px; margin: auto;">
		<c:import url="Menu2.jsp"></c:import>

		<h4 class="text-center">
			<strong>갤러리 상세 보기</strong>
		</h4>
		<hr>
		<div class="container-fluid">
				<%=sb.toString()%>
			<div style="clear: left;"></div>
		</div>



	</div>
</body>
</html>