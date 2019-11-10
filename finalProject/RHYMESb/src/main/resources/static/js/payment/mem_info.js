$(document).ready(function () {
	//alert("mem_info.js");
	


	// 비회원으로 결제할 때
	var count = 0; /* 문자 중복을 막기 위한 인증번호 */
	$("#oneselfConfirmBtn").click(function() {
		//alert("본인인증1");
		
		// 난수를 만들어 보낸다
		var number = Math.floor(Math.random() * 100000) + 100000;
		if(number>100000){
			number = number - 10000;
		}
		
		$("#text").val(number);      /* 난수로 생성된 인증번호를 hidden id : text 에 숨긴다 */
		var text = $("#text").val();
		var to = $("#to").val();
		
		if(to == "" || to == null){
			alert("전화번호를 입력해주세요");
		}else {
			var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
			
			if(con_test == true){
				if(count < 3){      /* 추후 데이터베이스에 컬럼 값을 확인하여 count 값을 비교 할 예정 */
					
					//alert("text : " + text + ", to : " + to);
					
					$.ajax({
						url:"/sendsms",
						type:"get",
						data:{
							to: to,
							text: text
					},
					success:function(data){
						//alert("해당 휴대폰으로 인증번호를 발송" + data + " 했습니다");
						count++;
						//alert(count);
					},
					error:function(){
						alert("발송실패");
					}
				});
				
				} else {
					alert("휴대폰 인증 그만하세요");
				}
			}
		}
	});
	
	
	
	// 내가 작성한 번호와 인증번호를 비교한다
	$("#enterBtn").click(function() {
		//alert( $("#text").val() );
		var userNum = $("#userNum").val();
		
		var sysNum = $("#text").val();
		
		if(userNum == null || userNum == ""){
			alert("휴대폰으로 발송된 인증번호를 입력해주세요");
		}else{
			if(userNum.trim() == sysNum.trim()){
				alert("인증 성공");
				$("#text_confirm").val( sysNum );
				$("#b_confirm").text( "인증 성공" );
			}else {
				alert("실패");
			}
		}
	});



});



// 보내는 사람 연락처
function send_phone() {
	alert("보내는 사람 연락처");
}



// 받는 사람 연락처
function receive_phone() {
	alert("받는 사람 연락처");
}


