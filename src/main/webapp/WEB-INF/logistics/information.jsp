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
</head>
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
  </style>
</head>
<body>
	<jsp:include page="/include/nav.jsp"/>
	<p><br/><p>
  <div class="container">
  	<h2>사원 정보</h2>
  	<table>
  		<tr>
  			<td colspan='2'>	
					<img src="${ctp}/data/employee/${vo.photo}" width="75px" class="rounded-circle"/><br/>  
  			</td>
  		</tr>
  		<tr>
  			<td>성명  </td>
  			<td>${vo.name}</td>
  		</tr>
  		<tr>
  			<td>직급  </td>
  			<td>${vo.rank}</td>
  		</tr>
  		<tr>
  			<td>사원번호  </td>
  			<td>${vo.id}</td>
  		</tr>
  		<tr>
  			<td>이메일  </td>
  			<td>${vo.email}</td>
  		</tr>
  		<tr>
  			<td>연락처  </td>
  			<td>${vo.tel}</td>
  		</tr>
  		<tr>
  			<td>회사전화  </td>
  			<td>${vo.com_tel}</td>
  		</tr>
  		<tr>
  			<td>팩스번호  </td>
  			<td>${vo.fax}</td>
  		</tr>
  		<tr>
  			<td>담당업무  </td>
  			<td>${vo.content}</td>
  		</tr>
  	</table>
	  <p><br/></p>
  	<input type="button" value="사원정보 수정" onclick="location.href='${ctp}/infoChange.em?idx=${vo.idx}'" class="btn btn-primary"/>
  	<input type="button" value="비밀번호 수정" onclick="location.href='${ctp}/pwdChange.em?idx=${vo.idx}'" class="btn pwchange"/>
  </div>
  <p><br/></p>
</body>
</html>