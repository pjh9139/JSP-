<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>exfactory.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"/></head>
</head>
<body>
	<p><br/><p>
  <div class="container">
	  <table class="table table-hover text-center">
	    <tr class="table-info">
	      <th>번호</th>
	      <th>거래 회사 번호</th>
	      <th>거래 회사 국가</th>
	      <th>거래 회사 이름</th>
	      <th>거래 회사 연락처</th>
	      <th>운송 방법</th>
	      <th>제품 번호</th>
	      <th>제품 수량</th>
	      <th>제작자</th>
	      <th></th>
	    </tr>
	    <c:set var="curScrStartNo" value="${curScrStartNo}"/>
	    <c:forEach var="vo" items="${vos}" varStatus="st">
	      <tr>
	        <td>${vo.idx}</td>
	        <td>${vo.recipient_idx}</td>
	        <td>${vo.recipient_country}</td>
	        <td>${vo.recipient_company}</td>
	        <td>${vo.recipient_tel}</td>
	        <td>${vo.recipient_method}</td>
	        <td>${vo.product_idx}</td>
	        <td>${vo.product_quantity}</td>
	        <td>${vo.writer}</td>
	        <td><button onclick="location.href='${ctp}/DOmodify.log?idx=${vo.idx}'" class ="btn btn-outline-primary btn-sm">V</button></td>
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
      <li class="page-item"><a class="page-link text-primary" href="${ctp}/checkDO.sh?pag=1">첫페이지</a></li>
    </c:if>
    <c:if test="${curBlock > 0}">
      <li class="page-item"><a class="page-link text-primary" href="${ctp}/checkDO.sh?pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
    </c:if>
    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
      <c:if test="${i <= totPage && i == pag}">
    		<li class="page-item active"><a class="page-link bg-primary border-primary" href="${ctp}/checkDO.sh?pag=${i}">${i}</a></li>
    	</c:if>
      <c:if test="${i <= totPage && i != pag}">
    		<li class="page-item"><a class="page-link text-primary" href="${ctp}/checkDO.sh?pag=${i}">${i}</a></li>
    	</c:if>
    </c:forEach>
    <c:if test="${curBlock < lastBlock}">
      <li class="page-item"><a class="page-link text-primary" href="${ctp}/checkDO.sh?pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
    </c:if>
    <c:if test="${pag < totPage}">
      <li class="page-item"><a class="page-link text-primary" href="${ctp}/checkDO.sh?pag=${totPage}">마지막페이지</a></li>
    </c:if>
    
  </ul>
</div>
<!-- 블록 페이지 끝 -->
  <p><br/></p>
</body>
</html>