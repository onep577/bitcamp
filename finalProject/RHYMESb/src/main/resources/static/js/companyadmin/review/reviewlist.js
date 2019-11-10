/**
 * 
 */
$(function(){
	//페이징 네비게이션 클릭 이벤트
	$(".page-num").on('click', function(){
		conditionChanged( $(this).text() );
	});
});

//검색조건변경시 조건내용대로 검색
function conditionChanged(pgn){
	$("#_currPageNum").val(pgn);
	$("#_frm").submit();
}