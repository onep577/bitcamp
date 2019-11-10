$(function () {
	
	$("#ordercheck_confirm_btn").click(function () {
		var code = $("#ordercheck_confirm_payment_code").val();
		var name = $("#ordercheck_confirm_send_name").val();
		
		if(code == "" || name == "") {
			alert("주문번호와 주문자 이름을 확인해주세요");
			return;
		}

		//alert("code : " + code + ", name : " + name);
		
		$.ajax({
			url:"/ordercheck_nomembership_confirm",
			data:"name="+name+"&code="+code,
			success:function(data){
				if(data == "true"){
					location.href="/ordercheck_detail_move?payment_code="+code;
				}else{
					alert("일치하는 주문이 없습니다.\n확인 후  다시 시도해 주십시오.");
				}
			}
		}); // ajax
		
	});
	
});



function ordercheck_detail( payment_code ){
	alert("주문상세보기");
	
	location.href="/ordercheck_detail_move?payment_code="+payment_code;
}



function ordercheck_delivery( payment_code ){
	alert("배송조회");
	window.open("/ordercheck_delivery_popup?payment_code="+payment_code, "window팝업", "width=600, height=750, menubar=no, status=no, toolbar=no");
}



function ordercheck_review( payment_code ){
	alert("상품후기쓰기");
	
	location.href="/ordercheck_review_move?payment_code="+payment_code;
}


