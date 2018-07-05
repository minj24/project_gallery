<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.test.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%
if (session.getAttribute("login") == null) {
	response.sendRedirect("LoginForm.jsp");
}
	String art_id = request.getParameter("art_id");
	StringBuilder sb = new StringBuilder();
	AuctionPopDAO dao = new AuctionPopDAO();
	AuctionDAO adao = new AuctionDAO();

	int max_price = adao.max_price(art_id);

	Auction a = dao.AuctionList(art_id);

	sb.append(String.format("<div style=\"float: left;\">"));
	sb.append(String.format("<table class=\"test\">"));
	sb.append(String.format("<tr>"));
	sb.append(String.format("<div class=\"row\">응찰자 : %s</div>",
			a.getName()));
	sb.append(String.format("<div class=\"row\">최고가격 : %s</div>",
			max_price));
	sb.append(String.format("</tr>"));
	sb.append(String.format("</table>"));
	sb.append(String.format("</div>"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#myForm").submit(function() {
			if ($("#bid_price").val() <=
<%=max_price%>
	) {

				alert(
<%=max_price%>
	+ "이상 응찰하십시오.");
				return false;
			} else {
				//서브밋 액션 진행  
				if (confirm($("#bid_price").val() + "원을 응찰하시겠습니까?")) {
					return true;
				} else {
					return false;
				}

			}

		});

	});
</script>
</head>
<body>
	<div align="center">
		<div>
			<img src="Logo.png" style="width: 100%;" style="padding-top: 10px">
		</div>
		<form action="Auctionim.jsp?art_id=<%=art_id%>" method="post"
			id="myForm" class="max_price">
			<strong>응찰</strong>

			<input type="text" id="bid_price" required="required"
				name="bid_price"> <input type="submit" value="응찰">

			<div class="row" style="padding-top: 10px">응찰단위 : 10000\</div>
			<br>
			<div class="col-xs-9">
				<table class="table table-hover">

					<%=sb.toString()%>
				</table>
			</div>
		</form>

	</div>
</body>
</html>