<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="../a_nav/head.jsp">
	<jsp:param name="" value="" />
</jsp:include>
</head>

<script>
	$(document).ready(function() {
});
	$(document).ready(function() {
		if(${PAGE.startPage} == 1){
			$('#pre').removeClass('page-item');
		}
		if(${PAGE.endPage} == ${PAGE.totalPage}){
			$('#nex').removeClass('page-item');
		}	
		if($('#pnum${PAGE.nowPage}>a').html()== ${PAGE.nowPage}){
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
					break;
			}
			$('#frm').attr('action', '/moa/review/qnaList.moa');
			$('#frm').submit();
		});
		
		$('.trow').click(function(){		
			$('#nowPage').val(${PAGE.nowPage});
			
			var bno = $(this).attr('id');
			bno = bno.substring(1);
			$('#bno').val(bno);
			$('#frm').submit();
		});
	});
</script>

<body>
	<form method="POST" action="/moa/review/qnaListDetail.moa" id="frm"
		name="frm">
		<input type="hidden" name="nowPage" id="nowPage"> <input
			type="hidden" name="bno" id="bno">
	</form>
		<!-- Navigator -->
		<jsp:include page="../a_nav/nav.jsp">
			<jsp:param name="active" value="마이페이지" />
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
						<div class="row">
							<!-- Sidebar Column-->

							<jsp:include page="../mypage/SideBar.jsp">
								<jsp:param name="" value="" />
							</jsp:include>

							<!-- Content Column-->
							<div class="col-lg-9 mb-4">
								<h2 class="w3-margin-bottom"">리뷰 작성 ></h2>
								<div class="row d-flex"">

									<div
										class="col-md-4 d-flex ftco-animate fadeInUp ftco-animated">
										<div class="blog-entry justify-content-end">
											<img src="/moa/img/mypage/image_1.jpg" width="250">
											<div class="text mt-3 float-right d-block">
												<div class="d-flex align-items-center pt-2 mb-4 topp">
													<div class="one mr-3">
														<span class="day">12</span>
													</div>
													<div class="two">
														<span class="yr">2019</span> <span class="mos">March</span>
													</div>
												</div>
												<h4 class="heading">Why Lead Generation is Key for
													Business Growth</h4>
												<p>A small river named Duden flows by their place and
													supplies it with the necessary regelialia.</p>
												<div class="d-flex align-items-center mt-4 meta">
													<p class="mb-0">
														<a class="btn btn-secondary">리뷰 작성<span
															class="ion-ios-arrow-round-forward"></span></a>
													</p>
													<p class="ml-auto mb-0"></p>
												</div>
											</div>
										</div>
									</div>


									<div
										class="col-md-4 d-flex ftco-animate fadeInUp ftco-animated">
										<div class="blog-entry justify-content-end">
											<img src="/moa/img/mypage/image_4.jpg" width="250">
											<div class="text mt-3 float-right d-block">
												<div class="d-flex align-items-center pt-2 mb-4 topp">
													<div class="one mr-3">
														<span class="day">10</span>
													</div>
													<div class="two">
														<span class="yr">2019</span> <span class="mos">March</span>
													</div>
												</div>
												<h4 class="heading">Why Lead Generation is Key for
													Business Growth</h4>
												<p>A small river named Duden flows by their place and
													supplies it with the necessary regelialia.</p>
												<div class="d-flex align-items-center mt-4 meta">
													<p class="mb-0">
														<a href="#" class="btn btn-secondary">리뷰 작성<span
															class="ion-ios-arrow-round-forward"></span></a>
													</p>
													<p class="ml-auto mb-0"></p>
												</div>
											</div>
										</div>
									</div>
									<div
										class="col-md-4 d-flex ftco-animate fadeInUp ftco-animated">
										<div class="blog-entry">
											<img src="/moa/img/mypage/img-6.jpg" width="250">
											<div class="text mt-3 float-right d-block">
												<div class="d-flex align-items-center pt-2 mb-4 topp">
													<div class="one mr-3">
														<span class="day">05</span>
													</div>
													<div class="two">
														<span class="yr">2019</span> <span class="mos">March</span>
													</div>
												</div>
												<h4 class="heading">Why Lead Generation is Key for
													Business Growth</h4>
												<p>A small river named Duden flows by their place and
													supplies it with the necessary regelialia.</p>
												<div class="d-flex align-items-center mt-4 meta">
													<p class="mb-0">
														<a href="#" class="btn btn-secondary">리뷰 작성<span
															class="ion-ios-arrow-round-forward"></span></a>
													</p>
													<p class="ml-auto mb-0"></p>
												</div>
											</div>
										</div>
									</div>

									<div
										class="col-md-4 d-flex ftco-animate fadeInUp ftco-animated">
										<div class="blog-entry justify-content-end">
											<img src="/moa/img/mypage/img-6.jpg" width="250">
											<div class="text mt-3 float-right d-block">
												<div class="d-flex align-items-center pt-2 mb-4 topp">
													<div class="one mr-3">
														<span class="day">12</span>
													</div>
													<div class="two">
														<span class="yr">2019</span> <span class="mos">March</span>
													</div>
												</div>
												<h4 class="heading">Why Lead Generation is Key for
													Business Growth</h4>
												<p>A small river named Duden flows by their place and
													supplies it with the necessary regelialia.</p>
												<div class="d-flex align-items-center mt-4 meta">
													<p class="mb-0">
														<a href="#" class="btn btn-secondary">리뷰 작성<span
															class="ion-ios-arrow-round-forward"></span></a>
													</p>
													<p class="ml-auto mb-0"></p>
												</div>
											</div>
										</div>
									</div>
									<div
										class="col-md-4 d-flex ftco-animate fadeInUp ftco-animated">
										<div class="blog-entry justify-content-end">
											<img src="/moa/img/mypage/image_5.jpg" width="250">
											<div class="text mt-3 float-right d-block">
												<div class="d-flex align-items-center pt-2 mb-4 topp">
													<div class="one mr-3">
														<span class="day">10</span>
													</div>
													<div class="two">
														<span class="yr">2019</span> <span class="mos">March</span>
													</div>
												</div>
												<h4 class="heading">Why Lead Generation is Key for
													Business Growth</h4>
												<p>A small river named Duden flows by their place and
													supplies it with the necessary regelialia.</p>
												<div class="d-flex align-items-center mt-4 meta">
													<p class="mb-0">
														<a href="#" class="btn btn-secondary">리뷰 작성<span
															class="ion-ios-arrow-round-forward"></span></a>
													</p>
													<p class="ml-auto mb-0"></p>
												</div>
											</div>
										</div>
									</div>
									<div
										class="col-md-4 d-flex ftco-animate fadeInUp ftco-animated">
										<div class="blog-entry">
											<img src="/moa/img/mypage/image_6.jpg" width="250">
											<div class="text mt-3 float-right d-block">
												<div class="d-flex align-items-center pt-2 mb-4 topp">
													<div class="one mr-3">
														<span class="day">05</span>
													</div>
													<div class="two">
														<span class="yr">2019</span> <span class="mos">March</span>
													</div>
												</div>
												<h4 class="heading">Why Lead Generation is Key for
													Business Growth</h4>
												<p>A small river named Duden flows by their place and
													supplies it with the necessary regelialia.</p>
												<div class="d-flex align-items-center mt-4 meta">
													<p class="mb-0">
														<a href="#" class="btn btn-secondary">리뷰 작성<span
															class="ion-ios-arrow-round-forward"></span></a>
													</p>
													<p class="ml-auto mb-0"></p>
												</div>
											</div>
										</div>
									</div>
								</div>
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Footer-->
		<footer class="py-5 bg-dark">
			<jsp:include page="../a_nav/footer.jsp">
				<jsp:param name="" value="" />
			</jsp:include>
		</footer>
</body>
</html>