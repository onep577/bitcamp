/**
 * 
 */
$(function(){

});

//작성된 후기 뷰 로드
function getProductReview(pageNumber,p_seq){
	$("#_product_review").load('/productreview/previewlist?pageNumber='+pageNumber+'&p_seq='+p_seq);
}