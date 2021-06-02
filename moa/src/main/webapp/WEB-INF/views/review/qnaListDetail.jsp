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
						<jsp:include page="../mypage/SideBar.jsp">
							<jsp:param name="" value="" />
						</jsp:include>
						<!-- Content Column-->
						<div class="col-lg-8 mb-4">

							<table class="table">
								<thead>
									<tr>
										<th scope="col">글번호(${DATA.bno})</th>
										<th scope="col" colspan=2>제목 : ${DATA.title}</th>
										<th scope="col">등록일</th>
									</tr>
								</thead>
								<tbody class="w3-margin-top">
									<tr>
										<th scope="row">${SID}님의 문의내용</th>
										<td colspan=2>${DATA.body}</td>
										<td>${DATA.wdate}</td>
									</tr>
									<tr>
										<th scope="row">관리자 답변</th>
										<td colspan=2>${DATA.reply}</td>
										<td>${DATA.redate}</td>
									</tr>
								</tbody>
							</table>
								<button class="btn btn-primary w3-margin-bottom" id="lbtn">리스트 보기</button> <br>
								<button class="btn btn-primary" id="wbtn">글작성</button>
								<button class="btn btn-primary" id="ebtn">수정</button>
								<button class="btn btn-primary" id="dbtn">삭제</button>
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