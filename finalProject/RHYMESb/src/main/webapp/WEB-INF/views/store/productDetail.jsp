<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
   <link rel="stylesheet" type="text/css"   
   href="<%=request.getContextPath() %>/css/store/silde.css">
   
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
<!-- <link href="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script> -->
<head>

<meta charset="UTF-8">

<!-- security ajax -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<% String ctx = request.getContextPath(); %>

<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" href="/css/store/productDetail.css">

<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
</script>

<!-- 상품후기 -->
<script type="text/javascript" src="<%=ctx%>/js/store/productreview.js"></script> 
<!-- 상품qna -->
<script type="text/javascript" src="<%=ctx%>/js/store/productqna.js"></script>

</head>
<body>
<input type="hidden" id="hdnPseq" value="${productDto.p_seq }">

<div id="body_wrap">
<div id="middle_wrap">


<div id="wrapper">
      <div id="slider-wrap">
          <ul id="slider">
          <li data-color="#1abc9c">              
            <img src="/upload/store/${productDto.photo1_file }">
             </li>
             <li data-color="#1abc9c">              
            <img src="/upload/store/${productDto.photo2_file }">
             </li>
             <li data-color="#1abc9c">              
            <img src="/upload/store/${productDto.photo3_file }">
             </li>
             <li data-color="#1abc9c">              
            <img src="/upload/store/${productDto.photo4_file }">
             </li>
             <li data-color="#1abc9c">              
            <img src="/upload/store/${productDto.photo5_file }">
             </li>
          </ul>
           <!--controls-->
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
                
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>
          <!--controls-->  
                 
      </div>
   </div>


  <div id="side_goods">
  <h4>${ productDto.c_name}</h4>
   <p style="color: gray;font-size: 20px;margin-bottom: 32px;">${ productDto.p_name}</p>
   <c:if test="${productDto.bfs_price ne 0 }">
   <span style="color: gray;font-size: 17px; float: left; text-decoration: line-through; margin-top: 5px;">&#8361;${ productDto.bfs_price2}</span>&nbsp;
   </c:if>
   <span style="color: gray;font-size: 20px; color:orange; font-weight: bolder;">&#8361;${ productDto.p_price2}</span>
   <br><br>
   <p style="color: gray;font-size: 15px">${ productDto.p_title}</p><br>
 	
   <p style="color: gray;font-size: 15px; margin-bottom: 5px;">· MADE IN ${productDto.nation}</p>
   <p style="color: gray;font-size: 15px; margin-bottom: 5px;">· COLOR : ${productDto.p_color}</p>
   <p style="color: gray;font-size: 15px; margin-bottom: 5px;">· SKU : ${productDto.cp_code}</p>
   <p style="color: gray;font-size: 15px">· MANUFACTURED : ${productDto.madeYear}/${productDto.madeMonth}</p>
   
   
   <br>
   <div class='' style="cursor:pointer; width: 450px;" onclick="detail(${pro.p_seq })"> 
      <p style="color: gray;font-size: 15px; margin-bottom: 2px;"><strong>사이즈 선택</strong></p>
      <c:forEach items="${sizelist }" var="size" varStatus="vs">
         <c:if test="${size.quantity ne 0 }">
         <input type="radio" name='sizeRadio' id="chooseSize${vs.count }" class="_chooseSize${index.count }" style="display:none" value="${size.size }" value2="${size.stock_seq }">
         <label for="chooseSize${vs.count }" id="_sizeChoo" class="sizeLabel" style="cursor: pointer; background-color: white;" value="${size.stock_seq }">${size.size }</label>
         </c:if>
         <c:if test="${size.quantity eq 0 }">
         <input type="radio" name='sizeRadio' id="chooseSize${vs.count }" disabled="disabled" class="_chooseSize${index.count }" style="display:none" value="${size.size }" value2="${size.stock_seq }">
         <label for="chooseSize${vs.count }" id="_sizeChoo" style="cursor: pointer; background-color: grey; color:white; "onclick="soldout()">${size.size }</label>
         </c:if>
      </c:forEach>
   </div>

   <div id="fewSizeDiv" style="margin-bottom: 20px;">
   		<label id="fewSizeNotice" style="display:none;"></label>
   </div>
   <c:if test="${productDto.sum ne 0 }">
     수량&nbsp;
   <span class="pqSelect">
      <span class="minus_Btn" style="cursor:pointer;">-</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <label id="pqCnt">1</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <span class="plus_btn" style="cursor:pointer;">+</span>
   </span>
   </c:if>
   <br>
   
   <div id="b_btn">
   <!-- not sold out -->
   <c:if test="${productDto.sum ne 0 }">
	   <input type="button" value="바로구매" id="buyBtn" onclick="buying()" style="cursor:pointer;"><br>
	   <input type="button" value="장바구니" class="basketBtn" style="cursor:pointer;">
	   <button type="button" class="wishBtn" style="cursor:pointer;">
	      위시리스트
	      <span>
	      <c:if test="${wishChk == false }">
	         <img class="heartImg" src="/img/store-img/unlike.png" style="width:10px; height:10px;">
	      </c:if>
	      <c:if test="${wishChk == true }">
	         <img class="heartImg" src="/img/store-img/like.png" style="width:10px; height:10px;">
	      </c:if>
	      </span>
	   </button>
	<!-- sold out -->
	</c:if>
		
	<c:if test="${productDto.sum eq 0 }">
		<input type="button" value="SOLD OUT" id="soldoutBtn" style="color:white; cursor: default;">
	</c:if>
		<br><br>
		<span id="restockBtn">
			<img src="data:image/png;base64,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">
			NOTIFY ME 입고 알림신청
		</span>	
		
	<!-- 미니 장바구니 영역 -->
	    <div class="basket" style="overflow: scroll;">
    </div>
