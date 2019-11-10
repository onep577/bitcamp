 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
#dataTable{
	font-size: 12px;
}
</style>
<meta charset="UTF-8">
<title>상품조회</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/member/memberlist.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/member/paging.css">
	
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/companyadmin/productmanage/productoperlist.css">	
</head>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">${c_name }</h1>
	<br>
	<!-- <p class="mb-4">회원조회, 수정, 정지</p> -->

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">상품관리 > <a href="/admin/company/productoperlist">상품 수정/SALE등록</a></h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="row">
					<div class="col-sm-12 col-md-6">
						<div class="dataTables_length" id="dataTable_length">
								<select id="sorting" class="custome-select border-0 pr-3 searchSelect" onchange="sorting(this.value)" 
									style="width:auto; border-color: black; cursor:pointer; text-align: center;" >
									<option selected="selected" value="SEQ"
										<c:out value="${param.sorting == 'SEQ'? 'selected':'' }"/>>상품번호순</option>
									<option value="PRICEUP"
										<c:out value="${param.sorting == 'PRICEUP'? 'selected':'' }"/>>가격 ↑</option>
									<option value="PRICEDOWN"
										<c:out value="${param.sorting == 'PRICEDOWN'? 'selected':'' }"/>>가격 ↓</option>
								</select>
								<button type="button" onclick="location.href='/admin/company/productoperlist'"
								style="border: solid 1px #DADCE0; width:auto; border-radius: 5px; color:white; background-color: #5587ED;">
								전체 조회</button>&nbsp;
								<button type="button" onclick="location.href='/admin/company/productoperlist?criterion=c1_search&c1_name=MEN'"
								style="border: solid 1px #DADCE0; width:auto; border-radius: 5px; background-color: white;">
								MEN</button>
								<button type="button" onclick="location.href='/admin/company/productoperlist?criterion=c1_search&c1_name=WOMEN'"
								style="border: solid 1px #DADCE0; width:auto; border-radius: 5px; background-color: white;">
								WOMEN</button>
						</div>
					</div>
					<!-- 검색 -->
					<div class="col-sm-12 col-md-6">
						<div id="dataTable_filter" class="searchPosition dataTables_filter">
							
							<select class="custome-select border-0 pr-3 searchSelect" id="_select" style="width:auto; cursor: pointer; text-align: center;">
								<option selected value="all_search">전체</option>
								<option value="pname_search"
									<c:out value="${param.criterion == 'pname_search'? 'selected':'' }"/>>상품명</option>
								<option value="cpcode_search"
									<c:out value="${param.criterion == 'cpcode_search'? 'selected':'' }"/>>상품코드</option>
								
							</select> 
							<input type="search" id="keyword" name="s_keyword" class="searchText form-control-sm" placeholder=""
								aria-controls="dataTable" style="width: 150px" value="${param.keyword }">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm" id="_btnSearch"></i>
							</button>
						</div>
					</div>
					<!-- /검색 -->

				</div>



				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<colgroup>
						
					</colgroup>
					<thead>
						<tr align="center">
							<!-- 1 -->
							<th>번호</th>
							<!-- 2 -->
							<th>상품 번호</th>
							<!-- 3 -->
							<th>상품명</th>
							<!-- 4 -->
							<th>가격</th>
							<!-- 5 -->
							<th>대분류</th>
							<!-- 6 -->
							<th>중분류</th>
							<!-- 7 -->
							<th>소분류</th>
							<!-- 8 -->
							<th>색상</th>
							<!-- 9 -->
							
							<!-- 13 -->
							<th>판매상태</th>
							
							<!-- 14 -->
							<th>SALE</th>
							<th>수정</th>
							<th>판매종료</th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${empty plist }">
							<tr align="center">
								<td colspan="12" align="center">등록된 상품이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="pro" items="${plist }" varStatus="vs">
							<tr align="center">
								<!-- 1 -->
								<td>${pro.rnum }</td>
								<!-- 2 -->
								<td>${pro.p_seq }</td>
								<!-- 3 -->
								<td>
									<a href="/admin/company/stocklist?p_seq=${pro.p_seq }">
									<strong>${pro.p_name }</strong></a>
								</td>
								<!-- 4 -->
								<td>
									<span id="plist_pprice${pro.p_seq }"><fmt:formatNumber type="currency" currencySymbol="" value="${pro.p_price}" /></span> 원
								</td>
								<!-- 5 -->
								<td>${pro.c1_name}</td>
								<!-- 6 -->
								<td>${pro.c2_name}</td>
								<!-- 7 -->
								<td>${pro.c3_name}</td>
								<!-- 8 -->
								<td>${pro.p_color }</td>
								<!-- 9 -->
								
								<!-- 13 -->
								<c:if test="${pro.sum ne 0}">
									<td class="list_rdate"><font style="color:green">판매중</font></td>
								</c:if>
								<c:if test="${pro.sum eq 0}">
									<td class="list_rdate"><font style="color:red">픔절</font></td>
								</c:if>
								<td id="saleRegi-td${pro.p_seq }">
									<c:if test="${pro.bfs_price eq 0 }">
									<button type="button" class="sale_register-btn" value="${pro.p_seq }"
									style="border: solid 1px #DADCE0; width:auto; border-radius: 5px; background-color: white; font-size: 12px;">
									SALE등록</button>
									</c:if>
									<c:if test="${pro.bfs_price ne 0 }">
										<label style="color:red">SALE</label>
									</c:if>
								</td>
								<td>
									<button type="button" onclick="location.href='/admin/company/productupdate?p_seq=${pro.p_seq}'"
									style="border: solid 1px #DADCE0; width:auto; border-radius: 5px; background-color: white;">
									수정</button>
								</td>
								<td>
									<button type="button" value="${pro.p_seq }" class="eachproduct-delete"
									style="border: solid 1px #DADCE0; width:auto; border-radius: 5px; background-color: white;">
									판매종료</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="col-sm-12 col-md-7">
					<div class="dataTables_paginate paging_simple_numbers"
						id="dataTable_paginate">
						<!-- 페이징 -->
						<div id="paging_wrap">
							<jsp:include page="/WEB-INF/views/companyadmin/productmanage/productpaging.jsp"
								flush="false">
								<jsp:param name="pageNumber" value="${pageNumber }" />
								<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
								<jsp:param name="pageCountPerScreen"
									value="${pageCountPerScreen }" />
								<jsp:param name="recordCountPerPage"
									value="${recordCountPerPage }" />
							</jsp:include>
						</div>
						<!-- 페이징끝 -->

					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<!-- 상품리스트 검색/정렬/페이징 -->
