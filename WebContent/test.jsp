<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.test.*"%>
<%
String login = (String)session.getAttribute("login");
String check ="";
if(login==null){
	check = "Menu.jsp";
}else{
	check = "Menu2.jsp";
}

StringBuilder sb = new StringBuilder();
AuctionDAO dao = new AuctionDAO();
for(Auction a : dao.auctionList()){
	
	sb.append(String.format("<tr><td>%s</td></tr>",a.getArt_picture()));	
	sb.append(String.format("<tr><td class = \"row\">%s</td></tr>",a.getAuction_start()));
	sb.append(String.format("<tr><td class = \"row\">%s</td></tr>",a.getAuction_end()));
	sb.append(String.format("<tr><td class = \"row\">%s</td></tr>",a.getFirst_price()));
	sb.append(String.format("<tr><td class = \"row\">%s</td></tr>",a.getName()));
	sb.append(String.format("<tr><td class = \"row\">%s</td></tr>",a.getArt_name()));
	sb.append(String.format("<a href=\"Auction.jsp?art_id=%s\">상세보기</a>",a.getArt_id())); 
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
	<c:import url="<%=check %>"></c:import>
		<%-- <c:import url="Menu2.jsp"></c:import> --%>
		<h4 class="text-center">
			<strong>경매 리스트</strong>
		</h4>
		<hr>
		<br>

 	<table id="test"><%=sb.toString() %></table>
 
 
 </div>

		<!-- 검색 부분 -->

<div class="dropdown" align="right">			
		<select><option>검색기준</option>
		<option>작가명</option>
		<option>작품명</option></select>
			
			
	<form class="form-search">
		<input type="text" class="input-medium search-query">
		<button type="submit" class="btn">검색</button>
	</form>
</div>

</body>
</html>