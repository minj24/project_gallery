<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ page import="com.test.*"%>
<%

	String witak_agree = request.getParameter("witak_agree");
	String art_id = request.getParameter("art_id");
	String hope_price =request.getParameter("hope_price");
	
	AdminDAO dao = new AdminDAO();
	
	Bid_witak_enroll bwe = new Bid_witak_enroll();
	
	bwe.setWitak_agree(witak_agree);
	bwe.setArt_id(art_id);	
	bwe.setHope_price(Integer.valueOf(hope_price));
	dao.witakAgreeModify(bwe);
	
	response.sendRedirect("Admin3.jsp");	
	
%>