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
	height: 1800px; /* 이걸로 메인에어리어 부분 높이 조정해서 알맞게 쓰기 !! */
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
	background-color: #fafafa;
	margin-top: 50px;
	margin-bottom: 100px;
	height: 200px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
}
.backLocation {
	width: 100%;
	height: 1500px;
	/* background-color: red; */
}
.maparea{
	width: 100%;
	height: 800px;
	margin-top: 100px;
	/* background-color: orange; */
}


.box1 {
	width: 100%;
	height: 400px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	/* background-color: blue; */
	margin-bottom: 100px;
	float: left;
}
.box11 {
	float: left;
	margin-right: 30px;
}
.box2 {
	width: 100%;
	height: 400px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	/* background-color: yellow; */
	margin-bottom: 100px;
	float: left;
}
.box21 {
	float: left;
	margin-right: 30px;
}
.box3 {
	width: 100%;
	height: 400px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	/* background-color: green; */
	margin-bottom: 100px;
	float: left;
}
.box31 {
	float: left;
	margin-right: 30px;
}


span{	/* 객실정보보기 를 span 으로 줘서 마우스 가져갈경우 클릭 모양이 뜨게 */
	cursor: pointer;
}

#ximg{
	cursor: pointer;
}
#gray_div1, #gray_div2, #gray_div3{
	background-color: gray;
	opacity: 0.2;
	width: 100%;
	height: 100%;
	position: fixed;
	display: none;
	
}
</style>

</head>

<body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=663d31a73a34a918bb28760edb2b72f7"></script>


<div id="gray_div1" onclick="closeLayer('layerPop1', 'gray_div1')"></div>
<div id="gray_div2" onclick="closeLayer('layerPop2', 'gray_div2')"></div>
<div id="gray_div3" onclick="closeLayer('layerPop3', 'gray_div3')"></div>

<jsp:include page="../header.jsp" flush="false"/>


<main>





<div class="intro" align="center">
<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 50px">객실</p>
<p>
잠실에서 바라보는 서울 시내의 환상적인 전망이 어루어진 시그니엘서울의 최고급 호텔 사우나, 헬스장, 실내 수영장은 새로운 힐링과 활력의 시간을 제안합니다.<br>
또한 한국 최초의 에비앙 스파는 프리미엄 수분공급을 통해 심신을 치유하는 에비앙 스파만의 특별한 트리트먼트를 제공합니다.<br>
투숙객 전용 라운지에서는 한강 전망을 바라보며 티 타임을 즐기실 수 있습니다.
</p>
</div>



<div class="backLocation">

<div class="box1" align="left">
	<div class="box11">

   	<img alt="" src="/miniProject/image/sweet1.png" style="width: 700px; height: 400px">

	
  </div>



	<p style="font-size: 30px;">스위트</p><br>
	시그니엘서울의 디럭스 스위트 룸은 일반 객실보다 더욱 넓고 쾌적한 공간을 제공하는 객실입니다. 
	시그니엘서울 디럭스 스위트 룸은 침실과 응접실이 공간이 분리되어 있어 편안함과 안정된 휴식을 누리실 수 있는 객실입니다.<br><br>
	
	<!-- 클릭시 openLayer 함수를 실행 하면서 매게변수로 layerPop(사진 3개가 들어있는 다이브 의 id), 그리고 top, left 값을 넘겨준다 -->
	<span onclick="openLayer('layerPop1', 'gray_div1')" style="color: skyblue">객실 상세정보 보기</span>
	
	<div id="layerPop1" style="position:absolute; display:none; border:3px solid #ccc;">
    	<div id="myCarousel1" class="carousel slide" data-ride="carousel"> 


	<!--페이지-->
			<!-- 이거는 부트스트랩 코드입니다. -->
			<div class="carousel-inner">
				<!--슬라이드1-->
				<div class="item active"> 
					<img src="/miniProject/image/ssweet1.png" style="width:1200px; height: 600px;" alt="First slide">
					<div class="container">
						<div class="carousel-caption">
						</div>
					</div>
				</div>
				<!--슬라이드1-->
		
				<!--슬라이드2-->
				<div class="item"> 
					<img src="/miniProject/image/ssweet2.png" style="width:1200px; height: 600px;" data-src="" alt="Second slide">
					<div class="container">
						<div class="carousel-caption">
						</div>
					</div>
				</div>
				<!--슬라이드2-->
				
				<!--슬라이드3-->
				<div class="item"> 
					<img src="/miniProject/image/ssweet3.png" style="width:1200px; height: 600px;" data-src="" alt="Third slide">
					<div class="container">
						<div class="carousel-caption">
						</div>
					</div>
				</div>
				<!--슬라이드3-->
			</div>
			
				<!--이전, 다음 버튼-->
				<a class="left carousel-control" href="#myCarousel1" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
				<a class="right carousel-control" href="#myCarousel1" data-slide="next" style="margin-right: 0px;"><span class="glyphicon glyphicon-chevron-right"></span></a> 
			</div>
	</div>
	
	
	
	</div>



