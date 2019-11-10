/**
 * 
 */

$(function(){
	
	//페이징 네비게이션 클릭 이벤트. 검색조건 submit
	$(".page-num").click(function(){
		var term = $("#_top_term option:selected").val();
		var pageNum = $(this).text();
				
		$("#_frm_pageNum").val(pageNum);
		$("#_frm_cond").val(term);
		$("#_frm_paging").submit();
	});
	
	//검색기간 변경 이벤트.
	$("#_search_cond_term").change(function(){
		var term = $("#_top_term option:selected").val();
				
		$("#_frm_pageNum").val(1);
		$("#_frm_cond").val(term);
		$("#_frm_paging").submit();
	});
	
	//주문상세페이지 이동
	$(".order_title, .btn_write_review").click(function(){
		location.href = '/mypage/orderlog/showdetail?payment_code=' + $(this).attr('accesskey');
	});
});