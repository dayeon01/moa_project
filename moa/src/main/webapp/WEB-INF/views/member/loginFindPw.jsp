<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

	<!-- head -->
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value=""/> 
	</jsp:include>

<script>
	$(document).ready(function() {
	
		$('#pbtn').click(function(){
	
		var sid = $('#id').val();
		var stel = $('#tel').val();
		
		if(!sid){
			alert('아이디를 입력하세요');
			return;
		}
		if(!stel){
			alert('휴대폰번호를 입력하세요');
			return;
		}
		if(telCk()){
			
			$.ajax({
				url : '/moa/member/loginFindPwProc.moa',
				type : 'post',
				dataType : 'json',
				data : {
					id : sid,
					tel : stel			
				},
				success : function(data) {
					if(data.result == 'NO'){
						alert('일치하는 아이디와 휴대폰번호가 없습니다');
					} else {
						alert('임시비밀번호가 발송 발송되었습니다.');
						$(location).attr('href', "/moa/member/login.moa");
					}
				},
				error : function() {
					alert('### 통신에러.###');
				}
		});
			
		} else{
			$('#tel').focus();
		}
		
	});
			
	function telCk(){
		var stel = $('#tel').val();
		var exp = /^01[0-9]{9}$/;
		return exp.test(stel);
	}
	
	$('#tel').keyup(function(){
		if(telCk()){
			$('#telmsg').removeClass('w3-text-red').addClass('w3-text-green').html('올바른 핸드폰 번호입니다.');
		} else {
			$('#telmsg').removeClass('w3-text-green').addClass('w3-text-red').html('휴대폰 번호 11자리(숫자만) 를 입력하세요 ');
		}
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
					<div class="blocks">
						<h3>패스워드 찾기</h3>
						<br> <br>
						<form method="post" id="frm1" name="frm1"
							action="/moa/member/loginFindIdProc.moa">

							<label for="id">아이디 : </label>
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="id" name="id">
								
							</div>
							<p class="help-block" id="idmsg"></p>

							<label for="tel">전화번호 : </label>
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="tel" name="tel">
							</div>
							<p class="help-block" id="telmsg"></p>
						</form>
						<button class="btn btn-primary w3-margin-top" id="pbtn">임시비밀번호
							발송</button>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="modal" tabindex="-1">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">로그인 실패</h5>
		        <button type="button" class="btn-close modalbtn" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <p>아이디와 패스워드를 확인하세요</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary modalbtn" data-bs-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>

	
<!-- Footer-->
<footer class="py-5 bg-blight">
    <jsp:include page="../a_nav/footer.jsp">
		<jsp:param name="" value="" />
	</jsp:include>
</footer>

</body>
</html>