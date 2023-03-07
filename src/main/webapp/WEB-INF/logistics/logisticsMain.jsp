<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>logisticsMain.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
    'use strict';
    
    //좋아요 체크
    
    function goodCheck() {
    	$.ajax({
    		type  : "post",
    		url   : "${ctp}/boGood.bo",
    		data  : {idx : ${vo.idx}},
    		success:function(res) {
    			if(res == "0") alert("이미 좋아요 버튼을 클릭하셨습니다.");
    			else location.reload();
    		},
    		error : function() {
    			alert("전송 오류~~");
    		}
    	});
    }
  </script>
	<style>
		.div1{
			width:100%;
			height:200px;
		}
		#mypage{
			font-size:1em;
			padding: 10px 0 0 20px;
		}
		#myphoto{
			width:50px;
			height:50px;
	    background-color: #eee;
		}
		#profile_photo{
			width:50px;
			height:50px;
	    background-color: #eee;
		}
		
		#clander{
			height:380px;
		}
		
		.table td, .table th {
    	padding: 0;
    }
    
    .board{
			line-height: 5px;
	    height: 80px;
	    padding: 10px;
    }
    
	}
	</style>
</head>
<body>
<jsp:include page="/include/nav.jsp"/>
  <div class="row">
  	<div class="col-xl-2">
  		<div>
  			<div  class="div1" id="mypage" >
					<p style="text-align:center"><img id="myphoto" src="${ctp}/data/employee/${emvo.photo}" class="rounded-circle"/></p>  
					성명 : ${sName}<br/>
					직급 : ${sRank}<br/> 
					사번 : ${emvo.id}<br/>
					이메일 : ${emvo.email}<br/>
					연락처 : ${emvo.tel}<br/>
  			</div>
  		</div>
		  <div class="div1" id="clander">
		  <br/>
		  <p class="text-center">이번달 일정</p>
<!-- 	*********일정*******		 -->
			  <div class="text-center">
			    <table class="table table-bordered" style="height:150px; padding">
			      <tr class="text-center" style="background-color:#eee">
			        <th style="width:13%; color:red; vertical-align:middle">일</th>
			        <th style="width:13%; vertical-align:middle">월</th>
			        <th style="width:13%; vertical-align:middle">화</th>
			        <th style="width:13%; vertical-align:middle">수</th>
			        <th style="width:13%; vertical-align:middle">목</th>
			        <th style="width:13%; vertical-align:middle">금</th>
			        <th style="width:13%; color:blue; vertical-align:middle">토</th>
			      </tr>
			      <tr>
			        <c:set var="cnt" value="${1}"/>
			        <!-- 시작일 이전의 공백을 이전달의 날짜로 채워준다. -->
			        <c:forEach var="preDay" begin="${preLastDay-(startWeek-2)}" end="${preLastDay}">
			          <td style="color:#777;font-size:0.6em"></td>
			          <c:set var="cnt" value="${cnt+1}"/>
			        </c:forEach>
			        
			        <!-- 해당월에 대한 날짜를 마지막일자까지 반복 출력한다.(단, gap이 7이되면 줄바꿈한다.) -->
			        <c:forEach begin="1" end="${lastDay}" varStatus="st">
			          <c:set var="todaySw" value="${toYear==yy && toMonth==mm && toDay==st.count ? 1 : 0}"/>
			          <td id="td${cnt}" ${todaySw==1 ? 'class=today' : ''} style="font-size:0.9em">
			            <c:set var="ymd" value="${yy}-${mm+1}-${st.count}"/>
			            <a href="scMenu.sc?ymd=${ymd}"style="font-size: 0.8em;">
			            	${st.count}<br/>
			            	
			            	<!-- 해당날짜에 일정이 있으면 part를 출력하게 한다. -->
			            	<c:set var="tempPart" value=""/>
			            	<c:set var="tempCnt" value="0"/>
			            	<c:set var="tempSw" value="0"/>
			              <c:forEach var="vo" items="${vos}">
			                <c:if test="${fn:substring(vo.sDate,8,10)==st.count}">
			                  <c:if test="${vo.part != tempPart}">
			                    <c:if test="${tempSw != 0}">
			                    </c:if>
			                    <c:set var="tempPart" value="${vo.part}"/>                  
			                  </c:if>
			                  <c:set var="tempSw" value="1"/>
			                  <c:set var="tempCnt" value="${tempCnt + 1}"/>
			                </c:if>
			            	</c:forEach>
			            	<c:if test="${tempCnt != 0}">${tempCnt}건</c:if>
			            </a>
			          </td>
			          <c:if test="${cnt % 7 == 0}"></tr><tr></c:if>  <!-- 한주가 꽉차면 줄바꾸기 한다. -->
			          <c:set var="cnt" value="${cnt + 1}"/>
			        </c:forEach>
			        <!-- 마지막일 이후를 다음달의 일자로 채워준다. -->
			        <c:if test="${nextStartWeek != 1}">
				        <c:forEach begin="${nextStartWeek}" end="7" varStatus="nextDay">
				          <td style="color:#777;font-size:0.6em"></td>
				        </c:forEach>
			        </c:if>
			      </tr>
			    </table>
			  </div>
