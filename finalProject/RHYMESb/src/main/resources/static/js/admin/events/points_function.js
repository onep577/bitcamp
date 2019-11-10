/**
 * 
 */

//적립금 최대 지급 가능 액수
var MAX_INPUT_AMOUNT = 100000;


$(function(){
	// ajax 통신을 위한 csrf 설정
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	});
	
	//검색자동완성기능 + 적립금 값 검사 기능(빈칸, 10만이상 입력불가)	
	$("#_search_mem_auto").autocomplete({ 
		source : function(request, response) {
			getMemberIds(request, response);
		},
		minLength: 2, 
		select : function(event, ui) {
			//선택된 회원 ID에 맞는 정보를 테이블에 추가
			addMemberOnTable(ui.item.value);
		}
	});
	
	//저장버튼 클릭 시 Ajax 통신을 통해 적립금 내용 DB 저장
	
	
});

$(document).on('show.bs.modal','#_points_give_modal', function () {
	//console.log('modal on show!!!!!!!!!!!');
	$("#_search_mem_auto").autocomplete("option", "appendTo", "#_points_give_modal");
});

//ajax통신을 통해 검색어에 맞는 회원 ID를 리턴하는 함수
function getMemberIds(request, response){
	$.ajax({
		type : 'get',
		url : "/admin/mypage/points/getmembers",
		dataType : "json",
		data : {
			value : request.term
		},
		success : function(data) {					
			response($.each(data, function(index, item) {
				return {
					label : item,
					value : item
				}
			}));
		}
	});
}

//선택된 회원 ID에 맞는 정보를 테이블에 추가
function addMemberOnTable(memberid){
	var auth = '';
	
	$.ajax({
		type : 'post',
		url : "/admin/mypage/points/getmemberauth",
		dataType : "json",
		data : memberid,
		success : function(data) {
			auth = data[0];
			addOnTable(memberid, auth);
		},
		error : function(err){
			auth = 'unknown';
		}
	});	
}

//테이블에 행 데이터 입력
function addOnTable(memberid, auth){
	$(".tbl_points_give_inform_nothing").remove();
	
	//기존 테이블에 맞게끔 데이터 입력(행번호, 중복제어)
	var tableRows = $(".tbl_points_give_tr");
	var rowNum = tableRows.length + 1;
	for(i = 0 ; i < rowNum ; i++ ){
		if( memberid === tableRows.children().eq(1).text() ){
			alert('이미 추가된 유저입니다.');
			return false;
		}
	}
	
	var $tr = $('<tr class="tbl_points_give_tr">'
			+ '<td>' + rowNum + '</td>'
			+ '<td>' + memberid + '</td>'
			+ '<td>' + auth + '</td>'
			+ '<td><input type="text" placeholder="지급 사유"/></td>'
			+ '<td><input type="number" name="amount" placeholder="1~100000"/></td>'
			+ '</tr>');
	
	$("#_tbl_points_give_tbody").append($tr);	
	
	//적립금 빈칸검사, 값 검사 이벤트 추가
	applyCheckEvent();
}

//적립금 빈칸검사, 값 검사 이벤트 추가
function applyCheckEvent(){
	
	$(".tbl_points_give_tr input[name=amount]").keyup(function(){
		if( parseInt($(this).val()) > MAX_INPUT_AMOUNT )
			$(this).val(MAX_INPUT_AMOUNT);		
		
		for( i = 0 ; i < $(".tbl_points_give_tr input[name=amount]").length ; i++ ){
			if( $(".tbl_points_give_tr input[name=amount]").eq(i).val() === '' )
				$("#_give_frm_btn_save").attr('disabled', 'disabled');
			else
				$("#_give_frm_btn_save").removeAttr('disabled');			
		}
	});	
}

//저장버튼 클릭 시 Ajax 통신을 통해 적립금 입력내용 DB에 저장 
function insertPointsData(){

	// 배열 초기화
	var viewData = {};
	// data[키] = 밸류
	var rows = $(".tbl_points_give_tr");
	for( i = 0 ; i < rows.length ; i++ ){
		var resultStr = '';
		resultStr += rows.eq(i).children().eq(1).text() + '___';
		resultStr += rows.eq(i).children().eq(3).children().eq(0).val() + '___';
		resultStr += rows.eq(i).children().eq(4).children().eq(0).val();
		viewData[i] = resultStr;
		console.log(resultStr);
	}
			
	$.ajax({
		contentType : 'application/json',
		dataType : 'json',
		url : '/admin/mypage/points/insertnew',
		type : 'post',
		async : false,
		data : JSON.stringify(viewData),
		success : function( resp ) {				
			if(resp === 1){
				alert('저장이 완료되었습니다.');
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

//적립금 지급 테이블 초기화
function initPointGiveTable(){
	$("#_search_mem_auto").val('');
	$("#_tbl_points_give_tbody tr").remove();
	var $tr = $('<tr class="tbl_points_give_inform_nothing"><td colspan="5">검색을 통해 유저를 추가해 주세요</td></tr>');
	$("#_tbl_points_give_tbody").append($tr);
}