/**
 * 
 */



var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

$(function() {
	
	//성별 초기값 선택
	var gen = $("#origin_gender").val();
	console.log("gen:"+gen);
	switch(gen){
		case 'male' : $("#_gen_male").attr('checked', 'checked'); break;
		case 'female' : $("#_gen_female").attr('checked', 'checked'); break;
		case 'none' : $("#_gen_none").attr('checked', 'checked'); break;
		default: break;
	}
	
	//포커스 또는 키다운 이벤트 발생 시 invalid경고 제거
	$("input").focus(function(){$(this).removeClass("is-invalid");});
	$("input").keydown(function(){$(this).removeClass("is-invalid");});
	
	// 확인버튼 클릭 이벤트
	$("#_btn_confirm_mem").click(function() {
		pwChk();
	});

	//비밀번호 확인 이벤트(invalid)
	$("#_userpwConfirm").on('keyup focusout',function(){
		chkPws();
	});
	
	//input에 변화가 생기면 저장버튼 활성화
	$("input").on('keyup change focusout', function(){
		//$("#_btn_save_modified_info").removeAttr('disabled');
		chkValues();
	}); 
	
	//회원탈퇴 관련
	$("#_txt_leave_confirmpw").keyup(function(){
		if( $(this).val().trim().length > 3 ){
			$("#_btn_leave_confirm").removeAttr('disabled');
		}
	});
	$("#_btn_leave_confirm").click(function(){
		leavePwChk();
	});
	
	//회원탈퇴 모달 폼 로드완료하면 input으로 포커스 이동
	$('#_leave_confirm').on('shown.bs.modal', function (event) {
		  $("#_txt_leave_confirmpw").focus();
	});
});

//회원정보수정 폼 데이터 변경시 valid-invalid 검증
function chkValues(){
	chkPws();
	var invalidInputs = $(".confirm_frm_wrap .is-invalid").length;
	console.log(invalidInputs);
	if( invalidInputs > 0 ){
		$("#_btn_save_modified_info").attr('disabled', 'disabled');
	}else{
		$("#_btn_save_modified_info").removeAttr('disabled');
	}
}

function chkPws(){
	var pw1 = $("#_userpw").val();
	var pw2 = $("#_userpwConfirm").val();
	if( (pw1 === pw2) === false ){
		$("#_userpwConfirm").addClass('is-invalid');
	}else{
		$("_userpwConfirm").removeClass('is-invalid');
	}
}

function frm_leave(e){
	if(e.keyCode==13 && e.srcElement.type != 'textarea'){
		leavePwChk();
	}
}

function pwChk(){
	// ajax 통신을 위한 csrf 설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});

	//폼 직렬화 설정
	var queryString = $("form[name=frm_confirm_mem]").serialize() ;
	    
	$.ajax({
		contentType : 'application/json',
		dataType : 'json',
		url : ctx + '/personal/confirmpw',
		type : 'post',
		async : false,
		data : queryString,
		success : function( resp ) {
			console.log('성공' + resp.result);
			
			if( resp.result === '1'){
				$(".confirm_frm_wrap").remove();
				$(".confirm_wrap").append('<div class="frm_personalform"></div>');
				
				//파라미터 추가
				var memInfo = '';
				$.each(resp, function(index, item){
					console.log('index:' + index + ' , item:' + item);
					memInfo += index + '=' + item + '&';
				});
				console.log(memInfo);
				$(".frm_personalform").load('/mypage/personalform', memInfo);
				
			}else{
				$("#_input_pw").addClass("is-invalid");
			}
		},
		error : function() {
			console.log('실패');
		}
	});

}

//회원탈퇴 작업 시 비밀번호 재확인
function leavePwChk(){
	// ajax 통신을 위한 csrf 설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});

	//폼 직렬화 설정
	var queryString = $("form[name=frm_leave_confirm]").serialize() ;	
	    
	$.ajax({
		contentType : 'application/json',
		dataType : 'json',
		url : ctx + '/personal/leave/confirmpw',
		type : 'post',
		async : false,
		data : queryString,
		success : function( resp ) {
			console.log('성공' + resp.result);
			
			if( resp.result === '1'){
				$.ajax({
					contentType : 'application/json',
					dataType : 'json',
					url : '/logout',
					type : 'post',
					async : false,
					data : queryString,
					success : function( resp ) {
						alert('회원 탈퇴가 정상적으로 처리되었습니다.');
						location.href='/main';
					},
					error : function() {
						alert('회원 탈퇴가 정상적으로 처리되었습니다.');
						location.href='/main';
					}
				});
			}else{
				$("#_txt_leave_confirmpw").addClass("is-invalid");
			}
		},
		error : function() {
			console.log('실패');
		}
	});
}

