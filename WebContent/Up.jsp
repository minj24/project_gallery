<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <title>파일 업로드를 심플하게 해보아요 :-)</title>
</head>
<body>
          <!-- enctype="multipart/form-data" 파일이나 대용량 데이터 보낼때 데이터 전송 방식 --> 
 <form name="fileForm" method="post" enctype="multipart/form-data" action="Upload.jsp"> 
 작성자 : <input type="text" name="name"><br>
 제목 : <input type="text" name="subject"><br>
 파일명 : <input type="file" name="filename"><br>
 
 <input type="submit" value="파일올리기"><br>
</form>
</body>
</html>
