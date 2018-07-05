<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
 
<!-- 파일 업로드 처리를 위한 MultipartRequest 객체를 임포트 -->
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
 
<!-- 파일 중복처리 객체 임포트 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
 
<%@ page import="java.util.*" %>

<%
// 업로드 파일이 저장 될 경로 설정 
// 웹서버의 하위 폴더 구성 -> 웹서버 루트 폴더 확인 명령 -> 하위 폴더 탐색

String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
 
 int size = 10*1024*1024; // 업로드 파일 최대 크기 지정
 
 String name="";
 String subject="";
 String filename="";
 String imgSource = request.getContextPath() + "/upload";
 
 try{
 
  // 파일 업로드. 폼에서 가져온 인자값을 얻기 위해request 객체 전달,
  //업로드 경로, 파일 최대 크기, 한글처리, 파일 중복처리
  MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr", new DefaultFileRenamePolicy());
 
  
  // 폼에서 입력한 값을 가져옴
  name = multi.getParameter("name");
  subject = multi.getParameter("subject");
 
  
// 업로드한 파일들을 Enumeration 타입으로 반환
// Enumeration형은 데이터를 뽑아올때 유용한 인터페이스 Enumeration객체는 java.util 팩키지에 정의 되어있으므로
// java.util.Enumeration을 import 시켜야 한다.
  Enumeration files = multi.getFileNames();
 
  
  // 업로드한 파일들의 이름을 얻어옴
  String file = (String)files.nextElement();
  filename = multi.getFilesystemName(file);
 
  
  //텍스트 파일 정보(파일 이름만)는 데이터베이스 저장
  //바이너리 파일 자체는 서버의 특정 폴더에 저장 
 
 }catch(Exception e){
  // 예외처리
  e.printStackTrace();
 }
 
 out.println("작성자 : "+name+"<br>"); 
 out.println("제목 : "+subject+"<br>");
 
 imgSource += "/"+ filename;
 
 System.out.println(imgSource);
 
 //imgSource = "http://localhost:8090/Gallery/KakaoTalk_20150520_101627866.png";
 
%>
  
<html>
<body>
<div>
	<div>
	 <p>업로드 된 파일명 : <%=filename%></p>
	 
	 <p>이미지 출력: </p>
	 <p><img src="<%=imgSource%>" style="width:200px;height:150px;"></p>
	 <p><a href="<%=imgSource%>" target="_blank">원본보기</a></p>
	 </div>
</div>
</body>
</html>
