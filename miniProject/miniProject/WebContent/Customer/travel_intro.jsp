<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔시그니엘</title>

<script type="text/javascript" src="../js/jquery.min.js"></script> 
<link rel="stylesheet" href="../css/bootstrap.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">

<style type="text/css">
main{
	width: 80%;
	height: 3700px; /* 이걸로 메인에어리어 부분 높이 조정해서 알맞게 쓰기 !! */
	margin: auto;
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

/* main안에 있는 태그이다 */
.intro{
	height: 150px;
	margin-top: 50px;
	background-color: #fafafa;
	margin-bottom: 60px;
}
.backLocation {
	width: 100%;
	height: 2500px;
	/* background-color: red; */
}
.maparea{
	width: 100%;
	height: 800px;
	margin-top: 100px;
	padding-top: 100px;
	/* background-color: orange; */
}

.intro_bar{
	background-color: #fafafa;
	width: 50%;
	height: 40px;
	margin-left: 400px;
}
.box1 {
	width: 100%;
	height: 500px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	/* background-color: blue; */
	padding-top: 100px;
	float: left;
}
.box11 {
	float: left;
	margin-right: 30px;
}
.box2 {
	width: 100%;
	height: 500px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	/* background-color: yellow; */
	padding-top: 100px;
	float: left;
}
.box21 {
	float: left;
	margin-right: 30px;
}
.box3 {
	width: 100%;
	height: 500px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	/* background-color: green; */
	padding-top: 100px;
	float: left;
}
.box31 {
	float: left;
	margin-right: 30px;
}
.box4 {
	width: 100%;
	height: 500px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	/* background-color: gray; */
	padding-top: 100px;
	float: left;
}
.box41 {
	float: left;
	margin-right: 30px;
}
.box5 {
	width: 100%;
	height: 500px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	/* background-color: silver; */
	padding-top: 100px;
	float: left;
}
.box51 {
	float: left;
	margin-right: 30px;
}
	
	
</style>

</head>

<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=663d31a73a34a918bb28760edb2b72f7"></script>

<jsp:include page="../header.jsp" flush="false"/>
 
<main>



<div class="intro">
<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 50px;" align="center">주변 관광지 정보</p>
<div class="intro_bar">
<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;" align="center">
<a href="#move1">롯데월드타워</a>
<a href="#move2">올림픽공원</a>
<a href="#move3">석촌호수</a>
<a href="#move4">롯데월드</a>
<a href="#move5">잠실 한강공원</a>
<a href="#move6">전체보기</a>
</p>
</div>
</div>




<div class="backLocation">

<div class="box1" id="move1" align="left">
	<div class="box11">
	<img alt="" src="/miniProject/image/travel1.png" style="width: 700px; height: 400px">
	</div>
	
	<p style="font-size: 30px;">롯데월드타워</p><br>
	한국적 곡선의 미를 지닌 한국 전통의 도자기와 붓의 형상을 모티브로 설계된 롯데월드타워는 총 123층, 555M 높이로 세계 5위의 초고층 빌딩이다.
	대지면적은 축구장의 12.2배, 전체 총 면적은 축구장의 110배에 달하는 거대한 수직도시이다.<br><br>
	2016년 12월 마침내 준공되었으며, 특급 호텔 '시그니엘 서울'과, 화려한 서울의 야경을 볼 수 있는 전망대인 '서울스카이', 최고급 레지던스와 오피스 공간, 복합기능공간 등으로 구성되어있다.<br><br>
	
	[한국관광공사 : http://api.visitkorea.or.kr ]<br>
	<a href="https://www.lwt.co.kr/tower/ko/main/main.do" target="_blank">홈페이지 바로가기</a><br>

</div>


<div class="box2" id="move2">
	<div class="box21">
	<img alt="" src="/miniProject/image/travel2.png" style="width: 700px; height: 400px">
	</div>
	
	<p style="font-size: 30px;">올림픽공원</p><br>
	올림픽공원은 백제 시대의 유적과 현대적 감각의 최신식 경기장이 공존하면서 숲과 잔디밭 또한 훌륭한 여가 공간이다.
	88서울올림픽의 유산인 올림픽공원은 도시민의 생활 수준 향상으로 건강 증진에 대한 욕구가 높아지면서
	도시 안에 마땅한 휴식공간이 없는 시민들에게 단순한 휴식처 뿐만 아니라 국내 최대의 스포츠 마당으로 부각되고 있다.<br><br>
	
	올림픽 공원은 체육공간, 문화예술공간, 역사와 교육의 장소, 휴식공간 등 다양한 용도를 갖춘 만능공원으로 자리매김하고 있다.<br><br>
	
	[한국관광공사 : http://api.visitkorea.or.kr ]<br>
	<a href="http://olympicpark.kspo.or.kr/" target="_blank">홈페이지 바로가기</a>
</div>


<div class="box3" id="move3">
	<div class="box31" style="font-family: 'Noto Sans KR', sans-serif; font-size: 40px">
	<img alt="" src="/miniProject/image/travel3.png" style="width: 700px; height: 400px">
	</div>
	<div class="box32">
	
	<p style="font-size: 30px;">석촌호수</p><br>
	현재의 석촌호수 북쪽 잠실벌은 서호의 남쪽에 나룻터가 한강이었으나 세월이 지남에 따라 토사가 쌓여 인공 섬이 생기면서 광진교 밑에서부터
	잠실야구장까지 지금의 석촌호수를 지나는 송파강과 신천강을 이루는 샛강이 생기게 되었다.<br><br>
	1969년 한강 본류의 하상 정비 개발에 착수하면서 이 강을 매립하였으나 일부는 남겨 놓았고 1980년대 초 이 호수를 정비하면서 공원이 만들어지게 되었다.
	'송파나루공원'은 송파대로가 개통하면서 동서로 같은 모양의 동호, 서호로 나누어져 있으며 호수와 공원으로 조성된 이상적인 형태의 공원이다.<br><br>
	
	[한국관광공사 : http://api.visitkorea.or.kr ]<br>
	<a href="http://parks.seoul.go.kr/" target="_blank">홈페이지 바로가기</a><br>
	</div>
</div>


<div class="box4" id="move4">
	<div class="box41">
	<img alt="" src="/miniProject/image/travel4.png" style="width: 700px; height: 400px">
	</div>
	
	<p style="font-size: 30px;">롯데월드</p><br>
	서울특별시 송파구 올림픽로 240(잠실동)에 위치한 건물 면적 581,645㎡, 대지 면적 128,246㎡ 규모의 쇼핑몰.
	즉, 놀이공원만 말하는게 아니다. 1989년 7월 12일에 실내 테마파크 롯데월드 어드벤처가 정식으로 개원하고,
	1990년 3월 24일 호수공원 매직아일랜드가 개원하며 완전한 모습을 갖추었다.<br><br>
	총 투자 비용은 6,500억원이며, 운영은 롯데그룹의 계열사인 호텔롯데의 월드사업부에서 하고 있다.
	서울 지하철 2호선 및 8호선 잠실역과 지하통로로 연결되어 있으며, 3번 출구 및 4번 출구를 통해서도 지상으로 접근이 가능하다.<br><br>
	
	[한국관광공사 : http://api.visitkorea.or.kr ]<br>
	<a href="http://www.lotteworld.com/" target="_blank">홈페이지 바로가기</a><br>
</div>


<div class="box5" id="move5">
	<div class="box51">
	<img alt="" src="/miniProject/image/travel5.png" style="width: 700px; height: 400px">
	</div>
	
	<p style="font-size: 30px;">잠실 한강공원</p><br>
	잠실한강공원은 잠실철교에서 영동대교 사이 강변 남단에 위치하고 있으며,
	잠실종합운동장, 롯데월드, 올림픽공원과 인접해 있어 공원 내의 생활체육시설 및 문화시설을 함께 이용하기에 편리하다.<br><br>
	공원내의 자연학습장은 야생화, 농작물 등이 잘 조성되어 있어 어린이들의 자연학습과 가족나들이 장소로 많이 이용하고 있다.
	특히, 잠실 수중보의 어도(漁道, 물고기길)는 살아있는 한강을 직접 느낄 수 있고 생태프로그램도 운영되고 있어 잠실한강공원의 또 하나의 자랑거리이다.<br><br>
	
	[한국관광공사 : http://api.visitkorea.or.kr ]<br>
	<!-- <a href="#">홈페이지 바로가기</a><br> -->
</div>


</div>





<div class="maparea" align="center" id="move6">
<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 50px">시그니엘 서울 주변 관광지 위치</p>
<div id="map" style="width:800px; height:500px;"></div>
</div>











<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(37.513041, 127.102711), // 지도의 중심좌표
    level: 6 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다



// 롯데월드
//마커가 표시될 위치입니다 
var markerPosition1 = new kakao.maps.LatLng(37.508870, 127.099944);
//마커를 생성합니다
var marker1 = new kakao.maps.Marker({
position: markerPosition1
});
//마커가 지도 위에 표시되도록 설정합니다
marker1.setMap(map);

// 석촌호수
var markerPosition2 = new kakao.maps.LatLng(37.511970, 127.106498);
var marker2 = new kakao.maps.Marker({
position: markerPosition2
});
marker2.setMap(map);

// 한강시민공원
var markerPosition3 = new kakao.maps.LatLng(37.518021, 127.085694);
var marker3 = new kakao.maps.Marker({
position: markerPosition3
});
marker3.setMap(map);

// 올림픽공원
var markerPosition4 = new kakao.maps.LatLng(37.519764, 127.121870);
var marker4 = new kakao.maps.Marker({
position: markerPosition4
});
marker4.setMap(map);

// 롯데타워
var markerPosition5 = new kakao.maps.LatLng(37.513041, 127.102711);
var marker5 = new kakao.maps.Marker({
position: markerPosition5
});
marker5.setMap(map);
/**/






var iwContent = '<div style="padding:5px;">롯데월드타워<br></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
iwPosition = new kakao.maps.LatLng(37.508870, 127.099944); //인포윈도우 표시 위치입니다

//인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
position : iwPosition, 
content : iwContent
});

//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker5); 
</script>

</main>




<jsp:include page="../footer.jsp" flush="false"/>

</body>
</html>