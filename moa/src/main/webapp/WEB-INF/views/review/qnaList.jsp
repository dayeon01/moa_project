<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</head>

<script>
$(document).ready(function() {
	
	$('#nowPage').val('${PAGE.nowPage}');
	
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
				break;
		}
		$('#frm').attr('action', '/moa/review/qnaList.moa');
		$('#frm').submit();
	});
	
	$('.trow').click(function(){					
		var bno = $(this).attr('id');
		bno = bno.substring(1);
		$('#bno').val(bno);
		$('#frm').submit();
	});
	
	$('#wbtn').click(function(){
		var bno = $(this).attr('id');
		bno = bno.substring(1);
		$('#bno').val(bno);
		$('#frm').attr('action', '/moa/review/qnaWrite.moa');
		$('#frm').submit();
	});
});
</script>

<body>

<form method="POST" action="/moa/review/qnaListDetail.moa" id="frm" name="frm">
		<input type="hidden" name="nowPage" id="nowPage">
		<input type="hidden" name="bno" id="bno">
</form>


<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="active" value="마이페이지"/>
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
						<div class="col-lg-8 mb-4">

							<table class="table table-hover">
								<thead>
									<tr>
										<th scope="col">글번호</th>
										<th scope="col">제목</th>
										<th scope="col">상태</th>
										<th scope="col">등록일</th>
									</tr>
								</thead>
								
								<tbody>
<c:forEach var="data" items="${LIST}" varStatus="idx">

										<tr class="trow" id="b${data.bno}">
											<th scope="row">${data.bno}</th>
											<td>${data.title}</td>
											<td>
											${null eq data.reply ? "미답변" : "답변"}
											</td>
											<td>${data.wdate}</td>
										</tr>

</c:forEach>
								</tbody>								
							</table>
							<button class="btn btn-primary" id="wbtn">글작성</button>
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
<footer class="py-5 bg-blight">
    <jsp:include page="../a_nav/footer.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</footer>

</body>
</html>