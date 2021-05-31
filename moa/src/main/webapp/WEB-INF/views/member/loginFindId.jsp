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
	
		$('#mailbtn').click(function(){
	
		var sname = $('#name').val();
		var stel = $('#tel').val();
		
		if(!sname){
			alert('이름을 입력하세요');
			return;
		}
		if(!stel){
			alert('휴대폰번호를 입력하세요');
			return;
		}
		if(telCk()){
			$.ajax({
				url : '/moa/member/loginFindIdProc.cls',
				type : 'post',
				dataType : 'json',
				data : {
					name : sname,
					tel : stel			
				},
				success : function(data) {
					if(data.result == 'NoCnt'){
						alert('일치하는 회원정보가 없습니다');
					} else {
						alert('인증번호가 정상 발송되었습니다.');				
						$('#result1').val(data.result1);
						$('#result2').val(data.result2);
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
		
	$('#ibtn').click(function(){
		var sname = $('#name').val();
		var stel = $('#tel').val();
		if(!sname){
			alert('이름을 입력하세요');
			return;
		}
		if(!stel){
			alert('휴대폰번호를 입력하세요');
			return;
		}
		if($('#result1').val()==$('#mail1').val()){
			$('#idconfirm').val($('#result2').val());
		} else{
			if(!$('#mail1').val()){
				alert('인증번호를 입력하세요');
				return;
			}
			alert("인증번호가 다릅니다. 다시 한번 확인하세요");
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
	<input type="hidden" id="result1" value="result1" />
	<input type="hidden" id="result2" value="result2" />
	<section class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 mb-4">
					<div class="blocks">
						<h3>아이디 찾기</h3><br><br>					
						<form method="post" id="frm1" name="frm1"
							action="/moa/member/loginFindIdProc.moa">
							
							<label for="name">이름 : </label>
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="name" name="name">
							</div>
							<p class="help-block" id="namemsg"></p>

							<label for="tel">전화번호 : </label>
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="tel" name="tel">
							</div>
							<p class="help-block" id="telmsg"></p>

							<label for="mail1">메일인증번호 : </label>
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="mail1" name="mail1">
								<button class="btn btn-primary mb-3" type="button" id="mailbtn">이메일
									발송</button>
							</div>
							<p class="help-block" id="mail1msg"></p>
						</form>
						<button class="btn btn-primary w3-margin-bottom" id="ibtn">아이디확인</button>

						<form method="post" id="frm2" name="frm2"
							action="/moa/member/loginFindIdProc.moa">
							
							<label for="idconfirm">고객님의 아이디는 : </label>
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="idconfirm"
									name="idconfirm" value="">
							</div>
							<p class="help-block" id="idconfirmmsg"></p>
						</form>
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