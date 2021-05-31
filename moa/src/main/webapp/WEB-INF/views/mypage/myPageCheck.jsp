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
							<h3>구매 확인/취소 ></h3>
							<table class="table table-hover w3-center" border="1"
								summary="게시판 목록">
								<thead class="w3-text-center">
									<tr>
										<th class="w3-center">날 짜</th>
										<th class="w3-center" style="padding-left: 10px;">전 시 명</th>
										<th class="w3-center">금 액</th>
										<th class="w3-center">매 수</th>
										<th class="w3-center"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td align="center">2021.05.05</td>
										<td align="center">공명 : 자연이 주는 울림</td>
										<td align="center">18,000 원</td>
										<td align="center">2 매</td>
										<td align="center"><sapn
												class=" w3-left w3-button w3-small w3-light-blue">구매취소</sapn></td>
									</tr>
									<tr>
										<td align="center">2021.05.03</td>
										<td align="center">볼로냐 일러스트 원화전</td>
										<td align="center">34,000 원</td>
										<td align="center">3 매</td>
										<td align="center"><sapn
												class=" w3-left w3-button w3-small w3-light-blue">구매취소</sapn></td>
									</tr>
									<tr>
										<td align="center">2021.05.10</td>
										<td align="center">공명 : 자연이 주는 울림</td>
										<td align="center">18,000 원</td>
										<td align="center">2 매</td>
										<td align="center"><sapn
												class=" w3-left w3-button w3-small w3-light-blue">구매취소</sapn></td>
									</tr>
								</tbody>
							</table>
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