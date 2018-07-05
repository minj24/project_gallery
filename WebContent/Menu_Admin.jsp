<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>

<meta http-equiv="content-type" content="text/html;charset=utf-8" />

   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
   <script type="text/javascript">
         $(function(){
        $("ul.sub").hide();
       $("ul.menu li").hover(function(){
          $("ul:not(:animated)",this).slideDown("fast");
         },
         function(){
            $("ul",this).slideUp("fast");
         });
      });   
   </script>
 
   <style type="text/css">
      *{
        margin: 0;
       padding: 0;
       list-style-type: none;}
      #container{
        margin: auto;
       width: 950px; }
      ul.menu li{ 
        float: left;
       width: 155px;
       height: 48px;
       background-color: black;
       position: relative;
       }
      ul.menu li a{
        display: block;
       width: 100%;
       height: 100%;
       line-height: 48px;
       text-indent: 30px;
       font-weight: bold;
       color: #eee;
       text-decoration: none;
       }
      ul.menu li a:hover{
        background-color: #333;
       }
      ul.menu li ul.sub{
        position: absolute;
       }
      ul.menu{
        zoom: 1;
       }
      ul.menu:after{
        height: 0;
       visibility: hidden;
       content: ".";
       display: block;
       clear: both;
       }
   </style>


   <div id="container">
   <ul class="menu">
       <li><a href="Main.jsp">Home</a>
       </li>
      <li><a href="#">About us</a>
       <ul class="sub">
          <li><a href="Notice.jsp">공지사항</a></li>
         <li><a href="Consigner.jsp">경매 위탁 신청</a></li>
         <li><a href="GalleryApply.jsp">갤러리 신청</a></li>
      </ul>
      </li>
      <li><a href="#">Auction</a>
       <ul class="sub">
          <li><a href="AuctionList.jsp">경매 상품 보기</a></li>
      </ul>
      </li>
      <li><a href="#">Gallery</a>
       <ul class="sub">
          <li><a href="GalleryList.jsp">그림 보기</a></li>
         <li><a href="ArtistList.jsp">화가 소개</a></li>
      </ul>
      </li>
      <li><a href="Mypage4.jsp">MyPage</a></li>
      <li><a href="Login.jsp">Log-out</a></li>
   </ul>
   </div>


<div>
   <img src="Logo.png" style="width: 100%;">
</div>



