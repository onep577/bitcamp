/**
 * 
 */
$(function(){

});

//작성된 문의 뷰 로드
function getProductQna(pageNumber,p_seq){

	$("#_product_qna").load('/productqna/pqnalist?pageNumber='+pageNumber+'&p_seq='+p_seq);
}