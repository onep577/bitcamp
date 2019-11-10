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
	
	$(".restockModal").fadeIn();
	
	var p_seq = "${productDto.p_seq }";
	
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
      $("#msg").html("<b><font style='font-size:20px'>로그인 후 이용해주세요.</b>")
      $(".wModal").fadeIn();
      setTimeout(function() {
         $(".wModal").fadeOut();
      },1500);
      
      location.href="/member/login";
      
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
         
      str += "<label class='moveBasketBtn'>장바구니 가기</label><br>";
      str += "<label class='_basketOrderBtn'>바로구매</label>";
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