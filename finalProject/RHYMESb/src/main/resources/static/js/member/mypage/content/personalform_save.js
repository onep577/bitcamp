/**비밀번호 확인 후 회원정보 수정 폼
 * 
 */
$(function(){
	//수정된 정보 저장
	$("#_btn_save_modified_info").click(function(){
		saveModifiedInformation();
	})
});


//_frm_mypage_personal에서 수정한 정보를 DB에 저장하기 위한 ajax 통신 설정
function saveModifiedInformation(){
	// ajax 통신을 위한 csrf 설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
	
	//세분화된 요소들 통합 및 정리
	var phoneNum = $("#_phone_1").val().trim() + $("#_phone_2").val().trim() + $("#_phone_3").val().trim();
	$("#_phone").val(phoneNum);
	var birthDay = $("#_birth_txt_1").val().trim() + $("#_birth_txt_2").val().trim() + $("#_birth_txt_3").val().trim();
	$("#_birth").val(birthDay);
	

	//폼 직렬화 설정
	var queryString = $("form[name=frm_mypage_personal]").serialize() ;	
	    
	$.ajax({
		contentType : 'application/json',
		dataType : 'json',
		url : ctx + '/personal/modinfo',
		type : 'post',
		async : false,
		data : queryString,
		success : function( resp ) {
			console.log('성공' + resp.result);
			
			if( resp.result === '1'){
				$("#_btn_save_modified_info").attr('disabled', 'disabled');
				alert('저장되었습니다.');
			}else{
				alert('저장 중 에러 발생. 다시 시도해 주세요.');
			}
		},
		error : function() {
			console.log('실패');
		}
	});
}