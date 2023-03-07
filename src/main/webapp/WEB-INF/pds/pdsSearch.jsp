<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>pdsList.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
    'use strict';
    
    function modalView(title,name,id,part,fName,fSName,fSize,downNum,fDate) {
    	let imgs = fSName.split("/");
    	fDate = fDate.substring(0,19);
    	fSize = parseInt(fSize / 1024) + "KByte";
    	
    	$("#myModal").on("show.bs.modal", function(e){
    		$(".modal-header #title").html(title);
    		$(".modal-header #part").html(part);
    		$(".modal-body #name").html(name);
    		$(".modal-body #id").html(id);
    		$(".modal-body #fName").html(fName);
    		$(".modal-body #fDate").html(fDate);
    		$(".modal-body #fSize").html(fSize);
    		$(".modal-body #downNum").html(downNum);
    		$(".modal-body #fSName").html(fSName);
    		
    		// 저장된 파일에 그림이 1장이라도 있다면 1장만 화면에 출력시켜준다.
    		$(".modal-body #imgSrc").attr("src",'');	// 기존에 존재하는 그림파일이 있으면 제거시킨다.(src값을 없앴기에 보이지 않게처리했다.)
    		for(let i=0; i<imgs.length; i++) {
    			let imgExt = imgs[i].substring(imgs[i].lastIndexOf(".")+1).toUpperCase();
    			if(imgExt=="JPG" || imgExt=="GIF" || imgExt=="PNG") {
    				$(".modal-body #imgSrc").attr("src",'${ctp}/data/pds/'+imgs[i]);
    				break;
    			}
    		}
    	});
    }
    
    // 다운로드 회수 증가
    function downNumCheck(idx) {
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/pdsDownNum.pds",
    		data  : {idx : idx},
    		success:function() {
    			location.reload();
    		},
    		error : function() {
    			alert("전송오류!!");
    		}
    	});
    }
    
    //검색기
    function searchCheck() {
    	let searchString = $("#searchString").val();
    	
    	if(searchString.trim() == "") {
    		alert("찾고자 하는 검색어를 입력하세요!");
    		searchForm.searchString.focus();
    	}
    	else {
    		searchForm.submit();
    	}
    }
  </script>
</head>
<body>
<jsp:include page="/include/nav.jsp"/></head>
<p><br/></p>
<div class="container">
  <h2 class="text-center">자 료 실 검 색 리 스 트(${part})</h2>
  <br/>
  <div class="text-center">
    (<font color="blue">${searchTitle}</font>(으)로 <font color="red">${searchString}</font>(을)를 검색한 결과 <font color="blue"><b>${searchCount}</b></font>건이 검색되었습니다.)
  </div>
  <table class="table table-borderless">
    <tr>
      <td class="text-left">
        <a href="${ctp}/pdsList.pds" class="btn btn-info">돌아가기</a>
      </td>
      <td class="text-right">
        <a href="${ctp}/pdsInput.pds?part=${part}" class="btn btn-success">자료올리기</a>
      </td>
    </tr>
  </table>
  <table class="table table-hover text-center">
    <tr class="table-info text-dark">
      <th>번호</th>
      <th>자료제목</th>
      <th>올린이</th>
      <th>올린날짜</th>
      <th>분류</th>
      <th>파일명(크기)</th>
      <th>다운수</th>
      <th>비고</th>
    </tr>
    <c:forEach var="vo" items="${vos}">
      <tr>
        <td>${searchCount}</td>
        <td>
          <a href="${ctp}/pdsContent.pds?idx=${vo.idx}&pag=${pag}&part=${part}">${vo.title}</a>
    	    <c:if test="${vo.hour_diff <= 1}"><img src="${ctp}/images/new.gif"/></c:if>
        </td>
        <td>${vo.name}</td>
        <td>
          <%-- ${vo.fDate} --%>
          <c:if test="${vo.hour_diff > 24}">${fn:substring(vo.fDate,0,10)}</c:if>
          <c:if test="${vo.hour_diff < 24}">		<!-- 24시간이 지나지 않았지만 현재시간~자정까찌는 '날짜:시간', 나머지는 '시간'만 출력 -->
    	      ${vo.day_diff > 0 ? fn:substring(vo.fDate,0,16) : fn:substring(vo.fDate,11,19)}
    	    </c:if>
        </td>
        <td>${vo.part}</td>
        <td>
          <c:set var="fNames" value="${fn:split(vo.fName,'/')}"/>
          <c:set var="fSNames" value="${fn:split(vo.fSName,'/')}"/>
          <c:forEach var="fName" items="${fNames}" varStatus="st">
	          <a href="${ctp}/data/pds/${fSNames[st.index]}" download="${fName}" onclick="downNumCheck(${vo.idx})">${fName}</a><br/>
          </c:forEach>
         	<c:if test="${vo.fSize/1024/1024 < 1}">
				  	(<fmt:formatNumber value="${vo.fSize/1024}" pattern="#,###" />KByte)
					</c:if>
					<c:if test="${vo.fSize/1024/1024 >= 1}">
						(<fmt:formatNumber value="${vo.fSize/1024/1000}" pattern=".00" />MByte)
					</c:if>
        </td>
        <td>${vo.downNum}</td>
        <td>
          <a href="#" onclick="modalView('${vo.title}','${vo.name}','${vo.id}','${vo.part}','${vo.fName}','${vo.fSName}','${vo.fSize}','${vo.downNum}','${vo.fDate}')" class="badge badge-primary" data-toggle="modal" data-target="#myModal">모달창</a><br/>
          <a href="${ctp}/pdsTotalDown.pds?idx=${vo.idx}" class="badge badge-info">전체다운</a><br/>
        </td>
      </tr>
      <c:set var="searchCount" value="${searchCount - 1}"/>
    </c:forEach>
    <tr><td colspan="8" class="m-0 p-0"></td></tr>
  </table>
</div>


<!-- The Modal(모달창 클릭시 자료실의 내용을 모달창에 출력한다. -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
    
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title"><span id="title"></span>(분류:<span id="part"></span>)</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        - 올린이 : <span id="name"></span>
        <hr/>
        - 아이디 : <span id="id"></span><br/>
        - 파일명 : <span id="fName"></span><br/>
        - 파일올린날짜 : <span id="fDate"></span><br/>
        - 파일크기 : <span id="fSize"></span><br/>
        - 파일다운횟수 : <span id="downNum"></span><br/>
        <hr/>
        - 저장파일명 : <span id="fSName"></span><br/>
        <img id="imgSrc" width="450px"/><br/>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
      
    </div>
  </div>
</div>

<!-- 검색기 처리 시작  -->
<div class="container text-center">
  <form name="searchForm" method="post" action="${ctp}/pdsSearch.pds">
    <b>검색 : </b>
    <select name="search">
      <option value="title">글제목</option>
      <option value="name">글쓴이</option>
      <option value="content">글내용</option>
    </select>
    <input type="text" name="searchString" id="searchString"/>
    <input type="button" value="검색" onclick="searchCheck()" class="btn btn-secondary btn-sm"/>
    <input type="hidden" name="pag" value="${pag}"/>
    <input type="hidden" name="pageSize" value="${pageSize}"/>
  </form>
</div>
<!-- 검색기 처리 끝  -->



<p><br/></p>
</body>
</html>