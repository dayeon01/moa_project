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

	$('#sbtn').click(function(){
		
		if(!$('#title').val()){
			alert('제목을 입력하세요');
			return;
		}
		if(!$('#body').val()){
			alert('내용을 작성하세요');
			return;
		}
		$('#frm').submit();	
	});
});
</script>

<body>
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
							<h3>1:1 문의글 작성</h3>
							<br>
							<form method="post" id="frm" name="frm"
								action="/moa/review/qnaWriteProc.moa">
							
								<label for="title">제목 : </label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="title" name="title"
										>
								</div>
								<p class="help-block" id="titlemsg"></p>

								<div class="controls">
									<label for="body">내용:</label>
									<textarea class="form-control" id="body" name="body" rows="10"
										cols="100" required=""
										data-validation-required-message="Please enter your message"
										maxlength="999" style="resize: none"></textarea>
									<div class="help-block"></div>
								</div>
								<br>
							</form>
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