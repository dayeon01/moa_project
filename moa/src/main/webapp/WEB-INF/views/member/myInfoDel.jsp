<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

	<!-- head -->
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
	</jsp:include>

<script>
$(document).ready(function(){
	$('#ebtn').click(function(){
		
		if(!$('#pw').val()){
			alert('비밀번호를 입력하세요');
			return;
		}
		if(!('${DATA.pw}' == $('#pw').val())) {
			alert('비밀번호가 맞는지 확인하세요');
		} else {
			var result = confirm('정말로 탈퇴하시겠습니까?');
			if(result){
				$('#del4').val($('#del4text').val());
				$(frm).submit();
			}
		}
	});
});
</script>

<body>
	
	<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="" value=""/>
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
					
						<!-- SideBar -->
						<jsp:include page="../a_nav/member/SideBar.jsp">
							<jsp:param name="" value="" />
						</jsp:include>
						<!-- Content Column-->
						<div class="col-lg-6 mb-4">
							<h3>회원탈퇴 ></h3><br><br>
								<h4>탈퇴 사유</h4>
							<br>
							<form method="post" id="frm" name="frm"
								action="/moa/member/myInfoDelProc.moa">
								<input type="hidden" name="id" value="${DATA.id}">

								<div class="form-check w3-margin-bottom">
									<input class="form-check-input" type="checkbox" name="del1"
										value="del1" id="del1" checked> <label
										class="form-check-label" for="del1"> 이용빈도 낮음 </label>
								</div>

								<div class="form-check w3-margin-bottom">
									<input class="form-check-input" type="checkbox" name="del2"
										value="del2" id="del2"> <label
										class="form-check-label" for="del12"> 싸이트 이용불편 </label>
								</div>

								<div class="form-check w3-margin-bottom">
									<input class="form-check-input" type="checkbox" name="del3"
										value="del3" id="del3"> <label
										class="form-check-label" for="del3"> 개인정보 노출우려 </label>
								</div>

								<div class="form-check w3-margin-bottom">
									<input class="form-check-input" type="checkbox" name="del4"
										value="" id="del4"> <label class="form-check-label"
										for="del4"> 기타 </label> <input type="text" id="del4text" /><br>
									<br>
								</div>

								<label for="name">이름 : </label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="name" name="name"
										value="${DATA.name}">
								</div>
								<p class="help-block" id="namemsg"></p>

								<label for="id">아이디 : </label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="id" name="id"
										value="${DATA.id}" disabled>
								</div>
								<p class="help-block" id="idmsg"></p>

								<label for="pw">비밀번호 : </label>
								<div class="input-group mb-3">
									<input type="password" class="form-control" id="pw" name="pw">
									<p class="help-block" id="pwmsg"></p>
								</div>
							</form>
							<button class="btn btn-primary" id="ebtn">탈퇴하기</button>

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