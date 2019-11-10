$(document).ready(function () {
	
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
	
	$("#vbankBtn").click(function () {
		//alert("입금완료");
		$("#vbank_frm").attr("action","/admin/company/payment/vbank/finish").submit();
	});

});
