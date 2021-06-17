<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../a_nav/head.jsp">
      <jsp:param name="" value="" />
   </jsp:include>
<style type="text/css">
 .box {
 	width: 230px;
 }

input{
	/* width: 105px; */
	height: 26px;
} 
.title {
	height: 40px;
}
.evtinfo{
	height: 200px;
}
.addbtn , .delbtn{
	width:160px;
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

			$('.addbtn').click(function(){
				var tno = $(this).next().val();
				var sdate =	$('#sdate'+tno).val();
				var edate =	$('#edate'+tno).val();
				var evtcode = $(this).prev().children('[name="evtcode"] option:selected').val();
				
				if(evtcode == 'D'){
					$('#ectnt'+tno).val('50');
				} else {
					$('#ectnt'+tno).val('1+1');
				}
				
				 if(!(sdate && edate && evtcode)){
					alert("필수 입력사항을 확인하세요.");
					return;
				}
				 $(this).parent().parent().submit(); 

			});
		 
		 $('.delbtn').click(function(){
			 var tno = $(this).next().val();
			$('#add' + tno).attr('action', '/moa/subpage/eventDelProc.moa');
			$('#add'+ tno).submit(); 
			
		 });
		
		
	});
</script>
<body>
<!-- Navigator -->
   <jsp:include page="../a_nav/nav.jsp">
      <jsp:param name="" value="" />
   </jsp:include>
   
   <form method="POST" action="/moa/subpage/addEvent.moa" id="frm" name="frm">
  		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
  		<input type="hidden" name="bno" id="bno">
  </form> 
  
	<div class="w3-content mxw900 ">
      <div class="w3-content mxw900 ">
        <div class="w3-col  w3-margin-top w3-margin-bottom w3-panel w3-border-grey w3-topbar w3-bottombar inblock">
            <h1 class="w3-col mgt30 w3-margin-left mgb20 inblock w3-left  ">이벤트</h1>
         	<h6 class="w3-margin-left mgb20 w3-text-red"><small><strong>이벤트 관리자 페이지.</strong></small></h6>      	
         </div>       
      </div>

      <div class="w3-content w3-margin w3-center">
      
 <c:forEach var="data" items="${LIST}"> 
      <div class="inblock w3-round w3-margin-top w3-padding w3-text-left exlist">
			 <div class="w3-col w3-margin-right w3-border w3-border-blue-grey w3-hover-shadow w3-hover-light-grey line" >
				  <div class="  mgt30 mgb20  w3-padding box">
					  <div class="w3-content w3-padding inblock">
						   <img src="${data.idir}${data.imgname}" id="img"class="img-rounded mgl10 w3-round w3-border img" alt="Cinque Terre" width="100px;" height="136px;"> 
					 </div>
<form method="POST" action="/moa/subpage/addEventProc.moa" id="add${data.exino}" class="w3-col mgl10">
					  <div class="w3-margin-top  w3-text-grey title " ><small>${data.exiname}</small></div>
					  <div class=" w3-margin-top w3-text-grey person"><small>${data.exiperson}</small></div> 
					  <div class="w3-padding">${data.exiprice}</div>
					 <span class="w3-margin-right w3-margin-bottom  mgl10"> <small><strong>[전시기간]</strong></small></span>
					  <div class=" w3-text-grey sdate">${data.exisdate}</div>          
					  <div class=" w3-text-grey edate">${data.exiedate}</div>  
			 		  <hr>
			 		  <div class="w3-margin-right w3-margin-bottom mgl20 evtinfo">
<c:if test="${data.evtexino eq -1 }">
						 <span class="w3-margin-right w3-margin-bottom mgl20"><small><strong>[이벤트 기간]</strong></small></span>
				 		  <input type="Date" name="evtsdate" id="sdate${data.exino}" class="w3-border w3-center w3-round w3-margin-top mgb10 evtsdate">
				 		  <input type="Date" name="evtedate" id="edate${data.exino}" class="w3-border w3-center w3-round mgb10  evtedate">
				 		  <select name="evtcode" class="w3-margin-bottom mgl10 w3-border w3-round evtcode" style="width:108px;height: 25px;">
				 		  	<option value ="">이벤트적용</option>
				 		  	<option value ="D" class="dc">50%</option>
				 		  	<option value ="P" class="plus">1+1</option>
				 		  </select>
				 		 <div class="w3-button w3-blue-grey w3-round w3-card-2 addbtn" style="cursor:pointer">등록</div>
</c:if>				 		
<c:if test="${data.evtexino ne -1}"> 
				 		  <span class="w3-margin-right w3-margin-bottom mgl20"> <small><strong>[이벤트 기간]</strong></small></span>
				 		  <div class="w3-center w3-round w3-margin-top mgb20  evtsdate">${data.evtsdate }</div>
				 		  <div class="w3-center w3-round w3-margin-top mgb10 evtsdate">${data.evtedate }</div>
<c:if test="${data.isshow eq 'Y'}">
					 		 <div class="w3-button w3-brown w3-round w3-card-2 mgt30 delbtn"  
					 		 		style="cursor:pointer">삭제하기</div> 
</c:if>						
<c:if test="${data.isshow eq 'N'}">
					 		 <h3 class= "w3-text-red mgt30 mgb10" >이벤트종료</h3>
</c:if>						
						<input type="hidden" name="evtexino" value="${data.evtexino}"> 
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