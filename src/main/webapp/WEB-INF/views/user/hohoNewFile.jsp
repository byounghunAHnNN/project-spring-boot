<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<!DOCTYPE html>
<html lang="en">


<div class="container">
	<form action="/user/join">
	  <div class="form-group">
	    <label for="username">Userid:</label>
	    <input type="text" class="form-control" placeholder="Enter 아이디" id="username">
	  </div>
	  <div class="form-group">
	    <label for="password">Password:</label>
	    <input type="password" class="form-control" placeholder="Enter 비밀번호" id="password">
	  </div>
	  <div class="form-group">
	    <label for="email">Email:</label>
	    <input type="email" class="email-control" placeholder="Enter 이메일" id="email">
	    <!-- 메일 체크 -->
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled"><!-- 입력을 받을 수 없는상태 -->
					</div>
					<button class="email_btn">인증번호 전송</button>
					<div class="clearfix"></div>
                    <span id="mail_check_input_box_warn"></span>
				</div>
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


<%@ include file="../layout/footer.jsp" %>


