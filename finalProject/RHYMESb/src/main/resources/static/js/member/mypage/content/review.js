/**
 * 
 */
$(function(){

});


//작성가능 후기 뷰 로드
function getUnWrittenReviews(pageNum){
	$(".waiting_items_wrap").remove();
	$("#_waiting_items").load('/mypage/review/review_sub_wait?pageNum=' + pageNum);
}

//작성된 후기 뷰 로드
function getWrittenReviews(pageNum){
	$(".written_reviews_wrap").remove();
	$("#_written_reviews").load('/mypage/review/review_sub_done?pageNum=' + pageNum);
}