<!-- 	*********일정*******		 -->
		  </div>
  	</div>
  	
  	
  	<div class="col-xl-6">
<!-- 	*********게시판*******		 -->
  		<div>
  			<span>게시판</span>
		    <c:forEach var="bvo" items="${bvos}">
		    	<div class="board row">
		    		<div class="profile col-1">
		    			<img id="profile_photo" src="${ctp}/data/employee/${bvo.photo}" class="rounded-circle"/>
		    		</div>
		    		<div class="comment col-11">
							<p>
								<span>${bvo.name}</span>
								<span>${bvo.day_diff > 0 ? fn:substring(bvo.wDate,0,16) : fn:substring(bvo.wDate,11,16)}</span>
							</p>
							<p>
								<a href="${ctp}/boContent.bo?idx=${bvo.idx}">${bvo.title}</a>
							</p>
							<p>
								<span>${bvo.content}</span>
								<span>&nbsp;
				          <font color="red">❤</font>&nbsp;${bvo.good}
								</span>
							</p>		    			
		    		</div>
		    	</div>
		    	<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
		    </c:forEach>
  		</div>
<!-- 	*********게시판*******	-->
  		
  		
  		<div>
  			<span>공지사항</span>
				<table class="table table-hover text-center">
			    <tr class="table-info">
			      <th>글제목</th>
			      <th>글쓴날짜</th>
			    </tr>
			    <c:forEach var="nvo" items="${nvos}">
			    	<tr>
			    	  <td class="text-left">
			    	    <a href="${ctp}/noContent.no?idx=${nvo.idx}">${nvo.title}</a>
			    	  </td>
			    	  <td>
			    	      ${fn:substring(nvo.wDate,0,16)}
			    	  </td>
			    	</tr>
			    	<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
			    </c:forEach>
			    <tr><td colspan="6" class="m-0 p-0"></td></tr>
			  </table>
  		</div>
  		
  		<div>
  			<span>자료실</span>
			  <table class="table table-hover text-center">
			    <tr  class="table-info">
			      <th>자료제목</th>
			      <th>올린날짜</th>
			    </tr>
			    <c:forEach var="pvo" items="${pvos}">
			      <tr>
			        <td class="text-left">
			          <a href="${ctp}/pdsContent.pds?idx=${pvo.idx}">${pvo.title}</a>
			        </td>
			        <td>
			    	      ${fn:substring(pvo.fDate,0,16)}
			        </td>
			      </tr>
			      <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
			    </c:forEach>
			  </table>  		
  		</div>
  		
  	</div>
  	
  	<div class="col-xl-4">
  	</div>
  </div>
  <p><br/></p>
</body>
</html>