<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<link rel="stylesheet" href="<%=ctx%>/css/admin/events/sub/coupon_make_new.css">
<link rel="stylesheet" href="<%=ctx%>/css/admin/events/sub/points_detail.css">


<!-- Begin Page Content -->
<div class="container-fluid">
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">쿠폰 관리</h1>
<p class="mb-4">쿠폰 발행, 조회, 삭제</p>

<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
			<a href="<%=ctx%>/admin/mypage/coupon">쿠폰 목록</a>
		</h6>
		<div class="function-btns-wrap">
			<a id="_btn_give_points" href="#" class="btn btn-info btn-icon-split" data-toggle="modal" data-target="#_coupon_make_new">
				<span class="icon text-white-50"><i class="fas fa-info-circle"></i></span><span class="text">새 쿠폰 발행</span>
			</a>
		</div>
	</div>
	<div class="card-body">
		<div class="table-wrap">
			<div class="row">
				<div class="col-sm-12 col-md-6">
					<div class="dataTables_length" id="dataTable_length">
					<form action="<%=ctx %>/admin/mypage/coupon" id="_frm" method="post">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						 <select style="width: 100px;" name="recordCountPerPage" aria-controls="dataTable" onchange="conditionChanged();"
							class="custom-select custom-select-sm form-control form-control-sm">
							<option value="10" <c:out value="${pDto.recordCountPerPage == '10'? 'selected':'' }"/>>10</option>
							<option value="25" <c:out value="${pDto.recordCountPerPage == '25'? 'selected':'' }"/>>25</option>
							<option value="50" <c:out value="${pDto.recordCountPerPage == '50'? 'selected':'' }"/>>50</option>
							<option value="100" <c:out value="${pDto.recordCountPerPage == '100'? 'selected':'' }"/>>100</option>
						</select>
					</div>
				</div>
				<!-- 검색 -->
				<div class="col-sm-12 col-md-6" align="right">
					<div id="dataTable_filter"
						class="searchPosition dataTables_filter">
						<select id="_s_category" name="cond" onchange="conditionChanged();" class="custome-select border-0 pr-3 searchSelect">
							<option value="" selected="selected">선택</option>
							<option value="1" <c:out value="${pDto.cond == '1'? 'selected':'' }"/>>아이디</option>
							<option value="2" <c:out value="${pDto.cond == '2'? 'selected':'' }"/>>쿠폰번호</option>
						</select>
						<input type="search" id="_s_keyword" name="keyword" class="searchText form-control-sm" placeholder="" aria-controls="dataTable" style="width: 150px"
							value="${pDto.keyword }">
						<button class="btn btn-primary" type="button">
							<i class="fas fa-search fa-sm" id="_btnSearch" onclick="conditionChanged();"></i>
						</button>
					</div>
				</div>				
				<input type="hidden" name="pageNum" id="_currPageNum" value="${pDto.pageNum }">				
				</form><!-- /검색 -->				
			</div>
			
			<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">			
				<thead>
					<tr align="center">
						<!-- <th class="list_checkbox"><input type="checkbox" name='allckeck' onclick='allchecks(this.checked)' id='_allck'></th> -->
						<!-- String[] cols = {"No", "쿠폰이름", "쿠폰내용", "구분", "기능", "유효기간(월)", "등록일  "}; -->
						<c:forEach items="${cols }" var="col" varStatus="i">							
							<c:if test="col == 'No'">
								<th class="sorting">${col }<input type="hidden" name="sorting" id="_sorting"></th>	
							</c:if>
							<th class="sorting">${col }</th>
						</c:forEach>						
					</tr>
				</thead>

				<tbody>
					<c:if test="${empty couponList }">
						<tr align="center">
							<td colspan="9" align="center">검색결과가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="c" items="${couponList }" varStatus="vs">
						<tr align="center" class="coupon_row" onclick="location.href='<%=ctx%>/admin/mypage/coupon/detail?seq=${c.seq }'">
							<%-- <td class="list_checkbox"><input type="checkbox" name='allck' value="${c.seq }"></td> --%>
							<td>${c.seq }</td> <td>${c.title }</td> <td class="list_id">${c.sub_title }</td>
							<td>${c.app_cate }</td> <td>${c.function }</td> <td>${c.func_time_limit }</td> <td>${c.rdate }</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		
			<div class="col-sm-12 col-md-7"><!-- 페이징 네비게이션 시작 -->
				<div class="dataTables_paginate paging_simple_numbers"
					id="dataTable_paginate" align="center">
					<!-- 페이징 -->
					<div id="paging_wrap" align="center">
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						        <span class="sr-only">Previous</span>
						      </a>
						    </li>
						    
						    <c:forEach begin="${pDto.firstNavIndex }" end="${pDto.lastNavIndex }" step="1" var="i">
						    	<li class="page-item"><a class="page-link page-num" href="#">${i }</a></li>
						    </c:forEach>
						    
						    <li class="page-item">
						      <a class="page-link" href="#" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						        <span class="sr-only">Next</span>
						      </a>
						    </li>
						  </ul>
						</nav>
					</div><!-- 페이징 네비게이션 끝 -->					
				</div>
			</div>
		</div>
	</div>
</div>

</div><!-- /.container-fluid -->

<!-- modal 영역 -->
<!-- 적립금 지급 모달 -->
<div class="coupon-make-new modal fade" id="_coupon_make_new" tabindex="-1" role="dialog" aria-labelledby="couponMakeNewModaLabel" aria-hidden="true">
	<jsp:include page="./sub/coupon_make_new.jsp"></jsp:include>
</div>
</html>