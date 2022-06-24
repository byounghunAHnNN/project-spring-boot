<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<!DOCTYPE html>
<html lang="en">


<div class="container">
  <c:forEach var="board" items="${boards.content}">
	<div class="card m-2"> <!-- style width 지우면 큰 박스로 변해 -->
  			<div class="card-body">
    			<h4 class="card-title">${board.title }</h4>	    
			    <span id="id"><i>글번호: ${board.id }</i></span>
			    <span><i>작성자: ${board.user.usernickname }</i></span>
			    <a href="/board/${board.id }" class="btn btn-primary">들어가보자</a>
			</div>
    	</div>
    </c:forEach>
    
<ul class="pagination justify-content-center">
 
 <c:choose>
   <c:when test="${boards.first }">
    <li class="page-item disabled"><a class="page-link" href="?page=${boards.number-1 }">Previous</a></li>
   </c:when>
   <c:otherwise>
    <li class="page-item"><a class="page-link" href="?page=${boards.number-1 }">Previous</a></li>
   </c:otherwise>
  </c:choose>
  
  <c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
      <c:choose>
       <c:when test="${i eq boards.number+1}">
           <li class="page-item active"><a class="page-link" href="?page=${i -1}">${i}</a></li>
       </c:when>
       <c:otherwise>
           <li class="page-item"><a class="page-link" href="?page=${i -1}">${i}</a></li>
       </c:otherwise>
      </c:choose>
  </c:forEach>

  <c:choose>
  <c:when test="${boards.last }">
    <li class="page-item disabled"><a class="page-link" href="?page=${boards.number+1 }">Next</a></li> 
  </c:when>
  <c:otherwise>
   <li class="page-item"><a class="page-link" href="?page=${boards.number+1 }">Next</a></li>
  </c:otherwise>
 </c:choose>    	
</div>

<%@ include file="../layout/footer.jsp" %>


