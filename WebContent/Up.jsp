<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<html>
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <title>���� ���ε带 �����ϰ� �غ��ƿ� :-)</title>
</head>
<body>
          <!-- enctype="multipart/form-data" �����̳� ��뷮 ������ ������ ������ ���� ��� --> 
 <form name="fileForm" method="post" enctype="multipart/form-data" action="Upload.jsp"> 
 �ۼ��� : <input type="text" name="name"><br>
 ���� : <input type="text" name="subject"><br>
 ���ϸ� : <input type="file" name="filename"><br>
 
 <input type="submit" value="���Ͽø���"><br>
</form>
</body>
</html>
