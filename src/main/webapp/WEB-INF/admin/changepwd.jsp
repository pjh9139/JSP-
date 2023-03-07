<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>join.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
 		'use strict';
    function fCheck() {
	    let pwd = myform.pwd.value;
	    let pwdC = myform.pwdC.value;
    	
	    if(!pwd.equal(pwdC)) {
	        alert("비밀번호가 서로 다릅니다.");
	        myform.pwd.focus();
	        return false;
	    }
	    else{
	    	myform.submit();
	    }
    }


  
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp"/>
<div class="container">
	<p><br/></p>
  <form name="myform" method="post" action="${ctp}/pwdChangeOk.em" class="was-validated">
    <h2>비밀번호 수정</h2>
    <br/>
    <div class="form-group">
      <label for="id">사원번호 :</label>
      <input type="text" class="form-control" id="id" name="id" value="${id}" readOnly/>
    </div>
    <div class="form-group">
      <label for="pwd">새로운 비밀번호 :</label>
      <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요."required />
    </div>
    <div class="form-group">
      <label for="pwd">새로운 비밀번호 확인 :</label>
      <input type="password" class="form-control" id="pwdC" name="pwdC" placeholder="비밀번호를 입력하세요."required />
    </div>
    <button type="submit" class="btn btn-primary">확인</button>
  </form>
</div>
<p><br/></p>
</body>
</html>