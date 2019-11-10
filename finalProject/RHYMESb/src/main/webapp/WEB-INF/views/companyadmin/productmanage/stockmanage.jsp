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
	
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/companyadmin/productmanage/stockmanage.css">	
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
			<h6 class="m-0 font-weight-bold text-primary">상품관리 > <a href="/admin/company/stockmanage">재고관리</a></h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="row">
					<div class="col-sm-12 col-md-6">
						<div class="dataTables_length" id="dataTable_length">
								<select id="sorting" class="custome-select border-0 pr-3 searchSelect" onchange="sorting(this.value)" 
									style="width:auto; border-color: black; cursor:pointer; text-align: center;" >
									<option selected="selected" value="SEQ"
										<c:out value="${param.sorting == 'SEQ'? 'selected':'' }"/>>재고번호순</option>
									<option value="PRICEUP"
										<c:out value="${param.sorting == 'PRICEUP'? 'selected':'' }"/>>가격↑</option>
									<option value="PRICEDOWN"
										<c:out value="${param.sorting == 'PRICEDOWN'? 'selected':'' }"/>>가격↓</option>
								</select>
								<button type="button" onclick="location.href='/admin/company/stockmanage'"
								style="border: solid 1px #DADCE0; width:auto; border-radius: 5px; color:white; background-color: #5587ED;">
								전체 조회</button>&nbsp;
								<button type="button" onclick="location.href='/admin/company/stockmanage?criterion=c1_search&c1_name=MEN'"
								style="border: solid 1px #DADCE0; width:auto; border-radius: 5px; background-color: white;">
								MEN</button>
								<button type="button" onclick="location.href='/admin/company/stockmanage?criterion=c1_search&c1_name=WOMEN'"
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
								<option value="stockseq_search"
									<c:out value="${param.criterion == 'stockseq_search'? 'selected':'' }"/>>재고번호</option>
								
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
							<th>재고 번호</th>
							<!-- 4 -->
							<th>상품명</th>
							<!-- 5 -->
							<th>색상</th>
							<!-- 6 -->
							<th>상품 가격</th>
							<!-- 7 -->
							<th>대분류</th>
							<!-- 8 -->
							<th>중분류</th>
							<!-- 9 -->
							<th>소분류</th>
							<!-- 10 -->
							<th>사이즈</th>
							<!-- 11 -->
							<th>수량</th>
							<!-- 12 -->
							<th>수량변경</th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${empty slist }">
							<tr align="center">
								<td colspan="12" align="center">등록된 상품이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="st" items="${slist }" varStatus="vs">
							<tr align="center">
								<!-- 1 -->
								<td>${st.rnum }</td>
								<!-- 2 -->
								<td>${st.p_seq }</td>
								<!-- 3 -->
								<td>${st.stock_seq }</td>
								<!-- 4 -->
								<td value="${st.p_name }">
									<a href="/admin/company/stocklist?p_seq=${st.p_seq }">
									<strong>${st.p_name }</strong></a>
								</td>
								<!-- 5 -->
								<td>${st.p_color }</td>
								<!-- 6 -->
								<td>
									<span id="11"><fmt:formatNumber type="currency" currencySymbol="" value="${st.p_price}" /></span> 원
								</td>
								<!-- 7 -->
								<td>${st.c1_name }</td>
								<!-- 8 -->
								<td>${st.c2_name}</td>
								<!-- 9 -->
								<td>${st.c3_name}</td>
								<!-- 10 -->
								<td><strong>${st.size }</strong></td>
								
								<!-- 11 -->
								<c:if test="${st.quantity ne 0 }">
									<td class="stockq-td${st.stock_seq }">${st.quantity }</td>
								</c:if>
								<c:if test="${st.quantity eq 0 }">
									<td style="color:red" class="stockq-td${st.stock_seq }">품절</td>
								</c:if>
								
								<!-- 12 -->
								<c:if test="${st.quantity ne 0 }">
								<td>
									<button type="button" value="${st.stock_seq }" class="change_q-btn" value2="justchange" id="_change_q-btn${st.stock_seq }"
									style="border: solid 1px #DADCE0; width:auto; border-radius: 5px; background-color: white;">
									수량변경</button>
								</td>
								</c:if>
								<c:if test="${st.quantity eq 0 }">
								<td>
									<button type="button" value="${st.stock_seq }" class="change_q-btn" value2="restock" id="_change_q-btn${st.stock_seq }" 
									style="border: solid 1px #DADCE0; width:auto; border-radius: 5px; background-color: white; ">
									재입고</button>
								</td>
								</c:if>
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
								<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
								<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
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
<form action="/admin/company/stockmanage" method="get" id="slistFrm">
	<input type="hidden" name="pageNumber" id="_pageNumber" value="${pageNumber }">
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
	<input type="hidden" name="criterion" id="frm_criterion" value="${param.criterion }">
	<input type="hidden" name="keyword" id="frm_keyword" value="${param.keyword }">
	<input type="hidden" name="sorting" id="form_sorting" value="${param.sorting }">	
</form>


