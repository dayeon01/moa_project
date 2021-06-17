<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</head>

<script type="text/javascript">
	$(document).ready(function(){
	/* 	$('#nowPage').val('${PAGE.nowPage}');
		
		if('${PAGE.startPage}' == 1){
			$('#pre').removeClass('page-item');
		}
		if('${PAGE.endPage}' == '${PAGE.totalPage}'){
			$('#nex').removeClass('page-item');
		}	
		if($('#pnum${PAGE.nowPage}>a').html()== '${PAGE.nowPage}'){
			$('#pnum${PAGE.nowPage}>a').addClass('w3-blue');
		}
		
		$('.page-item').click(function(){
			var sid = $(this).attr('id');
			
			switch(sid){
			case 'pre':
					$('#nowPage').val('${PAGE.startPage - 1}');
				break;
			case 'nex':
					$('#nowPage').val('${PAGE.endPage + 1}');
				break;
			default:
				tmp=$(this).children().html();
					$('#nowPage').val(tmp);
			}
		 	$('#frm').attr('action', '/moa/subpage/searchpage.moa'); 
			$('#frm').submit();
		}); */
		
		 $('.s-btn').click(function(){
			$('#sResult').css('display','block');
			var tmp = $('input[type="radio"]:checked').val();
			var tmp2 = $('.city').val();
			var tmp3 = $('.smonth').val();
			var tmp4 = $('.emonth').val();
			// alert(tmp + ' ' +tmp2 + ' ' +tmp3 + ' ' +tmp4);
			
			$('#selClass').val(tmp);
			$('#selCity').val(tmp2);
			$('#sMonth').val(tmp3);
			$('#eMont').val(tmp4);
			
			//$('#frm').attr('action', '/moa/subpage/searchpage.moa');
			$('#frm').submit();
		});
	});
</script>

<body>
<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
	
	
<!-- 데이터 전송 -->	

<section class="py-5">
	<div class="container">
<form method="POST" action="/moa/subpage/searchpage.moa" id="frm" name="frm">


<%--  	
	<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
	<input type="hidden" name="selClass" id="selClass">
	<input type="hidden" name="selCity" id="selCity">
	<input type="hidden" name="sMonth" id="sMonth">
	<input type="hidden" name="eMonth" id="eMonth">
--%>

<!-- 검색창 -->
        <h1 class="w3-padding w3-topbar">
            상세 검색
        </h1>
        <button type="submit" class="btn w3-blue-grey s-btn w3-right w3-circle">검색하기</button>
        <div class="w3-card-4 w3-round-xxlarge mgt60 w3-padding mgb60 pdAll20" style="height:200px;">

		<div class="w3-col ">
		<div class="w3-col m4 mgt20">
			<label for="exampleSelect1" class="form-label"><strong>지역</strong></label>
		    <select class="w3-border w3-round-xxlarge city w3-light-grey mgl20"  style="width:150px;height:30px;"id="exampleSelect2" name="selCity">
<c:forEach var="data" items="${CITY}">
		        <option value="${data.explono}">${data.excity}</option>
</c:forEach>
		    </select>
		</div>
		
		<div class="w3-col m4 mgt20">
				<label for="exampleSelect1" class=""><strong>시작</strong> </label>
			      <select class="w3-border w3-round-xxlarge smonth w3-light-grey mgl20 " style="width:150px;height:30px;" id="exampleSelect3" name="sMonth">
			        <option value="1">1월</option>
			        <option value="2">2월</option>
			        <option value="3">3월</option>
			        <option value="4">4월</option>
			        <option value="5">5월</option>
			        <option value="6">6월</option>
			        <option value="7">7월</option>
			        <option value="8">8월</option>
			        <option value="9">9월</option>
			        <option value="10">10월</option>
			        <option value="11">11월</option>
			        <option value="12">12월</option>
			      </select>
		</div>	
 		<div class="w3-col m4 mgt20">
				<label for="exampleSelect1" class="form-label"><strong>종료</strong> </label>
			      <select class="w3-border w3-round-xxlarge emonth w3-light-grey mgl20" style="width:150px;height:30px;"id="exampleSelect4" name="eMonth">
			        <option value="1">1월</option>
			        <option value="2">2월</option>
			        <option value="3">3월</option>
			        <option value="4">4월</option>
			        <option value="5">5월</option>
			        <option value="6">6월</option>
			        <option value="7">7월</option>
			        <option value="8">8월</option>
			        <option value="9">9월</option>
			        <option value="10">10월</option>
			        <option value="11">11월</option>
			        <option value="12">12월</option>
			      </select>
		</div> 
	</div>	
 <c:forEach var="data" items="${LIST}">
        <div class="w3-col mgl20 mgt20">
			<input class="form-check-input" type="radio" name="selClass" value="${data.ecno}">

			<label class="form-check-label">
			  ${data.ecnaming}전
			</label>
		</div>
</c:forEach> 
        </div>
		
</form>
		

    
        <!-- 검색결과 -->
      
        <div id="sResult">
        <div class="row  pdAll20">
<c:forEach var="data" items="${RST}">
            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
                <div class="card h-100">
                    <a href="#!"><img class="card-img-top" src="${data.idir}${data.imgname}" alt="..." /></a>
                    <div class="card-body">
                        <h4 class="card-title"><a href="#!">${data.exiname}</a></h4>
                        <p class="card-text">작가: ${data.exiperson}</p>
                        <p class="card-text">시작날짜: ${data.startdate}</p>
                        <p class="card-text">종료날짜: ${data.enddate}</p>
                    </div>
                </div>
            </div>
</c:forEach>
       
        
	       <%--  <!-- 페이징 처리 -->
	        <div class="user-paging">
			<ul class="pagination justify-content-center">
					<li class="page-item" id="pre"><a class="page-link"
						href="#" aria-label="Previous"> <span aria-hidden="true">«</span>
							<span class="sr-only">Previous</span>
					</a></li>
					<c:forEach var="page" begin="${PAGE.startPage}"
						end="${PAGE.endPage}">
						<li class="page-item" id="pnum${page}"><a
							class="page-link" href="#">${page}</a></li>
					</c:forEach>
					<li class="page-item" id="nex"><a class="page-link"
						href="#" aria-label="Next"> <span aria-hidden="true">»</span>
							<span class="sr-only">Next</span>
					</a></li>
				</ul>
			</div>  --%>
			
        </div>
        </div>
    </div>
</section>



</body>
</html>