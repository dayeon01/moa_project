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
		
		$('.evtinfo').css('display','none');
		/* $('[name=check]').click(function(){
			$('.evtinfo').css('display','block')
		})	;	
		$('[name=check]').click(function(){
			$('.evtinfo').css('display','none')
		})	;	
		 */
		
		$('[name=check]').click(function(){
			var chk = $(this).is(":checked");
			if(chk) $('.ch input').proc('cheked', true);
			else $('.ch input').prop('checked', false);
		});
		
	
		
		function addEvent(){
			var sdate = $('#evtsdate').val();
			var edate = $('#evtedate').val();
			var selectcode = $('select[name=code]').val();
		
			if(!(sdate && edate && selectcode)){
				alert("필수 입력사항을 확인하세요.");
				return;
			}
			$('#add').submit();
		};
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
  <form method="POST" action="/moa/subpage/addEventProc.moa" name="add"id="add">
  	
  </form>

	<div class="w3-content mxw900 ">
      <hr class="w3-darkgrey ">
      <div class="w3-content mxw900 ">
         <div class="w3-content m3 w3-margin-top w3-margin-bottom inblock">
            <h1 class="w3-col w3-margin-top w3-margin-left mgb20 inblock w3-left ">이벤트</h1>
         	<h6 class="w3-margin-left w3-text-grey"><small>이벤트 관리자 페이지.</small></h6>
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
							  		id="img"class="img-rounded w3-round" alt="Cinque Terre" width="100" height="136"> 
						 </div>
						  <div class="w3-margin-top  w3-text-grey title"id="name"><small>${data.exiname}</small></div>
						  <div class=" w3-margin-top w3-text-grey"id="person"><small>${data.exiperson}</small></div> 
						  <div class="w3-padding"id="price">${data.exiprice}</div>  
						  <div class="  w3-text-grey"id="sdate">${data.sdate}</div>          
						  <div class="  w3-text-grey"id="edate">${data.edate}</div>  
						  <input type="checkbox" name="check" value="check" id="check"class="w3-margin">     
			 		  <hr>
			 		  <div class="w3-margin-right w3-margin-bottom  evtinfo"> 
				 		  <span class="w3-margin-right w3-margin-bottom  mgl30"> 이벤트 기간</span>
					 		  <input type="text" name="evtsdate" id="evtsdate" class="w3-border w3-center w3-round w3-margin-top mgb20 w3-margin-left" placeholder=" YYYY/MM/DD">
					 		  <input type="text" name="evtedate" id="evtedate" class="w3-border w3-center w3-round mgb20 w3-margin-left" placeholder=" YYYY/MM/DD">
					 		  <select name="code" class="w3-margin-bottom mgl20 w3-border w3-round evtcode" style="width:108px;height: 25px;">
					 		  	<option value = "">이벤트적용</option>
					 		  	<option value = "dc" class="ch">50% 할인</option>
					 		  	<option value = "plus" class="ch">1+1</option>
					 		  </select>
					 		  <input type="button" onclick="addEvent()" value="등록" class="w3-blue-grey w3-round w3-card-2 mgl20">
			 		  </div>
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