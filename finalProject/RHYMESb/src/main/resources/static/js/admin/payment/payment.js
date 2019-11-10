$(document).ready(function () {
	//alert("어드민 주문");
	
	$("#_btnSearch").click(function () {
		//alert("검색");

		var _recordCountPerPage = $("#_recordCountPerPage").val();
		var _s_keyword = $("#_s_keyword").val();
		var _select = $("#_select").val();
		//alert( _s_keyword );
		//alert( _recordCountPerPage );
		
		location.href="/admin/payment/success?s_keyword="+_s_keyword+"&s_category="+_select+"&recordCountPerPage="+_recordCountPerPage;
	});
	
	
});



function goPage(pageNumber) {
	//alert("페이지 클릭 : " + pageNumber);
	
	var _s_keyword = $("#_s_keyword").val();
	var _select = $("#_select").val();
	var _recordCountPerPage = $("#_recordCountPerPage").val();

	$("#_pageNumber").val(pageNumber); // 들어오는 값을 가져옴
	var _pageNumber = $("#_pageNumber").val();

	location.href="/admin/payment/success?s_keyword="+_s_keyword+"&s_category="+_select+"&pageNumber="+_pageNumber+"&recordCountPerPage="+_recordCountPerPage;
}



function dataTable_length() {
	//alert("정렬 개수 바뀜");
	
	var _s_keyword = $("#_s_keyword").val();
	var _select = $("#_select").val();
	var _pageNumber = $("#_pageNumber").val();
	var _recordCountPerPage = $("#_recordCountPerPage").val();
	
	//alert(_s_keyword + ", " + _select + ", " + _pageNumber + ", " + _recordCountPerPage);

	location.href="/admin/payment/success?s_keyword="+_s_keyword+"&s_category="+_select+"&pageNumber="+_pageNumber+"&recordCountPerPage="+_recordCountPerPage;
}


