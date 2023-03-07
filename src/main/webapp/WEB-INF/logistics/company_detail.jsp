<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>company_detail.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"/></head>
<body>
	<p><br/><p>
	
  <div class="container">
  <h2>계약회사 상세 정보</h2>
  	회사 번호 : ${vo.idx}	<br/>
  	회사 이름 : ${vo.name}	<br/>
  	회사 국가 : ${vo.country}	<br/>
  	회사 주소 : ${vo.address}	<br/>
  	회사 이메일 : ${vo.email}	<br/>
  	회사 전화번호 : ${vo.tel}	<br/>
  	회사 팩스번호 : ${vo.fax}	<br/>
	<p><br/><p>
	<p><br/><p>
	<button onclick="location.href='${ctp}/company_modify.log?idx=${vo.idx}'" class="btn btn-primary">정보 수정</button>
	<button onclick="location.href='${ctp}/company_list.log'" class="btn btn-secondary">돌아가기</button>
  </div>
  <p><br/></p>
</body>
</html>