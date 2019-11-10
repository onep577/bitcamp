<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>

<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<link rel="stylesheet" href="<%=ctx%>/css/admin/events/sub/coupon_detail.css">
<script type="text/javascript" src="<%=ctx %>/js/admin/events/sub/coupon_detail.js"></script>
<script type="text/javascript" src="<%=ctx %>/js/admin/events/sub/coupon_new_detail.js"></script>

<script type="text/javascript" src="<%=ctx %>/js/bootstrap/bootstrap-3-typeahead.js"></script>
<script type="text/javascript" src="<%=ctx %>/js/admin/events/sub/coupon_detail_info.js"></script>


<!-- Begin Page Content -->
<div class="container-fluid">
<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">쿠폰 관리</h1>
<p class="mb-4">쿠폰 발행, 조회, 삭제</p>

<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
			<a href="<%=ctx%>/admin/mypage/coupon">쿠폰 목록</a>&nbsp;&nbsp;<i class="fas fa-angle-right"></i>&nbsp;
			<a href="<%=ctx%>/admin/mypage/coupon/detail">쿠폰 상세</a>
		</h6>
	</div>
	<div class="card-body"><!-- 쿠폰정보 부분 -->
		<div class="card border-left-primary shadow h-100 py-2" id="_coupon_info">
			<div class="card-body">
            	<div class="row no-gutters align-items-center">
              	<div class="col mr-2">
               		<div class="h5 mb-0 font-weight-bold text-primary text-uppercase mb-1">
               			쿠폰정보&nbsp;&nbsp;&nbsp;
               			<a id="_btn_gen_coup_code" href="#" class="btn btn-info btn-icon-split" data-toggle="modal" data-target="#_coupon_new_details_modal"
               				data-placement="right" data-content="새로운 쿠폰코드를 현재 쿠폰에 추가합니다.">
							<span class="icon text-white-50"><i class="fas fa-info-circle"></i></span><span class="text">쿠폰 추가</span>
							<input type="hidden" value="${cDto.seq}" id="_this_c_seq"><!-- 현재 쿠폰의 CDTO -->
							<input type="hidden" value="${cDto.func_time_limit}" id="_this_func_time_limit"><!-- 현재 쿠폰의 유효기간 -->
							<input type="hidden" value="${pDto.totalSize }" id="_this_total_size"><!-- 현재 발행된 쿠폰번호의 총 개수 -->
						</a>
               		</div>
                	<div class="text-xs font-weight-bold text-gray-800">
            	  		<c:choose>
							<c:when test="${cDto != null }">
								<table class="table" id="_tbl_coupon_title" width="100%" cellspacing="0">
									<c:set var="cols">쿠폰이름,쿠폰내용,구분,기능,유효기간(월),등록일</c:set>
									<tr><c:forEach items="${cols }" var="col"><th>${col }</th></c:forEach></tr>
									<tr class="coupon-info-row">
										<td>${cDto.title }</td> <td>${cDto.sub_title }</td> <td>${cDto.app_cate }</td> 
										<td>${cDto.function }</td> <td>${cDto.func_time_limit }</td> <td>${cDto.rdate }</td>
									</tr>
						        </table>				                    
							</c:when>
							<c:otherwise>잘못된 접근입니다.</c:otherwise>
						</c:choose>		                      
                	</div>			                      
				</div>
				</div>
			</div>
        </div><!-- 쿠폰정보 부분 끝 -->
		              
		<div class="table-wrap">
			<div class="row">
				<div class="col-sm-12 col-md-6">
					<div class="dataTables_length" id="dataTable_length">
					<form action="<%=ctx %>/admin/mypage/coupon/detail" id="_frm" method="get">
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
							<option value="1" <c:out value="${pDto.cond == '1'? 'selected':'' }"/>>등록ID</option>
							<option value="2" <c:out value="${pDto.cond == '2'? 'selected':'' }"/>>사용ID</option>
							<option value="3" <c:out value="${pDto.cond == '3'? 'selected':'' }"/>>쿠폰번호</option>
							<option value="4" <c:out value="${pDto.cond == '4'? 'selected':'' }"/>>사용여부</option>							
						</select>
						<c:choose>
							<c:when test="${pDto.cond == 4 }">
								<select name="keyword" style="width: 100px;" class="custom-select custom-select-sm form-control form-control-sm">
									<option value="" selected="selected">선택</option>
									<option value="사용" <c:out value="${pDto.keyword == '사용'? 'selected':'' }"/>>사용</option>
									<option value="미사용" <c:out value="${pDto.keyword == '미사용'? 'selected':'' }"/>>미사용</option>
								</select>
							</c:when>
							<c:otherwise>
								<input type="search" id="_s_keyword" name="keyword" class="searchText form-control-sm" placeholder="" aria-controls="dataTable" style="width: 150px"
								value="${pDto.keyword }"/>
							</c:otherwise>
						</c:choose>
						<button class="btn btn-primary" type="button" onclick="conditionChanged();">
							<i class="fas fa-search fa-sm" id="_btnSearch"></i>
						</button>
					</div>
				</div>				
				<%-- <input type="hidden" name="pageNum" id="_currPageNum" value="${pDto.pageNum }"> --%>
				<input type="hidden" name="seq" value="${pDto.seq }"><!-- 쿠폰ID(C_SEQ) -->
				<input type="hidden" name="pageNum" id="_currPageNum" value="${pDto.pageNum }">
				</form><!-- /검색 -->				
			</div>
						
			
				
			<!-- 쿠폰디테일 테이블 시작 -->
			<table class="table table-bordered table-hover" id="_tbl_coupon_detail" width="100%" cellspacing="0">			
				<thead>
					<tr align="center">
						<th class="list_checkbox"><input type="checkbox" name='allckeck' onclick='allchecks(this.checked)' id='_allck'>
						</th>
						<c:set var="detailCols">No,쿠폰번호,등록자ID,등록일,만료일,사용여부,사용자ID,사용일</c:set>
						<c:forEach items="${detailCols }" var="col" varStatus="i"><th>${col }</th></c:forEach>						
					</tr>
				</thead>

				<tbody>
					<c:if test="${empty couponDetailList }">
						<tr align="center">
							<td colspan="9" align="center">등록된 쿠폰이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="c" items="${couponDetailList }" varStatus="vs">
						<tr align="center" class="coupon_detail_row" data-toggle="modal" data-target="#_coupon_detail_info_modal">
							<td class="list_checkbox"><input type="checkbox" name='allck' value="${c.seq }"></td>
							<td>${c.seq }</td> <td>${c.coup_code }</td> <td>${c.userid }</td> <td>${c.gdate }</td> 
							<td>${c.expdate }</td> <td>${c.isused }</td> <td>${c.used_id }</td> <td>${c.used_date }</td>
						</tr>
					</c:forEach>

				</tbody>
			</table><!-- 쿠폰디테일 테이블 끝 시작 -->
		
			<div class="col-sm-12 col-md-7"><!-- 페이징 네비게이션 시작 -->
				<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate" align="center">
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

<!-- 모달 부분 -->
<!-- 쿠폰코드 추가 모달 -->
<div class="coupon_new_details_modal modal fade" id="_coupon_new_details_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<jsp:include page="./coupon_new_detail.jsp"></jsp:include>
</div>
<!-- 쿠폰발행정보 모달 -->
<div class="coupon_details_info_modal modal fade" id="_coupon_detail_info_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<jsp:include page="./coupon_detail_info.jsp"></jsp:include>
</div>
</html>