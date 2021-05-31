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
	$('#bno').val('${DATA1.bno}');
	
	if(!($('#body').val() == " ")){
		$('.tmp1').css('display', 'none');
	} else {
		$('.tmp2').css('display', 'none');
	}
	
	$('#wbtn').click(function(){
		var stitle = $('#body').val();
		$('#reply').val(stitle);
		$('#frm').submit();
	});
	
	$('#ebtn').click(function(){
		$('#reply').val($('#body').val());
		$('#frm').attr('action', '/moa/review/qnaEditProcAdmin.moa');
		$('#frm').submit();
	});
	
	$('#dbtn').click(function(){
		var result = confirm('정말로 삭제 하시겠습니까?');
		if(result){
			$('#frm').attr('action', '/moa/review/qnaDelAdmin.moa');
			$('#frm').submit();
		}	
	});	
});
</script>

<body>

<form method="post" action="/moa/review/qnaWriteProcAdmin.moa" id="frm" name="frm">
		<input type="hidden" name="nowPage" id="nowPage">
		<input type="hidden" name="bno" id="bno">
		<input type="hidden" name="reply" id="reply">
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
						<jsp:include page="SideBar.jsp">
							<jsp:param name="" value="" />
						</jsp:include>
						<!-- Content Column-->
						<div class="col-lg-8 mb-4">

							<table class="table">
								<thead>
									<tr>
										<th scope="col">글번호(${DATA1.bno})</th>
										<th scope="col" colspan=2>제목 : ${DATA1.title}</th>
										<th scope="col">등록일</th>
									</tr>
								</thead>
								<tbody class="w3-margin-top">
									<tr>
										<th scope="row">ID : ${DATA1.id}</th>
										<td colspan=2>${DATA1.body}</td>
										<td>${DATA1.sdate}</td>
									</tr>
									<tr>
										<th scope="row">관리자 답변</th>
										<td colspan=2></td>
										<td>${DATA2.sdate}</td>
									</tr>
								</tbody>
							</table>
							
							<textarea name="body" id="body"  rows="7"
							class="w3-col w3-input w3-round w3-border noresize w3-margin-bottom" 
							> ${DATA2.body}</textarea><br>
								
								<button class="btn btn-primary tmp1" id="wbtn">답변등록</button>
								<button class="btn btn-primary tmp2" id="dbtn">삭제</button>
								<button class="btn btn-primary tmp2" id="ebtn">수정</button>
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