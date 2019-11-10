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
	
	//text 입력 이벤트
	$("#smsid").keyup(function(){
		var valueLength = $(this).val().length;
		
		if(valueLength < 1 ){
			$("#btnSubmit").attr('disabled', 'disabled');
		}else{
			$("#btnSubmit").removeAttr('disabled');
		}
	});
	
	//아이디 입력 버튼 클릭 이벤트
	$("#btnSubmit").click(function(){
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
	});
});