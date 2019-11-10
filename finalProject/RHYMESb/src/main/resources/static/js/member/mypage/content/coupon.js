/**
 * 
 */

var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

$(function() {

	// ajax 통신을 위한 csrf 설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});

	// 쿠폰등록 버튼 클릭 이벤트
	$("#_btn_regi_new_coupon").click(function() {
		
		// 배열 초기화
		var viewData = {};
		// data[키] = 밸류
		viewData["coup_code"] = $("#_txt_coupon_input").val().trim();	

		$.ajax({
			contentType : 'application/json',
			dataType : 'json',
			url : ctx + '/coupon/regicoupon',
			type : 'post',
			async : false,
			data : JSON.stringify(viewData),
			success : function( resp ) {
				
				var result = resp;
				console.log(result);
				if( result === 0 ){
					alert('잘못된 쿠폰번호입니다. 다시 확인해 주세요.');
				}else if ( result === 1 ){
					alert('쿠폰 적용 완료.');
					location.reload();
					//location.href= ctx + '/coupon#_mypage_top';
					return;
				}else{
					alert('쿠폰 등록 오류. 고객센터로 문의하세요.');
				}
				
			},
			error : function() {
				alert('쿠폰 등록 오류. 고객센터로 문의하세요.');
			}
		});
	});

});

//사용됐거나 만료된 쿠폰을 리스트에서 삭제
function deleteCouponInList(seq){
	// 배열 초기화
	var viewData = {};
	// data[키] = 밸류
	viewData["seq"] = seq;	

	$.ajax({
		contentType : 'application/json',
		dataType : 'json',
		url : ctx + '/coupon/deleteone',
		type : 'post',
		async : false,
		data : JSON.stringify(viewData),
		success : function( resp ) {
			var result = resp;
			if( result === 1 ){
				alert('삭제 완료.');
				location.href= ctx + '/coupon#_mypage_top';
				return;
			}else{
				alert('오류 발생. 고객센터로 문의하세요.');
			}
		},
		error : function() {
			alert('오류 발생. 고객센터로 문의하세요.');
		}
	});
}