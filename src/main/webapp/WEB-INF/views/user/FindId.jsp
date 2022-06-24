<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

	
	  <div class="form-group">
	    <label for="email">Email:</label>
	    <input type="text" name="email" class="email-control" placeholder="email" id="email">
	  </div>
	  <div  id="btn-id-find" class="btn btn-primary">
          <span>인증번호 전송</span>
      </div>
      <div class="clearfix"></div>
      <span id="mail_check_input_box_warn"></span> 
	


<script src="/js/user.js"> </script>	
<script>
/* 입력 이메일 형식 유효성 검사 */
function mailFormCheck(email){
   var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
   return form.test(email);
}
</script>
<%@ include file="../layout/footer.jsp" %>


