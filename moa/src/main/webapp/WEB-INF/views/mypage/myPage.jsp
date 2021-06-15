<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

	<!-- head -->
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
	</jsp:include>

<style type="text/css">
 .bx{
	cursor: pointer;
} 
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.img').click(function(){
			var num = $(this).attr('id').substring(1);
			$('#exino').val(num);
			$('#frm').submit();
		});
	});
</script>
<body>

<form method="POST" action="/moa/exhibit/exhDetail.moa" id="frm">
	<input type="hidden" name="exino" id="exino" value="0">
</form>
<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="" value=""/>
	</jsp:include>

	<!-- Page Content-->
	<section class="py-5">
		<div class="container">

			<div class="row">
				<div class="col-lg-12 mb-4">
					<!-- Page Heading/Breadcrumbs-->
					<h1>My Page</h1>
					<ol class="breadcrumb mb-4">

					</ol>
					<!-- Content Row-->
					<div class="row ">
						
						<!-- Sidebar-->
						<jsp:include page="../a_nav/member/SideBar.jsp">
							<jsp:param name="" value="" />
						</jsp:include>


						<!-- Content Column-->
						<div class="col-lg-8">
                         <div class="row gx-5 row-cols-1 row-cols-md-2">
                         
  <c:forEach var="data" items="${LIST}">                
                        	 <div class="col-lg-4 mb-5 bx">
                          	  	<div class="card h-100 shadow border-0">
                               		 <img class="card-img-top" src="${data.idir}${data.imgname}" alt="...">
                               		 <div class="card-body p-4">
	                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">구매완료</div>
	                                    <a class="text-decoration-none link-dark stretched-link img" id="i${data.exino}" ><h5 class="card-title mb-3">"${data.exiname } "</h5></a>
	                                    <p class="card-text mb-0">- 구매 일시 : ${data.paydate }</p>
	                                    <p class="card-text mb-0">- 티켓 가격 : ${data.exiprice }원</p>
	                                    <p class="card-text mb-0">- 티켓 구매 수량 : ${data.ticket }장</p>
	                                    <p class="card-text mb-0">- 총 결제 금액 : ${data.total }원</p>
                             		   </div>
                            	</div>
                       		 </div>
   </c:forEach>                             
                            </div>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer-->
    <jsp:include page="../a_nav/footer.jsp">
		<jsp:param name="" value="" />
	</jsp:include>

</body>
</html>