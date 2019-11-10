<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content_main</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin/member/memberlist.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/payment/payment.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin/payment/payment.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin/member/paging.css">

</head>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">주문내역</h1>
	<p class="mb-4">주문내역</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">주문내역</h6>
	    	<a href="/admin/excel/payment" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="float: right;"><i class="fas fa-download fa-sm text-white-50"></i>결제내역 다운로드</a>
			<a href="/admin/excel/product" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="float: right;"><i class="fas fa-download fa-sm text-white-50"></i>상품정보 다운로드</a>
	    </div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="row">
					<!-- <form id="_payment_frm" name="payment_frm"> -->
						<div class="col-sm-12 col-md-6">		
							<div class="dataTables_length" id="dataTable_length">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								
								<select style="width: 100px;" name="recordCountPerPage" id="_recordCountPerPage" aria-controls="dataTable" onchange="dataTable_length()" class="custom-select custom-select-sm form-control form-control-sm">
									<%-- <option value="5" <c:out value="${param.recordCountPerPage == '5'? 'selected':'' }"/>>5</option> --%>
									<option value="10" <c:out value="${param.recordCountPerPage == '10'? 'selected':'' }"/>>10</option>
									<option value="15" <c:out value="${param.recordCountPerPage == '15'? 'selected':'' }"/>>15</option>
									<option value="20" <c:out value="${param.recordCountPerPage == '20'? 'selected':'' }"/>>20</option>
								</select>
							</div>
						</div>
	
						<!-- 검색 -->
						<div class="col-sm-12 col-md-6">
							<div id="dataTable_filter" class="searchPosition dataTables_filter">
								<select class="custome-select border-0 pr-3 searchSelect" id="_select" name="s_category">
									<option selected value="">전체</option>
									<option value="id" <c:out value="${param.s_category == 'id'? 'selected':'' }"/>>아이디</option>
									<option value="name" <c:out value="${param.s_category == 'name'? 'selected':'' }"/>>이름</option>
									<option value="payment_method" <c:out value="${param.s_category == 'payment_method'? 'selected':'' }"/>>결제수단</option>
									<option value="payment_status" <c:out value="${param.s_category == 'payment_status'? 'selected':'' }"/>>결제상태</option>
								</select>
								<input type="text" id="_s_keyword" name="s_keyword" class="searchText form-control-sm" placeholder="search..."
										aria-controls="dataTable" style="width: 150px" value="${param.s_keyword }">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm" id="_btnSearch"></i>
								</button>
								<!-- hidden 을 통해서 값을 넘겨주기 -->
								<input type="hidden" name="pageNumber" id="_pageNumber" value="0">
								<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty param.recordCountPerPage)?0:param.recordCountPerPage }">
							</div>
						</div>
						<!-- /검색 -->
					<!-- </form> -->
				</div>


				<div class="payment_success_wrap">
					<div class="payment_success_contents">
						<table class="table table-bordered">
							<tr>
								<td>주문번호</td>
								<td>회원아이디</td>
								<td>주문한사람 이름</td>
								<td>결제수단</td>
								<td>결제상태</td>
								<td>결제금액</td>
								<td>주문일</td>
							</tr>
							<c:forEach items="${orderSuccessList }" var="p">
								<tr>
									<td><a
										href="/admin/payment/detail?payment_code=${fn:substring(p.payment_code,4,16) }&coupon_code=${p.coupon_code }">${fn:substring(p.payment_code,4,16) }</a></td>
									<c:if test="${not empty p.userid }">
										<td>${p.userid }</td>
									</c:if>
									<c:if test="${empty p.userid }">
										<td>비회원</td>
									</c:if>
									<td>${p.send_name }</td>
									<td>${p.payment_method }</td>
									<td>${p.payment_status }</td>
									<td><fmt:formatNumber value="${p.totalprice }" />원</td>
									<td>${p.rdate }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				
				
				<div class="col-sm-12 col-md-7">
					<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
						
						<!-- 페이징 -->
						<div id="paging_wrap">
							<jsp:include page="/WEB-INF/views/admin/payment/paging.jsp" flush="false">
								<jsp:param name="pageNumber" value="${param.pageNumber }" />
								<jsp:param name="totalRecordCount" value="${param.totalRecordCount }" />
								<jsp:param name="pageCountPerScreen" value="${param.pageCountPerScreen }" />
								<jsp:param name="recordCountPerPage" value="${param.recordCountPerPage }" />
							</jsp:include>
						</div>
						<!-- 페이징끝 -->
						
					</div>
				</div>



			</div>
		</div>
	</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->
</html>



