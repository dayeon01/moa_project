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
			var pexino = ${DATA.exino};
			var ptotal = check;
			var ticket = no;
			var pmno = ${MEMB.mno};
			
			
			msg = '결제가 완료되었습니다.';
			msg += '\n고유ID' + rsp.imp_uid;
			msg +='\n상점 거래ID'+ rsp.merchant_uri;
			msg +='\결제 금액' + rsp.paid_amount;
			msg += '카드 승인번호 :' + rsp.apply_num;
			alert(msg);
			$('#pexino').val(pexino);
			$('#total').val(ptotal);
			$('#pmno').val(pmno);
			$('#ticket').val(ticket);
			$('#imp_uid').val(imp_uid);
			$('#merchant_uid').val(merchant_uid);
			
			alert('exino : ' + $('#pexino').val() + '\nimp_uid : ' + $('#imp_uid').val() + '\nmerchat_uid : ' + $('#merchant_uid').val());
			
			//$('#frm').submit();
			/*
			$.ajax({
				url: "/moa/pay/paypage.moa",
				type: 'POST',
				dataType: 'json',
				data: { 
					imp_uid :  imp_uid,
					merchant_uid : merchant_uid,
					pexino : pexino,
					ptotal : check,
					ticket : no,
				 	pmno :  pmno
				} 
			 
			}).done(function(data){
				if(data.everythings_fine){
				} else{
					//결제 x
				}
			});
			*/
			//성공시 이동할 페이지
			//location.href="/moa/main.moa"+msg;
		} else { 
			 msg = '결제에 실패하였습니다.';
			msg += '\n에러내용:' + rsp.error_msg; 
			//실패시 이동할 페이지
			location.href="/moa/pay/payFail.moa";
			alert(msg);
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
	<input type="hidden"  name="pexino" id="pexino" value=" ${DATA.exino }">
	<input type="hidden"  name="total" id="total" value=" check">
	<input type="hidden"  name="ticket" id="ticket" value=" no">
	<input type="hidden"  name="pmno" id="pmno" value=" ${MEMB.mno}">
	<input type="hidden"  name="imp_uid" id="imp_uid" value="#">
	<input type="hidden"  name="merchant_uid" id="merchant_uid" value="#">
</form>
	<div class="w3-content mxw900 ">
		<div class="w3-content mxw900 ">
			<div class="w3-col  w3-margin-top mgb20 pdb20 w3-panel w3-border-grey w3-topbar w3-bottombar inblock">
	            <h1 class="w3-col mgt30 w3-margin-left mgb20 inblock w3-left">결제</h1>
	         	<h6 class="w3-col w3-margin-left mgt30 mgb20 w3-text-grey" ><small>결제 페이지.</small></h6>
	   		 </div>
	   	</div>	 
   		  <div class="w3-content w3-margin w3-center">
		<div class="w3-col w3-border">
			<div class="w3-border  boxx" >
				<div class="inblock pdAll30 w3-border w3-border-light-grey w3-round-large ">
				 	<img src="${DATA.idir}${DATA.imgname}" 
					  		class="img-rounded w3-round mgb40" alt="Cinque Terre" width="280" height="480"> 
				</div>
				<div class="inblock pdt30 ">
					<h2 class="w3-text-dark-grey mgb20" id="name">[${DATA.exiname}]</h2>
					<h4 class="w3-text-grey mgt30 mgb20" id="person">${DATA.exiperson}</h4>
					<div class="w3-text-grey mgt30 mgb20" >일정 : ${DATA.exisdate} ~ ${DATA.exiedate}</div>
					<div class="w3-text-grey mgt10 mgb20 price" id="p${DATA.exiprice}">가 격 : ${DATA.exiprice} won</div>
					 <div class="mgt10">
					 	  	<label class="w3-margin-right w3-text-grey">수  량 :</label>
						 	<input type="number" pattern="[0-9]+" name="ticket" id="ticket" min="0" max="99" 
						 				class="w3-border w3-center" placeholder="0">
					 </div>   
					 <div class="mgt10">
					 	  	<label class=" w3-text-grey">결제 금액 :</label>
						 	<input type="text" id="ptotal"  name="ptotal" value=""
						 				class="w3-text-grey ptotal" style="width:60px;"readonly>
					 </div>   
					<h3 class="inblock w3-button w3-margin-top w3-blue-grey w3-hover-blue-grey w3-card-2 mgl40 mgb60 w3-round w3-right paybtn" 
							style=width:400px;height:50px; id="pay${DATA.exino }">결제</h3>
				</div>
		
			</div>
		</div>
   	</div>
   	</div>	 
			<!-- <div class="w3-content">
			<div class="w3-content mxw800 ">
		     	<div class="w3-col w3-margin-top  w3-padding w3-text-left imgbox">
					 <div class="w3-content inblock pdll0 w3-padding-left">
					 	 <img src="../img/exh_img_title/jang.gif" class="img-rounded w3-round" alt="Cinque Terre" width="200" height="236"> 
					</div>
				</div>
		     	<div class="w3-col mgt40  imgbox">
					  <h3 class="w3-margin-top mgl40 w3-text-grey title">다시 안녕</h3>
					  <p class="mgt20 mgl50">&lt;장 줄리안&gt;</p>            
					  <p class=" mgl50 ">₩ 25000</p>            
					  <p class="mgl0 w3-text-grey">2021.05.15 ~ 2021.08.15</p>        
				</div>
			    <div class="w3-col mgt40   w3-text-left imgbox1">
					 <div class="w3-content inblock pdll0 ">
					 	  <div class="mgt10">
					 	  	<label class="w3-margin-right w3-magin-bottom">유  아</label>
						 	<input type="number" id="num" name="num" min="0" max="10">
					 	  </div>         
					 	  <div class="mgt20">
					 	  	<label class="w3-margin-right w3-magin-bottom">청소년</label>
					 	  </div>         
					 	  <div class="mgt20">
					 	  	<label class="w3-margin-right w3-magin-bottom">성  인</label>
					 	  </div>         
					 	  <div class="mgt20">
					 	  	<label class="w3-margin-right w3-magin-bottom w3-margin-top ">총 금액</label>
					 	  </div> 
					 	     
					</div>
				</div>
			     <div class="w3-col mgt40  w3-padding w3-text-left imgbox2">
				 	 <div class="w3-border boxt  w3-round-large">
			     		<input type="text" class=" w3-round-large inbox inbox" placeholder="0"><br>
					</div>	
				 	 <div class="w3-border boxt w3-margin-top w3-round-large">
			     		<input type="text" class=" w3-round-large inbox inbox" placeholder="0"><br>
					</div>	
				 	<div class="w3-border boxt w3-margin-top w3-round-large">
			     		<input type="text" class=" w3-round-large inbox inbox" placeholder="0"><br>
				   	</div>	
					<div class="mgt40">
					 	 <div class="w3-border boxt w3-margin-top w3-round-large mgt20">
				     		<input type="text" class=" w3-round-large inbox" placeholder="0"><br>
						</div>	
					</div>	
				</div>
		</div>
		     	
				<div class="w3-content  w3-margin-top w3-margin-bottom">
					<h3 class="w3-col w3-content mgt40 pdl40 pdt40 mxw900 mgl40">구매자 정보</h3>
					<p class="w3-col mgb20 mgl40 pdl40">결제하신 모바일 티켓은 구매자의 핸드폰 번호로 전송됩니다. 정확한 정보로 등록되었는지 확인해 주세요.</p>
					<div class="w3-col w3-border mgl70 mgt40 pdAll20 pdl40 w3-light-grey" style="width:600px;">
						<div class="w3-col mgl40 pdl40 mgb20" >이름
							 <div class="inblock w3-border boxt  w3-round-large"style="width:120px;">
					     		<input type="text" class=" w3-round-large w3-light-grey inbox" placeholder="최다연"><br>
							</div>	
						</div>
						<div class="w3-col mgl40 pdl40 mgb20" >휴대폰 번호
							 <div class="inblock w3-border boxt  w3-round-large"style="width:120px;">
					     		<input type="text" class=" w3-round-large w3-light-grey inbox" style="width:110px;" placeholder="01021201239"><br>
							</div>	
						</div>
						<div class="w3-col mgl40 pdl40 mgb20" >이메일 주소
							 <div class="inblock w3-border boxt  w3-round-large"style="width:200px;">
					     		<input type="text" class=" w3-round-large pdr10 mgb60 w3-light-grey inbox" style="width:190px;" placeholder="yeon@naver.com"><br>
							</div>	
						</div>
					</div>
					<h3 class="w3-col  mgt40 pdl40 pdt10 mxw900 mgl40">결제 수단</h3>
						<div class="w3-col w3-margin-top mgl40 pdl40">
							<input type="radio" class="mgl20 " name="ppay" value="ppay">포인트 결제
							<input type="radio" class="mgl70" name="cpay" value="cpay">카드 결제
					</div>
					<div class="w3-col w3-border mgl70 mgt40 pdAll20 pdl40 w3-light-grey" style="width:600px;">
						<div class="w3-col mgt20 w3-center">보유 포인트 : 
							<input type="text" class="w3-border-bottom w3-light-grey" placeholder="10000 P">
						</div>
						
						<div class="w3-col w3-margin-top ">
							<hr>		
						</div>
						<div class="w3-col mgt20 w3-center">상품 금액 : 
							<input type="text" class="w3-border-bottom w3-light-grey" placeholder="20000 원">
						</div>
						<div class="w3-col mgt20 w3-center">포인트 사용 : 
							<input type="text" class="w3-border-bottom w3-light-grey" placeholder="5000 P">
						</div>
						<div class="w3-col mgt20 w3-center">총 결제 금액: 
							<input type="text" class="w3-border-bottom w3-light-grey" placeholder="15000 원">
						</div>
					</div>
					<div class="w3-col w3-button mgt60 mgb60 mgl70 w3-round w3-blue w3-hover-blue w3-round pbtn ftw" id="pbtn">결제하기</div>
				</div>
							
		</div>	
		</div>
	</div>	 -->
		
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