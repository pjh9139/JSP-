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
  	td{
  		padding: 5px 15px 5px 10px;
	    border-bottom-style: groove;
  	}
  	table{
  		border-style: double;
  	}
  	.container{
  		margin:0 auto;
  	}
  </style>
</head>
<body>
	<p><br/><p>
  <div class="container">
	  <form name="myform" method="post" action="${ctp}/infoChangeOk.em" class="was-validated">
	    <h2>회원정보 수정</h2>
	    <br/>
	  	<table>
	  		<tr>
	  			<td colspan='2'>	
						<img src="${ctp}/data/employee/${vo.photo}" width="75px" class="rounded-circle"/><br/>  
	  			</td>
	  		</tr>
	  		<tr>
	  			<td>성명  </td>
	  			<td><input type="text" class="form-control" id="name" name="name" value="${vo.name}" <c:if test="${sLevel != 0}">readOnly</c:if>/></td>
	  		</tr>
	  		<tr>
	  			<td>직급  </td>
	  			<td><input type="text" class="form-control" id="rank" name="rank" value="${vo.rank}" <c:if test="${sLevel != 0}">readOnly</c:if>/></td>
	  		</tr>
	  		<tr>
	  			<td>이메일  </td>
	  			<td><input type="text" class="form-control" id="email" name="email" value="${vo.email}"/></td>
	  		</tr>
	  		<tr>
	  			<td>연락처  </td>
	  			<td><input type="text" class="form-control" id="tel" name="tel" value="${vo.tel}"/></td>
	  		</tr>
	  		<tr>
	  			<td>회사전화  </td>
	  			<td><input type="text" class="form-control" id="com_tel" name="com_tel" value="${vo.com_tel}"/></td>
	  		</tr>
	  		<tr>
	  			<td>팩스번호  </td>
	  			<td><input type="text" class="form-control" id="fax" name="fax" value="${vo.fax}"/></td>
	  		</tr>
	  		<tr>
	  			<td>해당 업무  </td>
	  			<td><input type="text" class="form-control" id="content" name="content" value="${vo.content}" <c:if test="${sLevel != 0}">readOnly</c:if>/></td>
	  		</tr>
	  	</table>
	  	<input type="hidden" id="idx" name="idx" value="${vo.idx}">
	  <p><br/></p>
  	<button type="submit" class="btn btn-primary">확인</button>
	  </form>
	  <p><br/></p>
  </div>
  <p><br/></p>
</body>
</html>