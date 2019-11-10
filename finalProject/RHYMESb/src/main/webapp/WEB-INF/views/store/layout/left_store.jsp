<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
 <!-- test -->
 
 
<!-- <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> -->
<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<!-- <script src="/js/store/jquery-3.4.1.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script> -->


<input type="hidden" class="_c1name" value="${c1_name }">
<input type="hidden" class="_keyword" value="${keyword }">

<div class="sidenav">

 <c:if test="${not empty c1_name}">
 <a style="text-align: left; font-size: 15px;" onclick="location.href='/store/productList?c1_name=${c1_name}'">
 		<c:if test="${not empty keyword}">
 			<br>${keyword }&nbsp;&nbsp;for&nbsp;
 		</c:if>
 		<b>${c1_name }</b>
 		<hr width = "85%" color = "#DADCE0">
 </a>
 </c:if>
<c:if test="${empty c1_name}">
 <a>
<c:if test="${criterion eq 'company_search' }">
	<font style="font-size: 15px;"><b>${keyword }</b></font>
</c:if>
<c:if test="${criterion eq 'all_search' }">
	RESULT : <b>${keyword }</b>
</c:if>
	<hr width = "85%" color = "#DADCE0">
</a>
</c:if>
<c:if test="${empty keyword}">
    <a href="/store/productList?c1_name=${c1_name}&key=best"><strong>BEST</strong></a>
    <a href="/store/productList?c1_name=${c1_name}&key=newarrival">NEW ARRIVAL</a>
    <a href="/store/productList?c1_name=${c1_name}&key=sale" style="color:red">SALE</a>
</c:if>    

  <c:forEach items="${cate2list }" var="cate2" varStatus="vs">
	  <input type="hidden" value="${cate2.c2_name }">
	  <button class="dropdown-btn" id="cate2Btn${cate2.c2_seq }" onclick="bring3cate(${cate2.c2_seq})" value="${cate2.c2_name }">
	  	${cate2.c2_name }<i class="fa fa-caret-down"></i>
	  </button>
	  <div class="dropdown-container" id="cate3zone${cate2.c2_seq }">
	    <!-- <a href="#">1</a> -->
	  </div>
  </c:forEach>
 
 <!-- C1_NAME없이 브랜드 클릭해서 들어왔을 때 -->
 <c:forEach items="${cate1list }" var="b_cate1" varStatus="vs">
   <!-- 1차 카테고리 -->
   <button class="dropdown-btn" id="withoutC1C1list" value="${b_cate1.c1_name}" value2="${b_cate1.c1_seq}">
   		${b_cate1.c1_name }
    	<i class="fa fa-caret-down"></i>
   </button>
   <!-- 2차 카테고리 -->
   <div class="dropdown-container" id="withoutC1C2${b_cate1.c1_seq}">
	   	<!-- 3차 카테고리 -->
	   
   </div>
 </c:forEach>

<!-- 브랜드 리스트 -->
  <br>
  <button class="dropdown-btn"><b>BRAND</b>
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <c:forEach items="${clist }" var="co" varStatus="vs">
    	<a href="#" class="brandClick">${co }</a>
    </c:forEach>
  </div>
<br>
<a style="cursor: pointer;" class="search_btn">
	<font style="color:green">SEARCH</font> 
	<img src="https://cdn0.iconfinder.com/data/icons/it-hardware/100/search-512.png"
	style="width:15px; height:15px;">&nbsp;
</a>
<br><br>
</div>

<!-- 검색 modal -->
<div class='modal' id="search_modal">
	<div class="modal-content2">
		
		<div id="modal_s">
			
			<input type="radio" name='mwChk' id="mChk" class="_mwChk" style="display:none" value="MEN">
			<label for="mChk" class="mwRadioL" style="cursor: pointer; background-color: white;">MEN</label>
			
			<input type="radio" name='mwChk' id="wChk" class="_mwChk" style="display:none" value="WOMEN">
			<label for="wChk" class="mwRadioL" style="cursor: pointer; background-color: white;">WOMEN</label>
			
			<input type="text" id="searchWord" style="widht:500px;" placeholder="SEARCH" onkeypress="if( event.keyCode==13 ){search();}" autocomplete="searchWord">

			<img src="https://cdn0.iconfinder.com/data/icons/it-hardware/100/search-512.png" style="width:40px; height:40px; cursor:pointer;" onclick="search()">  <!-- id="m_search_btn" -->&nbsp;
		</div>
	
	</div>
</div>


<body>

<!-- 검색 -->
<form action="/store/productList" method="get" id='searchFrm'>
	<input type='hidden' name="criterion" value="all_search">	
	<input type="hidden" name="keyword" class="keyword" value="">
	<input type="hidden" name="c1_name" class="c1_name" value="">
</form>
<!-- 브랜드 클릭 -->
<form action="/store/productList" method="get" id='brandClickFrm'>
	<input type='hidden' name='keyword' value="" class="keyword">	
	<input type='hidden' name='criterion' value="company_search">
