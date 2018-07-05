<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.test.*"%>
<%
request.setCharacterEncoding("UTF-8");
//데이터 수신
String email = (String)session.getAttribute("login");
String bid_price = request.getParameter("bid_price");
String art_id = request.getParameter("art_id");

//DB 액션  -> add() 메소드 호출
Bid b = new Bid();
b.setEmail(email);
b.setBid_price(bid_price);
b.setArt_id(art_id);

AuctionDAO dao = new AuctionDAO();
dao.add(b);
dao.max_price(art_id);
//강제 페이지 전환
response.sendRedirect("AuctionPopup.jsp?art_id="+art_id);
%>