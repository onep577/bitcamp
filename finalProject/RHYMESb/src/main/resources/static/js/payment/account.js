$(document).ready(function () {
	//alert("account.js");
	// 결제 페이지로 처음 들어갔을 때부터 총 결제예상금액을 계산해서 넣는다
	result_price();



	// 쿠폰 팝업창이 나온다
	$("#coupon_btn").click(function () {
		var product_price = $("#product_price").text();
		var delivery_price = $("#delivery_price").text();
		var disc_point = $("#disc_point").val();

		window.open("/payment_coupon?product_price="+product_price+"&delivery_price="+delivery_price+"&disc_point="+disc_point, "window팝업", "width=950, height=570, menubar=no, status=no, toolbar=no");
	});

	
	
});



//적립금
function price_change() {
	//alert("적립금");
	
	var point_amount = $("#point_amount").val();
	var disc_coupon = $("#_disc_coupon").text();
	var input_disc_point = $("#input_disc_point").val();
	var totalprice = $("#_totalprice").text();
	//alert(input_disc_point);

	// text에 값이 아예 없을 경우
	if( input_disc_point.trim() == "" ) {
		$("#input_disc_point").val( "0" );
		$("#_disc_point").text( "0" );
		$("#disc_point").val( "0" );
		result_price();
		return;
	}
	
	// 1000원부터 적립금 사용 가능
	if(input_disc_point.length < 4) {
		alert("1000원부터 사용 가능합니다");
		$("#input_disc_point").val( "0" );
		$("#_disc_point").text( "0" );
		$("#disc_point").val( "0" );
		result_price();
		return;
	}

	// 적립금보다 text에 적은 숫자가 클 경우
	if( parseInt(point_amount) < parseInt(input_disc_point) ) {
		alert( $("#point_amount").val() + "원까지 사용가능합니다" );
		$("#input_disc_point").val("0");
		$("#_disc_point").text( "0" );
		$("#disc_point").val( "0" );
		result_price();
		return;
	}
	
	// 0은 입력 가능하지만 00은 못하게 한다
	if(input_disc_point.trim().length >= 2 && input_disc_point.substring(0,2) == "00") {
		$("#input_disc_point").val( "0" );
		$("#_disc_point").text( "0" );
		$("#disc_point").val( "0" );
		result_price();
		return;
	}
	
	// 결제예상금액보다 text가 클 경우
	if(parseInt(input_disc_point.trim()) - parseInt($("#_disc_point").text()) > parseInt(totalprice)){
		alert("사용범위를 초과하였습니다");
		$("#input_disc_point").val( "0" );
		$("#_disc_point").text( "0" );
		$("#disc_point").val( "0" );
		result_price();
		return;
	}
	
	$("#_disc_point").text( parseInt(input_disc_point) );
	$("#disc_point").val( parseInt(input_disc_point) );

	result_price();
}



//결제금액 계산
//총 금액 = 상품금액 + 배송비 - 할인금액
function result_price() {
	var product_price = $("#product_price").text();
	var delivery_price = $("#delivery_price").text();
	var disc_point = $("#_disc_point").text();
	var disc_coupon = $("#_disc_coupon").text();
	var totalprice = $("#_totalprice").text();
	
	//alert(product_price + ", " + delivery_price + ", " + disc_point + ", " + disc_coupon + ", " + totalprice);

	$("#add_point").val( (parseInt(product_price) + parseInt(delivery_price) - parseInt(disc_point) - parseInt(disc_coupon)) * 0.02 );
	$("#_totalprice").text( parseInt(product_price) + parseInt(delivery_price) - parseInt(disc_point) - parseInt(disc_coupon) );
	$("#totalprice").val( parseInt(product_price) + parseInt(delivery_price) - parseInt(disc_point) - parseInt(disc_coupon) );
}


