<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>addCompany.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <jsp:include page="/include/nav.jsp"/>
  <script>
  'use strict';

  // 회원가입폼 체크후 서버로 전송(submit)
  function fCheck() {
    let regEmail =/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    
    let submitFlag = 0;		// 전송체크버튼으로 값이 1이면 체크완료되어 전송처리한다.

    // 유효성검사를 위해 폼안의 내용들을 모두 변수에 담는다.
  	let email = myform.email.value;
  	
  	// 유효성 검사체크처리한다.(필수 입력필드는 꼭 처리해야 한다.)
/*     if(!regCountry.test(country)) {
      alert("국가명은 영문대소문자만 사용가능합니다.");
      myform.country.focus();
      return false;
    } */
    if(!regEmail.test(email)) {
      alert("이메일 형식에 맞지않습니다.");
      myform.email1.focus();
      return false;
    }
    else {
  	  submitFlag = 1;
    }
	
		// 전송전에 모든 체크가 끝나서 submitFlag가 1이되면 서버로 전송한다.
  	if(submitFlag == 1) {
			myform.submit();
  	}
  	else {
  		alert("계약회사 추가 실패");
  	}
  }
  
  
  </script>
</head>
<body>
	<p><br/><p>
  <div class="container">
  	<form name="myform" method="post" action="${ctp}/addCompanyok.log" class="was-validated">
	    <h2>계약회사 추가</h2>
	    <br/>
	    <div class="form-group">
	      <label for="name">회사명 :</label>
	      <input type="text" class="form-control" id="name" name="name" required />
	    </div>
	    <div class="form-group">
	      <label for="country">회사국가 :</label>
	      <input type="text" class="form-control" id="country" name="country" required />
	    </div>
	    <div class="form-group">
	      <label for="address">회사주소 :</label>
	      <input type="text" class="form-control" id="address" name="address" required />
	    </div>
	    <div class="form-group">
	      <label for="email">회사이메일 :</label>
	      <input type="text" class="form-control" id="email" name="email" required />
	    </div>
	    <div class="form-group">
	      <label for="tel">전화번호 :</label>
	      <input type="text" class="form-control" id="tel" name="tel" required />
	    </div>
	    <div class="form-group">
	      <label for="fax">팩스번호 :</label>
	      <input type="text" class="form-control" id="fax" name="fax" required />
	    </div>
	  	<button type="button" class="btn btn-primary" onclick="fCheck()">저장</button> &nbsp;
    	<button type="reset" class="btn btn-primary">다시작성</button> &nbsp;
 	 	</form>
  </div>
  <p><br/></p>
</body>
</html>