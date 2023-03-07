<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>pdsInput.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
    'use strict';
	  let cnt = 1;
	  
	  function fileBoxAppend() {
	  	cnt++;
	  	let fileBox = "";
	  	fileBox += '<div id="fBox'+cnt+'">';
	  	fileBox += '<input type="file" name="fName'+cnt+'" id="fName'+cnt+'" class="form-control-file border mb-2" style="float:left;width:85%"/>';
	  	fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger form-control ml-2 mb-2" style="width:10%"/>';
	  	fileBox += '</div>';
	  	$("#fileBoxAppend").append(fileBox);
	  }
	  
	  function deleteBox(cnt) {
	  	$("#fBox"+cnt).remove();
		  cnt--;
	  }
	  
	  function fCheck() {
		  let fName1 = $("#fName1").val();
		  let maxSize = 1024 * 1024 * 20;
		  let title = $("#title").val();
		  let pwd = $("#pwd").val();
		  
		  if(fName1.trim() == "") {
			  alert("업로드할 파일명을 선택해 주세요.");
			  return false;
		  }
		  else if(title.trim() == "") {
			  alert("업로드할 파일명을 입력하세요.");
			  return false;
		  }
		  else if(pwd.trim() == "") {
			  alert("비밀번호를 입력하세요.");
			  return false;
		  }
		  
		  // 파일 사이즈 처리...
		  let fileSize = 0;
		  for(let i=1; i<=cnt; i++) {
			  let imsiName = 'fName' + i;
			  if(isNaN(document.getElementById(imsiName))) {	// 내용이 있을경우만 해당 if블록을 처리한다. 즉 파일이 없으면 수행하지 않는다.
				  let fName = document.getElementById(imsiName).value;
				  if(fName != "") {
					  fileSize += document.getElementById(imsiName).files[0].size;
					  let ext = fName.substr(fName.lastIndexOf(".")+1);
					  let uExt = ext.toUpperCase();
					  if(uExt != "JPG" && uExt != "GIF" && uExt != "PNG" && uExt != "ZIP" && uExt != "HWP" && uExt != "PPT" && uExt != "PPTX") {
						  alert("업로드 가능한 파일은 'JPG/GIF/PNG/ZIP/HWP/PPT' 입니다.");
						  return false;
				    }
				  }
				  /* 
				  else {
					  alert("빈 파일박스에 파일을 선택해 주세요");
					  return false;
				  }
				   */
			  }
		  }
		  if(fileSize > maxSize) {
			  alert("업로드할 파일의 최대용량은 20MByte 입니다.");
			  return false;
		  }
		  else {
			  myform.fileSize.value = fileSize;
			  myform.submit();
		  }
	  }
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp"/></head>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${ctp}/pdsInputOk.pds" enctype="multipart/form-data">
	  <h2 class="text-center">자 료 올 리 기</h2>
	  <br/>
	  <div>
	    <input type="button" value="파일박스추가" onclick="fileBoxAppend()" class="btn btn-info btn-sm mb-2"/>
	    <input type="file" name="fName1" id="fName1" class="form-control-file border mb-2"/>
	  </div>
	  <div id="fileBoxAppend"></div>
	  <div class="mb-2">올린이 : ${sName}&nbsp;${sRank}</div>
	  <div class="mb-2">
	    제목 :
	    <input type="text" name="title" id="title" placeholder="자료 제목을 입력하세요" class="form-control" required />
	  </div>
	  <div class="mb-2">
	    내용 :
	    <textarea rows="4" name="content" id="content" class="form-control"></textarea>
	  </div>
	  <div class="mb-2">
	    분류 :
	    <select name="part" id="part" class="form-control">
	  	  <option value="공지" ${part == '공지' ? 'selected' : ''}>공지</option>
	  	  <option value="서류" ${part == '서류' ? 'selected' : ''}>서류</option>
	  	  <option value="사진" ${part == '사진' ? 'selected' : ''}>사진</option>
	  	  <option value="기타" ${part == '기타' ? 'selected' : ''}>기타</option>
	  	</select>
	  </div>
	  <div class="mb-2">
	    공개여부 :
	    <input type="radio" name="openSw" value="공개" checked />공개 &nbsp;&nbsp;
	    <input type="radio" name="openSw" value="비공개" />비공개
	  </div>
	  <div class="mb-2">
	    비밀번호 :
	    <input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요" required />
	  </div>
	  <div class="mb-2">
	    <input type="button" value="자료올리기" onclick="fCheck()" class="btn btn-primary"/> &nbsp;
	    <input type="reset" value="다시쓰기" class="btn btn-warning"/> &nbsp;
	    <input type="button" value="돌아가기" onclick="location.href='${ctp}/pdsList.pds?part=${part}';" class="btn btn-secondary"/> &nbsp;    
	  </div>
	  <input type="hidden" name="listPart" value="${part}"/>
	  <input type="hidden" name="fileSize"/>
	  <input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}"/>
  </form>
</div>
<p><br/></p>
</body>
</html>