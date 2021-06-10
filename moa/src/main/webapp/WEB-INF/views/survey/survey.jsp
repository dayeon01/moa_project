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
	$('#hbtn').click(function(){
		$(location).attr('href', '/moa/');
	});
	$('#lbtn').click(function(){
		$(location).attr('href', '/moa/survey/surveyList.moa');
	});
	$('#rbtn').click(function(){
		document.frm.reset();
	});
	$('#sbtn').click(function(){
		var len = ${LEN};
		var el = $('[type="radio"]:checked');
		if(len != el.length){
			alert('*** 선택하지 않은 문항이 있습니다. ***');
			return;
		}
		$('[type="radio"]:checked').attr('type', 'checkbox').attr('name', 'qnolist');
		$('#frm').submit();
	});
});
</script>

<body>
	<form method="post" action="/moa/survey/surveyProc.moa" id="frm" name="frm">
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
											<th scope="col">문제</th>
											<th colspan="4">선택</th>

										</tr>
									</thead>
									<tbody>
								<c:forEach var="data" items="${LIST}" varStatus="idx">
										<tr class="text-center tlist" id="b${data.sino}">
											<th scope="row">${idx.count}</th>
											<td>${data.body}</td>
											<td>

<c:forEach var="sub" items="${data.list}">
		<div class="form-check form-check-inline">
		  <input class="form-check-input" type="radio" name="${data.qno}" value="${sub.qno}">
		  <label class="form-check-label" for="id${sub.qno}">${sub.ex}</label>
		</div>				
</c:forEach>	
											</td>
											
										</tr>
								</c:forEach>
									</tbody>
								</table>
								<br>
			<div class="w3-col w3-margin-top w3-margin-bottom w3-card-4">
				<div class="w3-quarter w3-button w3-green" id="hbtn">home</div>
				<div class="w3-quarter w3-button w3-blue" id="lbtn">설문조사</div>
				<div class="w3-quarter w3-button w3-purple" id="rbtn">reset</div>
				<div class="w3-quarter w3-button w3-orange" id="sbtn">제출</div>
			</div>
		
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