<div class="box2">
	<div class="box21">
	<img alt="" src="/miniProject/image/pri1.png" style="width: 700px; height: 400px">
	</div>
	
	<p style="font-size: 30px;">프리미어</p><br>
	시그니엘서울의 시그니엘 프리미어 룸은 침실과 함께 여유로운 업무 공간이 구비되어 성공적인 비즈니스와 여유로운 휴식을 함께 즐길 수 있는 고급 비즈니스 객실입니다. 
	시그니엘 프리미어룸의 60인치 TV에 장착된 프리미엄 사운드 바는 새로운 경험을 제공해 드립니다.<br><br>
	
	<span onclick="openLayer('layerPop2', 'gray_div2')" style="color: skyblue">객실 상세정보 보기</span>
	
	<div id="layerPop2" style="position:absolute; display:none; border:3px solid #ccc;">
    	<div id="myCarousel2" class="carousel slide" data-ride="carousel"> 
	<!--페이지-->
			<!-- 이거는 부트스트랩 코드입니다. -->
			<div class="carousel-inner">
				<!--슬라이드1-->
				<div class="item active"> 
					<img src="/miniProject/image/prim1.png" style="width:1200px; height: 600px;" alt="First slide">
					<div class="container">
						<div class="carousel-caption">
						</div>
					</div>
				</div>
				<!--슬라이드1-->
		
				<!--슬라이드2-->
				<div class="item"> 
					<img src="/miniProject/image/prim2.png" style="width:1200px; height: 600px;" data-src="" alt="Second slide">
					<div class="container">
						<div class="carousel-caption">
						</div>
					</div>
				</div>
				<!--슬라이드2-->
				
				<!--슬라이드3-->
				<div class="item"> 
					<img src="/miniProject/image/prim3.png" style="width:1200px; height: 600px;" data-src="" alt="Third slide">
					<div class="container">
						<div class="carousel-caption">
						</div>
					</div>
				</div>
				<!--슬라이드3-->
			</div>
			
				<!--이전, 다음 버튼-->
				<a class="left carousel-control" href="#myCarousel2" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
				<a class="right carousel-control" href="#myCarousel2" data-slide="next" style="margin-right: 0px;"><span class="glyphicon glyphicon-chevron-right"></span></a> 
			</div>
	</div>
</div>


<div class="box3">
	<div class="box31" style="font-family: 'Noto Sans KR', sans-serif; font-size: 40px">
	<img alt="" src="/miniProject/image/deluxe1.png" style="width: 700px; height: 400px">
	</div>
	
	<p style="font-size: 30px;">디럭스</p><br>
	우아한 인테리어와 현대적 세련미가 조화롭게 어우러진 시그니엘서울의 그랜드 디럭스 룸은 서울 시내 동급 호텔 대비 넓은 40~50㎡의 여유로운 공간을 제공합니다. 
	87층부터 101층까지 위치한 초고층 객실에서 바라보는 서울 도심의 파노라믹뷰는 최상의 휴식을 제공합니다.
	모든 호텔 투숙객들이 자유롭게 이용할 수 있는 살롱 드 시그니엘은 시그니엘서울의 또 하나의 즐길 거리입니다.<br><br>
	
	<span onclick="openLayer('layerPop3', 'gray_div3')" style="color: skyblue">객실 상세정보 보기</span>
	
	<div id="layerPop3" style="position:absolute; display:none; border:3px solid #ccc;">
    	<div id="myCarousel3" class="carousel slide" data-ride="carousel"> 

	<!--페이지-->
			<!-- 이거는 부트스트랩 코드입니다. -->
			<div class="carousel-inner">
				<!--슬라이드1-->
				<div class="item active"> 
					<img src="/miniProject/image/de1.png" style="width:1200px; height: 600px;" alt="First slide">
					<div class="container">
						<div class="carousel-caption">
						</div>
					</div>
				</div>
				<!--슬라이드1-->
		
				<!--슬라이드2-->
				<div class="item"> 
					<img src="/miniProject/image/de2.png" style="width:1200px; height: 600px;" data-src="" alt="Second slide">
					<div class="container">
						<div class="carousel-caption">
						</div>
					</div>
				</div>
				<!--슬라이드2-->
				
				<!--슬라이드3-->
				<div class="item"> 
					<img src="/miniProject/image/de3.png" style="width:1200px; height: 600px;" data-src="" alt="Third slide">
					<div class="container">
						<div class="carousel-caption">
						</div>
					</div>
				</div>
				<!--슬라이드3-->
			</div>
			
				<!--이전, 다음 버튼-->
				<a class="left carousel-control" href="#myCarousel3" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
				<a class="right carousel-control" href="#myCarousel3" data-slide="next" style="margin-right: 0px;"><span class="glyphicon glyphicon-chevron-right"></span></a> 
			</div>
	</div>
</div>

</div>
</div>





</main>

<script type="text/javascript">


//레이어 팝업 열기
var cnt = 0;
function openLayer(IdName, Divname){
  if(cnt==0){
	cnt++;
	var pop = document.getElementById(IdName);
	var Gdiv = document.getElementById(Divname);
	/* show 랑 같다고 보시면 됩니다. */
	pop.style.display = "block";
	Gdiv.style.display = "block";
	/* 이 2개는 어디서 시작할지 좌표값 top, left 값 px 로 설정한거 입니다. */
	pop.style.position = "fixed";
	pop.style.top = "18%";
	pop.style.left = "18%";
  }
}
//레이어 팝업 닫기
function closeLayer(IdName, Divname){
	var pop = document.getElementById(IdName);
	var Gdiv = document.getElementById(Divname);
	/* hide랑 같은 원리 */
	pop.style.display = "none";
	Gdiv.style.display = "none";
	cnt=0;
}	




</script>


<jsp:include page="../footer.jsp" flush="false"/>

</body>
</html>