</div>
</div>

<!-- 메시지 영역 -->
<div class="wModal">
   <div class="wModal-content">
      <span id="msg"></span>
   </div>
</div>

<!-- 재입고 모달 영역-->

<div class="restockModal">
	<div class="restockModal-content">
		<div>
			<strong style="font-size: 17px;">NOTIFY ME 입고 알림 신청</strong><br><br>
			<label style="color:grey; font-size: 13px;">상품이 입고되는 즉시, 바로 만나보세요!<br>입력하신 휴대폰 번호로 알림 메시지를 보내드립니다.</label>			
			<hr width = "100%" color = "#DADCE0">
		</div>
		
		<div style="text-align: center; margin-top: 30px;">
			<strong style="font-size: 17px;">${ productDto.p_name}</strong><br><br>
			<c:if test="${ productDto.p_title ne ''}">
			<label style="color:grey; font-size: 13px;">${ productDto.p_title} /</label>
			</c:if>
			<label style="color:grey; font-size: 13px;">${ productDto.p_color}</label>
			
			<div id="restock-img">
				<img alt="사진1" src="/upload/store/${productDto.photo1_file }">
				
			</div>
			<hr width = "100%" color = "#DADCE0">
			<div id="restock-size" style="margin-top: -10px;">
				<div>
					<div style="float:left;">
						<strong>사이즈</strong>
					</div>
					<div class="_putrsSize" style="align:right">
						<label style="color:grey; font-size: 12px;" class="restockLabel">사이즈를 선택하세요.</label> &nbsp;
						<input type="hidden" id="restockseq-hdn">
					</div>
				</div>
				<div style="margin-top: 50px;">
				<c:forEach items="${sizelist }" var="size" varStatus="vs">
					<c:if test="${size.quantity eq 0 }">
						<input type="radio" name='restockRadio' id="chooseSize${vs.count }" class="_chooseSize${index.count }" style="display: none"
						value="${size.size }" value2="${size.stock_seq } ">
						<label for="chooseSize${vs.count }" id="_sizeRestock" class="restock_label" value="${size.stock_seq }" value2="${size.size }"
						style="cursor: pointer; background-color: white;"><strong>${size.size }</strong></label>
					</c:if>
					<c:if test="${size.quantity ne 0 }">
						<label id="_sizeRestock" style="background-color: #DADCE0; color: grey;" >${size.size }</label>
					</c:if>
				</c:forEach>
				</div>
			<div style="text-align: left; margin-top: 20px;">
				<strong>휴대폰 번호</strong><br>
				<input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="&quot;-&quot;&nbsp;없이 숫자만 입력해 주세요." id="restockPhone">	
				<br><br>
				<div style="font-size: 12px;">
				<input type="checkbox" name="personinfoChk" id="restockInfoChk" style="margin-bottom: 15px; cursor: pointer;">
					&nbsp;<a href="#" style="color:black"><b>개인정보 수집,</b></a> 이용에 동의합니다.
				</div><br>
				<div align="center">
					<input type="button" value="입고 알림 신청" id="rsFinish-btn">
				</div>
			</div>
			</div>
		</div>
	</div>
