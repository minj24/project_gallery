<%@page import="com.test.Gallery"%>
<%@page import="com.test.GalleryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 파일 업로드 처리를 위한 MultipartRequest 객체를 임포트 -->
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!-- 파일 중복처리 객체 임포트 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%
request.setCharacterEncoding("UTF-8");
	String uploadPath = request.getSession().getServletContext()
			.getRealPath("/upload");

	int size = 10 * 1024 * 1024; // 업로드 파일 최대 크기 지정
	String email = "";
	String art_name = "";
	String art_picture = "";
	String art_member_picture = "";
	String art_intro = "";

	try {
		// 파일 업로드. 폼에서 가져온 인자값을 얻기 위해request 객체 전달,
		//업로드 경로, 파일 최대 크기, 한글처리, 파일 중복처리
		MultipartRequest multi = new MultipartRequest(request,
				uploadPath, size, "UTF-8",
				new DefaultFileRenamePolicy());

		// 폼에서 입력한 값을 가져옴
		email = multi.getParameter("email");
		art_name = multi.getParameter("artName");
		art_picture = multi.getParameter("art_picture");
		art_intro = multi.getParameter("art_intro");

		// 업로드한 파일들을 Enumeration 타입으로 반환
		// Enumeration형은 데이터를 뽑아올때 유용한 인터페이스 Enumeration객체는 java.util 팩키지에 정의 되어있으므로
		// java.util.Enumeration을 import 시켜야 한다.
		Enumeration files = multi.getFileNames();

		// 업로드한 파일들의 이름을 얻어옴
		String file1 = (String) files.nextElement();

		art_picture = multi.getFilesystemName(file1);
		art_member_picture = multi.getParameter("art_member_picture");
		
		GalleryDAO dao = new GalleryDAO();

		String file2 = (String) files.nextElement();
		art_member_picture = multi.getFilesystemName(file2);
		
		//중복 작가 사진 검사 (아직 덜 됐음 멘붕 )
		for (Gallery gg : dao.galleryList()) {
			
			if (!art_member_picture.equalsIgnoreCase(gg.getArt_member_picture())) {
				
			}
		}
		Gallery g = new Gallery();

		g.setArt_name(art_name);
		g.setEmail(email);
		g.setArt_picture(art_picture);
		g.setArt_member_picture(art_member_picture);
		g.setArt_intro(art_intro);
		
		dao.galleryAdd(g);

		session.setAttribute("gallery_apply", "1");
		
		//텍스트 파일 정보(파일 이름만)는 데이터베이스 저장
		//바이너리 파일 자체는 서버의 특정 폴더에 저장 
	} catch (Exception e) {
		// 예외처리
		e.printStackTrace();
	}
	
	response.sendRedirect("Main.jsp");
%>