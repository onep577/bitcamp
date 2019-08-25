<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔시그니엘</title>

<style type="text/css">
main{
	width: 80%;
	height: 3200px; /* 이걸로 메인에어리어 부분 높이 조정해서 알맞게 쓰기 !! */
	margin: auto;
	margin-bottom: 30px;
	/* background-color: blue; */
}

ul{
   list-style:none;
   padding-left:0px;
}

.menu > li{
	list-style:none;
	color: #eee;
}
.menu > li > a{
	color: #eee;
}  
.menu > li > a:hover{
	list-style:none;
	color: black;
}
.allMenu{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1.3em;
  	color: red;
}
.totalpage{
	width: 100%;
	height: 3200px;
	margin: auto;
	/* background-color: pink; */
}
.instruction1{
	width: 100%;
	font-size : 20px;
	background-color: #fafafa;
	margin-top: 50px;
	margin-bottom: 50px;
	text-align: center;
}
.instruction2{
	width: 100%;
	/* background-color: blue; */
	height: 1400px;
}
.box1{
	/* background-color: red; */
	width: 48%;
	height: 600px;
	margin-right: 30px;
	margin-bottom: 30px;
	float: left;
}
.box2{
	/* background-color: yellow; */
	width: 48%;
	height: 600px;
	margin-bottom: 30px;
	float: left;
}
.box3{
	/* background-color: green; */
	width: 48%;
	height: 600px;
	margin-right: 30px;
	float: left;
}
.box4{
	/* background-color: orange; */
	width: 48%;
	height: 600px;
	float: left;
}
.visitload{
	/* background-color: orange; */
	width: 80%;
	height: 600px;
	margin: 30px 150px 30px 150px;
}
.visitfont{
	width: 80%;
	font-size: 20px;
	/* background-color: red; */
}
	
	
	
</style>

</head>

<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=663d31a73a34a918bb28760edb2b72f7"></script>

<jsp:include page="../header.jsp" flush="false"/>
 
<main>

