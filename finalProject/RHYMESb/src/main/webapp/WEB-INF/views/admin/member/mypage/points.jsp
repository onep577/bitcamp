<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<script type="text/javascript" src="<%=ctx %>/js/admin/events/points.js"></script>
<script type="text/javascript" src="<%=ctx %>/js/admin/events/points_function.js"></script>
<script type="text/javascript" src="<%=ctx %>/js/admin/events/sub/points_detail.js"></script>

<link rel="stylesheet" href="<%=ctx%>/css/admin/events/sub/points_detail.css">

<!-- autocomplete 관련 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<!-- Begin Page Content -->
<div class="container-fluid">
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">적립금 관리</h1>
<p class="mb-4">적립금 지급-차감 및 이력 조회</p>

<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">적립금 목록</h6>
		<div class="function-btns-wrap">
			<a id="_btn_give_points" href="#" class="btn btn-info btn-icon-split" data-toggle="modal" data-target="#_points_give_modal">
				<span class="icon text-white-50"><i class="fas fa-info-circle"></i></span><span class="text">적립금 지급</span>
			</a>
		</div>
	</div>
	<div class="card-body">
		<div class="table-wrap">
			<div class="row">
				<div class="col-sm-12 col-md-6">
					<div class="dataTables_length" id="dataTable_length">
					<form action="<%=ctx %>/admin/mypage/points" id="_frm" method="post">
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
				<%-- <input type="hidden" name="pageNum" id="_currPageNum" value="${pDto.pageNum }"> --%>
				<input type="hidden" name="pageNum" id="_currPageNum" value="2">
				</form><!-- /검색 -->				
			</div>
			
			<table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">			
				<thead>
					<tr align="center">
						<th class="list_checkbox"><input type="checkbox" name='allckeck' onclick='allchecks(this.checked)' id='_allck'>
						</th>
						<!-- String[] cols = {"No", "ID", "내용", "적립액", "사용금액", "사용가능금액", "만료일", "쿠폰번호"}; -->
						<c:forEach items="${cols }" var="col" varStatus="i">							
							<c:if test="col == 'No'">
								<th class="sorting">${col }<input type="hidden" name="sorting" id="_sorting"></th>	
							</c:if>
							<th class="sorting">${col }</th>
						</c:forEach>						
					</tr>
				</thead>

				<tbody>
					<c:if test="${empty pointsList }">
						<tr align="center">
							<td colspan="9" align="center">검색결과가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="c" items="${pointsList }" varStatus="vs">
						<tr align="center" class="points_row" data-toggle="modal" data-target="#_points_detail_modal">
							<td class="list_checkbox"><input type="checkbox"
								name='allck' value="${c.seq }"></td>
							<td>${c.seq }</td> <td class="list_id">${c.id }</td>
							<td>${c.comment }</td> <td>${c.amount }</td> <td>${c.used_amount }</td>
							<td>${c.totalAmount}</td> <td>${c.expdate }</td> <td>${c.coup_code }</td>
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
<!-- 적립금 디테일 모달 -->
<div class="points_detail_modal modal fade" id="_points_detail_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<jsp:include page="./sub/points_detail.jsp"></jsp:include>
</div>
<!-- 적립금 지급 모달 -->
<div class="points_give_modal modal fade" id="_points_give_modal" tabindex="-1" role="dialog" aria-labelledby="pointsGiveModalLabel" aria-hidden="true">
	<jsp:include page="./sub/points_give.jsp"></jsp:include>
</div>
</html>