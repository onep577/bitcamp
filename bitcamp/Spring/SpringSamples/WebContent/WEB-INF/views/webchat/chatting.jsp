<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

채팅명 : <input type="text" id="nickname">

<input type="button" id="enterBtn" value="입장" onclick="connect()">

<input type="button" id="exitBtn" value="나가기" onclick="disconnect()">
<br><br>

<h1>대화영역</h1>
<div id="chatArea">
	<div id="chatMessageArea">
	</div>
</div>

<input type="text" id="message">
<input type="button" id="sendBtn" value="전송" onclick="send()">


<script type="text/javascript">
$("#message").keydown(function(key) {
    if (key.keyCode == 13) {
        //alert("엔터키를 눌렀습니다.");
        send();
    }
});



// 웹 소켓 변수
var wsocket;

// 입장 버튼을 클릭했을 때 호출되는 함수
function connect() {
	if(wsocket != undefined && wsocket.readyState != WebSocket.CLOSED) {
		// 이미 소켓이 생성된 경우
		alert("이미 입장하셨습니다");
		return;
	}
	
	// Web Socket 생성
	wsocket = new WebSocket("ws://192.168.0.12:8090/SpringSamples/echo.do");
	alert("wsocket : " + wsocket);
	
	wsocket.onopen = onOpen;
	wsocket.onmessage = onMessage;
	wsocket.onclose = onClose;
}

function disconnect() {
	wsocket.close();
}

// onopen(연결), onmessage(메시지), onclose(끊겼을 때)

function onOpen(evt) {
	appendMessage("연결 되었습니다");
}

// 서버로부터 메시지가 도착했을 때
function onMessage(evt) {
	var data = evt.data;
	if(data.substring(0, 4) == 'msg:') {
		appendMessage(data.substring(4));
	}
}

function onClose() {
	appendMessage("연결이 끊겼습니다");
}

function send() {
	var nickname = $("#nickname").val();
	var msg = $("#message").val();
	
	// 실제 전송 부분
	wsocket.send("msg:" + nickname + ":" + msg);
	$("#message").val("");
}

function appendMessage(msg) {
	// 메시지를 추가하고 개행
	$("#chatMessageArea").append(msg + "<br>");
	
	// 화면을 밑으로 민다
	var chatAreaHeight = $("#chatArea").height();
	var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
	$("#chatArea").scrollTop(maxScroll);
	
}

</script>









