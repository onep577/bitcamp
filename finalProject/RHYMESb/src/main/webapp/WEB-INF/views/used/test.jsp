<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<button type="button" id="btn">클릭해보세요</button>

<button type="button" id="btn2">상품등록 창</button>

<button type="button" id="btn3">상품 리스트 창</button>

<script type="text/javascript">

$("#btn2").click(function() {
	location.href="usedwrite";
});

$("#btn3").click(function() {
	location.href="usedlist";
});


$('#btn').click(function(event){  //버튼을 클릭 했을시 popupOpen 함수 출력 
    console.log('click');
    popupOpen();	//Popup Open 함수
});

function popupOpen(){
	var url= "popup";    //팝업창 페이지 URL
	var winWidth = 600;
    var winHeight = 600;
    
    var popupX = (window.screen.width / 2) - (580 / 2);
 	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

 	var popupY= (window.screen.height / 2) - (700 / 2);
 	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
    
    
    var popupOption= "width="+winWidth+", height="+winHeight + ", left="+ popupX + ", top="+ popupY;    //팝업창 옵션(optoin)
	window.open(url,"",popupOption);
}

/* function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
	      alert(position.coords.latitude + ' ' + position.coords.longitude);
	    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: false,
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } else {
	    alert('GPS를 지원하지 않습니다');
	  }
	}
	getLocation(); */

</script>
</body>


</html>