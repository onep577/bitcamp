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

	//쿠폰정보 모달 내부 정보 set
	$(".coupon_detail_row").click(function(){
		setCouponDetailModalData( $(this) );
	});
	
	//모달 show 이벤트
	$(document).on('show.bs.modal','#_coupon_detail_info_modal', function () {		
		//쿠폰 등록대상 ID 검색 자동완성기능
		setAutoCompleteEvent();
		
		//쿠폰 사용자 등록 이벤트
		$("#_save_coup_detail_info").click(function(){
			giveCouponToUser();
		});
	});
	
	
});

//쿠폰 등록대상 ID 검색 자동완성기능
function setAutoCompleteEvent(){
	var $input = $("#_coup_reg_id");
	var dataArr = new Array();
	setDataArr(dataArr);
	
	$input.typeahead({
	  source: dataArr,
	  autoSelect: true
	});
	$input.change(function() {			
		var current = $input.typeahead("getActive");
		if (current) {
			// Some item from your model is active!
			if (current.name == $input.val()) {
				// This means the exact match is found. Use toLowerCase() if you want case insensitive match.
				$("#_save_coup_detail_info").removeAttr('disabled');
				return true;
		    } else {
		    	// This means it is only a partial match, you can either add a new item
		    	// or take the active if you don't want new items
		    }
		} else {
			// Nothing is active so it is a new value (or maybe empty value)
		}			
	});
	$input.keydown(function(){
		$("#_save_coup_detail_info").attr('disabled', 'disabled');
	});
}

//데이터리스트 세팅
function setDataArr(dataArr){
	dataArr.push({id: "someId1", name: "Display name 3"});
	dataArr.push({id: "someId2", name: "Display name 4"});
	
	$.ajax({
		type : 'get',
		url : "/admin/mypage/points/getmembers",
		dataType : "json",
		data : {
			value : $("#_coup_reg_id").val()
		},
		async: true,
		success : function(data) {
			console.log('load ok ');
			$.each(data, function(index, item) {
				dataArr.push( {id: "userid" + index , name: item } );
			});
		},
		error : function(err) {
			console.log('connect eror');
		}
	});	
}

//쿠폰정보 모달 set
function setCouponDetailModalData(row){
	console.log('row click' + row.children().length);
	var $modalInput = $("#_coup_detail_info input");
	
	for( i = 0 ; i < $modalInput.length ; i++ ){
		$modalInput.eq(i).val( row.children().eq(i + 2).text() );
	}
}

//쿠폰 사용자 등록 이벤트
function giveCouponToUser(){
	var c_seq = $("#_this_c_seq").val();
	var func_time_limit = $("#_this_func_time_limit").val();
	var coupon_code = $("#_coup_reg_code").val();
	var userid = $("#_coup_reg_id").val();
	
	console.log('save : ' + userid + "  ,  " + coupon_code);
	console.log('c_seq : ' + c_seq);
	
	var viewData = new Map();
	viewData["c_seq"] = c_seq;
	viewData["coupon_code"] = coupon_code;
	viewData["userid"] = userid;
	viewData["func_time_limit"] = func_time_limit;
	
	$.ajax({
		contentType : 'application/json',
		dataType : 'json',
		url : '/admin/mypage/coupon/detail/givecoupon',
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

//선택된 회원 ID에 맞는 정보를 테이블에 추가
function addMemberOnTable(memberid){
	$("#_coup_reg_id").attr('readonly', 'readonly');
	$("#_save_coup_detail_info").removeAttr('disabled');
}