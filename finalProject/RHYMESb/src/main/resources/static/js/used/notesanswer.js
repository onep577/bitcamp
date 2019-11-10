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

$(document).ready(function() {
	$("#_send").click(function() {
		
		if( $("#content").val() == "" ||  $("#content").val() == null  ){
			alert("내용을 작성해주세요");
			return;
		}	
		$("#_notesform").attr("action","/mypage/noteswriteAf");
		$("#_notesform").submit();
		window.close();	
	});
});

