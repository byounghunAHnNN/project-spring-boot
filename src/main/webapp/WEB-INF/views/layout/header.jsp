<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal" var="principal"/>
</sec:authorize>   

<!DOCTYPE html>
<html lang="en">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


<head>
  <title>Bootstrap Example</title>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <title>Nav bar</title>
  <script src="https://kit.fontawesome.com/342b4a23fe.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href= "/css/header.css">
</head>
<body>
 
<!-- 먼저 커다란 박스를 만든다. -->
  <nav class="navbar">
  <!-- 로고박스를 만든다-->
    <div class="navbar_logo">
      <!-- <img src="img/logo2.png">   -->
    </div>
    <!-- 메뉴 박스를 만든다. 메뉴들은 목록화 되어있으니까..  -->
    <div class="navbar_main">
      <a href="/">
        <img class="logo_to_home" src="image/로고다.png">
      </a>
    <ul class="navbar_menu">    
        <!-- 리스트 안에 클릭해서 넘어가야 하니까 a 테그도 써준다. -->
        <li><a href="">GPS</a></li>
        <li><a href="">캘린더</a></li>
        <li><a href="">게시판</a></li>
        <li><a href="">고객센터</a></li>
        <li class="nav-item"><a class="nav-link"href="/logout">로그아웃</a></li>	
      </ul>
    </div>
    
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
     <c:choose>
       <c:when test="${empty principal}">
       <div class="sns_login">
        <ul class="navbar_sns">
          <li><i class="fa-brands fa-facebook"></i></li>
          <li><i class="fa-brands fa-instagram"></i></li>
          <li><i class="fa-brands fa-twitter"></i></li>
        </ul>       
       	<ul class="navbar_login">
   		  <li class ="nav-item"><a class="nav-link"href="/auth/loginForm">로그인</a></li>
		  <li class="nav-item"><a class="nav-link"href="/auth/joinForm">회원가입</a></li>
 		</ul>
 	   </div>	
       </c:when>
       <c:otherwise> 
	    <ul class ="navbar-nav">
	     <ul class="navbar_sns">
          <li><i class="fa-brands fa-facebook"></i></li>
          <li><i class="fa-brands fa-instagram"></i></li>
          <li><i class="fa-brands fa-twitter"></i></li>
        </ul>
        <ul class="navbar_login2">     	 
		  <li class="nav-item"><a class="nav-link"href="/board/writeForm">글쓰기</a></li>
		  <li class="nav-item"><a class="nav-link"href="/user/updateForm">회원정보</a></li>
		  <li class="nav-item"><a class="nav-link"href="/logout">로그아웃</a></li>		
		  </ul>     
		</ul>
	   </c:otherwise>
     </c:choose>

  </div>  
</nav>
<br />


