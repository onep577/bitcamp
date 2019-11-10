<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mem_c_list</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/admin/member/memberlist_c.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/admin/member/paging.css">
</head>

<!-- Begin Page Content -->
<div class="container-fluid">

<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">회원관리</h1>
<p class="mb-4">회원조회, 수정, 정지</p>

<!-- DataTales Example -->
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">업체 목록</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<div class="row">
				<div class="col-sm-12 col-md-6">
					<div class="dataTables_length" id="dataTable_length">
					<form action="memlist" id="_frm" method="post">
						<input type="hidden" value="ROLE_SELLER" name="authority">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						 <select style="width: 100px;" name="recordCountPerPage" aria-controls="dataTable"
						 	onchange="dataTable_length()"
							class="custom-select custom-select-sm form-control form-control-sm">
							<option value="10" 
								<c:out value="${recordCountPerPage == '10'? 'selected':'' }"/>>10</option>
							<option value="25"
								<c:out value="${recordCountPerPage == '25'? 'selected':'' }"/>>25</option>
							<option value="50"
								<c:out value="${recordCountPerPage == '50'? 'selected':'' }"/>>50</option>
							<option value="100"
								<c:out value="${recordCountPerPage == '100'? 'selected':'' }"/>>100</option>
						</select>
					</div>
				</div>
				<!-- 검색 -->
				<div class="col-sm-12 col-md-6">
					<div id="dataTable_filter"
						class="searchPosition dataTables_filter">
						
						
												
						<select id="_s_category" name="s_category" onchange="categorychange()" class="custome-select border-0 pr-3 searchSelect">
							<option value="" selected="selected">선택</option>
							<option value="01"
								<c:out value="${s_category == '01'? 'selected':'' }"/>>아이디</option>
							<option value="02"
								<c:out value="${s_category == '02'? 'selected':'' }"/>>상호</option>
							<option value="03"
								<c:out value="${s_category == '03'? 'selected':'' }"/>>사업자번호</option>
							<option value="04"
								<c:out value="${s_category == '04'? 'selected':'' }"/>>담당자이름</option>
							<option value="05"
								<c:out value="${s_category == '05'? 'selected':'' }"/>>담당자번호</option>
						</select>
						<input type="search" id="_s_keyword" name="s_keyword" class="searchText form-control-sm" 
							placeholder="search..." value="${s_keyword }" aria-controls="dataTable" style="width: 150px">
						<button class="btn btn-primary" type="button">
							<i class="fas fa-search fa-sm" id="_btnSearch"></i>
						</button>
						<!-- hidden 을 통해서 값을 넘겨주기 -->
						<input type="hidden" name="pageNumber" id="_pageNumber" value="0">
						<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
					</div>
				</div>
				<!-- /검색 -->
				
			</div>
		
			
			
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			
				<thead>
					<tr align="center">
						<th class="list_checkbox"><input type="checkbox"
							name='allckeck' onclick='allchecks(this.checked)' id='_allck'>
						</th>
						<th class="sorting">아이디<input type="hidden" name="sorting" id="_sorting" value="${sorting }"></th>	<!-- 1 -->
						<th class="sorting">상호</th>											<!-- 2 -->
						<th class="sorting">사업자등록번호</th>										<!-- 3 -->
						<th class="sorting">대표자명</th>											<!-- 4 -->
						<th class="sorting">담당자이름</th>											<!-- 5 -->
						<th class="sorting">회사주소</th>											<!-- 6 -->
						<th class="sorting">담당자번호</th>											<!-- 7 -->
						<th class="sorting">담당자메일</th>											<!-- 7 -->
						<th class="sorting">가입일</th>
						<th class="sorting">계정장금</th>											<!-- 7 -->
					</tr>
				</thead>

				<tbody>
					<c:if test="${empty mem_c_list }">
						<tr align="center">
							<td colspan="10" align="center">검색결과가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="c" items="${mem_c_list }" varStatus="vs">
						<tr align="center">
							<td class="list_checkbox">
								<input type="checkbox" value="${c.userid }" name='checkid' value="${c.seq }" id="_checkid">
							</td>
							<td class="list_id">${c.userid }</td>
							<td>${c.c_name }</td>
							<td>${c.c_num }</td>
							<td>${c.p_name }</td>
							<td>${c.ic_name }</td>
							<td>${c.c_address}</td>
							<td>${c.ic_phone }</td>
							<td>${c.ic_email }</td>
							<td>${c.rdate }</td>
							<c:if test="${c.isAccountNonLock == 'false'}">
								<td style="color: blue; font-weight: bold;">${c.isAccountNonLock }</td>
							</c:if>
							<c:if test="${c.isAccountNonLock == 'true'}">
								<td>${c.isAccountNonLock }</td>
							</c:if>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</from>
			<div class="col-sm-12 col-md-7">
				<div class="dataTables_paginate paging_simple_numbers"
					id="dataTable_paginate">
					<!-- 페이징 -->
					<div id="paging_wrap">
						<jsp:include page="/WEB-INF/views/admin/member/paging.jsp"
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
					<button type="button" id="memLockBtn" class="memLockBtn">업체정지</button>
					<button type="button" id="memLockBtn_n" class="memLockBtn_n">정지해제</button>
				</div>
			</div>
		</div>
	</div>