<form action="/admin/company/productoperlist" method="get" id="plistFrm">
	<input type="hidden" name="pageNumber" id="_pageNumber" value="${pageNumber }">
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
	<input type="hidden" name="criterion" id="frm_criterion" value="${param.criterion }">
	<input type="hidden" name="keyword" id="frm_keyword" value="${param.keyword }">
	<input type="hidden" name="sorting" id="form_sorting" value="${param.sorting }">	
</form>


<!-- /.container-fluid -->
<!-- SALE상품 등록 MODAL -->
<div class="productsale_modal">
	<div class="productsale_modal-content" align="center">
			<div align="right">
			<img src="https://cdn4.iconfinder.com/data/icons/media-controls-4/100/close-512.png" style="width:30px; height:30px; cursor:pointer;" class="salemodal-Close">
			</div>
		<div align="center">
			<table id="saleRegiTable" style="border: 0px solid" border='1'>
			<colgroup><col width="40%"><col width="60%"></colgroup>
				<tr>
					<th>상품번호</th>
					<td id="modal_pseq" class="sale_modal_td"></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td id="modal_pname">ㅁㄴㅇㄻㄴㅇㄻㄴㅇㄹ</td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td><span id="modal_pprice"></span>원</td>
				</tr>
				<tr>
					<th>SALE할인률</th>
					<td>
						<input type='text' onchange="this.value=this.value.replace(/[^0-9]/g,'');"
							onKeyup="applysalepercent(this.value)" id="applypercent">%
					</td>
				</tr>	
				<tr>
					<th>SALE적용 가격</th>
					<td><span class='appliedPrice'></span>원</td>
					<input type="hidden" id="applied_hdn_price"> 
				</tr>			
			</table><br>
			<div>
			<button type="button" id="saleregister-finishBtn">SALE 적용</button>
			</div>
			
		</div>
	</div>

<!-- 메시지 MODAL영역 -->
<div class="msgModal">
   <div class="msg-content">
      <span id="msg"></span>
   </div>
