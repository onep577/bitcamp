<%@page import="dto.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="/miniProject/js/jquery.min.js"></script>

<style type="text/css">
.auto_input_msg, .input_msg{
	background: aqua;
	width: fit-content;
	height: auto;
	margin-left: auto;
	margin-right: 10px;
	margin-top: 5px;
	border-radius: 10px;
	border-top-right-radius: 0;
}

.select_msg, .on_msg{
	background: #fff;
	width: fit-content;
	height: auto;
	margin-right: auto;
	margin-left:10px;
	margin-top: 5px;	
	border-radius: 10px;
	border-top-left-radius: 0;
	padding:10px;
}

.server_ment {
	padding: 10px;
	
}
.server_ment p{
	margin: 0;
	
}

.msg_box {
	text-align: center;
	margin: 0;
	padding: 10px;
	
}


#chat_writeserver_msg {
	display: none;
    width: 100%;
    right: 0;
    bottom: 0;
    line-height: 100px;
    position: fixed;
    padding: 0.5em;
    /* 
    float: left;	
    background-color: #333;
 */
}
#inputMessage {
	line-height: 80px;
	width: 80%;	
}
</style>

<title>라이브챗</title>
</head>
<body style="background-color: #f1f1f1">

<%
CustomerDto user = (CustomerDto)session.getAttribute("login");
request.setAttribute("_user", user);
%>




<jsp:include page="chat_header.jsp" flush="false"/>
<div id="chat_div1" > <!-- style="overflow: auto; height: auto;" -->
	
	<div style="height:500px;">
		<div id="content" style="width:100%; height: 80%; overflow: auto;">
				
		</div>
		
		<div id="chat_writeserver_msg" align="center">	
			<input id="inputMessage" type="text">
			<input type="submit" value="보내기" onclick="send()" style = "line-height: 80px; width:15%;">		
		</div>
	</div>	
</div>



	

<%-- <jsp:include page="chat_footer.jsp" flush="false"/> --%>

	

<script type="text/javascript">


function scrolldown() {
	 var elem = document.getElementById('content');
	 elem.scrollTop = elem.scrollHeight;
}
/* 
아예 하단 고정
window.setInterval(function() {
	  var elem = document.getElementById('content');
	  elem.scrollTop = elem.scrollHeight;
	}, 0);
 */	
	
/*
var divdiv = document.getElementById("content");
divdiv.scrollTop = divdiv.scrollHeight + 2000; 

$(document).ready(function() {
	$('#content').scrollTop( $('#content').prop('scrollHeight'));
});
*/





