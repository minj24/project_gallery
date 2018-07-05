<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.*" %>
<%-- 액션 전용 페이지 --%>
<%
//데이터 수신 -> id, pw, grade
request.setCharacterEncoding("UTF-8");
String email = request.getParameter("email");
String pw = request.getParameter("pw");

//데이터베이스 액션 -> login() 메소드 호출
DAO dao = new DAO();
Member result = dao.login(email, pw);


//반환값(0 또는 1)을 분석하는 과정 추가
if(result == null){
	//로그인 실패
	response.sendRedirect("LoginFail.jsp");
} else {
	//로그인 성공

	//회원 전용 세션 객체(login) 생성 과정 추가
	session.setAttribute("login", result.getEmail());
	if (result.getGrade().equals("1")) {
		//작가 전용 세션 객체(artist) 생성 과정 추가
		session.setAttribute("artist", result.getEmail());
	}
	if (result.getGrade().equals("0")) {
		//관리자 전용 세션 객체(admin) 생성 과정 추가
		session.setAttribute("admin", result.getName());
	}

	response.sendRedirect("Main.jsp");
}
%>