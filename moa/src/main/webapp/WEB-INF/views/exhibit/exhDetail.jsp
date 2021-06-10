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
.pdt30 {
	padding-top: 30px;
}
.pdAll30 {
	padding: 30px;
}
.mgr40 {
	margin-right: 40px;
}
.box {
	width: 600px;
	height: 350px;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.paybtn').click(function(){
			var tno = $(this).attr('id').substring(3);
			$('#exino').val(tno);
			alert(tno);
			 $('#frm').submit(); 
		});
	});
</script>

<body>
<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
	
   	<form method="POST" action="/moa/subpage/paypage.moa" id="frm">
   		<input type="hidden" name="exino" id="exino" value="0">
    </form> 
	
	
	
	<div class="w3-content mxw900 ">
      <div class="w3-content mxw900 ">
         <div class="w3-col  w3-margin-top mgb20 pdb20 w3-panel w3-border-grey w3-topbar w3-bottombar inblock">
            <h1 class="w3-col mgt30 w3-margin-left mgb20 inblock w3-left">전시정보</h1>
         	<h6 class="w3-col w3-margin-left mgt30 mgb20 w3-text-grey"><small>전시 상세보기 페이지 입니다.</small></h6>
         </div>
      </div>

      <div class="w3-content w3-margin w3-center">
		<div class="w3-col w3-border">
			<div class="w3-border  boxx" >
				<div class="inblock pdAll30 w3-border w3-border-light-grey w3-round-large ">
				 	<img src="${DATA.idir}${DATA.imgname}" 
					  		class="img-rounded w3-round " alt="Cinque Terre" width="280" height="460"> 
				</div>
				<div class="inblock pdt30">
					<h2 class="w3-text-dark-grey mgb20">[${DATA.exiname}]</h2>
					<h4 class="w3-text-grey mgt30 mgb20">${DATA.exiperson}</h4>
					<div class="w3-text-grey mgt30 mgb20">일정 : ${DATA.exisdate} ~ ${DATA.exiedate}</div>
					<div class="w3-text-grey mgt30 mgb20">가격 : ${DATA.exiprice} won</div>
					<div class="w3-text-grey mgt30 mgb20">장소: ${DATA.expname} </div>
					<h3 class="inblock w3-button w3-margin-top w3-blue-grey w3-hover-blue-grey w3-card-2 mgl20 mgb60 w3-right paybtn" 
							style=width:400px;height:50px; id="pay${DATA.exino}">예매하기</h3>
				</div>
			</div>
		</div>
		<div class="w3-col w3-panel w3-topbar w3-bottombar mgb20 mgt60 ">
			<h2 class="w3-margin w3-text-dart-grey w3-left">전시장 정보</h2>
		</div> 
		<div class="w3-col ">
			<div class="w3-col w3-border ">
			<div class=" w3-border-bottom mgt10 mgb10">전시장 : ${DATA.expname }</div>
			<div class=" w3-border-bottom mgt10 mgb10">시간 : ${DATA.exptime }</div>
            <div class=" w3-border-bottom mgt10 mgb10">사이트 : ${DATA.expsite }</div>
            <div class=" w3-border-bottom mgt10 mgb10">문의 : ${DATA.exptel }</div>
            <div class=" w3-border-bottom mgt10 mgb10">주소 : ${DATA.exploc }</div>
            <h5 class=" w3-margin">전시장 위치</h5>
            
				<img src="${DATA.expdir}${DATA.expimgname}" style="width:700px;height:500px;">
			</div>
		</div>
    </div>
   
  </div>

                       
                         

<div class="w3-col mgt60">


 <!-- Footer-->
    <footer class="py-5 bg-dark">
       <jsp:include page="../a_nav/footer.jsp">
         <jsp:param name="" value="" />
      </jsp:include>
   </footer>   
</div>

</body>
</html>