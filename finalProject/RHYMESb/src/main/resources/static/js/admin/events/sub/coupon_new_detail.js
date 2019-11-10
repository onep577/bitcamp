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
	
	//새 쿠폰번호 추가 모달 쇼 이벤트
	$("#_coupon_new_details_modal").on('show.bs.modal', function(){
		var coupTitle = $(".coupon-info-row").children().eq(0).text();
		var coupTotalAmount = $("#_this_total_size").val();
		$("#_c_seq").val($("#_this_c_seq").val());
		$(".curr-coup-name").text(coupTitle);
		$(".curr-coup-amount").text(coupTotalAmount);
	});
	
	//쿠폰 수 선택 이벤트
	$("#_coup_amount_select").change(function(){
		var val = $(this).val();
		
		if( val === '0' ){//직접입력을 선택한 경우
			$("#_coup_amount_num").attr('type','number');
			return false;
		}else if( val != '' ){//선택한 경우
			$("#_newcoup_btn_save").removeAttr('disabled');
		}else{
			$("#_newcoup_btn_save").attr('disabled','disabled');
		}
		$("#_coup_amount_num").attr('type','hidden');
	});
	
	//쿠폰 수 직접입력시
	$("#_coup_amount_num").keyup(function(){
		var num = parseInt($(this).val());
		if( num < 0 || num > 1000 ){
			alert('1개부터 1000개까지 발행 가능합니다.');
			$(this).val(1000);
			return false;
		}
		$("#_newcoup_btn_save").removeAttr('disabled');
	});
	
	//새 쿠폰 저장 버튼
	$("#_newcoup_btn_save").click(function(){
		if( $("#_coup_amount_select").val() === '0' ){
			$("#_coup_amount_select .custom-num").val( parseInt($("#_coup_amount_num").val()) );
		}
		generateNewCouponCodes();
	});
	
	//쿠폰디테일 행 클릭 이벤트(쿠폰발행정보, 사용정보 등)
	$(".coupon_detail_row").click(function(){
		
	});
});

//Ajax 통신을 통해 새 쿠폰 발행
function generateNewCouponCodes(){
	// 배열 초기화
	var viewData = {};
	// data[키] = 밸류
	viewData["c_seq"] = $("#_c_seq").val();
	viewData["amount"] = $("#_coup_amount_select").val();
			
	$.ajax({
		contentType : 'application/json',
		dataType : 'json',
		url : '/admin/mypage/coupon/detail/generate',
		type : 'post',
		async : false,
		data : JSON.stringify(viewData),
		success : function( resp ) {				
			if(resp === 1){
				alert( $("#_coup_amount_select").val() + '개 발행이 완료되었습니다.');
				location.reload();
			}else{
				alert('저장에 실패했습니다. 다시 시도해 주세요.');
			}
		},
		error : function() {
			alert('저장 오류.');
		}
	});
}