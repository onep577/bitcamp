<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="//fast.fonts.net/jsapi/eb707d8d-32aa-4fee-b1c6-595a5dc30866.js"></script>
<link rel="stylesheet" href="/css/store/basket.css">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
<br><br>
<div id="cart_wrap" align="center">

<c:if test="${blist ne null }">
<h2><b>장바구니</b></h2>
<div id="cntProduct_wrap"><label id="_allCnt">${fn:length(blist) }</label>개 상품</div>
</div>
</c:if>

<div id="mainContainer">
<c:if test="${blist eq null }">
<div id=sub1Container">
	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT09uR_LfHPdzAfTxt9K3hvmH6atw3ZJRM6lMX9BaaDf9U1EMHfcQ"><br>
	<h3 style="color: gray">장바구니에 담긴 상품이 없습니다.</h3>
</div>
</c:if>

<c:if test="${blist ne null }">
<div id="product-select-all"><a href="#" class="allDeleteBtn" style="color:black">전체삭제</a></div>
<c:forEach items="${blist }" var="ba" varStatus="vs">
	<div id=sub1Container" class="sub1_${ba.b_seq }">
		<div class="product-opt_basket">
			<div class="item-info">
				<%-- <span class="img_wrap"><a href="/store/productDetail?p_seq=${ba.p_seq }"><img alt="사진x" src="/upload/store/${ba.photo1_file }" style="width:100px;height:100px;"></a></span> --%>
				<span class="img_wrap"><img alt="사진x" src="/upload/store/${ba.photo1_file }" style="width:100px;height:100px;"></span>
				<div class="info_wrap">
					<div style="margin-top:8px; font-size: 15px;" class="pname_wrap"><a >${ba.c_name }</a></div>
					<div style="margin-bottom: 7px; margin-top:3px;" class="pname_wrap"><a >${ba.p_name }</a></div>
					<div class="info2_warp">
					사이즈 : <span>${ba.size }</span><br>
					<c:if test="${ba.quantity ne 0 }">
					<div style="margin-top:3px;">수량 : <span class="eachPq${ba.b_seq }" id="eachPq${vs.count }">${ba.p_quantity }</span></div>
					<div style="margin-top:3px;">단가 : <span><fmt:formatNumber type="currency" currencySymbol="" value="${ba.p_price}" /></span></div>
					</c:if>
					<c:if test="${ba.quantity eq 0 }">
					<div style="margin-top:3px;">수량 : <span>${ba.p_quantity }</span></div>
					<div style="margin-top:3px;">상품 가격 : <span><fmt:formatNumber type="currency" currencySymbol="" value="${ba.p_price}" /></span>원</div>
					</c:if>										
					</div>
				</div>
				<div class="optionchange_wrap">
					<c:if test="${ba.quantity ne 0 }">
					<a onclick="stockCheck(${ba.stock_seq }, ${ba.b_seq } )"><font style="color:#4374D9; cursor: pointer">수량 변경</font></a><br>
					<div class="pqSelect">
						<span class="minus_Btn" style="cursor:pointer;" value="${ba.b_seq }">-</span>&nbsp;&nbsp;&nbsp;
							<label id="pqCnt${ba.b_seq }">${ba.p_quantity }</label>&nbsp;&nbsp;&nbsp;
						<span class="plus_btn" style="cursor:pointer;" value="${ba.b_seq }">+</span>
					</div>
					</c:if>
				</div>
				<div class="price_wrap">
					<input type="hidden" value="${ba.p_price }" id="eachPrice${ba.b_seq }">											
					<input type="hidden" value="${ba.p_price * ba.p_quantity}" id="pMq${ba.b_seq }">
					<c:if test="${ba.quantity ne 0 }">
						<span class="eachMultiple${ba.b_seq }">
						<fmt:formatNumber type="currency" currencySymbol="" value="${ba.p_price * ba.p_quantity}" />
						</span> 원
					</c:if>
					<c:if test="${ba.quantity eq 0 }">
						<span><font style="color:red">SOLD OUT</font></span>
					</c:if>
				</div>
				<div class="delete_wrap">
					<label class="delete_btn" value="${ba.b_seq }">X</label>
				</div>
			</div>
		</div>
		<input type="hidden" value="${ba.stock_seq }" id="eachSs${vs.count }">
	</div>	
