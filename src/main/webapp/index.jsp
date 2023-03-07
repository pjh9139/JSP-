<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>green2209_05</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/include/bs4.jsp" />
  <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
  <style>
		#login{
			position: relative;
			z-index: 2;
			margin: 0 auto;
			align-items : center;
			width: 370px;
			height: 500px;
			background-color: rgba(200, 200, 200, 0.5);
			border-radius: 10px;
			top: -120px;
		}
			
		#login-inner{
			margin: 60px auto 0 auto;
			width: 350px;
			height: 420px;
			background-color: #eee;
			border-radius: 10px;
		}
		.login-from{
			width: 280px;
			height: 40px;
		}
		.header{
			height: 300px;
		}
		.fa{
			color: #999;
			width: 15px;
		}
		.input-group-append{
			margin: 0 auto;
			border-radius: 10px;
		}
		.inputbox{
			background-color: #eee;
			border-color: #fff;
			border-top-right-radius: 5px;
			border-bottom-right-radius: 5px;
		}
		#punching{
	    position: absolute;
	    top: 15px;
	    width: 65px;
	    height: 10px;
	    border-radius: 10px;
	    background-color: #333;
		}
		#strap{
			position: absolute;
	    top: -333px;
    	right: -77px;
		}
		#text-box{
	    position: relative;
	    top: -320px;
	    width: 1200px;
	    height: 50px;
	    background-color: #336;
	    color: white;
	    text-align: left;
	    font-size: 1.5em;
      line-height: 50px;
		}
  </style>
</head>
<body>
	<div class="container" style="margin: 0 auto;">
		<div class="header">
			<img src="images/logistics.png" style="width: 1200px; height:520px;">
		</div>
  	<div id="login" class="d-flex justify-content-center form_container">
  		<div id="punching">
  			<img src="images/strap.png" id="strap">
  		</div>
		  <div id="login-inner">
				<p><br/></p>
				<p style="text-align: center"><img src="images/logo1.png" style="width: 250px;"></p>
			  <form name="myform" method="post" action="${ctp}/login.em" class="was-validated">
			  	<div class="input-group mb-3">
				  	<div class="input-group-append">
				    	<span class="input-group-text" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
    						<i class="fa fa-user"></i>
  						</span>
				      <input type="text" class="login-from inputbox" name="id" id="id" required />
				    </div>
			   	</div>
			   <div class="input-group mb-3">
				   	<div class="input-group-append">
				    	<span class="input-group-text" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
				    		<i class="fa fa-lock"></i>
				    	</span>
				      <input type="password" class="login-from inputbox" name="pwd" id="pwd" required />
				    </div>
			  	</div>
			    <div class="text-center mt-3"><button type="submit" class="btn btn-primary login-from" id="btnlogin">로그인</button></div>
		    <br/>
			  </form>
	    </div>
    </div>
    <div id="text-box">
    	<span>&nbsp;&nbsp;&nbsp;Logistics is the careful transit </span>
    	<span style="text-align: right; position: absolute; right: 20px;">Organization of a complicated activity</span>
    </div>
    <div style="position: relative; bottom: 130px;">
	    <p style="color:#bbb; text-align: center;">ID/PASS분실 시 시스템 운영 담당자에게 연락해 주십시오</p>
			<br/>
			<p style="color:#bbb; text-align: center;">샘플 ID,PW</p>
			<br/>
			<p style="color:#bbb; text-align: center;">관리자 ID : admin PW : 1234</p>
			<br/>
			<p style="color:#bbb; text-align: center;">평사원 ID : 2211	PW : 1234 </p>
    </div>
	</div>
	<p><br/></p>
</body>
</html>
