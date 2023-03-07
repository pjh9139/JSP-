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
    	
      let regName = /^[가-힣a-zA-Z]+$/;
      let regEmail =/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
      let regTel = /\d{2,3}-\d{3,4}-\d{4}$/g;
      let regLevel =/^[1-4]+$/;
      
      let submitFlag = 0;	

    	let name = myform.name.value;
    	let email1 = myform.email1.value;
    	let email2 = myform.email2.value;
      let email = email1 + '@' + email2;
      let tel1 = myform.tel1.value;
      let tel2 = myform.tel2.value;
      let tel3 = myform.tel3.value;
    	let tel = tel1 + "-" + tel2 + "-" + tel3;
    	let level = myform.level.value;
    	
    	let maxSize = 1024 * 1024 * 1; 	
    	let fName = myform.fName.value;
    	let ext = fName.substring(fName.lastIndexOf(".")+1);	
    	let uExt = ext.toUpperCase();		
			let fileSize = document.getElementById("file").files[0].size;
    	
      if(!regName.test(name)) {
        alert("성명은 한글과 영문대소문자만 사용가능합니다.");
        myform.name.focus();
        return false;
      }
      else if(!regEmail.test(email)) {
        alert("이메일 형식에 맞지않습니다.");
        myform.email1.focus();
        return false;
      }
      else if(!regTel.test(tel)) {
        alert("전화번호 형식에 맞지않습니다.(000-0000-0000)");
        myform.tel2.focus();
        return false;
      }
      else if(!regLevel.test(level)) {
        alert("직급이 형식에 맞지 않습니다.");
        myform.level.focus();
        return false;
      }
  		else if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG") {
  				alert("업로드 가능한 파일은 'JPG/GIF/PNG'파일 입니다.");
  				return false;
			}
			else if(fName.indexOf(" ") != -1) {
				alert("업로드 파일명에 공백을 포함할 수 없습니다.");
				return false;
			}
			else if(fileSize > maxSize) {
				alert("업로드 파일의 크기는 1MByte를 초과할수 없습니다.");
				return false;
			}
	    else {
	  	  submitFlag = 1;
	    }
  		
			// 전송전에 모든 체크가 끝나서 submitFlag가 1이되면 서버로 전송한다.
	  	if(submitFlag == 1) {
				// 묶여진 필드(email/tel)를 폼태그안에 hidden태그의 값으로 저장시켜준다.
				myform.email.value = email;
				myform.tel.value = tel;
				
				myform.submit();
	  	}
	  	else {
	  		alert("사원입력 실패");
	  	}
	  }
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp"/>
<div class="container">
  <form name="myform" method="post" action="${ctp}/joinOk.em" class="was-validated" enctype="multipart/form-data">
    <h2>사 원 입 력</h2>
    <br/>
    <div class="form-group">
      <label for="name">성명 :</label>
      <input type="text" class="form-control" id="name" placeholder="성명을 입력하세요." name="name" required />
    </div>
    <div class="form-group">
      <label for="email1">이메일 :</label>
				<div class="input-group mb-3">
				  <input type="text" class="form-control" placeholder="Email을 입력하세요." id="email1" name="email1" required />
				  <div class="input-group-append">
				    <select name="email2" class="custom-select">
					    <option value="naver.com" selected>naver.com</option>
					    <option value="hanmail.net">hanmail.net</option>
					    <option value="gmail.com">gmail.com</option>
					    <option value="nate.com">nate.com</option>
					    <option value="yahoo.com">yahoo.com</option>
					  </select>
				  </div>
				</div>
	  </div>
    <div class="form-group">
			<label for="level">소속부서 :</label>
				<div class="input-group mb-3">
			    <select name="level" class="custom-select">
				    <option value="1">운송팀</option>
				    <option value="2">출고팀</option>
				    <option value="3">공장팀</option>
				  </select>
				</div>
	  </div>
    <div class="form-group">
      <div class="input-group mb-3">
	      <div class="input-group-prepend">
	        <span class="input-group-text">전화번호 :</span> &nbsp;&nbsp;
			      <select name="tel1" class="custom-select">
					    <option value="010" selected>010</option>
					    <option value="02">서울</option>
					    <option value="031">경기</option>
					    <option value="032">인천</option>
					    <option value="041">충남</option>
					    <option value="042">대전</option>
					    <option value="043">충북</option>
			        <option value="051">부산</option>
			        <option value="052">울산</option>
			        <option value="061">전북</option>
			        <option value="062">광주</option>
					  </select>-
	      </div>
	      <input type="text" name="tel2" size=4 maxlength=4 class="form-control"/>-
	      <input type="text" name="tel3" size=4 maxlength=4 class="form-control"/>
	    </div> 
    </div>
    <div class="form-group">
      <label for="name">입사년도 :</label>
      <input type="text" class="form-control" id="startdate" placeholder="입사일을 입력하세요." name="startdate" required />
    </div>
    <div  class="form-group">
      사원 사진(파일용량:2MByte이내) :
      <input type="file" name="fName" id="file" class="form-control-file border"/>
    </div>
    <button type="button" class="btn btn-secondary" onclick="fCheck()">사원가입</button> &nbsp;
    <button type="reset" class="btn btn-secondary">다시작성</button> &nbsp;
    <button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/adminMain.em';">돌아가기</button>
    
    <input type="hidden" name="photo"/>
    <input type="hidden" name="tel"/>
    <input type="hidden" name="email"/>
  </form>
</div>
<p><br/></p>
</body>
</html>