</div>

</div>	
<!-- End of Main Content -->

<!--------------------------------- SCRIPT ZONE --------------------------------->
<script>
//가격 콤마
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//상품 삭제(EACH)
$('.eachproduct-delete').click(function(){
	
	
	$("#msg").html("<strong>상품이 판매종료되었습니다.</strong>");
 	 $(".msgModal").fadeIn();
	 setTimeout(function() {
    },1000);
		
	var p_seq = $(this).val();
	location.href="/admin/company/productDelete?p_seq="+ p_seq;
});

//SALE 적용 버튼
$('#saleregister-finishBtn').click(function(){
	//상품SEQ
	var p_seq = $("#modal_pseq").html();
	//적용 전 가격
	var p_price = $("#modal_pprice").val();
	//적용 후 가격
	var sale_price = $("#applied_hdn_price").val();
	
	$.ajax({
        type:"get",
        data: "p_seq=" + p_seq + "&bfs_price=" + p_price + "&p_price=" + sale_price,
        url:"/admin/company/salepriceupdate",
        success:function( data ){
        	
        	//sale_price
        	$("#plist_pprice" + p_seq).html(numberWithCommas(Number(sale_price)));
        	//<td id="saleRegi-td${pro.p_seq }">
        	$("#saleRegi-td" + p_seq).html("<font style='color:red'>SALE</font>");
        	
        	//메시지 모달
		     $("#msg").html("<strong>SALE이 적용되었습니다.</strong>");
	      	 $(".msgModal").fadeIn();
	     	 setTimeout(function() {
	     		$(".productsale_modal").fadeOut();
	     		$(".msgModal").fadeOut();
	     		$("#applypercent").val("");
	     		$(".appliedPrice").html("");
	         },1000);			
        },
        error:function(){
           alert("error!!"); 
        }
    })
	
});

//SALE등록 MODAL SHOW
$('.sale_register-btn').click(function(){
	
	$(".productsale_modal").fadeIn();
	var p_seq = $(this).val();
	//alert(p_seq);
	$(".sale_modal_td").html("");
	
	$.ajax({
        type:"get",
        data: "p_seq=" + p_seq,
        url:"/admin/company/getProductDetail",
        success:function( data ){
            var obj = JSON.stringify(data);
			var arr = JSON.parse(obj);
			$("#modal_pseq").html(arr.p_seq);
			$("#modal_pname").html(arr.p_name);
			$("#modal_pprice").html(numberWithCommas(arr.p_price));
			$("#modal_pprice").val(arr.p_price);
			
        },
        error:function(){
           alert("error!!"); 
        }
    })
});
// 검색
$(document).on('click', '#_btnSearch', function(){
	var criterion = $("#_select").val();
	var keyword = $("#keyword").val();
	var sorting = $("#sorting").val();
	$("#frm_criterion").val(criterion);
	$("#frm_keyword").val(keyword);
	$("#frm_sorting").val(sorting);
		
	$("#plistFrm").submit();
});
// 정렬
function sorting(sorting){
	var criterion = $("#_select").val();
	var keyword = $("#keyword").val();
	var sorting = $("#sorting").val();	
	$("#frm_criterion").val(criterion);
	$("#frm_keyword").val(keyword);
	$("#form_sorting").val(sorting);
	
	$("#plistFrm").submit();	
}
// 페이지 이동
function goPage( pageNumber ) {
	$("#_pageNumber").val(pageNumber);
	$("#plistFrm").submit();
}


$(document).on('click', '.salemodal-Close', function(){
	$(".productsale_modal").fadeOut();
	$("#applypercent").val("");
	$(".appliedPrice").html("");
	
});

function applysalepercent(percent){
	
	var pprice = $("#modal_pprice").val();
	var percent2 = 1-(0.01 * percent);
	var appliedPrice = pprice * percent2;
	
	if(isNaN(percent)){
		$("#applypercent").val("");
		$(".appliedPrice").html("");
		
	}else{
		if(percent.length>2){
			var twoword = percent.substring(0,2)
			$("#applypercent").val(twoword);
			(".appliedPrice").html("");
			
		}else{
			$(".appliedPrice").html(numberWithCommas(Math.round(appliedPrice)));
			$("#applied_hdn_price").val(Math.round(appliedPrice));
		}	
	}
	
	
}

</script>

</html>