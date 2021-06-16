<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <jsp:include page="../a_nav/head.jsp">
      <jsp:param name="" value="" />
   </jsp:include>

<style type="text/css">
select{
   border-style: none;
   
}
.mxw1100{
	max-width: 1100px;
}
</style>
</head>   
<script type="text/javascript">
   $(document).ready(function(){
      $('.seb').css('cursor','pointer');
      
      $('.title').mouseover(function(){
         $(this).css('text-decoration','underline');
         $(this).css('cursor','pointer');
      
      $('.title').mouseout(function(){
         $(this).css('text-decoration','none');
         });
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
      
      $('.body').css('display','none');
      $('.blist').click(function(){
    	  var result = $(this).hasClass('N');
    	  $(this).children().last().stop().slideToggle(500);
      });
      
      $('#board').change(function(){
    	 var result = $(this).val();
    	 if(result == 'faq'){
    		 $('.N').css('display', 'none');
    		 $('.F').css('display', 'block');
    		 
    	 } else if(result == 'NF'){
    		 $('.F, .N').css('display', 'block');
    		 
    	 }else {
    		 $('.F').css('display', 'none');
    		 $('.N').css('display', 'block');
    	 }
      });
   });
</script>
<body>
<!-- Navigator -->
   <jsp:include page="../a_nav/nav.jsp">
      <jsp:param name="" value="" />
   </jsp:include>
  <form method="POST" action="/moa/board/allboardlist.moa" id="frm" name="frm">
  		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
  		<input type="hidden" name="bno" id="bno">
  </form> 
  
   <div class="w3-content  mxw1100  ">
   <hr class="w3-topbar w3-border-dark-grey ">
   
      <!-- div class="w3-content mxw1100 ">
         <div class="w3-col  w3-margin-top mgb20 pdb20 w3-panel w3-border-grey w3-topbar w3-bottombar inblock">
            <h1 class="w3-col mgt30 w3-margin-left mgb20 inblock w3-left">전시정보</h1>
         	<h6 class="w3-col w3-margin-left mgt30 mgb20 w3-text-grey"><small>전시 상세보기 페이지 입니다.</small></h6>
         </div>
      </div> -->
      <div class="w3-content   mxw1100 ">
         <div class="w3-content m3 w3-margin-top w3-margin-bottom inblock">
            <h1 class="w3-col w3-margin-top w3-margin-left mgb60 inblock w3-left ">고객센터</h1>
               <select class="w3-margin-left w3-border w3-border-light-grey w3-round seb" name="board" id="board">
                   <option value="NF">분류</option>
                   <option value="notice">공지사항</option>
                   <option value="faq">FAQ</option>
               </select>
         </div>
      </div>
  
      <div class="w3-content w3-left"></div>
      <div class="w3-col w3-center w3-border w3-margin-bottom w3-padding">
            <span class="w3-col m2 "> 글번호 </span>         
            <span class="w3-col m1 "> 분류</span>         
            <span class="w3-col m6 "> 제목 </span>         
            <span class="w3-col m3"> 작성일</span>         
      </div>
 <c:forEach var="data" items="${LIST}">     
      <div class="w3-col w3-center w3-border-bottom w3-padding blist ${data.code}" id="${data.nno}">
            <span class="w3-col m2"> ${data.nno } </span>         
            <span class="w3-col m1">
            	<c:if test="${data.code eq 'N'}">
            		공지사항
            	</c:if>
            	<c:if test="${data.code eq 'F'}">
            		FAQ
            	</c:if>
            </span>         
            <span class="w3-col m6 title" > ${data.ntitle} </span> 
            <span class="w3-col m3"> ${data.sdate }</span>         
            <span class="w3-col mgt20 w3-border w3-border-light-grey body" > ${data.nbody }</span>       
      </div>
 </c:forEach>    

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
   </div>
   
 
</body>
</html>