</div>


<!-- 구매하기 form -->
<form action="/payment" id="orderFrm" method="post">
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
   <input type='hidden' name="stock_seq" id="stock_seq">
   <input type='hidden' name="p_quantity" id="p_quantity" >
</form>   

<!-- 장바구니 구매하기 form -->
<form action="/payment/basketOrder" method="post" id="bOrderFrm">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> 
   <input type='hidden' name="blist_stockseq" id="blist_stockseq" value="">   
   <input type='hidden' name="blist_pQuantity" id="blist_pQuantity" value="">
</form>

<div id="aa"></div>

<ul class="goods-view-infomation-tab-group">
   <li class="goods-view-infomation-tab">
   <a href="#goods_info" class="goods-view-infomation-tab-anchor __active" style="border: 1px solid #CFEC40; border-bottom: none;">Information</a>
   </li>
   <li class="goods-view-infomation-tab">
   <a href="#goods_review" class="goods-view-infomation-tab-anchor">Review</a>
   </li>
   <li class="goods-view-infomation-tab">
   <a href="#goods_qna" class="goods-view-infomation-tab-anchor">Q & A</a>
   </li>
   <li class="goods-view-infomation-tab">
   <a href="#goods_de" class="goods-view-infomation-tab-anchor">Delivery / Exchange</a>
   </li>
   <li class="goods-view-infomation-tab-group:after"></li>
</ul>



<div class="goods-view-infomation-content __active" id="goods_info">

<div align="center">
     <%--  p_title(상품 기본정보 입력:부가설명) : ${productDto.p_title}<br> --%>
     <!--  detail(상품 상세정보 입력) : --> 
     

      
       <img src="/upload/store/${productDto.photo1_file }" style="width: 700px;height: 700px;margin: 50px"><br><br><br><br>
        <img src="/upload/store/${productDto.photo2_file }" style="width: 700px;height: 700px;margin: 50px"><br><br><br><br>
         <img src="/upload/store/${productDto.photo3_file }" style="width: 700px;height: 700px;margin: 50px"><br><br><br><br>
          <img src="/upload/store/${productDto.photo4_file }" style="width: 700px;height: 700px;margin: 50px"><br><br><br><br>
           <img src="/upload/store/${productDto.photo5_file }" style="width: 700px;height: 700px;margin: 50px"><br><br><br><br>
           
           
           
                <p style="font-size: 15px;">${productDto.detail}</p><br>
      
     </div> 
      
      
      



<!-- 후기 review -->
<br><br>
<ul class="goods-view-infomation-tab-group">
   <li class="goods-view-infomation-tab">
   <a href="#goods_info" class="goods-view-infomation-tab-anchor">INFOMATION</a>
   </li>
   <li class="goods-view-infomation-tab">
   <a href="#goods_review" class="goods-view-infomation-tab-anchor __active" style="border: 1px solid #CFEC40; border-bottom: none;">REVIEW</a>
   </li>
   <li class="goods-view-infomation-tab">
   <a href="#goods_qna" class="goods-view-infomation-tab-anchor">Q&A</a>
   </li>
      <li class="goods-view-infomation-tab">
   <a href="#goods_de" class="goods-view-infomation-tab-anchor">Delivery / Exchange</a>
   </li>
   <li class="goods-view-infomation-tab-group:after"></li>
</ul>

<div class="goods-view-infomation-content" id="goods_review">
<div id="_product_review_wrap">
      <div  id="_product_review" >
         <script type="text/javascript">getProductReview(0,${productDto.p_seq });</script>
      </div>
      
</div>
</div>
<!-- 후기 끝 -->



<!-- 상품qna -->
<br><br>
<ul class="goods-view-infomation-tab-group">
   <li class="goods-view-infomation-tab">
   <a href="#goods_info" class="goods-view-infomation-tab-anchor">INFOMATION</a>
   </li>
   <li class="goods-view-infomation-tab">
   <a href="#goods_review" class="goods-view-infomation-tab-anchor">REVIEW</a>
   </li>
   <li class="goods-view-infomation-tab">
   <a href="#goods_qna" class="goods-view-infomation-tab-anchor __active" style="border: 1px solid #CFEC40; border-bottom: none;">Q&A</a>
   </li>
   <li class="goods-view-infomation-tab">
   <a href="#goods_de" class="goods-view-infomation-tab-anchor">Delivery / Exchange</a>
   </li>
   <li class="goods-view-infomation-tab-group:after"></li>
