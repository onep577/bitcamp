$(document).ready(function () {
	//alert("어드민 주문");
	
	$("#allcheckid").click(function(){
		
		//만약 전체 선택 체크박스가 체크된상태일경우
		if($("#allcheckid").prop("checked")) {
			
			//해당화면에 전체 checkbox들을 체크해준다
			$("input[type=checkbox]").prop("checked",true);
			
			// 전체선택 체크박스가 해제된 경우
		} else {
			//해당화면에 모든 checkbox들의 체크를해제시킨다.
			$("input[type=checkbox]").prop("checked",false);
		}
	});
	
	$("#deliveryIngChangeBtn").click(function () {
		//alert("1");		
		$("#delivery_frm").attr("action","/admin/company/payment/delivery/ing/change").submit();
	});
	
	$("#deliveryFinishChangeBtn").click(function () {
		//alert("2");
		$("#delivery_frm").attr("action","/admin/company/payment/delivery/finish/change").submit();
	});
	
	
});
