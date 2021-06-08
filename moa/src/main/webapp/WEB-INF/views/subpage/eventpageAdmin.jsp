<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../a_nav/head.jsp">
      <jsp:param name="" value="" />
   </jsp:include>
<style type="text/css">
.hr2{
	border: 0;
}
.won{
	text-decoration: line-through;
}
.exlist:hover {
	border: 1px solid navy;
}
</style>
</head>   
<script type="text/javascript">
	$(document).ready(function(){
		$('.addEvent').click(function(){
			location.href='/moa/subpage/addEvent.moa';
		});

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
         	<h6 class="w3-margin-left w3-text-red "><small>이벤트 관리자 페이지.</small></h6>
         </div>
         
         <div class="w3-col w3-right w3-border-bottom">
         	<div class="w3-text-right w3-right w3-button w3-border mgb20 w3-padding w3-dark-grey w3-round-large addEvent" >이벤트 등록</div>
         </div>
        
      </div>
      <div class="w3-content w3-margin w3-center">
      
 <c:forEach var="data" items="${LIST}">    
      <div class="w3-content inblock  w3-round w3-margin-top w3-padding w3-text-left exlist">
			 <div class="w3-margin-right  line">
			  <img src="${data.idir}${data.imgname}" 
			  		class="img-rounded w3-round" alt="Cinque Terre" width="100" height="136"> 
			  <h6 class="w3-margin-top w3-margin-left w3-text-grey title">${data.exiname}</h6>
			  <p class=" w3-margin-top w3-margin-left">${data.exiperson}</p> 
		 <c:if test="${data.evtcode == 'D' }">	  
			  <p class=" w3-margin-left inblock won">${data.exiprice}</p>  
			  <p class=" w3-margin-left inblock">${data.reprice}</p>    
		</c:if>	          
		 <c:if test="${data.evtcode == 'P' }">	  
			  <p class=" w3-margin-left inblock ">${data.exiprice}</p>  
			  <p class=" w3-margin-left inblock ">티켓 ${data.evtcontent}</p>  
		</c:if>	         
			  <p class=" w3-margin-left w3-text-grey">${data.edate}</p>            
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