</ul>


<div class="goods-view-infomation-content" id="goods_qna">
<div id="_product_qna_wrap" >
      <div  id="_product_qna" >
         <script type="text/javascript">getProductQna(0,${productDto.p_seq });</script>
      </div>
</div>
</div>
<!-- 리뷰 끝 -->


<!-- 배송 교환 안내  -->
<br><br>
<ul class="goods-view-infomation-tab-group">
   <li class="goods-view-infomation-tab">
   <a href="#goods_info" class="goods-view-infomation-tab-anchor">INFOMATION</a>
   </li>
   <li class="goods-view-infomation-tab">
   <a href="#goods_review" class="goods-view-infomation-tab-anchor">REVIEW</a>
   </li>
   <li class="goods-view-infomation-tab">
   <a href="#goods_qna" class="goods-view-infomation-tab-anchor">Q&A</a>
   </li>
   <li class="goods-view-infomation-tab">
   <a href="#goods_de" class="goods-view-infomation-tab-anchor __active" style="border: 1px solid #CFEC40; border-bottom: none;" >Delivery / Exchange</a>
   </li>
   <li class="goods-view-infomation-tab-group:after"></li>
</ul>


<div class="goods-view-infomation-content" id="goods_de">
<div id="_product_de_wrap" >
      <div  id="_product_de" >
         <div style="font-size: 12px;">
      <p>
      <strong>Tax&nbsp;Information</strong>
      </p>
      
      <ul>
      <li>
         <span style="color: #777777;">
         · Tax & Duties not included. All Tax & Duties should be covered by buyer.
         <br>
         </span>
      </li>
      
      <li>· 국내 배송 상품에는 부가세가 포함되어있습니다.</li>
      </ul>
      
      <br>
      <p>
      <strong>Delivery&nbsp;Information</strong>
      </p>
      
      <ul>
         <li>
         <span style="color: #777777;">
         · 우체국 택배를 이용하여 전 세계, 국내 전지역으로 배송됩니다.
         </span>
         </li>
         <li>
         <span style="color: #777777;">
         · 배송기간은 통상 2일~7일정도가 소요됩니다.
         </span>
         </li>
         <li>
         <span style="color: #777777;">
         · 오후3시까지 결제확인 된 주문은 당일 출고되며 10만원 이상 주문은 무료배송, 10만원 미만은 3,000원의 배송비가 추가됩니다.
         </span>
         </li>
         <li>
         <span style="color: #777777;">
         · 도서산간은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다. 고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 단, 상품 종류에 따라서 상품이 다소 지연될 수 있습니다.
         </span>
         </li>            
      </ul>

       <br>
      <br>
      <p>
      <strong>Exchange&nbsp;Information</strong>
      </p>
      
      
      <p>
         <span style="color: #777777;">
         <strong>1. 교환 및 반품이 가능한 경우</strong>
         </span>
      </p>
      
      <ul>
         <li>
         <span style="color: #777777;">
         · 상품을 수령하신 날을 포함한 7일 이내에 제품택이 손상되지 않고, 착용을 하지 않은 제품에 한하여, 교환 및 반품이 가능합니다.
         </span>
         </li>
      </ul>
      <br>
      <p>
         <span style="color: #777777;">
         <strong>2. 교환 및 반품이 불가능한 경우</strong>
         </span>
      </p>
      <ul>
         <li>
         <span style="color: #777777;">
         · 악세서리와 속옷, 화장품의 경우 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우
         </span>
         </li>
         <li>
         <span style="color: #777777;">
         · 고객님의 부주의로 상품 등이 멸실 또는 훼손된 경우
         </span>
         </li>
         <li>
         <span style="color: #777777;">
         · 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우
         </span>
         </li>
         <li>
         <span style="color: #777777;">
         · 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우
         </span>
         </li>
         <li>
         <span style="color: #777777;">
         · 시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우
         </span>
         </li>
         <li>
         <span style="color: #777777;">
         · 상품복제를 위해 구매후 교환 및 반품하는 경우
         </span>
         </li>
         <li>
         <span style="color: #777777;">
         · 고객님의 변심으로 인한 교환, 반품을 원하실 경우, 상품배송비용은 고객님께서 부담하셔야합니다.(색상교환, 사이즈 교환 등 포함)
         </span>
         </li>         
      </ul>
    </div> 

      </div>
