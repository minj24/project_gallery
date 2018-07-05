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
String email = request.getParameter("email");
StringBuilder sb = new StringBuilder();

ArtistDAO dao = new ArtistDAO();
for (Artist a : dao.artistDetailList(email)) {
	sb.append(String.format("<div style=\"float: left;\">"));
    sb.append(String.format("<table class=\"test\">"));
    sb.append(String.format("<tr>"));
	sb.append(String.format("<td><img src=\"%s\" style=\"width:500px;height:450px;\"></td>",imgSource +"/"+ a.getArt_member_pictire()));
	sb.append(String.format("<td style=\"vertical-align: top; padding: 10px;\"><div><b>작가 이름 :</b>%s</div>",a.getName()));
	sb.append(String.format("<div class=\"row\">%s</div>",a.getBirthday()));
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
<title>경매 위탁 신청</title>
<link href="css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<div style="width: 950px; margin: auto;">
		<c:import url="Menu2.jsp"></c:import>

		<h4 class="text-center">
			<strong>화가 상세 보기</strong>
		</h4>
		<hr>
		<div class="container-fluid">
			
			<%=sb.toString() %>
		</div>
	</div>
</body>
</html>