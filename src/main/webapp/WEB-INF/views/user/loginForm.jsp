<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal" var="principal"/>
</sec:authorize>  
<!DOCTYPE html>
<html lang="en">
<head>
  <title>로그인</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="/css/login_style.css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
</head>



<body>
  <div class="container">
    <div class="return_logo">
      
      <a href="/">
      <img src="/image/logo2.png" alt="logo" height="250">
      </a>
    </div>


<div class="login_form"> <!-- 로그인 요청을 스프링시큐리티가 가로채가서 수행함. 컨트롤러에 따로작성 안함 -->
	<form action="/auth/loginProc" method="post">

	  <div class="form-group">
	    <label for="username">Username:</label>
	    <input type="text" name="username" class="text_field" placeholder="아이디" id="username">
	  </div>
	   
	  <div class="form-group">
	    <label for="password">Password:</label>
	     <input type="password" name="password" class="text_field" placeholder="비밀번호" id="password">
	  </div>
	  <div class="remember_id_checkbox"> 
          <input class="remeber_id" type="checkbox" 
          name="remember">
          <p class="remember_id_word">아이디 기억</p>
          <input class="keep_login" type="checkbox" 
          name="remember">
          <p class="keep_login_word">로그인 상태 유지
          </p>
       </div>

	 <button id="btn-login" class="submit_btn">로그인</button>
	
	
	    <div class="links">
          <ul class="find_wrap" id="find_wrap">
            <li>
                <a href="/auth/findId" class="find_id">아이디 찾기</a>
            </li>
            <li>
                <a href="/auth/findPw" class="find_password">비밀번호 찾기</a>
            </li>
            
          </ul>
        </div>
	   </form>
	</br>
	
</div>

<%@ include file="../layout/footer.jsp" %>