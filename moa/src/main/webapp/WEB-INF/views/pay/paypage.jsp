<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko"><head>
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
		</jsp:include>
</head>	
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/moa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/moa/css/user2.css">
<script type="text/javascript" src="/moa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/moa/js/w3color.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

<style type="text/css">
.imgbox{
		width: 260px;
}
.pdt50 {
	padding-top: 50px;
}
.pdt25 {
	padding-top: 25px;
}
.imgbox1{
		width: 100px;
}
.imgbox2{
		width: 180px;
}
.inbox{
	text-align:right;
	width:50px;
	height:28px;
}
.pbtn{
	width: 600px;
	height: 60px;
}
.boxt{
	width: 60px;
	height: 31px;
}
.mgb40 {
	margin-bottom: 40px;
}
.mxw1100{
	max-width: 1100px;	
}

</style>
	
<script type="text/javascript">
$(document).ready(function(){
	
 	 $('.paybtn').prev().prev().children().next().click(function(){
		var no = $(this).val()
		var p = $('.price').attr('id').substring(1);
		var check = document.getElementById('ptotal').value=no*p;
		
	$('.paybtn').click(function(){
	
	var IMP = window.IMP;
	IMP.init('imp71302798');
	var msg;
	
	IMP.request_pay({
		pg: 'kakaopay',
		pay_method: 'card',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '${DATA.exiname}',
		amount : check,
		buyer_name : '${MEMB.name}',
		buyer_tel : '${MEMB.tel}',
		buyer_postcode: '123-456'
	}, function(rsp){
		if(rsp.success) {
			var imp_uid =  rsp.imp_uid;
			var merchant_uid = rsp.merchant_uid;
			var pexino = '${DATA.exino}';
			var ptotal = check;
			var ticket = no;
			var pmno = '${MEMB.mno}';
			
			$('#pexino').val(pexino);
			$('#total').val(ptotal);
			$('#pmno').val(pmno);
			$('#ticket').val(ticket);
			$('#imp_uid').val(imp_uid);
			$('#merchant_uid').val(merchant_uid);
			
			 $('#frm').submit(); 
		} else { 
			 msg = '결제에 실패하였습니다.';
			msg += '\n에러내용:' + rsp.error_msg; 
			//실패시 이동할 페이지
			location.href="/moa/pay/payFail.moa";
		}
		});
	});
 	});  
}); 



</script>
</head>
<body>
	<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="" value="" />
	</jsp:include>	
	
<form method="POST" action="/moa/pay/paySuccess.moa" id="frm" name="frm">
	<input type="hidden"  name="pexino" id="pexino" value="${DATA.exino }">
	<input type="hidden"  name="total" id="total" value="check">
	<input type="hidden"  name="ticket" id="ticket" value="no">
	<input type="hidden"  name="pmno" id="pmno" value="${MEMB.mno}">
	<input type="hidden"  name="imp_uid" id="imp_uid" value="#">
	<input type="hidden"  name="merchant_uid" id="merchant_uid" value="#">
</form>
	<div class="w3-content mxw1100 ">
		<div class="w3-content mxw1100 ">
			<div class="w3-col  w3-margin-top mgb20 pdb20 w3-panel w3-border-grey w3-topbar w3-bottombar inblock">
	            <h1 class="w3-col mgt30 w3-margin-left mgb20 inblock w3-left"><strong>결제</strong></h1>
	         	<h6 class="w3-col w3-margin-left mgt30 mgb20 w3-text-grey" ><small>결제 페이지.</small></h6>
	   		 </div>
	   	</div>	 
   		  <div class="w3-content w3-margin w3-center">
		<div class="w3-col pdl10 pdb20  w3-border w3-card-2"">
			<div class="" >
				<div class="w3-col pdl10 pdt25 w3-round-large" style="width: 310px; height: 490px;">
				 	<img src="${DATA.idir}${DATA.imgname}" 
					  		class="img-rounded w3-round " alt="Cinque Terre" width="280" height="460"> 
				</div>
				<div class="w3-rest pdt50 ">
					<h2 class="w3-text-dark-grey mgb20" id="name">[${DATA.exiname}]</h2>
					<h4 class="w3-text-grey mgt30 mgb20" id="person">${DATA.exiperson}</h4>
					<div class="w3-text-grey mgt30 mgb20" >일정 : ${DATA.exisdate} ~ ${DATA.exiedate}</div>
					<div class="w3-text-grey mgt10 mgb20 price" id="p${DATA.exiprice}">가 격 : ${DATA.exiprice} won</div>
					 <div class="mgt10">
					 	  	<label class="w3-margin-right w3-text-grey">수  량 :</label>
						 	<input type="number" pattern="[0-9]+" name="ticket" id="ticket" min="0" max="99" 
						 				class="w3-border w3-center" placeholder="0">
					 </div>   
					 <div class="mgt10" id="pp${MEMB.mno}">
					 	  	<label class=" w3-text-grey">결제 금액 :</label>
						 	<input type="text" id="ptotal"  name="ptotal" value=""
						 				class="w3-text-grey ptotal" style="width:60px;"readonly>
					 </div>   
					<h3 class="inblock w3-button w3-margin-top w3-blue-grey w3-hover-blue-grey w3-card-2 mgl40 mgb60 w3-round paybtn" 
							style=width:400px;height:50px; id="pay${DATA.exino }">결제</h3>
				</div>
		
			</div>
		</div>
   	</div>
   	</div>	 
			
		
<div class="w3-col w3-margin-top">
 <!-- Footer-->
	<footer class="py-5 bg-blight">
	    <jsp:include page="../a_nav/footer.jsp">
			<jsp:param name="" value="" />
		</jsp:include> 
	</footer>
</div>		
	
</body>
</html>