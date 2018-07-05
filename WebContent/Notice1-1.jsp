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
//데이터 수신
String notice_id = request.getParameter("notice_id");
//데이터액션 -> 
StringBuilder sb = new StringBuilder();


NoticeDAO dao = new NoticeDAO();


Notice n  = dao.List(notice_id);
	//번호, 이름, 생일,양음력,전번,부서명,직위명,지역명,기본급,수당,급여,삭제
	String contents  = n.getN_contents();
	contents = contents.replace("\r\n","<br>");
	
	sb.append(String.format("<table class=\"table table-hover\" style=\"border:solid 3px; \">"));
	sb.append(String.format("<thead>"));
	sb.append(String.format("<tr>\r\n"));
	sb.append(String.format("<th>제목</th>"));
	sb.append(String.format("<td>%s</td>", n.getN_title() ));
	sb.append(String.format("</tr>\r\n"));
	sb.append(String.format("<tr>\r\n"));
	sb.append(String.format("<th>날짜</th>"));
	sb.append(String.format("<td>%s</td>", n.getN_date() ));
	sb.append(String.format("</tr>\r\n"));
	sb.append(String.format("</thead>"));
	sb.append(String.format("<tbody>"));
	sb.append(String.format("<tr>\r\n"));
	sb.append(String.format("<th>내용</th>"));
	sb.append(String.format("<td>%s</td>", contents ));
	sb.append(String.format("</tr>\r\n"));
	sb.append(String.format("</tbody>"));
	sb.append(String.format("</table>"));
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>응찰내역 </title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
th {
	width:100px;
	border-right: solid 1px;
}

</style>

</head>
<body>
	<div style="width: 950px; margin: auto;">
		<c:import url="Menu2.jsp"></c:import>
		<h4 class="text-center">
			<strong>NOTICE</strong>
		</h4>
		<hr>
		<div align="center" >
	
			
			<%=sb.toString() %>	
		<c:if test="${!empty sessionScope.admin}">
	<p>
	<a href="NoticeModify.jsp?notice_id=<%=notice_id %>"><input type="button" value="수정"></a>
	</p>
	</c:if>
		
	
		</div>
		
	</div>
</body>
</html>