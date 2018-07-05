<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 액션 전용 페이지 - HTML 코드 삭제, 강제 페이지 전환, 직접 실행 X --%>
<%@ page import ="com.test.*"%>
<%
//데이터 수신(한글 인코딩 추가)
request.setCharacterEncoding("UTF-8");
String art_name = request.getParameter("art_name");
String hope_price = request.getParameter("hope_price");


//데이터베이스 액션 -> MemberDAO 클래스 담당
GalleryDAO dao = new GalleryDAO();
Bid_witak_enroll b = new Bid_witak_enroll();
b.setArt_name(art_name);
b.setHope_price(Integer.parseInt(hope_price));
dao.add(b);
if(art_name != null){
dao.modify(b);
}
 
//강제 페이지 전환
response.sendRedirect("AuctionList.jsp");
%>
