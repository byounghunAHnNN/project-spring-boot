<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<div class="container"> <!-- 로그인 요청을 스프링시큐리티가 가로채가서 수행함. 컨트롤러에 따로작성 안함 -->
	<form>
	  <input type="hidden" id="id" value="${board.id }" />
	  <div class="form-group">
	    <input value="${board.title }" type="text" class="form-control" placeholder="Enter Title" id="title">
	  </div>
	  
	 <div class="form-group">
	  <textarea class="form-control summernote" rows="5" id="content">${board.content }</textarea>
	 </div>	 
	</form>
 <button id="btn-modify" class="btn btn-primary">글수정완료</button>	
</div>

	<script>
      $('.summernote').summernote({
       // placeholder: 'Hello Bootstrap 4',
        tabsize: 2,
        height: 300
      });
    </script>
<script src="/js/board.js"> </script>
<%@ include file="../layout/footer.jsp" %>


