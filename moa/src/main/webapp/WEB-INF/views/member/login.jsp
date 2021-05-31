<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko"><head>
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value=""/> 
	</jsp:include>
</head>

<script>
	$(document).ready(function() {		
		
		if( '${MSG}' == 'false') {
			 alert('아이디와 비번을 확인하세요');
		 }
		
		$('#sbtn').click(function(){
			$('#frm').submit();
		});
	
		$('#ibtn').click(function(){
			 $(location).attr('href', "/moa/member/loginFindId.moa");
		});
		
		$('#fbtn').click(function(){
			 $('#frm1').submit();
		});
		
	});
</script>

<body>
<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="active" value="로그인"/>
	</jsp:include>

	<!-- Page Content-->
	<section class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-4">
					<h3>로그인 정보를 입력해 주세요</h3>
					<br> <br>
					<form method="post" id="frm" name="frm"
						action="/moa/member/loginProc.moa">

						<label for="id">아이디 : </label>
						<div class="input-group mb-3">
							<input type="text" class="form-control" id="id" name="id">
						</div>
						<p class="help-block" id="idmsg"></p>

						<label for="pw">패스워드 : </label>
						<div class="input-group mb-3">
							<input type="password" class="form-control" id="pw" name="pw">
						</div>
						<p class="help-block" id="pwmsg"></p>
					</form>

					<form method="post" id="frm1" name="frm1"
						action="/moa/member/loginFindPw.moa">

						<div class="input-group mb-3">
							<input type="text" class="col-lg-3 btn btn-primary w3-margin-right" id="sbtn" value="로그인"> 
							<input type="text" class="col-lg-3 btn btn-primary w3-margin-right" id="ibtn" value="아이디 찾기">
							<input type="text" class="col-lg-3 btn btn-primary" id="fbtn" name="fbtn" value="패스워드 찾기">
						</div>
					</form>
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