//소켓생성
var webSocket;	
   
    var inputMessage = document.getElementById('inputMessage');	//입력하는 내용
    var output =  document.getElementById('content');
    var ptag = document.createElement('p');
	var info_div = document.createElement('div');
	
		
		
	// jsp 도큐멘트 시작시 자동실행
	$(document).ready(function() {
		
		var info_div = document.createElement('div');
		info_div.className = 'server_ment';
		info_div.innerHTML = '<p class="mentp"/>안녕하세요 고객님. 시그니엘 호텔입니다. 문의유형을 선택하세요.';		
		output.appendChild(info_div);		
		
		var select_div = document.createElement('div');
	    select_div.className = 'select_msg';
	    select_div.innerHTML = 
	    	'<input type="button" name="btn1" value="호텔이용문의"/>\
	        <input type="button" name="btn1" value="호텔주변안내" />\
	        <input type="button" name="btn1" value="객실예약" />\
	        <input type="button" name="btn1" value="멤버십" />\
	        <input type="button" name="btn1" value="상담사연결" />';
	    
	     output.appendChild(select_div);
	    
	});
	
	
	// 
	function next_msgdiv( ob ) {
		//alert(ob);
		
		info_div = document.createElement('div');
	    info_div.className = 'auto_input_msg';
	    info_div.id = 'auto_input_msg';
	    info_div.innerHTML = "\n<p class='msg_box'\>" + ob + "\n";
	    document.getElementById('content').appendChild(info_div);	
		
	    
		/* 
		ptag = document.createElement('p');
	    ptag.className = 'usertext';
		ptag.innerHTML += "\n상대 : " + ob + "\n";
		document.getElementById('content').appendChild(ptag);
		*/
	}
	
	
	
	
	function next_selectdiv( ob ) {
		
		if(ob == '호텔이용문의'){
						
			info_div = document.createElement('div');
		    info_div.className = 'select_msg';
		    info_div.innerHTML = '<p name="p1"/>호텔이용문의입니다.';
		    info_div.innerHTML += 
		    	'<input type="button" name="btn1" value="오시는길" />\
		        <input type="button" name="btn1" value="주차" />\
		        <input type="button" name="btn1" value="객실이용문의" />\
		        <input type="button" name="btn1" value="연락처" />\
		        <input type="button" name="btn1" value="이전">\
		        <input type="button" name="btn1" value="홈">\
		        <input type="button" name="btn1" value="상담사연결">';
		     
		    output.appendChild(info_div); 
		        
		}
		else if(ob == '호텔주변안내'){
			info_div = document.createElement('div');
		    info_div.className = 'select_msg';
		    info_div.innerHTML = '<p name="p1"/>호텔 주변 안내입니다.';
		    info_div.innerHTML += 
		    	'<input type="button" name="btn1" value="롯데월드타워" />\
		        <input type="button" name="btn1" value="올림픽공원" />\
		        <input type="button" name="btn1" value="석촌호수" />\
		        <input type="button" name="btn1" value="롯데월드" />\
		        <input type="button" name="btn1" value="잠실 한강공원">\
		        <input type="button" name="btn1" value="전체보기">'; 
		       
		    output.appendChild(info_div); 
		}
		else if(ob == '객실예약'){
			info_div = document.createElement('div');
		    info_div.className = 'select_msg';
		    info_div.innerHTML = '<p name="p1"/>객실예약 문의 입니다.';
		    info_div.innerHTML += '<p name="p1"/>객실예약은 예약페이지에서 예약가능하며, ';
		    info_div.innerHTML += 
		    	'<input type="button" name="btn1" value="객실요금" />\
		    	<input type="button" name="btn1" value="객실예약 바로가기">\
		        <input type="button" name="btn1" value="홈">\
		        <input type="button" name="btn1" value="상담사연결">';
		       
		    output.appendChild(info_div); 
		}
		else if(ob == '멤버십'){
			info_div = document.createElement('div');
		    info_div.className = 'select_msg';
		    info_div.innerHTML = '<p name="p1"/>멤버십 문의 입니다.';
		    info_div.innerHTML += 
		    	'<input type="button" name="btn1" value="등급별 혜택" />\
		        <input type="button" name="btn1" value="등급 상향 조건" />\
		        <input type="button" name="btn1" value="홈">\
		        <input type="button" name="btn1" value="상담사연결">';
		       
		    output.appendChild(info_div); 
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		else if( ob == '상담사연결') {		
			info_div = document.createElement('div');
		    info_div.className = 'server_ment';
		    info_div.innerHTML = '<p name="p1"/>상담연결을 진행중입니다. 잠시만 기다려 주세요.';
		    document.getElementById('content').appendChild(info_div); 
		    
		    
			// 웹소캣 연결 - 상담사 채팅시작
			   	webSocket = new WebSocket('ws://192.168.0.55:8090/miniProject/broadcasting');
				alert("webSocket 생성 == " + webSocket);
				
				webSocket.onerror = function(event) {
				  onError(event)
				  console.log(event);
				};
				
				webSocket.onopen = function(event) {
				  onOpen(event)
				};
				
				webSocket.onmessage = function(event) {
				  onMessage(event)
				};			 
				
				// websocket 연결
				function onOpen(event) {
					
				    //textarea.value += "연결 성공\n";
					alert("웹소켓 연결 성공");
					
					var info_div = document.createElement('div');
					info_div.className = 'server_msg';
					info_div.innerHTML = '<p name="p1"/>안녕하세요? <%=user.getName() %> 고객님';
					info_div.innerHTML += '<p name="p1"/>무엇을 도와 드릴까요?';
					document.getElementById('content').appendChild(info_div); 
					
					$("#chat_writeserver_msg").show();
					
				   
				}
				
				// websocket 연결 오류
				function onError(event) {
				  alert(event.data);
				  alert("웹소켓 연결 실패");
				}
				
				// 외부에서 메세지 input했을때 
				function onMessage(event) { 		
					var info_div = document.createElement('div');
				    info_div.className = 'on_msg';
				    info_div.innerHTML = "\n<p align='right' class='msg_box'\>" + event.data + "\n";
				    document.getElementById('content').appendChild(info_div);
				    setTimeout(scrolldown, 0);
			}		
			
		}
		else if( ob == '이전') {		
			$("div").after(data);
		}
		else if( ob == '홈') {		
			window.location.href = window.location.href;
		}
	}
	
	function remove_server_msg() {	
	    document.getElementById('content').removeChild( input.parentNode );
	}
	

	// server에서 메세지 전송시 실행함수
	//  - userid를 통해 auth테이블 값이 0,1 에 따라 class remove, append를 하여 div align을 서버와 유저 구분해줘야한다
	function send() {
		alert("웹소켓 input메세지 : " + inputMessage.value );
		
		var info_div = document.createElement('div');
	    info_div.className = 'input_msg';
	    info_div.innerHTML = "\n<p align='right' class='msg_box'\>" + inputMessage.value + "\n";
		document.getElementById('content').appendChild(info_div);	
	    
		setTimeout(scrolldown, 0);
		
	   	webSocket.send(inputMessage.value);
	    inputMessage.value = "";
	     
	}
var data = null;
$(document).on("click","input[name='btn1']",function() {		
		
	alert("버튼클릭");
	
	var ob = $(this).val();
	//var row = $(this.parentNode).val();
	
	
	//alert(row);
	
	
	$(this).parent().remove();
	
	//data = $(this).parent().detach();
	
	// 선택유형을 상대방 메세지로 표현
	setTimeout(next_msgdiv, 0, ob);
	
	// 선택유형의 next div 호출
	setTimeout(next_selectdiv, 1000, ob);
		
});	
	

</script>
</body>
</html>