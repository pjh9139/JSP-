<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>productList.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
	  'use strict';
	  function delCheck(idx) {
	  	let ans = confirm("정말로 삭제하시겠습니까?");
	  	if(ans) location.href="${ctp}/productDelete.re?idx="+idx;
	  }
  </script>
</head>
<body>
	<jsp:include page="/include/nav.jsp"/>
	<p><br/><p>
  <div class="container">
  	<button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/releasedMain.re';">돌아가기</button>
	  <table class="table table-hover text-center">
	    <tr class="table-info">
	      <th>제품번호</th>
	      <th>제품명</th>
	      <th>제품가격</th>
	      <th>가로길이</th>
	      <th>세로길이</th>
	      <th>높이</th>
	      <th>무게</th>
	      <th>수정/삭제</th>
	    </tr>
	    <c:set var="curScrStartNo" value="${curScrStartNo}"/>
	    <c:forEach var="vo" items="${vos}" varStatus="st">
	      <tr>
	        <td>${curScrStartNo}</td>
	        <td>${vo.name}</td>
	        <td>${vo.price}</td>
	        <td>${vo.width}</td>
	        <td>${vo.length}</td>
	        <td>${vo.hight}</td>
	        <td>${vo.weight}</td>
	        <td>
	        	<a href="${ctp}/productUpdate.re?idx=${vo.idx}&name=${vo.name}&price=${vo.price}&width=${vo.width}&length=${vo.length}&hight=${vo.hight}&weight=${vo.weight}" 
	        	class="btn btn-sm btn-warning">수정</a>
	        	<a href="javascript:delCheck(${vo.idx})" class="btn btn-sm btn-danger">삭제</a>
        	</td>
	      </tr>
	      <c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
	    </c:forEach>
	    <tr><td colspan="7" class="m-0 p-0"></td></tr>
	  </table>
  </div>
  
  <br/>
<!-- 블록 페이지 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pag > 1}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/productList.re?&pag=1">첫페이지</a></li>
    </c:if>
    <c:if test="${curBlock > 0}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/productList.re?pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
    </c:if>
    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
      <c:if test="${i <= totPage && i == pag}">
    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/productList.re?pag=${i}">${i}</a></li>
    	</c:if>
      <c:if test="${i <= totPage && i != pag}">
    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/productList.re?pag=${i}">${i}</a></li>
    	</c:if>
    </c:forEach>
    <c:if test="${curBlock < lastBlock}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/productList.re?&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
    </c:if>
    <c:if test="${pag < totPage}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/productList.re?pag=${totPage}">마지막페이지</a></li>
    </c:if>
  </ul>
</div>
<!-- 블록 페이지 끝 -->
  <p><br/></p>
</body>
</html>