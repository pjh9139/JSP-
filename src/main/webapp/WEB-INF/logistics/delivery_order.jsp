<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>delivery_order.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"/></head>
  <script>
  function reCheck() {
		window.open("${ctp}/recipientCheck.log","nWin","width=580px,height=600px");
		
  }
  function prCheck() {
		window.open("${ctp}/productCheck.log","nWin","width=580px,height=600px");
  }
  </script>
</head>
<body>
	<p><br/><p>
  <div class="container">
  	<form name="myform" method="post" action="${ctp}/DOok.log" class="was-validated">
	    <h2>Delivery Order</h2>
	    <br/>
	    <div class="form-group">
	      <label for="recipient_idx">recipient_idx(수취번호) :<input type="button" class="btn btn-primary btn-sm" value="검색" id="reBtn" onclick="reCheck()"/></label>
	      <input type="number" class="form-control" id="recipient_idx" name="recipient_idx" required />
	    </div>
	    <div class="form-group">
	      <label for="recipient">recipient(수취자) :</label>
	      <input type="text" class="form-control" id="recipient" name="recipient" required />
	    </div>
	    <div class="form-group">
	      <label for="recipient_location">recipient_location(수취장소) :</label>
	      <input type="text" class="form-control" id="recipient_location" name="recipient_location" required />
	    </div>
	    <div class="form-group">
	      <label for="recipient_country">recipient_country(수취국가) :</label>
	      <input type="text" class="form-control" id="recipient_country" name="recipient_country" required />
	    </div>
	    <div class="form-group">
	      <label for="recipient_tel">recipient_tel(연락처) :</label>
	      <input type="text" class="form-control" id="recipient_tel" name="recipient_tel" required />
	    </div>
	    <div class="form-group">
	      <label for="recipient_method">recipient_method(운송방법) :</label>
	      <input type='radio' name='recipient_method' value='Air' checked />항공
	      <input type='radio' name='recipient_method' value='Ship' />해운
	    </div>
	    <div class="form-group">
	      <label for="product_idx">product_idx(제품번호) :<input type="button" class="btn btn-primary btn-sm" value="검색" id="prBtn" onclick="prCheck()"/></label>
	      <input type="number" class="form-control" id="product_idx" name="product_idx" required />
	    </div>
	    <div class="form-group">
	      <label for="product_name">product_name(제품이름) :</label>
	      <input type="text" class="form-control" id="product_name" name="product_name" required />
	    </div>
	    <div class="form-group">
	      <label for="product_price">product_price(제품가격) :</label>
	      <input type="number" class="form-control" id="product_price" name="product_price" required />
	    </div>
	    <div class="form-group">
	      <label for="product_weight">product_weight(제품중량) :</label>
	      <input type="number" class="form-control" id="product_weight" name="product_weight" required />
	    </div>
	    <div class="form-group">
	      <label for="product_size">product_size(제품크기) :</label>
	      <input type="text" class="form-control" id="product_size" name="product_size" required />
	    </div>
	    <div class="form-group">
	      <label for="product_quantity">product_quantity(제품수량) :</label>
	      <input type="number" class="form-control" id="product_quantity" name="product_quantity" required />
	    </div>
	  	<button type="submit" class="btn btn-primary">저장</button> &nbsp;
    	<button type="reset" class="btn btn-primary">다시작성</button> &nbsp;
 	 	</form>
 	 
 	 
  </div>
  <p><br/></p>
</body>
</html>