<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>noList.jsp</title>
  <jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/include/nav.jsp"/>
</head>
  <script>
    'use strict';
    function pageCheck() {
    	let pageSize = document.getElementById("pageSize").value;
    	location.href = "${ctp}/noList.no?pageSize="+pageSize+"&pag=${pag}";
    }
    
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
<p><br/></p>
<div class="container">
  <h2 class="text-center">회 사 공 지</h2>
  <br/>
  <table class="table table-borderless">
    <tr>
      <td class="text-left p-0">
        <c:if test="${sLevel == 0}">
	        <a href="${ctp}/noInput.no" ><i class="fa fa-pencil fa-fw" aria-hidden="true"></i>글쓰기</a>
        </c:if>
      </td>
    </tr>
  </table>
  <table class="table table-hover text-center">
    <tr class="table-info">
      <th>글번호</th>
      <th>글제목</th>
      <th>글쓴이</th>
      <th>글쓴날짜</th>
      <th>조회수</th>
    </tr>
    <c:forEach var="vo" items="${vos}">
    	<tr>
    	  <td>${curScrStartNo}</td>
    	  <td class="text-left">
    	    <a href="${ctp}/noContent.no?idx=${vo.idx}&pageSize=${pageSize}&pag=${pag}">${vo.title}</a>
    	  </td>
    	  <td>${vo.name}</td>
    	  <td>
    	    <!-- 1일(24시간)이 지난것은 날짜만표시, 1일(24시간)이내것은 시간을 표시하되, 24시간 이내중 현재시간보다 이후시간은 날짜와 시간을 함께 표시 -->
    	    <c:if test="${vo.hour_diff > 24}">${fn:substring(vo.wDate,0,10)}</c:if>
    	    <c:if test="${vo.hour_diff <= 24}">
    	      ${vo.day_diff > 0 ? fn:substring(vo.wDate,0,16) : fn:substring(vo.wDate,11,19)}
    	    </c:if>
    	  </td>
    	  <td>${vo.readNum}</td>
    	</tr>
    	<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
    </c:forEach>
    <tr><td colspan="6" class="m-0 p-0"></td></tr>
  </table>
</div>

<!-- 블록 페이지 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pag > 1}">
      <li class="page-item"><a class="page-link text-primary" href="${ctp}/noList.no?pageSize=${pageSize}&pag=1">첫페이지</a></li>
    </c:if>
    <c:if test="${curBlock > 0}">
      <li class="page-item"><a class="page-link text-primary" href="${ctp}/noList.no?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
    </c:if>
    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
      <c:if test="${i <= totPage && i == pag}">
    		<li class="page-item active"><a class="page-link bg-primary border-primary" href="${ctp}/noList.no?pageSize=${pageSize}&pag=${i}">${i}</a></li>
    	</c:if>
      <c:if test="${i <= totPage && i != pag}">
    		<li class="page-item"><a class="page-link text-primary" href="${ctp}/noList.no?pageSize=${pageSize}&pag=${i}">${i}</a></li>
    	</c:if>
    </c:forEach>
    <c:if test="${curBlock < lastBlock}">
      <li class="page-item"><a class="page-link text-primary" href="${ctp}/noList.no?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
    </c:if>
    <c:if test="${pag < totPage}">
      <li class="page-item"><a class="page-link text-primary" href="${ctp}/noList.no?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li>
    </c:if>
  </ul>
</div>
<!-- 블록 페이지 끝 -->
<br/>
<!-- 검색기 처리 시작  -->
<div class="container text-center">
  <form name="searchForm" method="post" action="${ctp}/noSearch.no">
    <b>검색 : </b>
    <select name="search">
      <option value="title">글제목</option>
      <option value="name">글쓴이</option>
      <option value="content">글내용</option>
    </select>
    <input type="text" name="searchString" id="searchString"/>
    <input type="button" value="검색" onclick="searchCheck()" class="btn btn-primary btn-sm"/>
    <input type="hidden" name="pag" value="${pag}"/>
    <input type="hidden" name="pageSize" value="${pageSize}"/>
  </form>
</div>
<!-- 검색기 처리 끝  -->
<p><br/></p>
</body>
</html>