</div>
</div>
<!-- 배송교환안내 끝 -->



</div>

<!--------------------------------------------- ★SCRIPT ZONE★ ---------------------------------------------->   

<script>
//current position
var pos = 0;
//number of slides
var totalSlides = $('#slider-wrap ul li').length;
//get the slide width
var sliderWidth = $('#slider-wrap').width();
var id = "${userloginid}";
var blist_stockseq = "";
var blist_pQuantity = "";
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
// 입고 알림신청(모달) 신청버튼 클릭 : INSERT
$(document).on('click', '#rsFinish-btn', function(){
	//★폰번호 자릿수, 체크박스 유효성 체크해야함
	
	var phone = $("#restockPhone").val();
	var stock_seq = $("#restockseq-hdn").val();
	var pinfoChk = $("input:checkbox[name='personinfoChk']").prop("checked");
	
	if(stock_seq == ""){
		$("#msg").html("<strong>사이즈를 선택해주세요.</strong>");
      	 $(".wModal").fadeIn();
     	 setTimeout(function() {
         	$(".wModal").fadeOut();
         },800);
    }else{
		if(phone.length == 11){
			 
			if(pinfoChk){
				$.ajax({
			         type:"get",
			         data: "phone=" + phone + "&stock_seq=" + stock_seq,
			         url:"/store/restockNotify_insert",
			         success:function( data ){
			        	 if(data == "already"){
			        		 $("#msg").html("<strong>이미 입고 알림신청이 된 상태입니다.</strong>");
			   		      	 $(".wModal").fadeIn();
			   		     	 setTimeout(function() {
			   		         	$(".wModal").fadeOut();
			   		         },2500);
			   		     	$(".restockLabel").html("사이즈를 선택하세요.");
			   		        $("input:radio[name='restockRadio']").prop("checked", false);
					        $(".restock_label").attr('style', 'background-color:white'); 
			   		     	 
			        	 }
			        	 else if(data == "insert"){
					          // 닫고 초기화
					          $(".restockModal").fadeOut();
						      $("#restockPhone").val("");
						      $("input:radio[name='restockRadio']").prop("checked", false);
						      $(".restock_label").attr('style', 'background-color:white');
						      $(".restockLabel").html("사이즈를 선택하세요.");
					          // 성공 메시지
						      $("#msg").html("<strong>입고 알림신청이 완료되었습니다.</strong>")
						      $(".wModal").fadeIn();
						      setTimeout(function() {
						         $(".wModal").fadeOut();
						      },2500);
			        	 }          
			       },
			         error:function(){
			            alert("error!!"); 
			         }
			     })
			}else{
				 $("#msg").html("<strong>입고 알림 신청을 위해 개인정보 수집에 동의해주세요.</strong>");
   		      	 $(".wModal").fadeIn();
   		     	 setTimeout(function() {
   		         	$(".wModal").fadeOut();
   		         },2000);
			}   
		  }else{
			  $("#msg").html("<strong>휴대폰 번호를 정확하게 입력해주세요</strong>");
		      	 $(".wModal").fadeIn();
		     	 setTimeout(function() {
		         	$(".wModal").fadeOut();
		         },2000);
		     	$("#restockPhone").focus();
		   }
    	}
});
// 입고 알림모달 안에서 사이즈선택 클릭
$(document).on('click', '.restock_label', function(){
	
	$(".restock_label").attr('style', 'background-color:white');
	$(this).attr('style', 'background-color:#d7fd75');
	var restock_seq = Number($("input[name='restockRadio']:checked").attr("value2"));
	var restock_size = Number($("input[name='restockRadio']:checked").val());
	
	var stock_seq = $(this).attr("value");
	var stock_size = $(this).attr("value2");
	
	//alert(stock_seq);
	//alert(stock_size);
	$("#restockseq-hdn").val(stock_seq);
	$(".restockLabel").html("<strong>"+stock_size+"</strong>");
	
});
/* restock모달 영역 외 클릭시 close */
$('body').click(function(e){
	 if($(".restockModal").css("display") == "block") {
        if(!$('.restockModal, .restockModal').has(e.target).length) { 
        	//$(".modal").css("display", "none");
        	$(".restockModal").fadeOut();
        	$("#restockPhone").val("");
        	$("#restockseq-hdn").val("");
        	
        	$("input:radio[name='restockRadio']").prop("checked", false);
        	$(".restock_label").attr('style', 'background-color:white');
        	$(".restockLabel").html("사이즈를 선택하세요.");
         } 
 	 }
});
// restock
$(document).on('click', '#restockBtn', function(){
	 
	if(id==""){
	      $("#msg").html("<b><font style='font-size:35px'>로그인 후 이용해주세요.</b>")
	      $(".wModal").fadeIn();
	      setTimeout(function() {
	         $(".wModal").fadeOut();
	      },1500);
	      
	}else{
		$(".restockModal").fadeIn();
	}
	//var p_seq = "${productDto.p_seq }";
	
	
	
});
// sold out
function soldout(){
   $("#msg").html("<b><font style='font-size:35px'>SOLD OUT</font></b>")
   $(".wModal").fadeIn();
   setTimeout(function() {
      $(".wModal").fadeOut();
   },700);
}
// 미니장바구니 modal 영역 외 클릭시 hide
$('body').click(function(e){
    if($(".basket").css("display") == "block") {
         if(!$('.basket, .blist').has(e.target).length) { 
            $(".basket").hide("slow");
            
          } 
      }
});
//사이즈 선택시 버튼색상 변경
$(document).on('click', '.sizeLabel', function(){
   $(".sizeLabel").attr('style', 'background-color:white');
   $(this).attr('style', 'background-color:#d7fd75');
   
   var stock_seq = $(this).attr("value");
   
   $.ajax({
		type:"get",
        data: "stock_seq=" + stock_seq,
        url:"/store/stockCheck",
        success:function( data ){
       		$("#fewSizeNotice").show();
       		if(data >= 1  && data <6){
       			$("#fewSizeNotice").html("ONLY "+ data + " LEFT");
       		}else if(data >=6 && data < 10){
       			$("#fewSizeNotice").html("ONLY FEW LEFT");
       		}else{
       			$("#fewSizeNotice").hide();
       		}
        },
        error:function(){
           alert("error!!"); 
        }
	});
   
   
});
/* 위시리스트 클릭 */
$(document).on('click', '.wishBtn', function(){
   
   if(id==""){
      $("#msg").html("<b><font style='font-size:35px'>로그인 후 이용해주세요.</b>")
      $(".wModal").fadeIn();
      setTimeout(function() {
         $(".wModal").fadeOut();
      },1500);
      
   }else{
      var p_seq = $("#hdnPseq").val();
      $("#msg").html("");
   
      $.ajax({
           type:"get",
           data: "p_seq=" + p_seq,
           url:"/store/operWishlist",
           success:function( data ){
              if(data == "insert"){
                 $(".heartImg").attr('src', '/img/store-img/like.png');
                 $("#msg").html("<b>위시리스트에 등록되었습니다.</b>")
                 $(".wModal").fadeIn();
                 setTimeout(function() {
                    $(".wModal").fadeOut();
                 },500);
              }else if(data == "delete"){
                 $(".heartImg").attr('src', '/img/store-img/unlike.png');
                 $("#msg").html("<b>위시리스트에서 삭제되었습니다.</b>")
                 $(".wModal").fadeIn();
                 setTimeout(function() {
                    $(".wModal").fadeOut();
                 },500);
              }
         },
           error:function(){
              alert("error!!"); 
           }
      }) 
   }   
});
//장바구니 클릭
$(document).on('click', '.basketBtn', function(){   
   var stock_seq = Number($("input[name='sizeRadio']:checked").attr("value2"));
   var cnt = Number($("#pqCnt").html());
      
      if(isNaN(stock_seq)){
    	 $("#msg").html("<b>사이즈를 선택해주세요.</b>")
         $(".wModal").fadeIn();
         setTimeout(function() {
            $(".wModal").fadeOut();
         },700);
      }else{
    	  
    	  $.ajax({
    			type:"get",
    	        data: "stock_seq=" + stock_seq,
    	        url:"/store/stockCheck",
    	        success:function( data ){
    	        	// 변경될 수량이 재고수량보다 많을 때
    	        	if(cnt>data){
    	        		$("#msg").html("<b>재고수량보다 많습니다.</b>");
    	            	$(".wModal").fadeIn();
    	            	setTimeout(function() {
    	            		$(".wModal").fadeOut();
    	            	},1500);
    	            	
    	            	$("#pqCnt").html("1");
    	            	
    	        	}
    	        	// 변경될 수량이 재고수량보다 적거나 같을 때
    	        	else{
    	        		if(id==""){
    	        			insertSessionBasket(stock_seq, cnt);
    	        		}else{
    	        			insertBasket(stock_seq, cnt);
    	        		}
    	        	}
    	        },
    	        error:function(){
    	           alert("error!!"); 
    	        }
    			
    		});
      }
      
});
function insertSessionBasket(stock_seq, cnt){
	   $.ajax({
           type:"get",
           data: "stock_seq=" + stock_seq + "&p_quantity=" + cnt,
           url:"/store/insertSessionBasket",
           success:function( data ){
              var obj = JSON.stringify(data);
            var arr = JSON.parse(obj);
            //alert(arr[0].total_price);
            var arrLen = arr.length;
              showBasketList(arrLen, arr);
           },
           error:function(){
              alert("error!!"); 
           }
         })
} 
function insertBasket(stock_seq, cnt){
	$.ajax({
        type:"get",
        data: "stock_seq=" + stock_seq + "&p_quantity=" + cnt,
        url:"/store/insertBasket",
        success:function( data ){
           var obj = JSON.stringify(data);
         var arr = JSON.parse(obj);
         //alert(arr[0].total_price);
         var arrLen = arr.length;
           showBasketList(arrLen, arr);
        },
        error:function(){
           alert("error!!"); 
        }
      })
}
/* 미니 장바구니 리스트 */
function showBasketList(arrLen, arr){
   $(".blist").html("");
   $("#baskettitle").remove();
   var str = "";
   var str = "<br><br><div align='center' id='baskettitle'><h4>장바구니</h4><br></div>";
   for (var i = 0; i < arrLen; i++) {
      str += "<div stylesdf='margin-top:5%;' align='center' class='blist' >";
      str += "<label><img src='/upload/store/"+ arr[i].photo1_file + "' style='width:100px; height:100px;'><br>";
      str += "<label class='_bDeleteBtn' value='"+arr[i].stock_seq+"'>X</label><br>";
      str += "<label>" + arr[i].p_name + "</label><br>";
      str += "<label>사이즈 : " + arr[i].size + "</label><br>";
      str += "<label>수량 : " + arr[i].p_quantity + "</label><br>";
      if(arr[i].p_price2 != 'SOLD OUT'){
      	str += "<label>&#8361;" + arr[i].p_price2 + "</label>";
	      blist_stockseq += arr[i].stock_seq;
	      blist_stockseq += "/";
	      blist_pQuantity += arr[i].p_quantity;
	      blist_pQuantity += "/";
	      
      }else if(arr[i].p_price2 === 'SOLD OUT'){
    	str  += "<label style='color:red;'>" + arr[i].p_price2 + "</label>";   
      }      
      str += "<hr width = '100%' color='white'>";
      
   }
         
      str += "<label class='moveBasketBtn'>장바구니 바로가기</label><br>";
      str += "<label class='_basketOrderBtn'>구매하기</label>";
      str += "<br><br><b><label value='"+arr[0].total_price+"' class='_bTotalPrice'>총 상품금액 : " + arr[0].total_price + "</b>원</label><br><br>";
      str += "</div>";
      
      $("#blist_stockseq").val(blist_stockseq);
      $("#blist_pQuantity").val(blist_pQuantity);
      
   $(".basket").append(str);
   
   $(".basket").animate({width:'toggle'},350);
}
/* 미니장바구니 전체 구매버튼 클릭 */
$(document).on('click', '._basketOrderBtn', function(){
   	var stockseq = $("#blist_stockseq").val();
   	var quantity = $("#blist_pQuantity").val();
	//alert(stockseq);
	//alert(quantity);
	$("#bOrderFrm").submit();      
});
/* 장바구니 페이지 이동버튼 클릭 */
$(document).on('click', '.moveBasketBtn', function(){
	location.href="/store/basket";	
});
/* 미니장바구니 삭제버튼 클릭 */
$(document).on('click', '._bDeleteBtn', function(){
   //alert("삭제");
   var stock_seq = $(this).val();
   //alert("재고번호 : " + stock_seq);
   /* ajax로 삭제하고 리스트 다시 뿌려야함 */
});
/* 구매버튼 클릭 */
function buying(){
   
   	  var stock_seq = Number($("input[name='sizeRadio']:checked").attr("value2"));
   	  //alert(stock_seq);
   
      if(isNaN(stock_seq)){
         $("#msg").html("<b>사이즈를 선택해주세요.</b>")
         $(".wModal").fadeIn();
         setTimeout(function() {
            $(".wModal").fadeOut();
         },700);
      }else{
         var cnt = Number($("#pqCnt").html());
		
         $.ajax({
     		type:"get",
             data: "stock_seq=" + stock_seq,
             url:"/store/stockCheck",
             success:function( data ){
             	// 변경될 수량이 재고수량보다 많을 때
             	if(cnt>data){
             		$("#msg").html("<b>구매수량이 재고수량보다 많습니다.</b>");
                 	$(".wModal").fadeIn();
                 	setTimeout(function() {
                 		$(".wModal").fadeOut();
                 	},1500);
                 	$("#pqCnt").html("1");
             	}
             	// 변경될 수량이 재고수량보다 적거나 같을 때
             	else{
             		$("#p_quantity").val(Number(cnt));
                    $("#stock_seq").val(Number(stock_seq));
                    $("#orderFrm").submit();
             	}
             },
             error:function(){
                alert("error!!"); 
             }
     		
     	}); 
         //alert(typeof $("#p_quantity").val());
         //alert(typeof $("#stock_seq").val());
      }
   
}
/* 구매 수량 */
$(document).on('click', '.plus_btn', function(){
var cnt = Number($("#pqCnt").html());
	
	if(cnt<9){
	   $("#pqCnt").html(cnt+1);   
	}else{
	
	   $("#msg").html("<b>최대 구매수량을 초과했습니다.</b>")
	   $(".wModal").fadeIn();
	   setTimeout(function() {
	      $(".wModal").fadeOut();
	   },900);
	}
	
	
});
$(document).on('click', '.minus_Btn', function(){
var cnt = Number($("#pqCnt").html());
if(cnt!=1){
   $("#pqCnt").html(cnt-1);
}    
});
</script>