<!-- /.container-fluid -->
<!-- 수량변경 MODAL -->
<div class="change_q-modal">
	<div class="change_q-modal-content" align="center">
			<div align="right">
			<img src="https://cdn4.iconfinder.com/data/icons/media-controls-4/100/close-512.png" style="width:30px; height:30px; cursor:pointer;" class="modal-Close">
			</div>
		<div align="center">
			<table id="changeq_table" style="border: 0px solid" border='1'>
			<colgroup><col width="40%"><col width="60%"></colgroup>
				<tr>
					<th>상품명</th>
					<td id="modal_pname"></td>
				</tr>
				<tr>
					<th>상품번호</th>
					<td id="modal_pseq" class="sale_modal_td"></td>
				</tr>
				<tr>
					<th>재고번호</th>
					<td id="modal_stockseq" class="sale_modal_td"></td>
				</tr>
				<tr>
					<th>사이즈</th>
					<td id="modal_stocksize" class="sale_modal_td"></td>
				</tr>
				<tr>
					<th>현재 수량</th>
					<td>
						<span id="modal_stockquantity"></span>&nbsp;
					</td>
					
				</tr>
				<tr>
					<th>변경 수량</th>
					<td>
						<input type="text" style="border-radius: 7px; width:60px; text-align:center " id="appliedstockq"
							onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="">&nbsp;EA
						&nbsp;
					</td>
				</tr>			
			</table><br>
			<div>
			<button type="button" id="changq-finishbtn">수량변경 등록</button>
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
<!-- 상품리스트 검색/정렬/페이징 -->
<form action="/admin/company/stockmanage" method="get" id="slistFrm">
	<input type="hidden" name="pageNumber" id="_pageNumber" value="${pageNumber }">
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
	<input type="hidden" name="criterion" id="frm_criterion" value="${param.criterion }">
	<input type="hidden" name="keyword" id="frm_keyword" value="${param.keyword }">
	<input type="hidden" name="sorting" id="form_sorting" value="${param.sorting }">	
</form>


<!--------------------------------- SCRIPT ZONE --------------------------------->
<script>


$('#changq-finishbtn').click(function(){
	
	var p_name = $("#modal_pname").text();
	var size = $("#modal_stocksize").text();
	var stock_seq = $("#modal_stockseq").text();
	var p_seq = $("#modal_pseq").text();
	var appliedstockq = $("#appliedstockq").val();
    var isrestock = $("#_change_q-btn" + stock_seq).attr("value2");
	
	$.ajax({
        type:"get",
        data: "p_name=" + p_name + "&stock_seq=" + stock_seq + "&quantity=" + appliedstockq + "&isrestock=" + isrestock + "&size=" + size,
        url:"/admin/company/changestockquantity",
        success:function( data ){
			        	
        	$(".stockq-td" + stock_seq).html("<font style='color:black'>"+appliedstockq+"</font>");
        	
        	if(isrestock === 'restock'){
        		$("#_change_q-btn" + stock_seq).html("수량변경");
        	}
        	$("#modal_stockquantity").html(appliedstockq + " EA");
        	
        	//메시지 모달
		     $("#msg").html("<strong>수량이 변경되었습니다.</strong>");
	      	 $(".msgModal").fadeIn();
	     	 setTimeout(function() {
	     		$(".change_q-modal").fadeOut();
	     		$(".msgModal").fadeOut();
	     		
	         },1000);			
        },
        error:function(){
           alert("error!!"); 
        }
    })
	
});

$('.modal-Close').click(function(){
	$(".change_q-modal").fadeOut();
});


$('.change_q-btn').click(function(){
	
	$("#appliedstockq").val("");	
	$(".change_q-modal").fadeIn();
	$("#appliedstockq").focus();
	
	var p_seq = $(this).closest('tr').find('td').eq(1).text();
	var stock_seq = $(this).closest('tr').find('td').eq(2).text();
	var p_name = $(this).closest('tr').find('td').eq(3).attr("value");
	var size = $(this).closest('tr').find('td').eq(9).text();
	var p_quantity = $(this).closest('tr').find('td').eq(10).text();
	
	$("#modal_pname").text(p_name);
	$("#modal_pseq").text(p_seq);
	$("#modal_stockseq").text(stock_seq);
	$("#modal_stocksize").text(size);

	if(p_quantity != '품절'){
		$("#modal_stockquantity").text(p_quantity + " EA");
	}else{
		$("#modal_stockquantity").html("<font style='color:red'>"+p_quantity+"</font>");
	}

	
});
//페이징
function goPage( pageNumber ) {
	$("#_pageNumber").val(pageNumber);
	
	$("#slistFrm").submit();
}
//검색
$(document).on('click', '#_btnSearch', function(){
	var criterion = $("#_select").val();
	var keyword = $("#keyword").val();
	var sorting = $("#sorting").val();
	$("#frm_criterion").val(criterion);
	$("#frm_keyword").val(keyword);
	$("#frm_sorting").val(sorting);
		
	$("#slistFrm").submit();
});
// 정렬
function sorting(sorting){
	var criterion = $("#_select").val();
	var keyword = $("#keyword").val();
	var sorting = $("#sorting").val();	
	$("#frm_criterion").val(criterion);
	$("#frm_keyword").val(keyword);
	$("#form_sorting").val(sorting);
	$("#slistFrm").submit();	
}
</script>

</html>