<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../a_nav/head.jsp">
      <jsp:param name="" value="" />
   </jsp:include>
<style type="text/css">
 .box{
 	width: 230px;
 	height: auto;
 }
input{
	width: 105px;
	height: 26px;
} 

</style>
</head>   
<script type="text/javascript">
	$(document).ready(function(){

		
		$('.w3-button.pbtn').click(function(){
	    	 var pno =$(this).html();
	    	 
	    	 if(pno =='&lt;'){
	    		 pno = '${PAGE.startPage -1}';
	    	 }else if(pno == '&gt;'){
	    		 pno ='${PAGE.endPage + 1}';
	    	 }
	    	 $('#nowPage').val(pno);
	    	 $('#frm').submit();
	      });
		
		
		/* 	
		$('.evtinfo').css('display','none');
		$('.ckBox').change(function(){
			var chked = $(this).is(":checked");
			if(chked) {
				$(this).next().next().css('display', 'block');
			}else{
				$(this).next().next().css('display', 'none');
			}
		}); */
		
		

		
	
		/* $('[name="check"]').is(':checked'.each( function(index){ */
			$('.addbtn').click(function(){
				var tno = $(this).next().val();
				
				//var name = $(this).parent().siblings('.name').eq(0).children().eq(0).html();
//				var person =$(this).parent().siblings('.person').eq(0).children().eq(0).html();
				var sdate =	$('#sdate'+tno).val();
				var edate =	$('#edate'+tno).val();
				var evtcode = $(this).prev().children('[name="evtcode"] option:selected').val();
				alert(sdate + '--' + edate + '--' + evtcode)
				
				
				alert('tno : ' + tno);
				if(evtcode == 'D'){
					$('#ectnt'+tno).val('50');
				} else {
					$('#ectnt'+tno).val('1+1');
				}
				/*
				// 데이터 입력
				$('#sdate'+tno).val(sdate);
				$('#edate'+tno).val(edate);
				*/
				 if(!(sdate && edate && evtcode)){
					alert("필수 입력사항을 확인하세요.");
					return;
				} 
				$('#add'+tno).submit();
			});
		/* }) */
		
	});
</script>
<body>
<!-- Navigator -->
   <jsp:include page="../a_nav/nav.jsp">
      <jsp:param name="" value="" />
   </jsp:include>
   
   <form method="POST" action="/moa/subpage/eventpage.moa" id="frm" name="frm">
  		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
  		<input type="hidden" name="bno" id="bno">
  </form> 
  
	<div class="w3-content mxw900 ">
      <hr class="w3-darkgrey ">
      <div class="w3-content mxw900 ">
         <div class="w3-content m3 w3-margin-top w3-margin-bottom inblock">
            <h1 class="w3-col w3-margin-top w3-margin-left mgb20 inblock w3-left ">이벤트</h1>
         	<h6 class="w3-margin-left w3-text-red"><small>이벤트 관리자 페이지.</small></h6>
         </div>
         
       <!--   <div class="w3-col w3-right w3-border-bottom">
         	<div class="w3-text-right w3-right w3-button w3-border mgb20 w3-padding w3-dark-grey w3-round-large" id="add" > 등록 하기</div>
         </div> -->
        
      </div>

      <div class="w3-content w3-margin w3-center">
      
 <c:forEach var="data" items="${LIST}"> 
      <div class="w3-content inblock  w3-round w3-margin-top w3-padding w3-text-left exlist">
			 <div class="w3-margin-right line" >
				  <div class="w3-border w3-border-blue-grey w3-card-2 w3-round-large w3-padding box">
						  <div class="w3-content w3-padding inblock">
							   <img src="${data.idir}${data.imgname}" 
							  		id="img"class="img-rounded w3-round img" alt="Cinque Terre" width="100" height="136"> 
						 </div>
<form method="POST" action="/moa/subpage/addEventProc.moa" id="add${data.exino}"  >
					  <div class="w3-margin-top  w3-text-grey title name" ><small>${data.exiname}</small></div>
					  <div class=" w3-margin-top w3-text-grey person"><small>${data.exiperson}</small></div> 
					  <div class="w3-padding">${data.exiprice}</div>  
					  <div class=" w3-text-grey sdate">${data.sdate}</div>          
					  <div class=" w3-text-grey edate">${data.edate}</div>  
			 		  <hr>
			 		  <div class="w3-margin-right w3-margin-bottom  evtinfo"> 
				 		  <span class="w3-margin-right w3-margin-bottom  mgl30"> <small>이벤트 기간</small></span>
				 		  <input type="text" name="sdate" id="sdate${data.exino}" class="w3-border w3-center w3-round w3-margin-top mgb20 w3-margin-left evtsdate" placeholder=" YYYY/MM/DD">
				 		  <input type="text" name="edate" id="edate${data.exino}" class="w3-border w3-center w3-round mgb20 w3-margin-left evtedate" placeholder=" YYYY/MM/DD">
				 		  <select name="evtcode" class="w3-margin-bottom mgl20 w3-border w3-round evtcode" style="width:108px;height: 25px;">
				 		  	<option value ="">이벤트적용</option>
				 		  	<option value ="D" class="dc">50%</option>
				 		  	<option value ="P" class="plus">1+1</option>
				 		  </select>
<c:if test="${data.exino} ne ${evt.evtexino}"> 
				 		 <div class="w3-button w3-blue-grey w3-round w3-card-2 mgl20 addbtn" style="cursor:pointer">등록</div>
</c:if>	 			 		 
<c:if test="${data.exino} eq ${evt.evtexino}"> 
				 		 <div class= "w3-brown w3-round w3-card-2 mgl20 " >등록됨</div>
				 		 <div class="w3-button w3-brown w3-round w3-card-2 mgl20 addbtn"  style="cursor:pointer">삭제하기</div>
</c:if>				 		 
						<input type="hidden" name="evtexino" value="${data.exino}">
						<input type="hidden" name="evtcontent" id="ectnt${data.exino}" value="0">
			 		  </div>
</form>
			  </div>		
			</div>
      </div>
 </c:forEach>   
    </div>
  </div>
      
     <!-- 페이징 처리 -->
      <div class="w3-center w3-margin-top w3-margin-bottom ">
      <div class="w3-bar w3-border w3-round w3-margin-top">
    <c:if test="${PAGE.startPage == 1 }">    
            <span class="w3-bar-item w3-border-right ">&lt;</span>
    </c:if>
    <c:if test ="${PAGE.startPage != 1 }" >     
            <span class="w3-bar-item w3-button w3-border-right pbtn">&lt;</span>
  	</c:if>
  <c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage }">
     <c:if test="${PAGE.nowPage == page }">       
            <span class="w3-bar-item w3-button w3-border-right w3-text-blue pbtn"id="pagpre">${page}</span>
     </c:if>
     <c:if test="${PAGE.nowPage != page }">     
            <span class="w3-bar-item w3-button w3-border-right  pbtn" id="pagnext">${page}</span>
     </c:if>
  </c:forEach>  
     <c:if test="${PAGE.endPage == PAGE.totalPage }">
            <span class="w3-bar-item ">&gt;</span>
     </c:if> 
      <c:if test="${PAGE.endPage != PAGE.totalPage }">  
            <span class="w3-bar-item w3-button w3-border-left  pbtn">&gt;</span>
      </c:if>   
         </div>
      </div>
  
      
   
   
  <!-- Footer-->
    <footer class="py-5 bg-dark">
       <jsp:include page="../a_nav/footer.jsp">
         <jsp:param name="" value="" />
      </jsp:include>
   </footer>   
</body>
</html>