</form>
<!-- 3차 카테고리 클릭 -->
<form action="/store/productList" method="get" id='c3ClickFrm'>
	<input type='hidden' name='c1_name' value="" class="c3_c1name">	
	<input type='hidden' name='c2_name' value="" class="c3_c2name">
	<input type='hidden' name='c3_name' value="" class="c3_c3name">
	<input type='hidden' name='keyword' value="" class="keyword">
	<input type='hidden' name='criterion' value="${criterion }" class="criterion">
	
</form>

<!--------------------- SCRIPTZONE ----------------------------------->
<script type="text/javascript">

//카테고리 없이 검색어바로 들어올시 1차카테고리 생성 후 
//1차 카테고리 클릭 -> 2차 카테고리 불러오기
$(document).on('click', '#withoutC1C1list', function(){
	
	var c1_name = $(this).val();
	var c1_seq = $(this).attr("value2");
	var keyword = $("._keyword").val();
	
	$(".dropdown-btn2").remove();
		
	$.ajax({
        type:"get",
        data: "c1_name="+ c1_name +"&c1_seq=" + c1_seq +"&keyword=" + keyword,
        url:"/store/kCate2List",
        success:function( data ){
        	var obj = JSON.stringify(data);
			var arr = JSON.parse(obj);
			var arrLen = arr.length;
			//$("._cate3a"+c2_seq).remove();
			addkCate2(arr, arrLen, c1_seq, c1_name);
        },
        error:function(){
           alert("error!!"); 
        }
   })

});
function addkCate2(arr, arrLen, c1_seq, c1_name) {
 	
	var str ="";
	for (var i = 0; i < arrLen; i++) {
		str += "<button class='dropdown-btn2' id='withoutC1C2list"+arr[i].c2_seq+"' c2name='"+arr[i].c2_name+"' ";
		str += "c2seq='"+arr[i].c2_seq+"' c1name='"+c1_name+"' c1seq='"+c1_seq+"'>";
		str += arr[i].c2_name;
		str += "<i class='fa fa-caret-down'></i>";
		str += "</button>";
	}
	$("#withoutC1C2" + c1_seq).append(str);
}


//카테고리 없이 검색어바로 들어올시 1차카테고리 생성 후 
//2차 카테고리 클릭 -> 3차 카테고리 불러오기
$(document).on('click', '.dropdown-btn2', function(){
	$("a[name='cbtn3']").fadeOut();
	$(".criterion").val("all_search");
	
	var c1_name = $(this).attr("c1name");
	var c1_seq = $(this).attr("c1seq");
	var c2_name = $(this).attr("c2name");
	var c2_seq = $(this).attr("c2seq");
	var keyword2 = $("._keyword").val();
	//alert(c2_name);
	//alert(c1_name + ", " + c1_seq + ", " + c2_name + ", " + c2_seq + ", " + keyword2);
	
	$.ajax({
        type:"get",
        data: "c1_name="+ c1_name +"&c2_name=" + c2_name +"&keyword=" + keyword2,
        url:"/store/kCate3List",
        success:function( data ){
        	var obj = JSON.stringify(data);
			var arr = JSON.parse(obj);
			var arrLen = arr.length;
			//$("._cate3a"+c2_seq).remove();
			addkCate3(arr, arrLen, c1_name, c2_name, c2_seq, c1_seq);
        },
        error:function(){
           alert("error!!"); 
        }
   })
});

function addkCate3(arr, arrLen, c1_name, c2_name, c2_seq, c1_seq){
	//alert(c1_name);
	//alert(c2_name);
	//alert(c1_name)
	var str ="";		
	str += "<div class='dropdown-container2'>";
	for (var i = 0; i < arrLen; i++) {
		str += "<a href='#' name='cbtn3' class='_cate3a"+c2_seq+"' id='cate3_btn' style='cursor:pointer;' c3_name='"+arr[i].c3_name+"' c2_name='"+c2_name+"' c1_name='"+c1_name+"'>";
		str += arr[i].c3_name;
		str += "</a>";
	}
	str += "</div>";
	//alert(str);
	//alert(c2_seq);
	$("#withoutC1C2list" + c2_seq).after(str);
	//$(".dropdown-btn2").after(str);
	//$(".dropdown-btn2").nextElementSibling.fadeIn();
	
}

// 3차 카테고리 클릭시
$(document).on('click', '#cate3_btn', function(){
	var c3_name = $(this).attr("c3_name");
	$(".c3_c3name").val(c3_name);
	var c2_name = $(this).attr("c2_name");
	$(".c3_c2name").val(c2_name);
	var c1_name = $("._c1name").val();
	if(c1_name==''){
		c1_name = $(this).attr("c1_name");
	}	
	$(".c3_c1name").val(c1_name);
	var keyword = $("._keyword").val();
	$(".keyword").val(keyword);
	
	//alert(c1_name);
	
	$("#c3ClickFrm").submit();
	
});


