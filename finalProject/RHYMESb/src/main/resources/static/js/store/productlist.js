
<!-- 상품 정렬 -->
function sortingBy(sort){
	$("._sorting").val(sort);
	$("#sortingFrm").submit();
}

<!-- 상품 상세정보 이동 -->

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

// 상품 디테일 이동
function detail(seq, c1name){
	$("#p_seq").val(seq); 
	//var c1_name = $(".hdnC1name").val();
	//$("#moveFrm").attr("action", "/store/productList").submit();
	$("#moveFrm").submit();
}

// 페이징 이동
function goPage( pageNumber) {
	$("#_pageNumber").val(pageNumber);
	$("#_frmFormSearch").submit();
}
