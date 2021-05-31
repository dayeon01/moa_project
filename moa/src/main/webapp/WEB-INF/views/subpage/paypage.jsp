<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko"><head>
	<jsp:include page="../a_nav/head.jsp">
		<jsp:param name="" value="" />
		</jsp:include>
	   <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        
</head>	
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/moa/css/w3.css">
<link rel="stylesheet" type="text/css" href="/moa/css/user2.css">
<script type="text/javascript" src="/moa/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/moa/js/w3color.js"></script>

<style type="text/css">
.imgbox{
		width: 260px;
}
.imgbox1{
		width: 100px;
}
.imgbox2{
		width: 180px;
}
.inbox{
	text-align:right;
	width:50px;
	height:28px;
}
.pbtn{
	width: 600px;
	height: 60px;
}
.boxt{
	width: 60px;
	height: 31px;
}

</style>
	
<script type="text/javascript">

</script>
</head>
<body>
	<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="" value="" />
	</jsp:include>	

	<hr class="w3-content  mxw900 ">
		<div class="w3-content w3-margin-top ">
			<h1 class="w3-content w3-margin-left pdl40 w3-padding w3-text-left">결제</h1>
		</div>
	<hr class="w3-content  mxw900 ">
		<div class="w3-content">
		
			<div class="w3-content mxw800 ">
			     <div class="w3-col w3-margin-top  w3-padding w3-text-left imgbox">
					 <div class="w3-content inblock pdll0 w3-padding-left">
					 	 <img src="../img/exh_img_title/jang.gif" class="img-rounded w3-round" alt="Cinque Terre" width="200" height="236"> 
					</div>
				</div>
				
			     <div class="w3-col mgt40  imgbox">
					  <h3 class="w3-margin-top mgl40 w3-text-grey title">다시 안녕</h3>
					  <p class="mgt20 mgl50">&lt;장 줄리안&gt;</p>            
					  <p class=" mgl50 ">₩ 25000</p>            
					  <p class="mgl0 w3-text-grey">2021.05.15 ~ 2021.08.15</p>        
				</div>
			     <div class="w3-col mgt40   w3-text-left imgbox1">
					 <div class="w3-content inblock pdll0 ">
					 	  <div class="mgt10">
					 	  	<label class="w3-margin-right w3-magin-bottom">유  아</label>
					 	  </div>         
					 	  <div class="mgt20">
					 	  	<label class="w3-margin-right w3-magin-bottom">청소년</label>
					 	  </div>         
					 	  <div class="mgt20">
					 	  	<label class="w3-margin-right w3-magin-bottom">성  인</label>
					 	  </div>         
					 	  <div class="mgt20">
					 	  	<label class="w3-margin-right w3-magin-bottom w3-margin-top ">총 금액</label>
					 	  </div> 
					 	     
					</div>
				</div>
			     <div class="w3-col mgt40  w3-padding w3-text-left imgbox2">
				 	 <div class="w3-border boxt  w3-round-large">
			     		<input type="text" class=" w3-round-large inbox inbox" placeholder="0"><br>
					</div>	
				 	 <div class="w3-border boxt w3-margin-top w3-round-large">
			     		<input type="text" class=" w3-round-large inbox inbox" placeholder="0"><br>
					</div>	
				 	<div class="w3-border boxt w3-margin-top w3-round-large">
			     		<input type="text" class=" w3-round-large inbox inbox" placeholder="0"><br>
				   	</div>	
					<div class="mgt40">
					 	 <div class="w3-border boxt w3-margin-top w3-round-large mgt20">
				     		<input type="text" class=" w3-round-large inbox" placeholder="0"><br>
						</div>	
					</div>	
				</div>
		</div>
		     	
				<div class="w3-content  w3-margin-top w3-margin-bottom">
					<h3 class="w3-col w3-content mgt40 pdl40 pdt40 mxw900 mgl40">구매자 정보</h3>
					<p class="w3-col mgb20 mgl40 pdl40">결제하신 모바일 티켓은 구매자의 핸드폰 번호로 전송됩니다. 정확한 정보로 등록되었는지 확인해 주세요.</p>
					<div class="w3-col w3-border mgl70 mgt40 pdAll20 pdl40 w3-light-grey" style="width:600px;">
						<div class="w3-col mgl40 pdl40 mgb20" >이름
							 <div class="inblock w3-border boxt  w3-round-large"style="width:120px;">
					     		<input type="text" class=" w3-round-large w3-light-grey inbox" placeholder="최다연"><br>
							</div>	
						</div>
						<div class="w3-col mgl40 pdl40 mgb20" >휴대폰 번호
							 <div class="inblock w3-border boxt  w3-round-large"style="width:120px;">
					     		<input type="text" class=" w3-round-large w3-light-grey inbox" style="width:110px;" placeholder="01021201239"><br>
							</div>	
						</div>
						<div class="w3-col mgl40 pdl40 mgb20" >이메일 주소
							 <div class="inblock w3-border boxt  w3-round-large"style="width:200px;">
					     		<input type="text" class=" w3-round-large pdr10 mgb60 w3-light-grey inbox" style="width:190px;" placeholder="yeon@naver.com"><br>
							</div>	
						</div>
					</div>
					<h3 class="w3-col  mgt40 pdl40 pdt10 mxw900 mgl40">결제 수단</h3>
						<div class="w3-col w3-margin-top mgl40 pdl40">
							<input type="radio" class="mgl20 " name="ppay" value="ppay">포인트 결제
							<input type="radio" class="mgl70" name="cpay" value="cpay">카드 결제
					</div>
					<div class="w3-col w3-border mgl70 mgt40 pdAll20 pdl40 w3-light-grey" style="width:600px;">
						<div class="w3-col mgt20 w3-center">보유 포인트 : 
							<input type="text" class="w3-border-bottom w3-light-grey" placeholder="10000 P">
						</div>
						
						<div class="w3-col w3-margin-top ">
							<hr>		
						</div>
						<div class="w3-col mgt20 w3-center">상품 금액 : 
							<input type="text" class="w3-border-bottom w3-light-grey" placeholder="20000 원">
						</div>
						<div class="w3-col mgt20 w3-center">포인트 사용 : 
							<input type="text" class="w3-border-bottom w3-light-grey" placeholder="5000 P">
						</div>
						<div class="w3-col mgt20 w3-center">총 결제 금액: 
							<input type="text" class="w3-border-bottom w3-light-grey" placeholder="15000 원">
						</div>
					</div>
					<div class="w3-col w3-button mgt60 mgb60 mgl70 w3-round w3-blue w3-hover-blue w3-round pbtn ftw" id="pbtn">결제하기</div>
				</div>
							
		</div>		
<%-- <!-- Footer-->
<footer class="py-5 bg-blight">
    <jsp:include page="../a_nav/footer.jsp">
		<jsp:param name="" value="" />
	</jsp:include> 
</footer> --%>
	
</body>
</html>