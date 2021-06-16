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
	
	$('#nowPage').val('${nowPage}');
	$('#bno').val('${DATA.bno}');
	
	$('#lbtn').click(function(){
		$('#frm').attr('action', '/moa/review/qnaList.moa');
		$('#frm').submit();
	});
	
	$('#wbtn').click(function(){
		$('#frm').attr('action', '/moa/review/qnaWrite.moa');
		$('#frm').submit();
	});
	
	$('#ebtn').click(function(){
		if('${DATA.reply}'){
			alert('답변이 완료된 게시글은 수정하실 수 없습니다.');
			return;
		}
		$('#frm').attr('action', '/moa/review/qnaEdit.moa');
		$('#frm').submit();
	});
	
	$('#dbtn').click(function(){
		if('${DATA1.body}'){
			alert('답변이 완료된 게시글은 수정하실 수 없습니다.');
			return;
		}
		
		var result = confirm('정말로 삭제 하시겠습니까?');
		if(result){
			$('#frm').attr('action', '/moa/review/qnaDel.moa');
			$('#frm').submit();
		}
	});
});
</script>

<body>

<form method="post" action="/moa/review/qnaList.moa" id="frm" name="frm">
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
						<jsp:include page="../a_nav/member/SideBar.jsp">
							<jsp:param name="" value="" />
						</jsp:include>
						<!-- Content Column-->
							<div class="col-lg-6 mb-4">
							<h3>1:1 문의글 상세보기</h3>
							<br>
								<label for="title">제목 : </label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="title" name="title" 
									placeholder="${DATA.title}" readonly>
								</div>
								<p class="help-block" id="titlemsg"></p>

								<div class="controls">
									<label for="body">내용:</label>
									<textarea class="form-control" id="body" name="body" rows="10"
										cols="100" required=""
										data-validation-required-message="Please enter your message"
										maxlength="999" style="resize: none"
										placeholder="${DATA.body}" readonly
										></textarea>
									<div class="help-block"></div>
								</div>
								<br>
								<label>답변 : </label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="title" name="title" 
									placeholder="${DATA.reply}" readonly>
								</div>
							
								<button class="btn btn-primary" id="lbtn">리스트 보기</button>
								<button class="btn btn-primary" id="wbtn">글작성</button>
								<button class="btn btn-primary" id="ebtn">수정</button>
								<button class="btn btn-primary" id="dbtn">삭제</button>
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