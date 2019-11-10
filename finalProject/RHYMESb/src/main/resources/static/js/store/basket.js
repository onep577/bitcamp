var id = "${userloginid}";
var allCnt = ${fn:length(blist) };

// 가격 콤마
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).on('click', '.goShopping', function(){
	location.href="/main";
	
});

$(document).on('click', '.orderBtn', function(){
	if($(".pay_price").html() == "0"){
		$("#msg").html("<b>장바구니에 주문가능한 상품이 없습니다.</b>")
    	$(".wModal").fadeIn();
    	setTimeout(function() {
    		$(".wModal").fadeOut();
    	},700);
	}else{
		var len = ${fn:length(blist) };
		var blist_stockseq = "";
		var blist_pQuantity = "";
		
		//alert(len);
		for (var i = 0; i < len; i++) {
			if($("#eachPq" + (i+1)).html() != undefined){
				blist_pQuantity += $("#eachPq" + (i+1)).html();
				blist_pQuantity += "/";
				blist_stockseq += $("#eachSs" + (i+1)).val();
				blist_stockseq += "/";
			}
		}
		$("#blist_stockseq").val(blist_stockseq);
		$("#blist_pQuantity").val(blist_pQuantity);
		
		$("#bOrderFrm").submit();
	}
});
// 장바구니 전체 삭제
$(document).on('click', '.allDeleteBtn', function(){
	$.ajax({
        type:"get",
        url:"/store/deleteBasketAll",
        success:function( data ){
        	$("#cntProduct_wrap").remove();
    		$("#product-select-all").remove();
    		$(".sub2Container").remove();
    		$("#sub1Container").remove();
    		$(".product-opt_basket").remove();
    		
        	var str = "";
    		str += "<hr style='margin-top:-10px;' width='100%' color='#DADCE0'>";
    		str += "<img alt='사진없음' class='basketImg' src='http://www.habitatriverside.org/wp-content/uploads/2016/10/shopping-cart-icon.png' style='width:500px; height:500px;'>";            		
    		str += "<span class='nothingLabel'>장바구니에 담긴 상품이 없습니다.</span><br>";
    		str += "<input type='button' class='goShopping' value='계속 쇼핑하기'>";
    		
    		
    		$("#mainContainer").append(str); 
        },
        error:function(){
           alert("error!!"); 
        }
	})	
});

// 수량변경 전 체크
function stockCheck(stock_seq, b_seq){
	var p_quantity = Number($("#pqCnt"+b_seq).html());
	
	$.ajax({
		type:"get",
        data: "stock_seq=" + stock_seq,
        url:"/store/stockCheck",
        success:function( data ){
        	// 변경될 수량이 재고수량보다 많을 때
        	if(p_quantity>data){
        		$("#msg").html("<b>변경수량이 재고수량보다 많습니다.</b>");
            	$(".wModal").fadeIn();
            	setTimeout(function() {
            		$(".wModal").fadeOut();
            	},1500);
            	
            	var eachPq = $(".eachPq" + b_seq).html();
            	$("#pqCnt" + b_seq).html(eachPq);
            	
        	}
        	// 변경될 수량이 재고수량보다 적거나 같을 때
        	else{
        		changeQ(stock_seq, b_seq);
        	}
        },
        error:function(){
           alert("error!!"); 
        }
		
	});
}

// 장바구니 수량 변경
function changeQ(stock_seq, b_seq){
	
	var p_quantity = Number($("#pqCnt"+b_seq).html());
	var eachPrice =  $("#eachPrice"+b_seq).val();
	var udtQ = p_quantity * eachPrice;
	
	$.ajax({
        type:"get",
        data: "stock_seq=" + stock_seq + "&p_quantity=" + p_quantity + "&b_seq=" + b_seq,
        url:"/store/updateBasketQ",
        success:function( data ){
			//alert(data);
        	$(".eachPq"+b_seq).html(p_quantity);
        	$(".eachMultiple"+b_seq).html(numberWithCommas(udtQ));
        	$("#pMq"+b_seq).val(udtQ);
        	
        	$("#msg").html("<b>수량이 변경되었습니다.</b>")
        	$(".wModal").fadeIn();
        	setTimeout(function() {
        		$(".wModal").fadeOut();
        	},700);
        	
        	if(data>=10000){
        		$("#totalP_price").html(numberWithCommas(data));
        		$(".pay_price").html(numberWithCommas(data));
        		$(".post_price").html("0");
        	}else if(data<10000){
        		$("#totalP_price").html(numberWithCommas(data));
        		$(".pay_price").html(numberWithCommas(data+3000));
        		$(".post_price").html("3,000");
        	}
        },
        error:function(){
           alert("error!!"); 
        }
	})
}

