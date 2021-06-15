<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String active = request.getParameter("active"); %>
<script>
	$(document).ready(function(){
		if('${SID}'){
			$('.navShow').children().eq(0).css('display', 'none');
			$('.navShow').children().eq(2).css('display', 'none');
			
		} else {
			$('.navShow').children().eq(1).css('display', 'none');
			$('.navShow').children().eq(3).css('display', 'none');
		}
		
		switch('<%=active%>'){
		case '로그인' : $('.navShow').children().eq(0).addClass().children().addClass('w3-text-light-grey'); break;
		case '회원가입' : $('.navShow').children().eq(2).addClass().children().addClass('w3-text-light-grey'); break;
		case '마이페이지' : $('.navShow').children().eq(3).addClass().children().addClass('w3-text-light-grey'); break;
		case '고객센터' : $('.navShow').children().eq(3).addClass().children().addClass('w3-text-light-grey'); break;
		case '이벤트' : $('.navShow').children().eq(3).addClass().children().addClass('w3-text-light-grey'); break;
		}
		
		$('.s-btn').click(function(){
			var tmp = $('.s-text').val();
			// alert(tmp);
			
			// $('#s-btn').val(tmp);
			
			$('#frm3').attr('action', '/moa/subpage/searchpage.moa')
			$('#frm3').submit();
		});
	});
	
</script>

<nav>
<!-- <form method="POST" action="/moa/subpage/searchpage.moa" id="frm3" name="frm">
	<input type="hidden" name="n-btn" id="n-btn">
</form> -->

    <div class="user-con">
        <a class="logo" href="/moa/main.moa">MOA</a>
        <div class="snb">
            <ul class="user-snb navShow">
                <li class="user-li"><a class="user-a" href="/moa/member/login.moa">로그인</a></li>                  
                <li class="user-li"><a class="user-a" href="/moa/member/logout.moa">로그아웃</a></li>                  
                <li class="user-li"><a class="user-a" href="/moa/member/join.moa">회원가입</a></li>
                <li class="user-li"><a class="user-a" href="/moa/myPage/myPage.moa">마이페이지</a></li>
                <li class="user-li"><a class="user-a" href="/moa/board/allboardlist.moa">고객센터</a></li>
                <li class="user-li"><a class="user-a" href="/moa/subpage/eventpage.moa">이벤트</a></li>
            </ul>
        </div>
    </div>
    <div class="user-con user-con-gnb">
        <div class="gnb">
            <ul class="user-gnb">
                <li class="user-li user-grey"><a class="user-a" href="/moa/menupage/menu1.moa">일반 전시</a></li>                  
                <li class="user-li user-grey"><a class="user-a" href="/moa/menupage/menu2.moa">미술전</a></li>
                <li class="user-li user-grey"><a class="user-a" href="/moa/menupage/menu3.moa">테마전</a></li>
                <li class="user-li user-grey"><a class="user-a" href="/moa/subpage/searchpage.moa">상세 검색</a></li>
            </ul>
        </div>
        <!-- <div class="user-ipt">
            <input class="user-input s-text" type="text" placeholder="검색어를 입력하세요.">
            <button type="submit" class="btn btn-primary n-btn">검색</button>
        </div> -->
    </div>
</nav>