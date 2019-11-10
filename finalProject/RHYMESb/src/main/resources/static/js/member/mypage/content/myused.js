$(document).ready(function() {
	$(".deletebtn").click(function() {
		var seq = $(this).val();
		
		location.href="/used/deleteProduct?seq="+seq;
	})

	$("#_formbtn").click(function() {

	    var keyword = $("#_keyword").val();
		var select = $("#s_select").val();
		
	location.href="/mypage/myused/?keyword="+keyword+"&select="+select; 
		
	});
})

function goUsedDetail(th) {

	var seq = $(th).attr("val");

	location.href = "/used/useddetail?seq=" + seq;
}

function ChangeDivision(th) {
	var seq = $(th).attr("seq");
	$("#seq").val(seq);
	
	var division = $(th).val();
	
	location.href="/mypage/updatedivision?seq="+seq+"&division="+division;
}

function goPage( pageNumber ) { /* pageNumber는 현재 페이지를 뜻한다 */
	$("#_pageNumber").val(pageNumber);
	
	$("#_frmFormSearch").attr("action","/mypage/myused").submit();
}
