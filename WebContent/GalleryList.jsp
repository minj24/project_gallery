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

	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");

	StringBuilder sb = new StringBuilder();
	GalleryDAO dao = new GalleryDAO();

	if (searchKey == null) {
		 for (Gallery g : dao.galleryList()) {

	         sb.append(String.format("<div style=\"float:left; padding-right: 20px\">"));
	         sb.append(String.format("<table class=\"table table-hover\" style=\"border:solid 3px; \">"));
	         sb.append(String.format("<tr>"));
	         sb.append(String
	               .format("<td><img src=\"%s\" style=\"width:200px;height:150px; padding-right: 20px\"></td>",
	                     imgSource + "/" + g.getArt_picture()));
	         sb.append(String.format("</table>"));
	         
	         sb.append(String
	               .format("<td style=\"vertical-align: top; padding: 40px;\"><div><b>작품 이름 :</b>%s</div>",
	                     g.getArt_name()));
	          sb.append(String.format("<div style=\"vertical-align: top;  padding-top: 60px\"><b>작가 이름 :</b>%s</div>",g.getName()));
	         sb.append(String
	               .format("<div style=\"vertical-align: top; padding: 10px; padding-top: 30px\"><a href=\"Gallery.jsp?art_id=%s\">상세보기</a></div></td>",
	                     g.getArt_id()));
	         sb.append(String.format("</div>"));
	         
	         sb.append(String.format("</tr>"));
	         sb.append(String.format("</div>"));
	         
	         
	      }
	   }else{
	      for (Gallery g : dao.galleryList(searchKey, searchValue)) {

	         sb.append(String.format("<div style=\"float:left;\">"));
	         sb.append(String.format("<table class=\"test\">"));
	         sb.append(String.format("<tr>"));
	         sb.append(String
	               .format("<td><img src=\"%s\" style=\"width:200px;height:150px;\"></td>",
	                     imgSource + "/" + g.getArt_picture()));
	         sb.append(String
	               .format("<td style=\"vertical-align: top; padding: 20px;\"><b>작품 이름 :</b>%s",
	                     g.getArt_name()));
	          sb.append(String.format("<div><b>작가 이름 :</b>%s</div>",g.getName()));
	         sb.append(String
	               .format("<div><a href=\"Gallery.jsp?art_id=%s\">상세보기</a></div></td>",
	                     g.getArt_id()));
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

</head>

<body>
	<div style="width: 950px; margin: auto;">

		<c:import url="Menu2.jsp"></c:import>

		<h4 class="text-center">
			<strong>갤러리 리스트</strong>
		</h4>
		<hr>
		<br>


		<%=sb.toString()%>


			<div style="clear: left;"></div>
		<!-- 검색 부분 -->
		<form method="post" id="myForm">
		<div class="dropdown" align="right">
			<select name="searchKey">
				<option>검색기준</option>
				<option value="0">작가명</option>
				<option value="1">작품명</option>
			</select>
			<p>
               검색단어* <input type="text" name="searchValue" id="searchValue" value="<%=searchValue %>">
               <input type="submit" value="검색">
            </p>
		</div>
		</form>

	</div>





</body>
</html>