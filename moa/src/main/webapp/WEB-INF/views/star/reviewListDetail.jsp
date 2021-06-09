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

<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

#myImg {
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}

#myImg:hover {
	opacity: 0.7;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
}

/* Caption of Modal Image */
#caption {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
	text-align: center;
	color: #ccc;
	padding: 10px 0;
	height: 150px;
}

/* Add Animation */
.modal-content, #caption {
	-webkit-animation-name: zoom;
	-webkit-animation-duration: 0.6s;
	animation-name: zoom;
	animation-duration: 0.6s;
}

@
-webkit-keyframes zoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes zoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* The Close Button */
.close {
	position: absolute;
	top: 15px;
	right: 35px;
	color: #f1f1f1;
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}

.close:hover, .close:focus {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px) {
	.modal-content {
		width: 100%;
	}
}
</style>



<script>
	$(document).ready(function() {

		$('#nowPage').val('${nowPage}');
		$('#bno').val('${DATA.bno}');

		$('#wbtn').click(function() {
			
			var t1 = $('#title').val();
			var t2 = $('#body').val();
			var t3 = $('[type="radio"]:checked').val();
			if(!(t1 && t2 && t3)){
				alert('전체 입력하세요');
				return;
			}
			$('#frm').submit();
		});

		$('.btn-sm').click(function() {
			var reno = $(this).attr('id').substring(1);
			$('#reno').val(reno);
			$('#frm2').submit();
		});

	});
</script>

<body>

	<form method="POST" action="/moa/star/reviewDel.moa" id="frm2"
		name="frm2">
		<input type="hidden" name="reno" id="reno"> <input
			type="hidden" name="bno" value='${DATA.bno}'>
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
						<jsp:include page="../a_nav/member/SideBar.jsp">
							<jsp:param name="" value="" />
						</jsp:include>
						<!-- Content Column-->
						<div class="col-lg-9">
							<!-- Post content-->
							<article>
								<!-- Post header-->
								<header class="mb-4">
									<!-- Post title-->
									<h1 class="fw-bolder mb-1">리뷰 상세</h1>
								</header>
								<!-- Preview image figure-->
								<figure class="mb-2">
									<img class="img-fluid rounded imgBox100"
										src="${DATA.dir}${DATA.savename}" alt="...">
								</figure>
								<h6 class="fw-bolder mb-3 mt-2">작가: ${DATA.title}</h6>
								<h6 class="fw-bolder mb-3 mt-2">전시명: ${DATA.body}</h6>
								<h6 class="fw-bolder mb-3 mt-2">기간: ${DATA.wdate} ~
									${DATA.redate}</h6>
								<!-- Post content-->
								<section class="mb-5">
									<h2 class="fw-bolder mb-4 mt-5">리뷰 남기기</h2>
									<h4>평점 ${RESULT.star/20} (5.0점 만점) / 리뷰개수 ${RESULT.total}</h4>
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											style="width: ${RESULT.star}%;"
											aria-valuenow="${RESULT.star}" aria-valuemin="0"
											aria-valuemax="100">${RESULT.star/20}</div>
									</div>
								</section>
							</article>
							<!-- Comments section-->
							<section>
								<div class="card bg-light">
									<div class="card-body">
										<!-- Comment form-->
									<c:if test="${DATA.cnt ne 1}">
										<form method="POST" action="/moa/star/reviewWriteProc.moa"
											id="frm" name="frm" encType="multipart/form-data">
											<input type="hidden" name="nowPage" id="nowPage"> <input
												type="hidden" name="bno" id="bno"> <input
												class="form-control mb-2" id="title" name="title"
												type="text" placeholder="제목을 입력하세요"
												data-sb-validations="required" data-sb-can-submit="no">
											<textarea class="form-control mb-2" rows="3" id="body"
												name="body" placeholder="내용을 입력하세요"></textarea>

											<div>
												<h6>평점</h6>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="star"
														id="inlineRadio1" value="1"> <label
														class="form-check-label" for="inlineRadio1">1점:
														불만족</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="star"
														id="inlineRadio2" value="2"> <label
														class="form-check-label" for="inlineRadio2">2점: 별로</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="star"
														id="inlineRadio3" value="3"> <label
														class="form-check-label" for="inlineRadio3">3점: 보통</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="star"
														id="inlineRadio4" value="4"> <label
														class="form-check-label" for="inlineRadio3">4점:
														괜찮음</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="star"
														id="inlineRadio5" value="5"> <label
														class="form-check-label" for="inlineRadio3">5점:
														최고추천</label>
												</div>
											</div>

											<div class="mb-2 mt-2">
												<input type="file" name="file" /> <input type="file"
													name="file" />
											</div>

											
										</form>
										<button class="btn btn-primary mb-2 mt-2" id="wbtn">저장</button>
								</c:if>		
										<!-- Single comment-->
										<c:forEach var="list" items="${DATA.list}" varStatus="idx">
											<div class="d-flex mb-2 mt-2" id=b${list.bno}
												style="padding-left: 20px">
												<div class="flex-shrink-0">${list.id}</div>
												<div class="ms-3">
													<div class="fw-bold">${list.title}
														/ <small>${list.wdate}</small>
													</div>
													${list.body}
												</div>

												<c:forEach var="flist" items="${list.flist}"
													varStatus="idx2">
													<div class="w3-col w3-margin-left imgBox100"
														id="imgbox${flist.fno}">
														<img id=img${flist.fno}
															"  src="/moa/img/upload/${flist.savename}" alt="Snow"
															style="width: 100%; max-width: 300px">
													</div>

												</c:forEach>

												<c:if test="${SID eq list.id}">
													<div class="w3-margin-left">
														<input type="button" class="btn btn-primary btn-sm mb-2"
															id="d${list.bno}" value="삭제">
													</div>
												</c:if>
											</div>

										</c:forEach>
									</div>
								</div>
							</section>

						</div>
					</div>

				</div>
			</div>
		</div>
	</section>


	<!-- The Modal -->
	<div id="myModal" class="modal">
		<span class="close">&times;</span> <img class="modal-content"
			id="img01">
		<div id="caption"></div>
	</div>


	<script>
		$(function() {
			$('.imgBox100 > img').click(function() {
				var tsrc = $(this).attr('src');
				var modal = document.getElementById("myModal");
				modal.style.display = "block";
				var modalImg = document.getElementById("img01");
				modalImg.src = tsrc;
				var captionText = document.getElementById("caption");
				captionText.innerHTML = $(this).alt;

				var span = document.getElementsByClassName("close")[0];

				// When the user clicks on <span> (x), close the modal
				span.onclick = function() {
					modal.style.display = "none";
				}
			});
		});
	</script>


	<!-- Footer-->
	<footer class="py-5 bg-blight">
		<jsp:include page="../a_nav/footer.jsp">
			<jsp:param name="" value="" />
		</jsp:include>
	</footer>

</body>
</html>