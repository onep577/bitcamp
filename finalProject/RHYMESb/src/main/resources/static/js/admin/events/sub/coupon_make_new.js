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
	
	//모달 show 이벤트
	$(document).on('show.bs.modal','#_coupon_make_new', function () {
		//빈칸 검사 + 저장버튼활성화
		checkInputData();
		
		//저장버튼 클릭 이벤트 - Ajax통신을 통해 값 저장
		$("#_save_coup_detail_info").click(function(){
			makeNewCoupon();
		});
		
		//적립은 % 선택 불가하도록 설정
		$("#_coup_function_func, #_coup_function_func_measure").change(function(){
			changeConditions();
		});
	});	
	
});

//빈칸 검사
function checkInputData(){
	$("#_coup_detail_info .form-control").on('change keyup',function(){
		var value = $(this).val();
		if( value === '' || value === null ){
			$(this).removeClass('is-valid');
			$(this).addClass('is-invalid');
		}else{
			$(this).removeClass('is-invalid');
			$(this).addClass('is-valid');
		}
		checkSaveBtnEnable();	//저장버튼 활성화 가능여부 검사
		checkFuncMeasure();		//값 유효성 검사
	});
}

//저장버튼 활성화 가능여부 검사
function checkSaveBtnEnable(){
	var $validatedTags = $("#_coup_detail_info .is-valid");
	if($validatedTags.length > 6){
		$("#_save_coup_detail_info").removeAttr('disabled');
	}else{
		$("#_save_coup_detail_info").attr('disabled','disabled');
	}
}

//금액은 10만원 이하, %는 100이하, 적립은 % 불가
function checkFuncMeasure(){
	$("#_coup_function_func_num").on('keyup change', function(){
		var value = $(this).val();
		if( '%' === $("#_coup_function_func_measure").val() ){
			if( value < 0 || value > 100 ){
				$("#_measure_feedback").text('할인율은 0~100 사이의 정수만 가능합니다.');
				$("#_coup_function_func_num").removeClass('is-valid');
				$("#_coup_function_func_num").addClass('is-invalid');
			}else{
				$("#_coup_function_func_num").removeClass('is-invalid');
				$("#_coup_function_func_num").addClass('is-valid');
			}
		}else{
			if( value < 0 || value > 100000 ){
				$("#_measure_feedback").text('할인/적립 금액은 0~100,000 사이의 정수만 가능합니다.');
				$("#_coup_function_func_num").removeClass('is-valid');
				$("#_coup_function_func_num").addClass('is-invalid');
			}else{
				$("#_coup_function_func_num").removeClass('is-invalid');
				$("#_coup_function_func_num").addClass('is-valid');
			}
		}
	});
}

//적립은 % 선택 불가하도록 설정
function changeConditions(){
	var func = $("#_coup_function_func").val();
	var meas = $("#_coup_function_func_measure").val();
	if( func === '적립' && meas === '%' ){
		alert('적립 쿠폰은 % 선택이 불가합니다.');
		$("#_coup_function_func").val('적립');
		$("#_coup_function_func_measure").val('원');
	}
}

//저장버튼 클릭 이벤트 - Ajax통신을 통해 값 저장
function makeNewCoupon(){
	var $validatedTags = $("#_coup_detail_info .is-valid");
	
//	$.each($validatedTags, function(i, e){
//		console.log(i + ' , ' + e.value);
//	});
	
	var viewData = new Map();
	
	//DTO 컬럼 이름
	var dtoArr = ["title", "sub_title", "app_cate", "func_time_limit", "func", "func_num", "func_measure"];
	
	//viewData에 값 설정
	$.each($validatedTags, function(i, e){
		viewData[dtoArr[i]] = e.value;
	});
	
	$.ajax({
		contentType : 'application/json',
		dataType : 'json',
		url : '/admin/mypage/coupon/makenew',
		type : 'post',
		async : false,
		data : JSON.stringify(viewData),		
		success : function(data) {
			console.log('success : ' + data);
			if( data === '1' || data === 1){
				alert('저장 성공.');
				location.reload();
				return true;
			}else{
				alert('저장 실패.');
			}
		},
		error : function(err) {
			console.log('connect eror');
		}
	});
}