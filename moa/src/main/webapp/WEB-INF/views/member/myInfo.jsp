<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

	<!-- head -->
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
	</jsp:include>

<script>
$(document).ready(function() {
	$('#${DATA.gen.equals("M") ? "m":"f"}gen').prop('checked',true);
	
	$('#ebtn').click(function(){
		$(location).attr('href','/moa/member/myInfoEdit.moa');
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
				<div class="col-lg-12 mb-4">
					<!-- Page Heading/Breadcrumbs-->
					<h1>My Page</h1>
					<ol class="breadcrumb mb-4">
					</ol>
					<!-- Content Row-->
					<div class="row">
							
							<!-- Sidebar -->
							<jsp:include page="../a_nav/member/SideBar.jsp">
								<jsp:param name="" value="" />
							</jsp:include>
						
						<!-- Content Column-->
						<div class="col-lg-6 mb-4">
							<h3>${DATA.name}님의
								회원정보 <br><small class="w3-text-grey">(가입일 : ${DATA.sdate})</small>
							</h3> <br>					
							<form method="post" id="frm" name="frm"
								action="/moa/member/myInfo.moa">

								<label for="name">이름 : </label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="name" name="name"
										value="${DATA.name}" disabled>
								</div>
								<p class="help-block" id="namemsg"></p>

								<label for="id">아이디 : </label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="id" name="id"
										value="${DATA.id}" disabled>
								</div>
								<p class="help-block" id="idmsg"></p>

								<label for="pw">비밀번호 :</label>
								<div class="input-group mb-3">
									<input type="password" class="form-control" id="pw" name="pw"
										value="${DATA.pw}" disabled>
								</div>
								<p class="help-block" id="pwmsg"></p>

								<label for="repw">비밀번호 확인:</label>
								<div class="input-group mb-3">
									<input type="password" class="form-control" id="repw" name="repw"
										value="${DATA.pw}" disabled>
								</div>
								<p class="help-block" id="repwmsg"></p>

								<label for="tel">전화번호 :</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="tel" name="tel"
										value="${DATA.tel}" disabled>
								</div>
								<p class="help-block" id="telmsg"></p>

								<label for="email">이메일 :</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="email" name="email"
										value="${DATA.email}" disabled>
								</div>
								<p class="help-block" id="emailmsg"></p>

								<label for="gen">성별 :</label>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="gen"
										id="mgen" value="M" disabled> <label
										class="form-check-label" for="mgen"> 남성 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="gen"
										id="fgen" value="F" disabled> <label
										class="form-check-label" for="fgen"> 여성 </label>
								</div><br>
								
								<label for="birth">생년월일 :</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="birth" name="birth"
										value="${DATA.birth}" disabled>
								</div>
								<p class="help-block" id="birthmsg"></p>
							</form>
							<button class="btn btn-primary" id="ebtn">수정하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer-->
    <jsp:include page="../a_nav/footer.jsp">
		<jsp:param name="" value="" />
	</jsp:include>

</body>
</html>