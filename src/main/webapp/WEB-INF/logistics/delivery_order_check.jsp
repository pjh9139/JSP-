<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>delivery_order_list.jsp</title>
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
	  function sendCheck(COMPANY,ADRESS,PHONE,product_name,price,weight,size,quantity,COUNTRY,DOidx) {
		  let totprice = price*quantity;
		  weight = weight*quantity/1000;
	  	opener.window.document.myform.COMPANY.value = COMPANY;
	  	opener.window.document.myform.COMPANY.readOnly = true;
	  	opener.window.document.myform.ADRESS.value = ADRESS;
	  	opener.window.document.myform.ADRESS.readOnly = true;
	  	opener.window.document.myform.PHONE.value = PHONE;
	  	opener.window.document.myform.PHONE.readOnly = true;
	  	opener.window.document.myform.weight.value = weight;
	  	opener.window.document.myform.weight.readOnly = true;
	  	opener.window.document.myform.PHONE.value = PHONE;
	  	opener.window.document.myform.PHONE.readOnly = true;
	  	opener.window.document.myform.size.value = size;
	  	opener.window.document.myform.size.readOnly = true;
	  	opener.window.document.myform.product_name.value = product_name;
	  	opener.window.document.myform.product_name.readOnly = true;
	  	opener.window.document.myform.quantity.value = quantity;
	  	opener.window.document.myform.quantity.readOnly = true;
	  	opener.window.document.myform.price.value = price;
	  	opener.window.document.myform.price.readOnly = true;
	  	opener.window.document.myform.totprice.value = totprice;
	  	opener.window.document.myform.totprice.readOnly = true;
	  	opener.window.document.myform.COUNTRY.value = COUNTRY;
	  	opener.window.document.myform.COUNTRY.readOnly = true;
	  	opener.window.document.myform.DOidx.value = DOidx;
	  	window.close();
	  }
  </script>
</head>
<body>
	<p><br/><p>
  <div class="container">
  	<form name="searchForm" method="post" action="${ctp}/DOSearch.log">
	   <b>검색 : </b>
	    <select name="search">
	      <option value="recipient_company">회사명</option>
	      <option value="recipient_country">회사국가</option>
	    </select>
	    <input type="text" name="searchString" id="searchString"/>
	    <input type="button" value="검색" onclick="searchCheck()" class="btn btn-primary btn-sm"/>
	    <input type="button" value="전체검색" onclick="location.href='${ctp}/DOCheck.log';" class="btn btn-primary btn-sm"/>
	    <input type="hidden" name="pag" value="${pag}"/>
	    <input type="hidden" name="pageSize" value="${pageSize}"/>
	  </form>
	  <table class="table table-hover text-center">
	    <tr class="table-info">
	      <th>idx</th>
	      <th>recipient_company</th>
	      <th>recipient_location</th>
	      <th>recipient_method</th>
	      <th>product_idx</th>
	      <th>product_quantity</th>
	      <th></th>
	    </tr>
	    <c:set var="curScrStartNo" value="${curScrStartNo}"/>
	    <c:forEach var="vo" items="${vos}" varStatus="st">
	      <tr>
	        <td>${vo.idx}</td>
	        <td>${vo.recipient_company}</td>
	        <td>${vo.recipient_location}</td>
	        <td>${vo.recipient_method}</td>
	        <td>${vo.product_idx}</td>
	        <td>${vo.product_quantity}</td>
 	        <td><button onclick="sendCheck('${vo.recipient_company}','${vo.recipient_location}','${vo.recipient_tel}','${vo.product_name}',${vo.product_price},${vo.product_weight},'${vo.product_size}',${vo.product_quantity},'${vo.recipient_country}',${vo.idx})" class="btn btn-primary">select</button></td>
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
      <li class="page-item"><a class="page-link text-primary" href="${ctp}/DOCheck.log?pag=1">첫페이지</a></li>
    </c:if>
    <c:if test="${curBlock > 0}">
      <li class="page-item"><a class="page-link text-primary" href="${ctp}/DOCheck.log?pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
    </c:if>
    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
      <c:if test="${i <= totPage && i == pag}">
    		<li class="page-item active"><a class="page-link bg-primary border-primary" href="${ctp}/DOCheck.log?pag=${i}">${i}</a></li>
    	</c:if>
      <c:if test="${i <= totPage && i != pag}">
    		<li class="page-item"><a class="page-link text-primary" href="${ctp}/DOCheck.log?pag=${i}">${i}</a></li>
    	</c:if>
    </c:forEach>
    <c:if test="${curBlock < lastBlock}">
      <li class="page-item"><a class="page-link text-primary" href="${ctp}/DOCheck.log?pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
    </c:if>
    <c:if test="${pag < totPage}">
      <li class="page-item"><a class="page-link text-primary" href="${ctp}/DOCheck.log?pag=${totPage}">마지막페이지</a></li>
    </c:if>
  </ul>
</div>
<!-- 블록 페이지 끝 -->
  <p><br/></p>
</body>
</html>