</div>

</div>

<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->




<script type="text/javascript">
function goPage( pageNumber ) {
	
	$("#_pageNumber").val(pageNumber);  // 들어오는 값을 가져옴 
	$("#_frm").attr("action", "mem_c_list").submit(); //
	
}

$("#_btnSearch").click(function () {
	$("#_frm").attr("action", "mem_c_list").submit(); //
	
});



//정지
$("#memLockBtn").click(function() {
  	$("#_frm").attr("action", "/admin/memLock").submit(); 

});
//해제
$("#memLockBtn_n").click(function() {
  	$("#_frm").attr("action", "/admin/memLock_n").submit(); 

});
</script>

<script type="text/javascript">

function allchecks(e) {
	// 모두 체크
	var arr = document.getElementsByName("checkid");
	
	for(i=0; i<arr.length; i++){
		arr[i].checked = e;
	}
}

$("#delBtn").click(function(){
	
});

/* function selectMem(){
	$("#_frm").attr("action", "memlist").submit();
} */

// 리스트 갯수 뿌리기
function dataTable_length(){
	$("#_frm").attr("action", "mem_c_list").submit();
}

// sorting
$(function(){
	$(".sorting").click(function() {
		
		var thNum = $(this).index();

		if(thNum == 1){
			$("#_sorting").val("ID");
			$("#_frm").attr("action", "mem_c_list").submit();		
		}
		if(thNum == 2){
			$("#_sorting").val("C_NAME");
			$("#_frm").attr("action", "mem_c_list").submit();		
		}
		if(thNum == 3){
			$("#_sorting").val("C_NUM");
			$("#_frm").attr("action", "mem_c_list").submit();		
		}
		if(thNum == 4){
			$("#_sorting").val("P_NAME");
			$("#_frm").attr("action", "mem_c_list").submit();		
		}
		if(thNum == 5){
			$("#_sorting").val("C_ADDRESS");
			$("#_frm").attr("action", "mem_c_list").submit();		
		}
		if(thNum == 6){
			$("#_sorting").val("IC_PHONE");
			$("#_frm").attr("action", "mem_c_list").submit();		
		}
		if(thNum == 7){
			$("#_sorting").val("IC_MAIL");
			$("#_frm").attr("action", "mem_c_list").submit();		
		}
		if(thNum == 8){
			$("#_sorting").val("RDATE");
			$("#_frm").attr("action", "mem_c_list").submit();		
		}
		if(thNum == 9){
			$("#_sorting").val("isAccountNonLock");
			$("#_frm").attr("action", "mem_c_list").submit();		
		}
		
	});
});

//마우스 커서
$(document).ready(function() {
	$('.sorting').mouseover(function() {
		$(this).css("cursor", "pointer");
	});
});

</script>


</html>