$(document).on('click', '.plus_btn', function(){
	var b_seq = $(this).attr("value");
	//alert(b_seq);
	var cnt = Number($("#pqCnt" + b_seq).html());
	if(cnt<9){
		$("#pqCnt" + b_seq).html(cnt+1);	
	}else{
		$("#msg").html("<b>최대 구매수량을 초과했습니다.</b>")
    	$(".wModal").fadeIn();
    	setTimeout(function() {
    		$(".wModal").fadeOut();
    	},700);
	}
});

$(document).on('click', '.minus_Btn', function(){
	var b_seq = $(this).attr("value");
	var cnt = Number($("#pqCnt" + b_seq).html());
	
	if(cnt!=1){
		$("#pqCnt" + b_seq).html(cnt-1);
	}	 
});

</script>
<script>
$(document).on('click', '.delete_btn', function(){
	var b_seq = $(this).attr("value");
				
		$.ajax({
	        type:"get",
	        data: "b_seq=" + b_seq,
	        url:"/store/deleteBasket",
	        success:function( data ){
	            $(".sub1_" + b_seq).remove();
	            //alert("삭제 후 총 결제금액 : " + data);
			    /* var udtTotal = numberWithCommas(data);
			    alert("변환 총액 : " + udtTotal); */
	            var postfee = $(".post_price").attr("value");
	            //alert("배송비 : " + postfee);
	            
	            if(isNaN(data)){
	            	//alert("장바구니 아무것도 없음");	
	            }else{
	            	//alert("총 결제금액 : " + (data + Number(postfee)));
	            	
	            	//배송비 + (총금액-삭제금액)
	            	var udtPp = data + Number(postfee);
	            	$("#flexTotal").val(udtPp);
	            	
	            /* 1.배송비 부과될 때 */	           	
	            	if(data<10000){
	            		//alert("배송비O");
	            		/* 수정된 총 결제 예상 금액 */
	            		udtPp = data + 3000;
	            		      				    		
	            		/* 상품금액 */
	            		$("#totalP_price").html(numberWithCommas(data));
	            		
	            		if(data>0){
	            		/* 예상 배송비 */
		            		$(".post_price").attr("value", "3000");
		            		$(".post_price").html("3,000");
		            		/* 총 결제 예정 금액 */
		            		$(".pay_price").html(numberWithCommas(udtPp));
	            		}else if(data == 0){
	                		$(".post_price").html("0");
	                		$(".pay_price").html("0");
	                	}
	            		
	            	}
	            /* 2.무료배송 */	
	            	else if(data>=10000){
	            		$("#totalP_price").html(numberWithCommas(udtPp));
	            		$(".pay_price").html(numberWithCommas(udtPp));
	            	}
	            /* 3.장바구니 리스트 없을 때 */	
	            	//alert("allCnt -1 : " + (allCnt-1));
	            	
	            	$("#_allCnt").text(allCnt-1);
	            	allCnt--;
	            	
	            	if(allCnt == 0){
	         			$("#cntProduct_wrap").remove();
	            		$("#product-select-all").remove();
	            		$(".sub2Container").remove();
	            		
	            		var str = "";
	            		str += "<hr style='margin-top:-10px;' width='100%' color='#DADCE0'>";
	            		str += "<img alt='사진없음' class='basketImg' src='http://www.habitatriverside.org/wp-content/uploads/2016/10/shopping-cart-icon.png' style='width:500px; height:500px;'>";            		
	            		//str += "<label class='nothingLabel' value='장바구니에 담긴 상품이 없습니다.'></label>";
	            		str += "<span class='nothingLabel'>장바구니에 담긴 상품이 없습니다.</span><br>";
	            		str += "<input type='button' class='goShopping' value='계속 쇼핑하기'>";
	            		
	            		$("#mainContainer").append(str); 
	            	}
	            }
	            //minusallCnt();
	            
	            $("#msg").html("<b>장바구니에서 삭제되었습니다.</b>")
	        	$(".wModal").fadeIn();
	        	setTimeout(function() {
	        		$(".wModal").fadeOut();
	        	},700);
	        },
	        error:function(){
	           alert("error!!"); 
	        }
	   })
	   //ajax 끝
	
});
