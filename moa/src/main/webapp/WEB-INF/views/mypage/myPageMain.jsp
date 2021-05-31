<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<link rel="stylesheet" type="text/css" href="/moa/css/user2.css">

<head>
<jsp:include page="../a_nav/head.jsp">
	<jsp:param name="" value="" />
</jsp:include>
</head>

<body>
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
					<!-- Sidebar Column-->
					<div class="row ">

						<jsp:include page="../mypage/SideBar.jsp">
							<jsp:param name="" value="" />
						</jsp:include>


						<!-- Content Column-->

						<fieldset disabled="" style="margin-left: 500px; width: 200px;">
							<label class="form-label" for="disabledInput">회원님의 잔여 포인트</label>
							<input class="form-control" id="disabledInput" type="text"
								placeholder="10,000 P" disabled="">
						</fieldset>



						<div class="col-lg-4 col-sm-6 mb-4 por"
							style="margin-left: 300px;">
							<div class="card h-100">
								<a href="#!"><img class="card-img-top"
									src="https://via.placeholder.com/700x400" alt="..."></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#!">최근 본 전시</a>
									</h4>
								</div>
							</div>
						</div>


						<div class="col-lg-4 col-sm-6 mb-4 por" style="margin-left: 30px;">
							<div class="card h-100">
								<a href="#!"><img class="card-img-top"
									src="https://via.placeholder.com/700x400" alt="..."></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#!">최근 본 이벤트</a>
									</h4>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-sm-6 mb-4 por"
							style="margin-left: 300px;">
							<div class="card h-100">
								<a href="#!"><img class="card-img-top"
									src="https://via.placeholder.com/700x400" alt="..."></a>
								<div class="card-body">
									<h4 class="card-title">
										<a href="#!">찜목록</a>
									</h4>
									<button type="button" class="btn btn-outline-secondary">더보기</button>
								</div>
							</div>
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