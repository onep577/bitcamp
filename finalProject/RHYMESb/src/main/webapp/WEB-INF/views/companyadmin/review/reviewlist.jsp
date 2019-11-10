<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>

<script type="text/javascript" src="<%=ctx%>/js/companyadmin/review/reviewlist.js"></script>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">상품 후기 관리</h1>
	<p class="mb-4">상품후기</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="#">상품후기</a>
			</h6>
		</div>
		<div class="card-body">
			<div class="table-wrap">
				<div class="row">
					<div class="col-sm-12 col-md-6">
						<div class="dataTables_length" id="dataTable_length">
						<form action="<%=ctx %>/admin/productreview/showlist" id="_frm" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							 <select style="width: 100px;" name="recordCountPerPage" aria-controls="dataTable" onchange="conditionChanged(1);"
								class="custom-select custom-select-sm form-control form-control-sm">
								<option value="10" <c:out value="${aRPDto.recordCountPerPage == '10'? 'selected':'' }"/>>10</option>
								<option value="25" <c:out value="${aRPDto.recordCountPerPage == '25'? 'selected':'' }"/>>25</option>
								<option value="50" <c:out value="${aRPDto.recordCountPerPage == '50'? 'selected':'' }"/>>50</option>
								<option value="100" <c:out value="${aRPDto.recordCountPerPage == '100'? 'selected':'' }"/>>100</option>
							</select>
						</div>
					</div>
					<!-- 검색 -->
					<div class="col-sm-12 col-md-6" align="right">
						<div id="dataTable_filter"
							class="searchPosition dataTables_filter">
							<select id="_s_category" name="cond" onchange="conditionChanged(1);" class="custome-select border-0 pr-3 searchSelect">
								<option value="" selected="selected">선택</option>
								<option value="1" <c:out value="${aRPDto.cond == '1'? 'selected':'' }"/>>아이디</option>
								<option value="2" <c:out value="${aRPDto.cond == '2'? 'selected':'' }"/>>상품명</option>
								<option value="3" <c:out value="${aRPDto.cond == '2'? 'selected':'' }"/>>상품코드</option>
							</select>
							<input type="search" id="_s_keyword" name="keyword" class="searchText form-control-sm" placeholder="" aria-controls="dataTable" style="width: 150px"
								value="${aRPDto.keyword }">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm" id="_btnSearch" onclick="conditionChanged(1);"></i>
							</button>
						</div>
					</div>				
					<input type="hidden" name="pageNum" id="_currPageNum" value="${aRPDto.pageNum }">				
					</form><!-- /검색 -->				
				</div>
				
				<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">			
					<thead>
						<tr align="center">
							<!-- String[] cols = {"No", "리뷰제목", "작성자", "좋아요", "등록일시", "상품명", "구매수량", "상품색상"}; -->
							<c:forEach items="${cols }" var="col" varStatus="i">							
								<c:if test="col == 'No'">
									<th class="sorting">${col }<input type="hidden" name="sorting" id="_sorting"></th>	
								</c:if>
								<th class="sorting">${col }</th>
							</c:forEach>						
						</tr>
					</thead>
	
					<tbody>
						<c:if test="${empty reviewList }">
							<tr align="center">
								<td colspan="9" align="center">검색결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="c" items="${reviewList }" varStatus="vs">
							<tr align="center" class="coupon_row" onclick="location.href='<%=ctx%>/admin/productreview/showdetail?seq=${c.seq }'">
								<%-- <td class="list_checkbox"><input type="checkbox" name='allck' value="${c.seq }"></td> --%>
								<td class="list_id">${c.seq }</td> <td>${c.title }</td> <td>${c.userid }</td> <td>${c.likes_cnt }</td> 
								<td>${c.rdate }</td> <td>${c.p_name }</td> <td>${c.ea }</td> <td>${c.p_color }</td>
							</tr>
						</c:forEach>
	
					</tbody>
				</table>
			
				<div class="col-sm-12 col-md-7" style="position: relative; left: 40%;"><!-- 페이징 네비게이션 시작 -->
					<div class="dataTables_paginate paging_simple_numbers"
						id="dataTable_paginate" align="center">
						<!-- 페이징 -->
						<div id="paging_wrap" align="center">
							<nav aria-label="Page navigation example">
							  <ul class="pagination">
							    <li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
							    
							    <c:forEach begin="${aRPDto.firstNavIndex }" end="${aRPDto.lastNavIndex }" step="1" var="i">
							    	<li class="page-item"><a class="page-link page-num" href="#">${i }</a></li>
							    </c:forEach>
							    
							    <li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>
							  </ul>
							</nav>
						</div><!-- 페이징 네비게이션 끝 -->					
					</div>
				</div>
			</div><!-- 테이블 끝 -->
		</div>
	</div>

</div>

<!-- /.container-fluid -->



</html>