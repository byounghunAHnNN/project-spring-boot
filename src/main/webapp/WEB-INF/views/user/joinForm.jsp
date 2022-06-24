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
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<link rel="stylesheet" href= "/css/joinForm.css">
</head>
<body>
 
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="/">개르만족</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
     <c:choose>
       <c:when test="${empty principal}">
       	<ul class ="navbar-nav">
   		  <li class ="nav-item"><a class="nav-link"href="/auth/loginForm">로그인</a></li>
		  <li class="nav-item"><a class="nav-link"href="/auth/joinForm">회원가입</a></li>
 		</ul>
       </c:when>
       <c:otherwise> 
	    <ul class ="navbar-nav">      	 
		  <li class="nav-item"><a class="nav-link"href="/board/writeForm">글쓰기</a></li>
		  <li class="nav-item"><a class="nav-link"href="/user/updateForm">회원정보</a></li>
		  <li class="nav-item"><a class="nav-link"href="/logout">로그아웃</a></li>		
		</ul>
	   </c:otherwise>
      </c:choose>

  </div>  
</nav>
<br />
<div class="container">
	<form action="/user/join">
	  <div class="form-group">
	    <label for="username">Username:</label>
	    <input type="text" class="form-control" placeholder="Enter 아이디" id="username">
	    <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
		<span class="id_input_re_2">이미 존재하는 아이디입니다.</span>
	    <span class="final_id_ck">아이디를 입력해주세요.</span>
	  </div>
	  <div class="form-group">
	    <label for="password">Password:</label>
	    <input type="password" class="form-control" placeholder="Enter 비밀번호" id="password">
	    <span class="final_pw_ck">비밀번호를 입력해주세요.</span>
	  </div>
	  <div class="form-group">
	    <label for="usernickname">Usernickname:</label>
	    <input type="usernickname" class="form-control" placeholder="Enter 닉네임" id="usernickname">
	    <span class="nick_input_re_1">사용 가능한 닉네임입니다.</span>
		<span class="nick_input_re_2">이미 존재하는 닉네임입니다.</span>	   
	    <span class="final_name_ck">닉네임을 입력해주세요.</span>
	  </div>
	  <div class="form-group">
	    <label for="email">Email:</label>
	      <input type="email" class="email-control" placeholder="Enter 이메일" id="email">
	      <span class="final_mail_ck">이메일을 입력해주세요.</span>
	      <span class="mail_input_box_warn"></span>
	    <!-- 메일 체크 -->
		<div class="mail_check_wrap">
          <div class="mail_check_input_box" id="mail_check_input_box_false">
              <input class="mail_check_input" disabled="disabled">
          </div>
          <div class="mail_check_button">
              <span >인증번호 전송</span>
          </div>
          <div class="clearfix"></div>
          <span id="mail_check_input_box_warn"></span>
        </div>
	  </div>
	  
	  <div class="address_wrap">
			<div class="address_name">주소</div>
			<div class="address_input_1_wrap">
				<div class="address_input_1_box">
					<input class="address_input_1" name="memberAddr1" id = "useradd1">
				</div>
				<div class="address_butt" onclick="execution_daum_address()">
					<span>주소 찾기</span>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class ="address_input_2_wrap">
				<div class="address_input_2_box">
					<input class="address_input_2" name="memberAddr2" id = "useradd2">
				</div>
			</div>
			<div class ="address_input_3_wrap">
				<div class="address_input_3_box">
					<input class="address_input_3" name="memberAddr3" id = "useradd3">
				</div>
			</div>
			<span class="final_addr_ck">주소를 입력해주세요.</span>
		</div> 
	
	 	  
	  <div class="form-group form-check">
	    <label class="form-check-label">
	      <input class="form-check-input" type="checkbox"> Remember me
	    </label>
	  </div>
	 </form>
	 <button id="btn-save" class="btn btn-primary">회원가입완료</button>
</div>

<script src="/js/user.js"> </script>
<script src="/js/email.js"> </script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
/* 입력 이메일 형식 유효성 검사 */
function mailFormCheck(email){
   var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
   return form.test(email);
}
</script>

<%@ include file="../layout/footer.jsp" %>


