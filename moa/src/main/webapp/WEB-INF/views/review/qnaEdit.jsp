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
$(document).ready(function(){
	$('#nowPage').val('${nowPage}');
	
	$('#lbtn').click(function(){
		$('#frm2').attr('action', '/moa/review/qnaList.moa');
		$('#frm2').submit();
	});
	
	$('#sbtn').click(function(){
		
		if(!$('#title1').val()){
			alert('제목을 입력하세요');
			return;
		}
		if(!$('#body1').val()){
			alert('내용을 작성하세요');
			return;
		}
		
		$('#bno').val(${DATA.bno});
		$('#title').val($('#title1').val());
		$('#body').val($('#body1').val());
		$('#frm2').submit();	
	});
});
</script>

<body>
<form method="post" action="/moa/review/qnaEditProc.moa" id="frm2" name="frm2">
	<input type="hidden" id="bno" name="bno">
	<input type="hidden" id="title" name="title">
	<input type="hidden" id="body" name="body">
	<input type="hidden" id="nowPage" name="nowPage">
</form>

<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="active" value="마이페이지"/>
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
						<div class="col-lg-6 mb-4">
							<h3>1:1 문의글 수정</h3>
							<br>
							<form method="post" id="frm1" name="frm1"
								action="/moa/review/qnaEditProc.moa">
								<label for="title">제목 : </label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="title1" name="title1"
										value="${DATA.title}">
								</div>
								<p class="help-block" id="titlemsg"></p>

								<div class="controls">
									<label for="body">내용:</label>
									<textarea class="form-control" id="body1" name="body1" rows="10"
										cols="100" required=""
										data-validation-required-message="Please enter your message"
										maxlength="999" style="resize: none">${DATA.body}</textarea>
									<div class="help-block"></div>
								</div>
								<br>
							</form>
							<button class="btn btn-primary" id="lbtn">리스트 보기</button>
							<button class="btn btn-primary" id="sbtn">저장</button>
						

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