<!-- 상품문의 -->
<script type="text/javascript">
/* 클릭시 내용보이기 */
$(".detail").hide();
function pqnadetail(seq){
   
   if($("#detail"+seq).css("display")=="none"){
      $(".detail").hide();
      $("#detail"+seq).show();
   
   }else{
      $("#detail"+seq).hide();
   }
}
/* 버튼 */
function PqnaAnswer( seq ) {
   location.href = "pqnaanswer?seq=" + seq;
}
function PqnaDelete( seq ) {
   location.href = "pqnadelete?seq=" + seq;
}
function PqnaUpdate( seq ) {
   location.href = "pqnaupdate?seq=" + seq;
}
$("#_btnWrite").click(function () { 
   location.href = "pqnawrite";
});
function goPage( pageNumber,p_seq) {
   
   $("#_pageNumber").val(pageNumber);  // 들어오는 값을 가져옴 
   $("#_p_seq").val(p_seq);  // 들어오는 값을 가져옴 
   $("#_frmFormSearch").attr("action", "/store/productDetail").submit(); //
   
}
$(document).ready(function(){
    /*****************
     BUILD THE SLIDER
    *****************/
    //set width to be 'x' times the number of slides
    $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
    
    //next slide    
    $('#next').click(function(){
        slideRight();
    });
    
    //previous slide
    $('#previous').click(function(){
        slideLeft();
    });
    
    
    
    /*************************
     //*> OPTIONAL SETTINGS
    ************************/
    //automatic slider
    var autoSlider = setInterval(slideRight, 3000);
    
    //for each slide 
    $.each($('#slider-wrap ul li'), function() { 
       //create a pagination
       var li = document.createElement('li');
       $('#pagination-wrap ul').append(li);    
    });
    
    //counter
    countSlides();
    
    //pagination
    pagination();
    
    //hide/show controls/btns when hover
    //pause automatic slide when hover
    $('#slider-wrap').hover(
      function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
      function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
    );
    
    
});//DOCUMENT READY
    
/***********
 SLIDE LEFT
************/
function slideLeft(){
    pos--;
    if(pos==-1){ pos = totalSlides-1; }
    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
    
    //*> optional
    countSlides();
    pagination();
}
/************
 SLIDE RIGHT
*************/
function slideRight(){
    pos++;
    if(pos==totalSlides){ pos = 0; }
    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
    
    //*> optional 
    countSlides();
    pagination();
}
    
/************************
 //*> OPTIONAL SETTINGS
************************/
function countSlides(){
    $('#counter').html(pos+1 + ' / ' + totalSlides);
}
function pagination(){
    $('#pagination-wrap ul li').removeClass('active');
    $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
}
</script>  
      
</body>
</html>