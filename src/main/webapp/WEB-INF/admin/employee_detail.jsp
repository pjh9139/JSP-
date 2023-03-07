<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>information.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"/></head>
  <style>
  	.pwchange{
  		background-color:#58E6EF;
  	}
  	
  
  </style>
  <script>
	  function infochange() {
			window.open("${ctp}/pwchagne.em","nWin","width=1000px,height=600px");
		}
	  function pwchange() {
			window.open("${ctp}/pwchagne.em","nWin","width=1000px,height=600px");
		}
  </script>
</head>
<body>
	<p><br/><p>
  <div class="container">
		<img src="${ctp}/data/employee/${vo.photo}" width="75px" class="rounded-circle"/><br/>  
  	사번 : ${vo.id}<br/>
  	성명 : ${sName}<br/> 
  	이메일 : ${vo.email}<br/>
  	연락처 : ${vo.tel}<br/>
		입사년도 : ${vo.startdate}<br/>
  	<input type="button" value="사원정보 수정" onclick="infochange()" class="btn btn-primary"/>
  	<input type="button" value="비밀번호 수정" onclick="pwchange()" class="btn pwchange"/>
  	
  </div>
  <p><br/></p>
</body>
</html>