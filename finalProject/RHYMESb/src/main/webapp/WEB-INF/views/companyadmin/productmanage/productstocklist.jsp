 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품조회</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/member/memberlist.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/member/paging.css">
</head>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">${c_name }</h1>
	<br>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">상품 관리 > <a href="/admin/company/productlist">상품 조회</a> > 상품 상세조회</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive" >
				<div class="row" style="float:left; margin-bottom: 20px;">
					<div style="margin-left: 10px;">
						<img src="/upload/store/${pDto.photo1_file }"  style="width:250px; height:250px;">
					</div>
					<div style="padding-left: 10px; margin-left: 40px; margin-top: 30px; margin-right: 30px;">
						<label><strong>상품명</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${pDto.p_name }</label><br>
						<label><strong>상품 가격</strong>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<fmt:formatNumber type="currency" currencySymbol="" value="${pDto.p_price}" /> 원</label><br>
						<label><strong>상품 색상</strong>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${pDto.p_color }</label><br>
						<label><strong>상품 번호</strong>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${pDto.p_seq }</label><br>
						<label><strong>상품 코드</strong>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;${pDto.cp_code }</label>
					</div>					
				</div>


				<div style="align:center; width:40%; float:left; margin-left: 50px;" >
				<table class="table table-bordered" id="dataTable">
					<colgroup>
						
					</colgroup>
					<thead>
						<tr align="center">
							<!-- <th class="list_checkbox"><input type="checkbox"
								name='allckeck' onclick='allchecks(this.checked)' id='_allck'>
							</th> -->
							<!-- 1 -->
							<th>번호</th>
							<!-- 2 -->
							<th>재고 번호</th>
							<!-- 3 -->
							<th>사이즈</th>
							<!-- 4 -->
							<th>현재 수량</th>
							<!-- 5 -->
							<th>판매량</th>							
							
						</tr>
					</thead>

					<tbody>
						<c:if test="${empty slist }">
							<tr align="center">
								<td colspan="12" align="center">등록된 상품이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="stock" items="${slist }" varStatus="vs">
							<tr align="center">
								<%-- <td class="list_checkbox"><input type="checkbox"name='allck' value="${p.seq }"></td> --%>
								<!-- 1 -->
								<td>${vs.count }</td>
								<!-- 2 -->
								<td>${stock.stock_seq }</td>
								<!-- 3 -->
								<td>${stock.size }</td>
								<!-- 4 -->
								<c:if test="${stock.quantity ne 0}">
								<td>${stock.quantity }</td>
								</c:if>
								<c:if test="${stock.quantity eq 0}">
								<td><font style="color:red"><b>픔절</b></font></td>
								</c:if>
								<!-- 5 -->
								<td>${stock.salesvolume }</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="col-sm-12 col-md-7">
				</div>	
					
					
					
				</div>
			</div>
		</div>
	</div>

</div>
<!-- 상품리스트 검색/정렬/페이징 -->
<form action="/admin/company/productlist" method="get" id="plistFrm">
	<input type="hidden" name="pageNumber" id="_pageNumber" value="${param.pageNumber }">
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
	<input type="hidden" name="criterion" id="frm_criterion" value="${param.criterion }">
	<input type="hidden" name="keyword" id="frm_keyword" value="${param.keyword }">
	<input type="hidden" name="sorting" id="form_sorting" value="${param.sorting }">	
</form>


<!-- /.container-fluid -->

<!-- End of Main Content -->

<!--------------------------------- SCRIPT ZONE --------------------------------->
<script>
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


</script>



</html>