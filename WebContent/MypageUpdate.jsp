<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 액션 전용 페이지 - HTML 코드 삭제, 강제 페이지 전환, 직접 실행 X --%>
<%@ page import ="com.test.*"%>
<%
//데이터 수신(한글 인코딩 추가)
request.setCharacterEncoding("UTF-8");
String pw = request.getParameter("PW");
String phone = request.getParameter("PHONE");
String member_intro = request.getParameter("member_intro");
String email = (String)session.getAttribute("login");

//데이터베이스 액션 -> MemberDAO 클래스 담당
GalleryDAO dao = new GalleryDAO();
Member m = new Member();
m.setPw(pw);
m.setPhone(phone);
m.setMember_intro(member_intro);
m.setEmail(email);
dao.sujang(m);


//강제 페이지 전환
response.sendRedirect("Mypage1.jsp");
%>