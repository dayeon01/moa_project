<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="../a_nav/head.jsp">
	<jsp:param name="" value="" />
</jsp:include>
</head>
<style type="text/css">
.tlist{
	cursor: pointer;
}
</style>


<script>
$(document).ready(function() {
	$('.tlist').click(function(){
		var tid = $(this).attr('id');
		$('#exino').val(tid);
		$('#frm').submit();
	});
});
</script>

<body>
<form method="POST" action="/moa/exhibit/exhDetail.moa" name="frm" id="frm" >
			<input type="hidden" name="exino" id="exino">
</form>
	<!-- Navigator -->
	<jsp:include page="../a_nav/nav.jsp">
		<jsp:param name="active" value="마이페이지" />
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
						<jsp:include page="../a_nav/member/SideBar.jsp">
							<jsp:param name="" value="" />
						</jsp:include>
						<!-- Content Column-->
						<div class="col-lg-9 mb-6">
							<h3>진행 중인 공연정보 현황</h3>
							<br>
						

<!-- 지도 넣기 -->

					<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            
        </a>
    </em>
</p>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d608d8acb6636994381a72afb4a8118
&libraries=services"></script>

<script>

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var arrString = '${LIST}';
var arr = JSON.parse(arrString);

var bodys = new Array();
var titles = new Array();
var j = 0;

for(i = 0 ; i < arr.length ; i++ ){
	var body = arr[i].body;
	var title = arr[i].title;
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(body, function(result, status) {

     // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords,
            title : arr[j].title
        });
 
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
        	 content: '<div style="width:200px;text-align:center;padding:6px 0;">' +  marker.getTitle() + '</div>'      	
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        if(arr.length == i){
        	map.setCenter(coords);
        }
 
        j++;
    } 
});   
}
</script>		
						
						<table class="table table-hover">
									<thead>
										<tr class="text-center">
											<th scope="col">#</th>
											<th scope="col">전시명</th>
											<th scope="col">전시관</th>
											<th scope="col">위치</th>
											<th colspan="2">기간</th>
										
										</tr>
									</thead>
									<tbody>
								<c:forEach var="data" items="${LIST_A}" varStatus="idx">
										<tr class="text-center tlist" id="${data.exno}">
											<th scope="row">${idx.count}</th>
											<td>${data.id}</td>
											<td>${data.title}</td>
											<td>${data.body}</td>
											<td>${data.sdate} ~ ${data.edate.substring(5)}</td>
											
										</tr>
								</c:forEach>
									</tbody>
								</table>
						
						
							
						</div>					
					</div>
				</div>
			</div>
		</div>
	</section>

	

</body>
</html>