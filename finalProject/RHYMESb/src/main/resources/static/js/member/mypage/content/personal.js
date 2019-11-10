/**
 * 
 */



var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

$(function() {
	$("#_input_pw").focus();
	
	$("#_input_pw").focus(function(){
		$("#_input_pw").removeClass("is-invalid");
	});
	
	// 확인버튼 클릭 이벤트
	$("#_btn_confirm_mem").click(function() {
		pwChk();
	});	
});

function frm_ent(e){
	if(e.keyCode==13 && e.srcElement.type != 'textarea'){
		pwChk();
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
			//console.log('성공' + resp.result);
			
			if( resp.result === '1'){
				$(".confirm_frm_wrap").remove();
				$(".confirm_wrap").append('<div class="frm_personalform"></div>');
				
				//파라미터 추가
				var memInfo = '';
				$.each(resp, function(index, item){
					//console.log('index:' + index + ' , item:' + item);
					memInfo += index + '=' + item + '&';
				});
				//console.log(memInfo);
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