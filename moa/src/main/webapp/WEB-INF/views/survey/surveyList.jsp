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
	$('.tlist').click(function(){
		var sino = $(this).attr('id').substring(1);
		var title = $(this).children().eq(1).html();
		$('#sino').val(sino);
		$('#title').val(title);
		$('#frm').submit();
	});

});
</script>

<body>
<form method="post" id="frm" name="frm" action="/moa/survey/survey.moa">
	<input type="hidden" id="sino" name="sino" />
	<input type="hidden" id="title" name="title" />
</form>
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
							<h3>설문조사 리스트</h3>
							<br>
						
								<table class="table table-hover">
									<thead>
										<tr class="text-center">
											<th scope="col">#</th>
											<th scope="col">설문명</th>
											<th scope="col">시작일</th>
											<th scope="col">종료일</th>
											
										
										</tr>
									</thead>
									<tbody>
									
									<c:forEach var="list" items="${LIST}" varStatus="idx">
										<tr class="text-center tlist" id="b${list.sino}">
											<th scope="row">${idx.count}</th>
											<td>${list.title}</td>
											<td>${list.sdate}</td>
											<td>${list.edate}</td>
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

	<!-- Footer-->
	<footer class="py-5 bg-blight">
		<jsp:include page="../a_nav/footer.jsp">
			<jsp:param name="" value="" />
		</jsp:include>
	</footer>

</body>
</html>