<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>packinglist.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/include/nav.jsp"/>
	<p><br/><p>
  <div class="container">
  	이곳은 패킹리스트 작성화면 입니다.
  	<form name="myform" method="post" action="${ctp}/PLok.re" class="was-validated">
	    <h2>packinglist</h2>
	    <br/>
	    <div class="form-group">
	      <label for="recipient">recipient(수취자) :</label>
	      <input type="text" class="form-control" id="recipient" name="recipient" required />
	    </div>
	  	<button type="button" class="btn btn-secondary" onclick="fCheck()">저장</button> &nbsp;
    	<button type="reset" class="btn btn-secondary">다시작성</button> &nbsp;
			<button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/releasedMain.re';">돌아가기</button>
 	 	</form>
  </div>
  <p><br/></p>
</body>
</html>