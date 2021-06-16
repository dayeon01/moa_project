<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="../a_nav/head.jsp">
      <jsp:param name="" value="" />
   </jsp:include>
</head>
<style type="text/css">
.pdt50 {
	padding-top: 50px;
}
.pdt25 {
	padding-top: 25px;
}
.mgr40 {
	margin-right: 40px;
}
.box {
	width: 600px;
	height: 350px;
}
.mxw1100{
	max-width: 1100px;	
}
.mgl150{
	margin-left:150px;
}
.map{
	cursor : pointer;
}
.paybtn{
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.paybtn').click(function(){
			var tno = $(this).attr('id').substring(3);
			$('#exino').val(tno);
			 $('#frm').submit(); 
		});
		
		$('.map').click(function(){
			location.href="/moa/survey/surveyMap.moa";
		});
	});
</script>

<body>
<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
	
   	<form method="POST" action="/moa/pay/paypage.moa" id="frm">
   		<input type="hidden" name="exino" id="exino" value="0">
    </form> 
	
	
	
	<div class="w3-content mxw1100 ">
      <div class="w3-content mxw1100 ">
         <div class="w3-col  w3-margin-top mgb20 pdb20 w3-panel w3-border-grey w3-topbar w3-bottombar inblock">
            <h1 class="w3-col mgt30 w3-margin-left mgb20 inblock w3-left"><strong>전시정보</strong></h1>
         	<h6 class="w3-col w3-margin-left mgt30 mgb20 w3-text-grey"><small>전시 상세보기 페이지 입니다.</small></h6>
         </div>
      </div>

      <div class="w3-content w3-margin w3-center">
		<div class="w3-col w3-margin-left w3-border w3-card-2">
			<div class="" >
				<div class="w3-col pdl10 pdt25 w3-round-large" style="width: 310px; height: 490px;">
				 	<img src="${DATA.idir}${DATA.imgname}" 
					  		class="img-rounded w3-round " alt="Cinque Terre" width="280" height="460"> 
				</div>
				<div class="w3-rest pdt50">
					<h2 class="w3-text-dark-grey mgb20">[${DATA.exiname}]</h2>
					<h4 class="w3-text-grey mgt30 mgb20">${DATA.exiperson}</h4>
					<div class="w3-text-grey mgt30 mgb20">전시일정 : ${DATA.exisdate} ~ ${DATA.exiedate}</div>
					<div class="w3-text-grey mgt30 mgb20">이벤트일정 : ${DATA.sdate} ~ ${DATA.edate}</div>
					<div class="w3-text-grey mgt30 mgb20">가격 : ${DATA.reprice} won 
	<c:if test="${DATA.evtcode eq 'P'}">				
						<div class="badge bg-primary bg-gradient rounded-pill mb-2">티켓 1+1</div>
	</c:if>					
	<c:if test="${DATA.evtcode ne 'P'}">				
						<div class="badge bg-primary bg-gradient rounded-pill mb-2">50% 할인</div>
	</c:if>					
					</div>
					<div class="w3-text-grey mgt30 mgb20">장소: ${DATA.expname} </div>
					<h3 class="inblock w3-button w3-margin-top w3-blue-grey w3-hover-blue-grey w3-card-2 mgl30 mgb60 paybtn" 
							style=width:400px;height:50px; id="pay${DATA.exino}">예매하기</h3>
				</div>
			</div>
		</div>
		<div class="w3-col w3-panel w3-topbar w3-bottombar mgb60 mgt60 ">
			<h2 class="w3-margin w3-text-dart-grey w3-left">전시장 정보</h2>
		</div> 
		<div class="col-lg-8">
          <div class="row mxw900 " >
			<div class=" w3-center mgl150 w3-padding">
           	  	<div class="card h-100 shadow border-0 w3-center map">
                	<img class="card-img-top" src="${DATA.expdir}${DATA.expimgname}" alt="...">
                	<div class="card-body p-4">
                      <div class="badge bg-primary bg-gradient rounded-pill mb-2">전시장 정보</div>
                      <a class="text-decoration-none link-dark stretched-link img" ><h5 class="card-title mb-3">전시장 : ${DATA.expname }</h5></a>
                      <p class="card-text mb-0 w3-margin-bottom ">- 시간 : ${DATA.exptime }</p>
                      <p class="card-text mb-0">- 사이트 : ${DATA.expsite }</p>
                      <p class="card-text mb-0">- 문의 : ${DATA.exptel }</p>
                      <p class="card-text mb-0">- 주소 : ${DATA.exploc }</p>
                      <p></p>
              		</div>
             	</div>
        	</div>
          </div>
   		</div>
 	  </div>
  </div>

                       
                         

<div class="w3-col mgt60"></div>
<div class="w3-col mgt60"></div>

</body>
</html>