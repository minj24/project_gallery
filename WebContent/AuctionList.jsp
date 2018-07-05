<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.test.*"%>
<%
if (session.getAttribute("login") == null) {
    response.sendRedirect("LoginForm.jsp");
    
 }
request.setCharacterEncoding("UTF-8");
String imgSource = request.getContextPath() + "/upload";
String searchKey = request.getParameter("searchKey");
String searchValue = request.getParameter("searchValue");

StringBuilder sb = new StringBuilder();
AuctionDAO dao = new AuctionDAO();

if(searchKey==null){
for(Auction a : dao.auctionList()){
	  sb.append(String.format("<div style=\"float:left; padding-right: 20px\">"));
      sb.append(String.format("<table class=\"table table-hover\" style=\"border:solid 3px; \">"));
      sb.append(String.format("<tr>"));
	sb.append(String
			.format("<td><img src=\"%s\" style=\"width:200px;height:150px;\"></td>",
					imgSource + "/" + a.getArt_picture()));
	sb.append(String.format("</table>"));
	sb.append(String
			.format("<td style=\"vertical-align: top; padding: 10px;\"><div><b>경매 시작일 :</b>%s</div>",
					a.getAuction_start()));
	sb.append(String.format("<div><b>경매 종료일 :</b>%s</div>", a.getAuction_end()));
	sb.append(String.format("<div style=\"COLOR: red;\"><script>document.write(showCountdown(\"%s\"))</script></div>",a.getAuction_end()));
	sb.append(String.format("<div><b>작가 이름 :</b>%s</div>", a.getName()));
	sb.append(String.format("<div><b>작품 이름 :</b>%s</div>", a.getArt_name()));
	sb.append(String
			.format("<div><a href=\"Auction.jsp?art_id=%s\">상세보기</a></div></td>",
					a.getArt_id()));
	 sb.append(String.format("</div>"));
     
     sb.append(String.format("</tr>"));
     sb.append(String.format("</div>"));
}
}else{
   for(Auction a : dao.auctionList(searchKey, searchValue)){
	   sb.append(String.format("<div style=\"float: left;\">"));
		sb.append(String.format("<table class=\"test\">"));
		sb.append(String.format("<tr>"));
		sb.append(String
				.format("<td><img src=\"%s\" style=\"width:200px;height:150px;\"></td>",
						imgSource + "/" + a.getArt_picture()));
		sb.append(String
				.format("<td style=\"vertical-align: top; padding: 10px;\"><div><b>경매 시작일 :</b>%s</div>",
						a.getAuction_start()));
		sb.append(String.format("<div><b>경매 종료일 :</b>%s</div>", a.getAuction_end()));
		sb.append(String.format("<div style=\"COLOR: red;\"><script>document.write(showCountdown(\"%s\"))</script></div>",a.getAuction_end()));
		sb.append(String.format("<div><b>작가 이름 :</b>%s</div>", a.getName()));
		sb.append(String.format("<div><b>작품 이름 :</b>%s</div>", a.getArt_name()));
		sb.append(String
				.format("<div><a href=\"Auction.jsp?art_id=%s\">상세보기</a></div></td>",
						a.getArt_id()));
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
<script type="text/javascript">

window.onload=function() {
   setInterval("location.reload()", 1000*60);
};

function showCountdown(day) {
   var today = new Date();
   var dday = new Date(day);
   var result = dday - today;
   if (result > 0) {
      result = Math.floor(result / 1000);
       var day = Math.floor(result / (3600 * 24));
       var mod = result % (24 * 3600);
       var hour = Math.floor(mod / 3600);
       mod = mod % 3600;
       var min = Math.floor(mod / 60);
       var count =  (day > 0) ? day + "일 " : "";
       count = count + ((hour > 0) ? hour + "시 " : "");
       count = count + min + "분 ";
       
      return count;
   } else {
      return "경매 종료";
      
   }
}

</script>

</head>
<body>
	<div style="width: 950px; margin: auto;">
		<c:import url="Menu2.jsp"></c:import>
		<h4 class="text-center">
			<strong>경매 리스트</strong>
		</h4>
		<hr>
		<br>

		<div>
			<%=sb.toString() %>

			<div style="clear: left;"></div>
		</div>

	

	<!-- 검색 부분 -->

	<form method="post" id="myForm">
		<div class="dropdown" align="right">
			<select name="searchKey"><option>검색기준</option>
				<option value="0">작가명</option>
				<option value="1">작품명</option></select>
			<p>
				검색단어* <input type="text" name="searchValue" id="searchValue"
					value="<%=searchValue %>"> <input type="submit" value="검색">
			</p>

		</div>
	</form>
</div>
</body>
</html>