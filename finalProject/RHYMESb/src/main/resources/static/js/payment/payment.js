$(document).ready(function () {
	//alert("payment.js");
	var constraints = true;
		
});



function func_constraints(){
	//alert("제약조건");
	
	if($("#text_confirm").val() == "" ){
		alert("본인인증을 해주세요");
		$("#to").focus();
		constraints = false;
		$("input[name='payment_method']").removeAttr("checked"); // 전체해제하기
		return;
	}
	
	if($("#send_name").val() == "" ){
		alert("주문하는 분 이름을 입력해주세요");
		$("#send_name").focus();
		constraints = false;
		$("input[name='payment_method']").removeAttr("checked"); // 전체해제하기
		return;
	}
	
	if($("#send_phone1").val() == "" || $("#send_phone2").val() == "" || $("#send_phone3").val() == "" ){
		alert("주문하는 분 번호를 입력해주세요");
		$("#send_phone1").focus();
		constraints = false;
		$("input[name='payment_method']").removeAttr("checked"); // 전체해제하기
		return;
	}
	
	if($("#send_email").val() == "" ){
		alert("이메일을 입력해주세요");
		$("#send_email").focus();
		constraints = false;
		$("input[name='payment_method']").removeAttr("checked"); // 전체해제하기
		return;
	}
	
	if($("#sample6_address").val() == "" ){
		alert("배송지를 입력해주세요");
		$("#sample6_postcode").focus();
		constraints = false;
		$("input[name='payment_method']").removeAttr("checked"); // 전체해제하기
		return;
	}
	
	if($("#receive_name").val() == "" ){
		alert("수취인을 입력해주세요");
		$("#receive_name").focus();
		constraints = false;
		$("input[name='payment_method']").removeAttr("checked"); // 전체해제하기
		return;
	}

	if($("#receive_phone1").val() == "" || $("#receive_phone2").val() == "" || $("#receive_phone3").val() == "" ){
		alert("연락처를 입력해주세요");
		$("#receive_phone1").focus();
		constraints = false;
		$("input[name='payment_method']").removeAttr("checked"); // 전체해제하기
		return;
	}
	
	if($("input[name='payment_method']:checked").val() == null){
		alert("결제수단을 선택해주세요");
		constraints = false;
		return;
	}
	constraints = true;
}



// 결제 API
function paymens(){
	//alert("결제");
	
	// api로 보낼 데이터
	var radioVal = $("input[name='payment_method']:checked").val();
	var totalprice = $("#_totalprice").text();
	var send_name = $("#send_name").val();
	var send_phone = $("#send_phone1").val() + "-" + $("#send_phone2").val() + "-" + $("#send_phone3").val();
	var send_email = $("#send_email").val();
	var receive_postnum = $("#sample6_postcode").val();
	var receive_address = $("#sample6_address").val() + " " + $("#sample6_detailAddress").val();
	

	
	// 제약조건 - 필수조건을 입력하지 않으면 alert창을 띄우고 포커스 가게 한다
	func_constraints();
	if(constraints == false){
		return;
	}else{

	}

	$("#add_point").val( parseInt( $("#add_point").val() ) );
	
	$("#disc_coupon").val( parseInt($("#_disc_coupon").text()) );
	$("#disc_point").val( parseInt($("#_disc_point").text()) );
	
	$("#send_phone").val( $("#send_phone1").val() + "-" + $("#send_phone2").val() + "-" + $("#send_phone3").val() );
	$("#receive_phone").val( $("#receive_phone1").val() + "-" + $("#receive_phone2").val() + "-" + $("#receive_phone3").val() );
	
	
	
	var IMP = window.IMP; // 생략가능
	IMP.init("imp50599923");  // 가맹점 식별 코드

	IMP.request_pay({
	    pg : "html5_inicis",
	    pay_method : radioVal,
	    merchant_uid : "merchant_" + new Date().getTime(),
	    name : "RHYMESb 구매",
	    amount : totalprice,
	    buyer_name : send_name,
	    buyer_tel : send_phone,
	    buyer_email : send_email,
	    buyer_addr : receive_address,
	    buyer_postcode : receive_postnum
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = "결제가 완료되었습니다.";
	        msg += "\n고유ID : " + rsp.imp_uid;
	        msg += "\n상점 거래ID : " + rsp.merchant_uid;
	        msg += "\n결제 금액 : " + rsp.paid_amount + "원";
	        msg += "\n카드 승인번호 : " + rsp.apply_num;
	        msg += "\n결제상황 : " + rsp.status;
	        msg += "\n결제수단 : " + rsp.pay_method;
	        msg += "\n가상계좌 : " + rsp.vbank_num;
	        
	        
	        
	        // api에서 받은 데이터를 다시 넣는다 왜? submit 하려고
	        $("#payment_code").val( rsp.imp_uid );
	        $("#receipt_url").val( rsp.receipt_url );
	        $("#vbank_num").val( rsp.vbank_num );
	        $("#vbank_name").val( rsp.vbank_name );
	        $("#vbank_date").val( rsp.vbank_date );
	        $("#vbank_holder").val( rsp.vbank_holder );
	        $("#card_apply_num").val( rsp.apply_num );
	        $("#payment_status").val( rsp.status );
	        $("#receive_address").val( rsp.buyer_addr );
	        $("#totalprice").val( rsp.paid_amount );

	        
	        
	        $("#payment_frm").attr("action", "/paymentAf").submit();
	    } else {
	        var msg = "결제에 실패하였습니다.";
	        msg += "\n에러내용 : " + rsp.error_msg;
	    }

	    //alert(msg);
	});
}


