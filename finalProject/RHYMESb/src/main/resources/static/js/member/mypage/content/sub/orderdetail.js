/**
 * 
 */

$(function(){
	// ajax 통신을 위한 csrf 설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
	
	//모든상품 담기 버튼 클릭 이벤트
	$("#_addAllToBasket").click(function(){		
		var $items = $(".s_seq_number");
		var itemArr = new Array();
		var userid = $("#_curr_user_id").val();

		for( i = 0 ; i < $items.length ; i++){
			itemArr.push({ id : userid, stock_seq : $items.eq(i).val() , p_quantity : 1 });
		}		
		saveItems(itemArr);
	});
	
	//주문취소 버튼 클릭 이벤트
	$("#_canceOrder").click(function(){
		var result = confirm('주문을 취소하시겠습니까?');
		if( result ){
			cancelOrder();
		}
	});
	
	//푸터 간격 조절
	adjustFooterHeight();
});

//개별 물품 1건 장바구니 저장
function saveOneItemToBasket(userid, seq){	
	// 배열 초기화
	var itemArr = new Array();
	itemArr.push({ id : userid, stock_seq : seq , p_quantity : 1 });

	saveItems(itemArr);
}

//Ajax 통신을 통해 장바구니 배열 저장
function saveItems(itemArr){
	$.ajax({
		contentType : 'application/json',
		dataType : 'json',
		url : '/mypage/orderlog/detail/addtobasket',
		type : 'post',
		async : false,
		data : JSON.stringify(itemArr),
		success : function( resp ) {
			var result = resp + '';
			if(result === '1'){
				alert('장바구니 저장 성공.');
			}else{
				alert('장바구니 저장 실패. 고객센터로 문의하세요.');
			}			
		},
		error : function() {
			alert('오류 발생. 고객센터로 문의하세요.');
		}
	});
}

//Ajax 통신을 통해 전체 상품 취소
function cancelOrder(){
	var paymentCode = $("#_payment_code").text();
	console.log(paymentCode);
	
	$.ajax({
		contentType : 'application/json',
		dataType : 'json',
		url : '/mypage/orderlog/detail/cancelorder',
		type : 'post',
		async : false,
		data : paymentCode,
		success : function( resp ) {
			var result = resp + '';
			if(result === '1'){
				alert('주문 취소 성공.');
				location.href='http://192.168.0.14:18080/mypage/orderlog';
			}else{
				alert('주문 취소 실패. 고객센터로 문의하세요.');
			}			
		},
		error : function() {
			alert('오류 발생. 고객센터로 문의하세요.');
		}
	});
}

//푸터 간격 조절 함수
function adjustFooterHeight(){
	//console.log('푸터조절');
	var lastWrap = $(".orderdetail_delivery_info_wrap");
	//var contentH = $(".mypage_middle_content_template").css('height');
	var contentH = lastWrap.offset().top + lastWrap.height();
	//console.log(contentH + ' ' + (contentH/2));
	$("#footer_wrap_mypage").css('top', (contentH/1.4) + 'px');
}