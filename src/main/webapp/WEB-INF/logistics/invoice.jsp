<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>invoice</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"/></head>
  <script >
  function DOCheck() {
		window.open("${ctp}/DOCheck.log","nWin","width=1080px,height=600px");
	}
  </script>
</head>
<body>
	<p><br/><p>
  <div class="container">
  <h3 style="text-align:center">INVOICE</h3>
  	<br/>
  	<button type="button" id="DOBtn" class="btn btn-primary" onclick="DOCheck()">DO 검색</button> &nbsp;
  	<br/>
  	<br/>
  	<form name="myform" method="post" action="${ctp}/IVok.log" class="was-validated">
	  	<div class = "row">
	  		COMPANY NAME : 
	  		<input type="text" class="form-control" id="COMPANY" name="COMPANY" required />
		  	</div>
	  	<div class ="row">
	  		ADRESS : 
	  		<input type="text" class="form-control" id="ADRESS" name="ADRESS" required />
	  	</div>
	  	<div class ="row">
	  		COUNTRY : 
	  		<input type="text" class="form-control" id="COUNTRY" name="COUNTRY" required />
	  	</div>
	  	<div class ="row">
	  		PHONE / FAX NO : 
	  		<input type="text" class="form-control" id="PHONE" name="PHONE" required />
	  	</div>
			<div class = "row">
				TOTAL WEIGHT :
				<input type="number" class="form-control" id="weight" name="weight" required />
			</div>
			<div class = "row">
				SIZE :
	  		<input type="text" class="form-control" id="size" name="size" required />
			</div>
			<div class="row">
				FULL DESCRIPTION OF GOODS :
				<input type="text" class="form-control" id="product_name" name="product_name" required />
			</div>
			<div class="row">
				NO OF ITEM :
				<input type="number" class="form-control" id="quantity" name="quantity" required />
			</div>
			<div class="row">
				UNIT VALUE :
				<input type="number" class="form-control" id="price" name="price" required />
			</div>
			<div class="row">
				TOTAL VALUE :
				<input type="number" class="form-control" id="totprice" name="totprice" required />
			</div>
			<input type="hidden" id="DOidx" name="DOidx"/>
			<br/>
	  	<button type="submit" class="btn btn-primary">저장</button> &nbsp;
    	<button type="reset" class="btn btn-primary">다시작성</button> &nbsp;
 	 	</form>
  </div>
  <p><br/></p>
</body>
</html>