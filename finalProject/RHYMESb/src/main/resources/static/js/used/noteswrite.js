var count = 0;

$(function() {
	$("#autocomplete").autocomplete({
		source : function(request, response) {
			$.ajax({
				type : 'get',
				url : "/mypage/json",
				dataType : "json",
				//request.term = $("#autocomplete").val()
				data : {
					value : request.term
				},
				success : function(data) {
					//서버에서 json 데이터 response 후 목록에 뿌려주기 위함
					//                        response(
					//                            $.map(data, function(item) {
					//                                return {
					//                                    label: item.data,
					//                                    value: item.data
					//                                }
					//                            })
					//                        );
					response($.each(data, function(index, item) {
						return {
							label : item,
							value : item
						}
					}));
				}
			});
		},
		//조회를 위한 최소글자수
		minLength : 1,
		select : function(event, ui) {
			// 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
		}
	});
})

$(function() {
	$('#content').keyup(function(e) {
		var content = $(this).val();
		//  $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
		$('#counter').html(content.length + '/1000');
	});
	$('#content').keyup();
});

function save() {
	if ($("#_save").prop('checked') == true) 
		$("#_save").prop('checked', false);
    else 
		$("#_save").prop('checked', true);

}

function check(){
	var id =  $("#autocomplete").val();
	
	$.ajax({
		url:"/mypage/idcheck",
		type:"get",
		data:{
			id : id
		},
		success:function(num){
			if(num == 1){
				$("#idcheck").html("<b id='suc'>전송가능</b>");
				count = 1;
			} else {
				$("#idcheck").html("<b id='error'>발신이 불가능합니다</b>");
				count = 0;
			}
		},
		error:function(){
		}

	});
}



$(document).ready(function() {
	
/*    $("#autocomplete").keyup(function() {
    	var text = $(this).val();
    
    	$.ajax({
    		url:"/mypage/idcheck",
    		type:"get",
    		data:{
    			id : text
    		},
    		success:function(num){
    			if(num == 1){
    				
    			} else {
    				
    			}
    		},
    		error:function(){
    		}

    	});
    })*/
	
	
	$("#_send").click(function() {
		
		if(count == 0){
			alert("받는사람을 확인하세요");
			return;
		}
		if( $("#content").val() == "" ||  $("#content").val() == null  ){
			alert("내용을 작성해주세요");
			return;
		}	
		$("#_notesform").attr("action","/mypage/noteswriteAf");
		$("#_notesform").submit();
		window.opener.location.reload();
		window.close();
	});
})