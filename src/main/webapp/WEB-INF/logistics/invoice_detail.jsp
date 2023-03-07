      <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>invoice_detail</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
	<jsp:include page="/include/nav.jsp"/></head>
</head>
<style>
	.content{
		margin: 0px;
		padding: 5px;
		border-style:double
	}
	.content2{
		margin: 0px;
		padding: 0px 10px;
		border-style:double
	}
	#content2{
		 border-left:0px;
	}
	#content3{
		 border-top:0px;
	}
	#content4{
		 border-top:0px;
		 border-left:0px;
	} 
	.contentB{
		padding: 0px;
		border-right:1px solid;
		text-align: center;
	}
	.col-7{
		padding: 0px;
		border-bottom:1px solid red;
	}
	.pd{
		padding: 20px 0px; 
	}
</style>
<body>
	<p><br/><p>
  <div class="container">
  <h3 style="text-align:center">INVOICE</h3>
  	<br/>
  	<form name="myform" method="post" action="${ctp}/IVok.em" class="was-validated">
  		<div>
  			<br/>
				<div class="row">
				  <div class="col content" id= "content1">
				  	<span>1) SHIPPER</span> <br/>
				  	<div class = "row">
				  		<div class = "col-4">COMPANY NAME : </div>
				  		<div class = "col-7"> GreenCompany </div>
				  	</div>
				  	<div class ="row ">
				  		<div class ="col-4">ADRESS : </div>
				  		<div class ="col-7">109, Sajik-daero, Seowon-gu, Cheongju-si, Chungcheongbuk-do, Republic of Korea</div>
				  	</div>
				  	<div class ="row">
				  		<div class ="col-4">COUNTRY : </div>
				  		<div class ="col-7">Korea</div>
				  	</div>
				  	<div class ="row">
				  		<div class ="col-4">PHONE / FAX NO : </div>
				  		<div class ="col-7">+82-43-225-2111</div>
				  	</div>
				  </div>
				  <div class="col content" id= "content2">
				  	<span>2) SHIP TO</span> <br/>
				  	<div class = "row">
				  		<div class = "col-4">COMPANY NAME : </div>
				  		<div class = "col-7">${vo.COMPANY}</div>
				  	</div>
				  	<div class ="row">
				  		<div class ="col-4">ADRESS : </div>
				  		<div class = "col-7">${vo.ADRESS}</div>
				  	</div>
				  	<div class ="row">
				  		<div class ="col-4">COUNTRY : </div>
				  		<div class = "col-7">${vo.COUNTRY}</div>
				  	</div>
				  	<div class ="row">
				  		<div class ="col-4">PHONE / FAX NO : </div>
				  		<div class = "col-7">${vo.PHONE}</div>
				  	</div>
				  </div>
				</div>
				<div class = "row">
					<div class = "col content" id= "content3">
						3) PACKING INFO RMATION
						<div class = "row">
							<div class = "col-4">
								NO OF PIECES : 
							</div>
							<div class = "col-7">
								1
							</div>
						</div>
						<div class = "row">
							<div class = "col-4">
								TOTAL WEIGHT :  
							</div>
							<div class = "col-7">
								${vo.weight}KG
							</div>
						</div>
						<div class = "row">
							<div class = "col-4">
								SIZE :  
							</div>
				  		<div class = "col-7">
				  			${vo.size}
				  		</div>
						</div>
					</div>
					<div class = "col content" id= "content4">
						4) BILL TO
							<div class = "col">
								&nbsp;&nbsp;&nbsp;
							</div>
							<div class = "col">
								SAME AS SHIPPER
							</div>
					</div>
				</div>
				<br/>
				<div class="content2">
					<div class ="row">
						<div class="col-3 contentB" style="border-bottom:1px solid">
							FULL DESCRIPTION OF GOODS
						</div>
						<div class="col-2 contentB" style="border-bottom:1px solid">
							NO OF ITEM
						</div>
						<div class="col-2 contentB" style="border-bottom:1px solid">
							CURRENCY
						</div>
						<div class="col-2 contentB" style="border-bottom:1px solid">
							UNIT VALUE
						</div>
						<div class="col-3 contentB" style="border-bottom:1px solid">
							TOTAL VALUE
						</div>
					</div>	
					<div class ="row">
						<div class="col-3 contentB pd">
		 		 			${vo.product_name}
						</div>
						<div class="col-2 contentB pd">
		 		 			${vo.quantity}
						</div>
						<div class="col-2 contentB pd">
							WON
						</div>
						<div class="col-2 contentB pd">
		 		 			${vo.price}
						</div>
						<div class="col-3 contentB pd">
		 		 			${vo.totprice}
						</div>
					</div>	
	  		</div>
			</div>
	    <div class="form-group">
	    </div>
			<button type="button" class="btn btn-secondary" onclick="location.href='${ctp}/invoice_list.log';">돌아가기</button>
 	 	</form>
  </div>
  <p><br/></p>
</body>
</html>