</c:forEach>
		
	<div class="sub2Container">
		<div class="proudct-checkout">
			<div class="gonna-pay"><strong>주문예정금액</strong></div>
			<table class="price-Table">
				<tr>
					<td class='leftTd' style="padding-top: 20px;">상품금액</td>
					<td class='rightTd' style="padding-top: 20px;"><span id="totalP_price">${blist[0].total_price }</span> 원</td>
				</tr>
				<tr>
					<td class='leftTd' style="padding-top: 15px;">예상 배송비</td>
					<td class='rightTd' style="padding-top: 15px;">
						<c:set value="${blist[0].total_price2 }" var="total"/>
						<c:if test="${ total gt 10000}">
							<span class="post_price" value="0">0</span> 원
						</c:if>
						<c:if test="${ total lt 10000}">
							<c:if test="${ total eq 0}">
								<span class="post_price" value="0">0</span> 원
							</c:if>
							<c:if test="${ total ne 0}">
								<span class="post_price" value="3000">
									<fmt:formatNumber type="currency" currencySymbol="" value="${'3000'}" />
								</span> 원
							</c:if>
						</c:if>
												
					</td>
				</tr>
				<tr>
					<td class='leftTd' style="padding-top: 30px; font-weight: bold; font-size: 18px;">총 결제 예정 금액</td>
					<td class='rightTd' style="padding-top: 30px; font-weight: bold; font-size: 18px;">
					<input type="hidden" id="flexTotal" value="">
					<input type="hidden" id="flexPostFee" value="">
						<c:if test="${ total gt 10000}">
							<span class="pay_price">
								<fmt:formatNumber type="currency" currencySymbol="" value="${total}"/>
							</span> 원
						</c:if>
						<c:if test="${ total lt 10000}">
							<c:if test="${ total eq 0}">
								<span class="pay_price"> 0 </span> 원
							</c:if>
							<c:if test="${ total ne 0}">
								<span class="pay_price">
								<fmt:formatNumber type="currency" currencySymbol="" value="${total + 3000}" />
								</span> 원
							</c:if>	
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan='2'>
						<label class="orderBtn">주문하기</label>
					</td>
				</tr>
				
			</table>
		</div>
	</div>
	
<div>
</div>
</c:if>
	
</div>
<!-- 메시지 영역 -->
<div class="wModal">
	<div class="wModal-content">
		<span id="msg"></span>
	</div>
</div>

<!-- 주문하기 -->
<form action="/payment/basketOrder" method="post" id="bOrderFrm">
 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
	<input type='hidden' name="blist_stockseq" id="blist_stockseq" value="">	
	<input type='hidden' name="blist_pQuantity" id="blist_pQuantity" value="">
</form>

<!----------------- SCRIPT ZONE ----------------->
<script>
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
    		//str += "<hr style='margin-top:-10px;' width='100%' color='#DADCE0'>";
    		//str += "<img alt='사진없음' class='basketImg' src='/img/store-img/cart.png'>";            		
    		str += "<span>장바구니에 담긴 상품이 없습니다.</span><br>";
    		//str += "<input type='button' class='goShopping' value='계속 쇼핑하기'>";
    		
    		
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
	            		//str += "<hr style='margin-top:-10px;' width='100%' color='#DADCE0'>";
	            		//str += "<img alt='사진없음' class='basketImg' src='/img/store-img/cart.png'>";            		
	            		//str += "<label class='nothingLabel' value='장바구니에 담긴 상품이 없습니다.'></label>";
	            		str += "<span>장바구니에 담긴 상품이 없습니다.</span><br>";

	            		
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
</script>

</body>
</html>