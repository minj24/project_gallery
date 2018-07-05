<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.test.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//페이지 차단 액션 추가 (회원 전용 페이지)
	if (session.getAttribute("login") == null) {
		response.sendRedirect("LoginForm.jsp");
	}
%>
<%
	String art_id = request.getParameter("art_id");
	request.setCharacterEncoding("UTF-8");
	String imgSource = request.getContextPath() + "/upload";
	StringBuilder sb = new StringBuilder();
	AuctionDAO dao = new AuctionDAO();
	int max =dao.max_price(art_id);
	for (Auction a : dao.list(art_id)) {	
	sb.append(String.format("<div style=\"float: left;\">"));
	sb.append(String.format("<form action=\"NakcharInsert.jsp?art_id=%s\" method=\"post\" id=\"myForm\">",art_id));
	sb.append(String.format("<table class=\"test\">"));
	sb.append(String.format("<tr>"));
	sb.append(String.format("<td><img src=\"%s\" style=\"width:500px;height:450px;\"></td>",imgSource +"/"+a.getArt_picture()));
 	sb.append(String.format("<td style=\"vertical-align: top; padding: 10px;\"><div><b>NO.</b>%s</div>", a.getArt_id())); 
	sb.append(String.format("<div><b>경매 시작일 :</b>%s</div><br>", a.getAuction_start()));
	sb.append(String.format("<div><b>경매 종료일 :</b>%s</div><br>", a.getAuction_end()));
	sb.append(String.format("<div style=\"COLOR: red;\"><script>document.write(showCountdown(\"%s\"))</script></div>",a.getAuction_end()));
	sb.append(String.format("<div><b>시작 가격 :</b>%s</div>", a.getFirst_price()));
	sb.append(String.format("<div style=\"COLOR: blue;\"><b>현재 최고가격 :</b>%s</div>",max));
	sb.append(String.format("<div><b>작품 이름 :</b>%s</div>", a.getArt_name()));
	sb.append(String.format("<div><b>작가 이름 :</b>%s</div>", a.getName()));
	sb.append(String.format("</tr>")); 
	sb.append(String.format("</table>"));
	sb.append(String.format("</form>"));
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
<script type="text/javascript">
function AuctionPop(){
   window.open('AuctionPopup.jsp?art_id=<%=art_id%>', 'window팝업','width=500, height=500, menubar=no, status=no,top=200,left=400,toolbar=no');
	}
	
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
		<div class="col-xs-12" align="center">
			<h4 class="text-center">
				<strong>경매 상세 보기</strong>
			</h4>
			<hr>
			<%=sb.toString()%>
			<div style="clear: left;"></div>
			
			<div>
				<input type="button" onclick="javascript:AuctionPop();" value="응찰하기">
			</div>
		</div>
	</div>

</body>
</html>