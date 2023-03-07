<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>released.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/include/nav.jsp"/>
	<p><br/><p>
  <div class="container">
  	이곳은 상품정보 추가 화면 입니다.
  	<form name="myform" method="post" action="${ctp}/productOk.re" class="was-validated">
	    <h2>product</h2>
	    <br/>
	    <div class="form-group">
	      <label for="name">제품명 :</label>
	      <input type="text" class="form-control" id="name" name="name" required />
	    </div>
	    <div class="form-group">
	      <label for="price">제품가격 :</label>
	      <input type="number" class="form-control" id="price" name="price" required />
	    </div>
	    <div class="form-group">
	      <label for="width">제품가로길이 (mm) :</label>
	      <input type="number" class="form-control" id="width" name="width" required />
	    </div>
	    <div class="form-group">
	      <label for="length">제품세로길이 (mm) :</label>
	      <input type="number" class="form-control" id="length" name="length" required />
	    </div>
	    <div class="form-group">
	      <label for="hight">제품높이 (mm) :</label>
	      <input type="number" class="form-control" id="hight" name="hight" required />
	    </div>
	    <div class="form-group">
	      <label for="weight">제품중량	(g) :</label>
	      <input type="number" class="form-control" id="weight" name="weight" required />
	    </div>
	  	<button type="submit" class="btn btn-primary" >저장</button> &nbsp;
    	<button type="reset" class="btn btn-primary">다시작성</button> &nbsp;
 	 	</form>
  </div>
  <p><br/></p>
</body>
</html>