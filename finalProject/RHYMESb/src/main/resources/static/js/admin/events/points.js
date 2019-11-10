/**
 * 
 */
var initAmount = 0;
var usedAmount = 0;
var totalAmount = 0;

var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

$(function(){
	// ajax 통신을 위한 csrf 설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
	
	$(".page-item .page-num").click(function(){
		var pageNum = $(this).text().trim();		
		$("#_currPageNum").val(pageNum);
		$("#_frm").submit();
	});
	
	//모달폼 저장버튼 클릭 시 저장 이벤트(Ajax)
	$("#_frm_btn_save").click(function(){
		location.href='points';
		
		// 배열 초기화
		var viewData = {};
		// data[키] = 밸류
		viewData["seq"] = $("#_detail_0").val();
		viewData["comment"] = $("#_detail_2").val();
		viewData["amount"] = $("#_detail_3").val(); 
		viewData["used_amount"] = $("#_detail_4").val();
				
		$.ajax({
			contentType : 'application/json',
			dataType : 'json',
			url : ctx + '/mypage/points/updatedetail',
			type : 'post',
			async : false,
			data : JSON.stringify(viewData),
			success : function( resp ) {				
				var result = resp;
				console.log(result);
				if( result === 0 ){
					alert('변경내용 저장에 실패했습니다..'); return;					
				}else if ( result === 1 ){
					alert('변경내용 저장 완료.');
					location.reload();
					return;
				}else{
					alert('저장 오류.');
				}				
			},
			error : function() {
				alert('저장 오류.');
			}
		});
	});
	
	//모달폼 데이터 적용
	$(".points_row").click(function(){		
		var tds = $(this).children();
		var items = $(".detail-input-items");		
		tds.each(function(index, item){	
			if( index === 0 ) return true;	//continue;
			items.eq(index-1).val( $(this).text() );
		});		
		//$("#_points_detail_modal").modal();
		$("#_frm_btn_save").attr('disabled', 'disabled');
		
		//금액계산을 위해 값 저장
		initAmount = $("#_detail_3").val(); 
		usedAmount = $("#_detail_4").val();
		totalAmount = $("#_detail_5").val();
	});
	
	//숫자만 입력하게끔 설정
	$("#_detail_3, #_detail_4").attr('type', 'number');
	
	//comment 수정 시 이벤트
	$("#_detail_2").keyup(function(){ $("#_frm_btn_save").removeAttr('disabled'); });
	
	//모달에서 적립금 수정시 값 계산
	$("#_detail_3, #_detail_4").keyup(function(){
		
		var newInit = parseInt($("#_detail_3").val());
		var newUsed = parseInt($("#_detail_4").val());
		var newTotal = parseInt($("#_detail_5").val());
		
		newTotal = newInit - newUsed;
		
		$("#_detail_3").val(newInit);
		$("#_detail_4").val(newUsed);
		$("#_detail_5").val(newTotal);
		
		var result = (newInit >= newUsed + newTotal) && newTotal >= 0;
		
		if( result === false ){
			alert('사용금액과 사용가능금액의 합은 적립액을 초과할 수 없습니다.');
			$("#_detail_3").val(initAmount);
			$("#_detail_4").val(usedAmount);
			$("#_detail_5").val(totalAmount);
			$("#_frm_btn_save").attr('disabled', 'disabled');
		}else{
			initAmount = newInit;
			usedAmount = newUsed;
			totalAmount = newTotal;
			$("#_frm_btn_save").removeAttr('disabled');
		}		
	});
});


//검색조건변경시 조건내용대로 검색
function conditionChanged(){
	$("#_currPageNum").val(1);
	$("#_frm").submit();
}