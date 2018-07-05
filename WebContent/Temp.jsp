<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<%

String uploadPath = request.getContextPath();

System.out.println(uploadPath);

String imgSource = uploadPath + "/upload/Jellyfish.jpg";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>

<div>

<img src="<%=imgSource%>" style="width:50%; height:50%;">
</div>

</body>
</html>