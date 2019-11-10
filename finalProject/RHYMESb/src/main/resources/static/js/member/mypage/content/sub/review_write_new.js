/**
 * 
 */

$(function(){
	//컨텍스트 패스
	var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

	//form 변화 감지를 위한 변수
	var isChanged = 0;
	
	// ajax 통신을 위한 csrf 설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
	
	//타이틀 수정
	$(".mypage_main_content_title h3").text('상품후기 작성');
	
	//form 변화 감지
	$("#_new_review_wrap").on("change keyup paste", function() {
		isChanged = 1;
		$("#btn_save").removeAttr('disabled');
	});
	
	//돌아가기 버튼 클릭 이벤트
	$("#btn_cancel").on('click', function(){
		if( isChanged === 1 ){
			$(".modal-body a").html('<br>변경된 내용은 저장되지 않습니다.<br>');
			$(".modal-footer .btn-rhy-full").text('돌아가기');
			$("#_modal_confirm").on('click', function(){history.back();});
			$('#confirmBack').modal('show');
		}else{
			history.back();
		}
	});
	
	//등록하기 버튼 클릭 이벤트
	$("#btn_save").click(function(){
		$("#_modal_confirm").off('click');
		console.log('이벤트 off');
		$(".modal-body a").html('<br>저장하시겠습니까?<br>');
		$(".modal-footer .btn-rhy-full").text('예');
		
		//예 버튼 클릭 시 ajax통신을 통해 폼 데이터 저장
		$(".modal-footer .btn-rhy-full").click(function(){
			sendFormData(ctx);
		});
		$('#confirmBack').modal('show');
	});
});

function sendFormData(ctx){
		
	// 배열 초기화
	var viewData = {};
	// data[키] = 밸류
	viewData["userid"] = $("#_frm_userid").val();
	viewData["pd_seq"] = $("#_frm_seq").val();
	viewData["title"] = $("#_review_title").val();
	viewData["content"] = myEditor.getData();

	$.ajax({
		contentType : 'application/json',
		dataType : 'json',
		url : ctx + '/review/savenew',
		type : 'post',
		async : false,
		data : JSON.stringify(viewData),
		success : function( resp ) {
			var result = resp + '';
			if(result === '1'){
				alert('저장이 완료되었습니다. ');
				location.href= ctx + '/review';
			}else{
				console.log('세상에...0이라니..' + result);
			}
			
		},
		error : function() {
			alert('오류 발생. 고객센터로 문의하세요.');
		}
	});
	
}
