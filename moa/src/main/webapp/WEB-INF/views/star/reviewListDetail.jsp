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
body {font-family: Arial, Helvetica, sans-serif;}

#myImg {
  border-radius: 5px;
  cursor: pointer;
  transition: 0.3s;
}

#myImg:hover {opacity: 0.7;}

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
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.9); /* Black w/ opacity */
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

@-webkit-keyframes zoom {
  from {-webkit-transform:scale(0)} 
  to {-webkit-transform:scale(1)}
}

@keyframes zoom {
  from {transform:scale(0)} 
  to {transform:scale(1)}
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

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
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
			$('#frm').submit();
		});
		
		
	});
</script>

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
									<img class="img-fluid rounded"
										src="${DATA.dir}${DATA.savename}" alt="...">
								</figure>
								<h6 class="fw-bolder mb-3 mt-2">작가: ${DATA.title}</h6>
								<h6 class="fw-bolder mb-3 mt-2">전시명: ${DATA.body}</h6>
								<h6 class="fw-bolder mb-3 mt-2">기간: ${DATA.wdate} ~
									${DATA.redate}</h6>
								<!-- Post content-->
								<section class="mb-5">
									<h2 class="fw-bolder mb-4 mt-5">리뷰 남기기</h2>
								</section>
							</article>
							<!-- Comments section-->
							<section>
								<div class="card bg-light">
									<div class="card-body">
										<!-- Comment form-->										
										<form method="POST" action="/moa/star/reviewWriteProc.moa" id="frm" name="frm" encType="multipart/form-data">
											<input type="hidden" name="nowPage" id="nowPage"> 
											<input type="hidden" name="bno" id="bno"> 
											<input class="form-control mb-2" id="title" name="title"
												type="text" placeholder="제목을 입력하세요"
												data-sb-validations="required" data-sb-can-submit="no">
											<textarea class="form-control mb-2" rows="3" id="body"
												name="body" placeholder="내용을 입력하세요"></textarea>
											<input type="file" name="file" />
										    <input type="file" name="file" />

											<button class="btn btn-primary mb-2" id="wbtn">저장</button>
										</form>
										<!-- Single comment-->
										<c:forEach var="list" items="${DATA.list}" varStatus="idx">
											<div class="d-flex mb-2 mt-2" id=b${list.bno} id=b${list.bno}
												style="padding-left: 20px">
												<div class="flex-shrink-0">${list.id}</div>
												<div class="ms-3">
													<div class="fw-bold">${list.title}
														/ <small>작성일: ${list.wdate}</small>
													</div>
													${list.body}
												</div>
										<c:forEach var="flist" items="${list.flist}" varStatus="idx2">
												<div class="w3-col imgBox100" id="img${flist.fno}">
												<img id="myImg${idx2.count}" class="w3-col img100"
														src="/moa/img/upload/${flist.savename}" alt="Snow">
												</div>
												</c:forEach>											
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
  <span class="close">&times;</span>
  <img class="modal-content" id="img01">
  <div id="caption"></div>
</div>

<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img1 = document.getElementById("myImg1");
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img1.onclick = function(){
  modal.style.display = "block";
  modalImg.src = this.src;
  captionText.innerHTML = this.alt;
}

var img2 = document.getElementById("myImg2");
img2.onclick = function(){
  modal.style.display = "block";
  modalImg.src = this.src;
  captionText.innerHTML = this.alt;
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() { 
  modal.style.display = "none";
}
</script>


	<!-- Footer-->
	<footer class="py-5 bg-blight">
		<jsp:include page="../a_nav/footer.jsp">
			<jsp:param name="" value="" />
		</jsp:include>
	</footer>

</body>
</html>