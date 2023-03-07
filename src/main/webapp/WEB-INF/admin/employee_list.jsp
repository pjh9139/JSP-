<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>employee_list.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  'use strict';
  
  function searchCheck() {
  	let searchString = $("#searchString").val();
  	
  	if(searchString.trim() == "") {
  		alert("찾고자 하는 검색어를 입력하세요!");
  		searchForm.searchString.focus();
  	}
  	else {
  		searchForm.submit();
  	}
  }
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp"/>
  <div class="container">
	<p><br/><p>
    <form name="searchForm" method="post" action="${ctp}/employee_search.em">
	   <b>검색 : </b>
	    <select name="search">
	      <option value="name">사원명</option>
	      <option value="country">소속팀</option>
	    </select>
	    <input type="text" name="searchString" id="searchString"/>
	    <input type="button" value="검색" onclick="searchCheck()" class="btn btn-primary btn-sm"/>
	    <input type="button" value="전체검색" onclick="location.href='${ctp}/employee_list.em';" class="btn btn-primary btn-sm"/>
	    <input type="hidden" name="pag" value="${pag}"/>
	    <input type="hidden" name="pageSize" value="${pageSize}"/>
	  </form>
		<p><br/><p>	  
	  <table class="table table-hover text-center">
	    <tr class="table-info">
	      <th>사원번호</th>
	      <th>사원명</th>
	      <th>소속팀</th>
	      <th>사원사진</th>
	      <th></th>
	    </tr>
	    <c:set var="curScrStartNo" value="${curScrStartNo}"/>
	    <c:forEach var="vo" items="${vos}" varStatus="st">
	      <tr>
	        <td>${vo.id}</td>
	        <td>${vo.name}</td>
	        <td>
	        	${vo.level == 0 ? "관리자" : ""}${vo.level == 1 ? "운송팀" : ""}${vo.level == 2 ? "출고팀" : ""}${vo.level == 3 ? "공장팀" : ""}
	        </td>
	        <td><img src="${ctp}/data/employee/${vo.photo}" width="50px" height="50px" class="rounded-circle"/></td>
	        <td><button onclick="location.href='${ctp}/employee_detail.em?idx=${vo.idx}'" class ="btn btn-outline-primary btn-sm">select</button></td>
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
      <li class="page-item"><a class="page-link text-info" href="${ctp}/employee_list.em?pag=1">첫페이지</a></li>
    </c:if>
    <c:if test="${curBlock > 0}">
      <li class="page-item"><a class="page-link text-info" href="${ctp}/employee_list.em?pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
    </c:if>
    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
      <c:if test="${i <= totPage && i == pag}">
    		<li class="page-item active"><a class="page-link bg-info border-info" href="${ctp}/employee_list.em?pag=${i}">${i}</a></li>
    	</c:if>
      <c:if test="${i <= totPage && i != pag}">
    		<li class="page-item"><a class="page-link text-info" href="${ctp}/employee_list.em?pag=${i}">${i}</a></li>
    	</c:if>
    </c:forEach>
    <c:if test="${curBlock < lastBlock}">
      <li class="page-item"><a class="page-link text-info" href="${ctp}/employee_list.em?pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
    </c:if>
    <c:if test="${pag < totPage}">
      <li class="page-item"><a class="page-link text-info" href="${ctp}/employee_list.em?pag=${totPage}">마지막페이지</a></li>
    </c:if>
  </ul>
</div>
<!-- 블록 페이지 끝 -->
</body>
</html>