<%@page import="com.test.AuctionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("UTF-8");
String art_id = request.getParameter("art_id");
AuctionDAO dao = new AuctionDAO();
dao.nakcherAdd(art_id);

response.sendRedirect("Auction.jsp?art_id="+art_id);
%>