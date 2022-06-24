<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

	  <div class="form-group">
	    <label for="username">Username:</label>
	    <input type="text" name="username" class="username-control" placeholder="Enter username" id="username">
	  </div>	
	  <div class="form-group">
	    <label for="email">Email:</label>
	    <input type="text" name="email" class="email-control" placeholder="email" id="email">
	  </div>
	 <!-- 메일 체크 -->
		<div class="mail_check_wrap">
          
	    <div  id="btn-fW-find" class="btn btn-primary">
          <span>인증번호 전송</span>
        </div>
        <div class="clearfix"></div>
        <span id="fw_mail_check_input_box_warn"></span>
       </div>
       <div class="form-group">
       
       </div>
		

<script src="/js/user.js"> </script>	
<script>
/* 입력 이메일 형식 유효성 검사 */
function mailFormCheck(email){
   var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
   return form.test(email);
}
</script>
<%@ include file="../layout/footer.jsp" %>





