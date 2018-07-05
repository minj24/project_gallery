<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "com.test.*" %>
<%
	//페이지 차단 액션 추가 (회원 전용 페이지)
	if (session.getAttribute("login") == null) {
		response.sendRedirect("LoginForm.jsp");
	}
%>
<%
StringBuilder sb = new StringBuilder();
int count = 0;
NoticeDAO dao = new NoticeDAO();

for(Notice n  : dao.NoticeList()){
	//번호, 이름, 생일,양음력,전번,부서명,직위명,지역명,기본급,수당,급여,삭제
	sb.append(String.format("<tr>\r\n"));
	sb.append(String.format("<td>%s</td>", n.getNotice_id() ));
	sb.append(String.format("<td><a href=\"Notice1-1.jsp?notice_id=%s\">%s</a></td>",n.getNotice_id(), n.getN_title() ));
	sb.append(String.format("<td>%s</td>", n.getN_date() ));
	sb.append(String.format("<td>\r\n"));
	//sb.append(String.format("<a href=\"Notice1-1.jsp?notice_id=%s\">상세보기</a>",n.getNotice_id())); 
	sb.append(String.format("</td>"));
	sb.append(String.format("</tr>\r\n"));
}

/* sb.append(String.format("<div><a href=\"Notice1-1.jsp?notice_id=%s\">상세보기</a></div>",n.getNotice_id())); */

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항</title>
<link href="css/bootstrap.min.css" rel="stylesheet">


</head>
<body>
	<div style="width: 950px; margin: auto;">
		<c:import url="Menu2.jsp"></c:import>
		<h4 class="text-center"><strong>NOTICE</strong></h4>
		<hr>
		
		<c:if test="${!empty sessionScope.admin}">		
		<p><a href="NoticeAdminWrite.jsp"><input type="button"
								value="글쓰기"></a></p>
		</c:if>						
								
		<table class="table table-hover">
	
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>

			<tr>
				<%=sb.toString()%>
			
			</tr>
		</table>
	</div>
</body>
</html>