<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>message.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
    'use strict';
    let msg = "${msg}";
    let url = "${url}";
    let val = "${val}";
    
    if(msg == "adminLoginOk") msg = "관리자 로그인";
    else if(msg == "loginOk") msg = val + "님 로그인 하셨습니다.";
    else if(msg == "loginNo") msg = "로그인 실패";
    else if(msg == "joinOk") 	msg =	"사원등록 성공";
    else if(msg == "joinNo1") msg = "사원등록 실패(sql오류)";
    else if(msg == "joinNo2") msg = "사원등록 실패(사번오류)";
    else if(msg == "logoutOk") msg = val+"님 로그아웃 되셨습니다.";
    else if(msg == "addcompanyOk") 	msg =	"계약회사 등록 성공";
    else if(msg == "addcompanyNo") 	msg =	"계약회사 등록 실패";
    else if(msg == "company_updateOk") 	msg =	"계약회사 정보 수정 성공";
    else if(msg == "company_updateNo") 	msg =	"계약회사 정보 수정 실패";
    else if(msg == "addProductOk") 	msg =	"제품 등록 성공";
    else if(msg == "addProductNo") 	msg =	"제품 등록 실패";
    else if(msg == "updateProductOk") 	msg =	"제품 수정 성공";
    else if(msg == "updateProductNo") 	msg =	"제품 수정 실패";
    else if(msg == "addDOOk") 	msg =	"딜리버리오더 작성 완료";
    else if(msg == "addDONo") 	msg =	"딜리버리오더 작성 실패";
    else if(msg == "addIVOk") 	msg =	"인보이스 작성 완료";
    else if(msg == "addIVNo") 	msg =	"인보이스 작성 실패";
    else if(msg == "DOstateUpdatOk") 	msg =	"DO 확인 완료";
    else if(msg == "DOstateUpdatNO") 	msg =	"DO 확인 실패";
    else if(msg == "updateDOOk") 	msg =	"DO 수정 완료";
    else if(msg == "updateDONo") 	msg =	"DO 수정 실패";
    else if(msg == "firstlogin") 	msg =	"첫로그인을 환영합니다 사원님";
    else if(msg == "pwdchangeOk") 	msg =	"비밀번호 변경성공 (다시 로그인 해주세요)";
    else if(msg == "pwdchangeNo") 	msg =	"비밀번호 변경성공 (다시 로그인 해주세요)";
    else if(msg == "infochangeOk") 	msg =	"사원정보 변경성공";
    else if(msg == "infochangeNo") 	msg =	"사원정보 변경실패";
    else if(msg == "boInputOk") 	msg =	"게시글 등록 성공";
    else if(msg == "boInputNo") 	msg =	"게시글 등록 실패";
    else if(msg == "boDeleteOk") 	msg =	"게시글 삭제 성공";
    else if(msg == "boDeleteNo") 	msg =	"게시글 삭제 실패";
    else if(msg == "boUpdateOk") 	msg =	"게시글 수정 성공";
    else if(msg == "boUpdateNo") 	msg =	"게시글 수정 실패";
    else if(msg == "noInputOk") 	msg =	"공지글 등록 성공";
    else if(msg == "noInputNo") 	msg =	"공지글 등록 실패";
    else if(msg == "noDeleteOk") 	msg =	"공지글 삭제 성공";
    else if(msg == "noDeleteNo") 	msg =	"공지글 삭제 실패";
    else if(msg == "noUpdateOk") 	msg =	"공지글 수정 성공";
    else if(msg == "noUpdateNo") 	msg =	"공지글 수정 실패";
    
    alert(msg);
    if(url != "") location.href = url;
  </script>
</head>
<body>

</body>
</html>