/* 3번째 카테고리 불러오기 */
function bring3cate(c2_seq){
	//var c2_name = $(this).val();
	//var c2_name = "";
	var c2_name = $("#cate2Btn"+c2_seq).val();
	//alert("C2NAME : " + c2_name);
	//alert(c2_seq);
	var c1_name = $("._c1name").val();
	//alert("C1NAME : " + c1_name);
	var keyword = $("._keyword").val();
	//alert("키워드 : " + keyword);
	
	if(keyword == ''){
		$.ajax({
	        type:"get",
	        data: "c2_seq=" + c2_seq,
	        url:"/store/cate3List",
	        success:function( data ){
	        	var obj = JSON.stringify(data);
				var arr = JSON.parse(obj);
				var arrLen = arr.length;
				$("._cate3a"+c2_seq).remove();
				addCate3(arr, arrLen, c2_seq, c2_name);
	        },
	        error:function(){
	           alert("error!!"); 
	        }
	   })
	}else if(keyword != ''){
		$.ajax({
	        type:"get",
	        data: "c1_name="+ c1_name +"&c2_name=" + c2_name +"&keyword=" + keyword,
	        url:"/store/kCate3List",
	        success:function( data ){
	        	var obj = JSON.stringify(data);
				var arr = JSON.parse(obj);
				var arrLen = arr.length;
				$("._cate3a"+c2_seq).remove();
				addCate3(arr, arrLen, c2_seq, c2_name);
	        },
	        error:function(){
	           alert("error!!"); 
	        }
	   })
	}
}

function addCate3(arr, arrLen, c2_seq, c2_name) {
	
	var str ="";
	for (var i = 0; i < arrLen; i++) {
		str += "<a href='#' class='_cate3a"+c2_seq+"' id='cate3_btn' style='cursor:pointer;' c3_name='"+arr[i].c3_name+"' c2_name='"+c2_name+"'>";
		str += arr[i].c3_name;
		str += "</a>";
	}
	
	$("#cate3zone" + c2_seq).append(str);
}

function search(){
	var c1_name = $("input[name='mwChk']:checked").val();
	var keyword = $("#searchWord").val();
	
	if(keyword != ""){
		if(keyword.length < 12){
			$(".c1_name").val(c1_name);
			$(".keyword").val(keyword);
			$("#searchFrm").submit();
		}else{
			alert("검색어가 너무 길어요");
		}
	}
}

// 검색모달 성별 선택
$(document).on('click', '.mwRadioL', function(){
	$(".mwRadioL").attr('style', 'background-color:white');
	$(this).attr('style', 'background-color:#d7fd75');
		
});

/* 검색모달 영역 외 클릭시 close */
$('body').click(function(e){
	 if($(".modal").css("display") == "block") {
        if(!$('.modal, .modal').has(e.target).length) { 
        	//$(".modal").css("display", "none");
        	$(".modal").fadeOut();
        	/* 검색창 초기화 */
        	$("#searchWord").val('');
        	$("input:radio[name='mwChk']").prop("checked", false);
        	$(".mwRadioL").attr('style', 'background-color:white');
         } 
 	 }
});

/* 검색(모달)버튼 클릭 */
$(document).on('click', '.search_btn', function(){
	/* $("#search_modal").css("display", "block"); */
	$("#search_modal").fadeIn();
});

$(document).on('click', '.brandClick', function(){
	var c_name = $(this).html();
	$(".keyword").val(c_name);
	$("#brandClickFrm").submit();
});	

//* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */


var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
	this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    
    if (dropdownContent.style.display === "block") {    	
      //dropdownContent.style.display = "none";
      $(this.nextElementSibling).fadeOut();
    } else {
      //$(".dropdown-container").attr('style', "display:none;");
      $(".dropdown-container").fadeOut();
      $(".dropdown-btn").attr('style', "background-color:white;");
      $(this).attr('style', "background-color:#d7fd75;");
      //dropdownContent.style.display = "block";
      $(this.nextElementSibling).fadeIn();
      
    }
  });
}


	var dropdown = document.getElementsByClassName("dropdown-btn2");
	var i;
	
	for (i = 0; i < dropdown.length; i++) {
	  dropdown[i].addEventListener("click", function() {
		//alert("ggggggggg");
		this.classList.toggle("active");
	    var dropdownContent = this.nextElementSibling;
	    
	    if (dropdownContent.style.display === "block") {    	
	    	$(this.nextElementSibling).fadeOut();
	      //$(this.nextElementSibling).show();
	      
	    } else {
	    	//alert("닫힘->열림");
	      //$(".dropdown-container").attr('style', "display:none;");
	      $(".dropdown-container2").fadeOut();
	      $(".dropdown-btn2").attr('style', "background-color:white;");
	      $(this).attr('style', "background-color:#d7fd75;");
	      $(this.nextElementSibling).fadeIn();
	      
	    }
	  });
	}
$(document).on('keyup', '#searchWord', function(){
	 var autocomplete_text = ["자동완성기능","Autocomplete","개발로짜","국이"];
     $("#searchWord").autocomplete({
        source: autocomplete_text
     });
});

	
</script>
</body>