<div align="center">
	
	<div id="adminMain">
	
	<div class="totalpage">
	<div class="instruction1">
	<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 50px">시그니엘 서울 소개</p>
	<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px">
	국내 최고층 건물인 롯데월드타워 76층~101층에 위치한 시그니엘서울은 한국의 아름다움을 현대적인 감각으로 풀어낸 객실(235실)에서<br>
	서울의 파노라믹한 스카이라인과 환상적인 야경을 조망할 수 있으며 일몰과 일출을 한 자리에서 감상할 수 있는 국내 유일의 호텔입니다.
	<br><br>
	미식가들을 위한 천국이자 그 자체가 ‘고메 호텔(Gourmet Hotel)’로, 멀티 미쉐린스타 셰프 ‘야닉 알레노(Yannick Alléno)’가 ‘스테이(STAY)’ 레스토랑 운영과 <br>
	더불어 호텔 내 모든 식음료(Food and Beverage)에 대해 총괄 디렉팅을 전담하여 웨딩에서부터 인룸다이닝 메뉴에 이르기까지 세계적인 스타 셰프가 제안하는 맛과 스타일을 경험할 수 있습니다.
	<br><br>
	국내 최고층에 위치하여 햇살 가득한 에메랄드빛 풀에서 도심 속 망중한을 즐길 수 있는 호텔 수영장, 국내 최초로 선보이는 세계적인 프리미엄 스파 브랜드 ‘에비앙 (Evian) 스파’,<br>
	세계 최고층에 위치한 최첨단 시설의 연회장에서는 섬세하고 격조 있는 시그니엘서울만의 서비스가 펼쳐집니다. <br>
	<br><br>
	[ Live beyond expectations. ]<br>
	시그니엘서울은 ‘럭셔리를 넘어, 서비스를 넘어, 기대를 넘어, 상상하는 모든 것 그 이상의 가치를 제공’합니다.
	<br><br><br><br>
	</p>
	</div>
	
	<div class="instruction2">
	<div class="box1">
	<img alt="이미지 없음" src="/miniProject/image/img1.png" style="width: 100%; height: 60%">
	
	<h2>객실</h2>
	<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px" align="left">
	초고층 타워의 전 객실에서 서울의 환상적인 경관을 파노라믹뷰로 조망할 수 있습니다.<br><br>
	
	- 여유로운 면적의 최고급 객실<br>
	- 세련미와 편안함이 어우러진 격조 높은 인테리어<br>
	- 최상의 평온함을 위한 Super-premium Bedding System (Simmons사 공동 개발)<br>
	</p>
	</div>
	<div class="box2">
	<img alt="이미지 없음" src="/miniProject/image/img2.png" style="width: 100%; height: 60%">
	<h2>다이닝</h2>
	<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px" align="left">
	탁트인 도심의 전경을 바라보며 세계 최고 수준의 셰프들이 직접 선보이는 다양한 요리를 즐기실 수 있습니다.<br><br>
	
	- 멀티 미쉐린스타 셰프 ′야닉 알레노′가 운영하는 레스토랑 ′스테이′<br>
	- 한식의 새로운 빛깔, 미쉐린 1스타 코리안 퀴진 ′비채나′<br>
	- 국내 최대의 샴페인 셀렉션, 프리미엄 바 ′바81′<br>
	- 하늘에서 즐기는 차 한잔의 여유 ′더 라운지′<br>
	</p>
	</div>
	<div class="box3">
	<img alt="이미지 없음" src="/miniProject/image/img3.png" style="width: 100%; height: 60%">
	<h2>웨딩&연회</h2>
	<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px" align="left">
	생애 최고의 경험을 제공하는 고품격 웨딩 및 가족모임은 물론 국제회의와 비즈니스 행사를 위한 맞춤식 공간을 연출할 수 있습니다.<br><br>
	
	- 웅장한 층고 (약 8m) 와 한강 조망이 돋보이는 세계 최고층 연회장 (76F)<br>
	- 미쉐린 3스타 셰프 야닉 알레노가 엄선한 연회 메뉴<br>
	- 크리스틴 반타가 제안하는 최신 북미 트렌드의 웨딩 컨셉<br>
	- 자연채광에 최적화된 LED 스크린 및 특수조명 등의 최첨단 장비<br>
	</p>
	</div>
	<div class="box4">
	<img alt="이미지 없음" src="/miniProject/image/img4.png" style="width: 100%; height: 60%">
	<h2>부대시설</h2>
	<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px" align="left">
	자연 채광과 스카이 뷰가 어우러진 친환경 분위기의 프레스티지 리프레싱존 (Prestige Refreshing Zone)은 생활의 활력을 되찾아 드립니다.<br><br>
	
	- 구름 위에서 즐기는 최고급 사우나와 호텔 헬스장 및 실내수영장<br>
	- 서유럽 방식의 정교한 트리트먼트 기술로 한 단계 높은 수준의 웰빙 경험을 제공하는 에비앙스파 (Evian Spa)<br>
	</p>
	</div>
	</div>
	
	
	<h1>시그니엘 서울 위치</h1>
	<div class="visitload" id="map" style="z-index: 1;">
	</div>
	<div class="visitfont" align="left">
	<b>찾아오는 길</b>
	<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px">
	2호선 잠실역<br><br>
	[롯데월드몰 오픈 전]<br>
	
	2번 출구 → 에비뉴엘 우측 방면으로 직진 후 좌측으로 빌딩을 따라 이동 → 타워 남문 (1F) 도착 → 시그니엘서울 호텔 정문 도착<br><br><br>
	
	[롯데월드몰 오픈 후]<br>
	
	1, 2번 출구 방면 월드몰 입구 (B1F) → 왕관 조형물 지나 전망대 입구의 좌측 통로 방향으로 약 50M → 우측 월드타워 입구 회전문 (B1F) 도착
	<br>→ 좌측 방면 에스컬레이터 탑승 후 1F으로 이동 → 타워 내 남문 방향 이동 → 시그니엘서울 호텔 정문 도착<br>
	</p>
	</div>
	
	</div>
	
	</div>




</div>

</main>

<script>    
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(37.513041, 127.102711), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption);

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.513041, 127.102711); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">롯데월드타워<br></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(37.513041, 127.102711); //인포윈도우 표시 위치입니다

//인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent 
});

//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>



<jsp:include page="../footer.jsp" flush="false"/>

</body>
</html>