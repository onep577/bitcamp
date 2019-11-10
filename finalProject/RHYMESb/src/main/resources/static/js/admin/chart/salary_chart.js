$(document).ready(function () {
	//alert("어드민 통계");	
	
	$("#_btnSearch").click(function () {
		//alert("클릭");
		
		var year = $("#_select_year").val();
		var month = $("#_select_month").val();
		//alert(year + ", " + month);
		
		location.href="/admin/chart/salary?year="+year+"&month="+month;
	});
	
});