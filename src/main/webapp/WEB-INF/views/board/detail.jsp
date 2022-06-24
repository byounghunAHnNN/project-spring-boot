<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<div class="container"> <!-- 로그인 요청을 스프링시큐리티가 가로채가서 수행함. 컨트롤러에 따로작성 안함 -->
	  <div class="form-group">
	  	<div>
		 글 번호: <span id="id"><i> ${board.id }</i></span>
	     작성자: <span><i>${board.user.username }</i></span>	
		</div>
		<br/>
	    <label for="title">Title</label>
		<h3>${board.title }</h3>
	  </div>
	  <hr />
	  
	 <div class="form-group">
	  <label for="content">Content:</label>
	  <div>${board.content }</div>
	  
	 </div>	 
	 <hr />
	 
	
	 
	 <div class="card">
	 	<div class="card-header">댓글리스트</div>
	 	<ul id="reply-box" class="list-group">
	 		<c:forEach var="reply" items="${board.replys }">
	 		  <li id="reply-${reply.id }" class="list-group-item d-flex">
	 		  <div class="font-italic">${reply.user.usernickname } &nbsp;</div>
	 		  <div  class="d-flex justify-content-center">${reply.content }</div>
	 		  <button class="d-flex justify-content-end" onClick="index.replyReply(${board.id},${reply.id})" class="badge">답글 달기</button>
	 		  <c:if test="${reply.user.id == principal.user.id }">
		 		  <div  >
		 		  	<button class="d-flex justify-content-end" onClick="index.replyDelete(${board.id},${reply.id})" class="badge">삭제</button>
		 		  </div>
		 	  </c:if>	  
	 		  </li>
	 		</c:forEach>		
	 	</ul>
	 </div>
	  <div>
	 	<div class="card">
	 	  <form>
	 	    <input type="hidden" id="boardId" value="${board.id }"/>
	 		<div class="card-body">
	 		  <textarea id="reply-content" class="form-control" rows="1" cols="">
	 		  </textarea>
	 		</div>
	 	
	 		<div class="card-footer">
	 		  <button type="button" id="btn-reply-save" class="btn btn-primary">등록</button>
	 		</div>
	 	   </form>	
	 	</div>
	 </div>
</div>
		<br/>
 <button id="btn-back" class="btn btn-back" onclick="history.back()">목록으로</button>	

 <c:if test="${board.user.id == principal.user.id }">
   <a href="/board/${board.id }/modifyForm" class="btn btn-modify">글 수정</a>
   <button id="btn-delete" class="btn btn-delete">글 삭제</button>	
 </c:if>
 	<script>
      $('.summernote').summernote({
       // placeholder: 'Hello Bootstrap 4',
        tabsize: 2,
        height: 300
      });
    </script>
<script src="/js/board.js"> </script>
<%@ include file="../layout/footer.jsp" %>


