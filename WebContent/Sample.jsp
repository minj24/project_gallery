<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>부트스트랩 101 템플릿</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>


	<!-- <div>
 <ul>
 <li class="dropdown" style="list-style: none;">
	<button id="dLabel"  data-toggle="dropdown">    
    About us<span class="sr-only">(current)</span>
  	</button>
  	<ul class="dropdown-menu">    
    	<li>3333333</li>    
  	</ul>  
  	</li>
 </ul>
  </div>
<div class="dropdown">
  <button id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Gallery    
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
    <li><a href="Gallery.jsp">1111111</a></li>
    <li>1122</li>    
  </ul>  
</div>



<div class="dropdown">
  <li id="dLabel" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Gallery    
  </li>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
    
    <li>dididididi</li>    
  </ul>  
</div> 
 -->



	<!-- 
<table class="table table-hover">
  <tr>
		<th>번호</th><th>제목</th><th>글쓴이</th>
		<th>날짜</th>
		</tr>
		
		<tr>
		<td>1</td><td>경매 위탁 신청 방법</td><td>관리자</td>
		<td>2015-05-01</td>
		</td>
		</tr>
</table>
   -->

	<!-- <div class="dropdown">
		<button id="dLabel" type="button" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false">
			검색기준<span class="caret"></span>
		</button>
		<br>
		<ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
			<li>작가명</li>
			<li>작품명</li>
		</ul>
	</div> -->


	<div id="myCarousel" class="carousel slide">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<!-- 회전광고판 항목 -->
		<div class="carousel-inner">
			<div class="active item">
				<img src="Main1.png" style="width:100%; "style="height:80px">
			</div>
			<div class="item">
				<img src="Main2.png" style="width: 100%;" style="height:80px">
			</div>
			<div class="item">
				<img src="Main3.jpg" style="width: 100%;" style="height :80px">
			</div>
		</div>
		<!-- 회전광고판 탐색 -->
		<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
	</div>
</body>
</html>
