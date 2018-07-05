<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jstl/core" %>
<%@ page import="com.test.*" %>
<%
String gallery_agree = request.getParameter("gallery_agree");
String art_id = request.getParameter("art_id");

System.out.println("gallery_agree:"+gallery_agree);
System.out.println("art_id:"+art_id);

AdminDAO dao = new AdminDAO();

Gallery g = new Gallery();

g.setArt_id(art_id);
g.setGallery_agree(gallery_agree);

dao.galleryAgreeModify(g);

response.sendRedirect("Admin2.jsp");








%>