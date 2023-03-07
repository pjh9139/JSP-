<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
  int level = session.getAttribute("sLevel")==null? 99 : (int) session.getAttribute("sLevel");
  pageContext.setAttribute("level", level);
%>
<style>
</style>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="${ctp}/logisticsMain.log"><img src="images/logo2.png" style="width: 200px;"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
        <li class="nave-item active ">
          &nbsp;&nbsp;&nbsp;
        </li>
        <c:if test="${sLevel == 0}">
	        <li class="nave-item active dropdown">
	          <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">인사관리</a>
	          <div class="dropdown-menu">
	            <a class="dropdown-item" href="${ctp}/join.em">사원등록</a>
	            <a class="dropdown-item" href="${ctp}/employee_list.em">사원목록/수정</a>
	          </div>
	        </li>
        </c:if>
        <c:if test="${sLevel == 1}">
	        <li class="nave-item active dropdown">
	          <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">D/O</a>
	          <div class="dropdown-menu">
	            <a class="dropdown-item" href="${ctp}/makeDO.log">딜리버리오더 제작</a>
	            <a class="dropdown-item" href="${ctp}/DOlist.log">딜리버리오더 리스트</a>
	            <a class="dropdown-item" href="${ctp}/DOerror.log">딜리버리오더 수정목록</a>
	          </div>
	        </li>
	        <li class="nave-item active dropdown">
	          <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">I/V</a>
	          <div class="dropdown-menu">
	            <a class="dropdown-item" href="${ctp}/makeIV.log">인보이스 제작</a>
	            <a class="dropdown-item" href="${ctp}/invoice_list.log">인보이스 리스트</a>
	          </div>
	        </li>
	        <li class="nave-item active dropdown">
	          <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">계약회사</a>
	          <div class="dropdown-menu">
	            <a class="dropdown-item" href="${ctp}/addCompany.log">계약회사 추가</a>
	            <a class="dropdown-item" href="${ctp}/company_list.log">계약회사 리스트</a>
	          </div>
	        </li>
        </c:if>
        <c:if test="${sLevel == 2}">
	        <li class="nav-item active">
	          <a class="nav-link" href="${ctp}/checkDO.sh">DO 출고여부 확인</a>
	        </li>
	        <li class="nave-item dropdown active">
	          <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">B/L</a>
	          <div class="dropdown-menu">
	            <a class="dropdown-item" href="${ctp}/makeBL.sh">B/L 제작</a>
	            <a class="dropdown-item" href="${ctp}/listBL.sh">B/L 리스트</a>
	          </div>
	        </li>
	        <li class="nave-item dropdown active">
	          <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">AWB</a>
	          <div class="dropdown-menu">
	            <a class="dropdown-item" href="${ctp}/makeAWB.sh">AWB 제작</a>
	            <a class="dropdown-item" href="${ctp}/listAWB.sh">AWB 리스트</a>
	          </div>
	        </li>
        </c:if>
        <c:if test="${sLevel == 3}">
	        <li class="nave-item dropdown active">
	          <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">제품</a>
	          <div class="dropdown-menu">
	            <a class="dropdown-item" href="${ctp}/product.re">제품 추가</a>
	            <a class="dropdown-item" href="${ctp}/productList.re">제품 리스트</a>
	          </div>
	        </li>
        </c:if>
        <li class="nave-item active">
          <a class="nav-link" href='${ctp}/noList.no'>공지사항</a>
        </li>
        <li class="nave-item active">
          <a class="nav-link" href='${ctp}/boList.bo'>게시판</a>
        </li>
        <li class="nave-item active">
          <a class="nav-link" href='${ctp}/pdsList.pds'>자료실</a>
        </li>
        <li class="nave-item active dropdown">
          <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">마이 페이지</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="${ctp}/information.em">사원 정보</a>
            <a class="dropdown-item" href="${ctp}/schedule.sc">일정 관리</a>
          </div>
        </li>
        <li class="nave-item active">
          <a class="nav-link" href='${ctp}/logout.em'>로그아웃</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
