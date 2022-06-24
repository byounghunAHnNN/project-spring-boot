<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<!DOCTYPE html>
<html lang="en">


<div class="container">
	<input type="hidden" id="id" value="${principal.user.id }" />
	  <div class="form-group">
	    <label for="username">Username:</label>
	    <input type="text" value="${principal.user.username }" class="form-control" placeholder="Enter 아이디" id="username" readonly>
	  </div>
	  <div class="form-group">
	    <label for="password">Password:</label>
	    <input type="password"  class="form-control" placeholder="Enter 비밀번호" id="password">
	  </div>
	  <div class="form-group">
	    <label for="email">Email:</label>
	    <input type="email" value="${principal.user.email }" class="email-control" placeholder="Enter 이메일" id="email">	  
	  </div>
	  
	  
	  <div class="form-group form-check">
	    <label class="form-check-label">
	      <input class="form-check-input" type="checkbox"> Remember me
	    </label>
	  </div>
	 </form>
	 <button id="btn-update" class="btn btn-primary">회원수정완료</button>
</div>

<script src="/js/user.js"> </script>
<script src="/js/email.js"> </script>
<script>

</script>

<%@ include file="../layout/footer.jsp" %>


