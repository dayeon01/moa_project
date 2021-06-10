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
</script>

<body>
	<form method="post" action="/moa/survey/surveyProc.moa" id="frm"
		name="frm">
		<!-- Navigator -->
		<jsp:include page="../a_nav/nav.jsp">
			<jsp:param name="active" value="마이페이지" />
		</jsp:include>

		<!-- Page Content-->
		<section class="py-5">
			<div class="container">
				<div class="row">
					<div class="col-lg-612 mb-4">
						<!-- Page Heading/Breadcrumbs-->
						<h1>My Page</h1>
						<ol class="breadcrumb mb-4">

						</ol>
						<!-- Content Row-->
						<div class="row">
							<jsp:include page="../a_nav/member/SideBar.jsp">
								<jsp:param name="" value="" />
							</jsp:include>
							<!-- Content Column-->
							<div class="col-lg-9 mb-6">
								<h3>${TITLE}</h3>
								<br>

								<table class="table table-hover">
									<thead>
										<tr class="text-center">
											<th scope="col">#</th>
											<th scope="col">설문명</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="data" items="${LIST}" varStatus="idx">
											<tr class="text-center tlist" id="b${data.sino}">
												<th scope="row">${idx.count}</th>
												<td>${data.body}</td>
											</tr>
											<c:forEach var="sub" items="${data.list}">
												<tr class="text-center tlist"  id="b${data.sino}">
													<th scope="row" style="border:none;">(${sub.exno}). ${sub.ex}</th>
													<td colspan="2" style="border:none;">
														<div class="progress">
															<div class="progress-bar" role="progressbar"
																style="width: ${sub.per}%;" aria-valuenow="${sub.per}"
																aria-valuemin="0" aria-valuemax="100">${sub.per}%</div>
														</div>
													</td>
												</tr>
											</c:forEach>
											<tr>
												<td colspan="2"></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<br>
							</div>
						</div>
					</div>
				</div>
			</div>

		</section>
	</form>
	<!-- Footer-->
	<footer class="py-5 bg-blight">
		<jsp:include page="../a_nav/footer.jsp">
			<jsp:param name="" value="" />
		</jsp:include>
	</footer>

</body>
</html>