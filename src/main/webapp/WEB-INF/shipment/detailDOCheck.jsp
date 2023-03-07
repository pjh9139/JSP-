<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>detailDOCheck.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/include/nav.jsp"/>
	<p><br/><p>
  <div class="container">
  	딜리버리 오더 번호 : ${vo.idx}	<br/>
  	거래 회사 이름 : ${vo.recipient_company}	<br/>
  	거래 회사 주소 : ${vo.recipient_location}	<br/>
  	거래 회사 국가 : ${vo.recipient_country}	<br/>
  	거래 회사 연락처 : ${vo.recipient_tel}	<br/>
  	운송 방법 : ${vo.recipient_method}	<br/>
  	제품 번호 : ${vo.product_idx}	<br/>
  	제품 이름 : ${vo.product_name}	<br/>
  	제품 가격 : ${vo.product_price}	<br/>
  	제품 무게 : ${vo.product_weight}	<br/>
  	제품 크기 : ${vo.product_size}	<br/>
  	제품 수량 : ${vo.product_quantity}	<br/>
  	DO작성자 : ${vo.writer}	<br/>
  	
	<p><br/><p>
	<p><br/><p>
	<button onclick="location.href='${ctp}/DOstateUpdate.sh?state=1&idx=${vo.idx}'" class="btn btn-primary">제품 출고</button>
	<button onclick="location.href='${ctp}/DOstateUpdate.sh?state=2&idx=${vo.idx}'" class="btn btn-warning">제품 재고 부족</button>
	<button onclick="location.href='${ctp}/DOstateUpdate.sh?state=3&idx=${vo.idx}'" class="btn btn-danger">DO 오타</button>
	<button onclick="location.href='${ctp}/checkDO.sh'" class="btn btn-secondary">돌아가기</button>
  </div>
  <p><br/></p>
</body>
</html>