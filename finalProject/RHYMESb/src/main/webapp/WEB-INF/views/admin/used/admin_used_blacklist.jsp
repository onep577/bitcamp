<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath() %>/css/admin/used/adminusedlist.css">
</head>
<body>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">비매너유저 관리</h1>
		<p class="mb-4">민수마켓</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">신고접수 목록</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<div class="row">
						<div class="col-sm-12 col-md-6">
						<button type="button" id="admindel" class="btn btn-primary">경고</button>
						<button type="button" id="admincancel" class="btn btn-primary">허위신고</button>	
							<div class="dataTables_length" id="dataTable_length">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
							</div>
						</div>
						<!-- 검색 -->
						<div class="col-sm-12 col-md-6">
							<div id="dataTable_filter"
								class="searchPosition dataTables_filter">
		
		<form id="_frmFormSearch">
			<select id="select" name="select" onchange="categorychange()"	class="custome-select border-0 pr-3 searchSelect">
				<option value="id" <c:out value="${select == 'id'? 'selected':'' }"/>>아이디</option>
			</select> 
			<input type="search" id="keyword" name="keyword" value="${keyword }" class="searchText form-control-sm" placeholder=""	aria-controls="dataTable" style="width: 150px">
			<button class="btn btn-primary" type="button" id="_formbtn">
				<i class="fas fa-search fa-sm" id="_btnSearch"></i>
			</button>
		<!-- hidden 을 통해서 값을 넘겨주기 -->
		<input type="hidden" name="pageNumber" id="_pageNumber" value="0">
		<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage ? 0 : recordCountPerPage)}">	
		</form>
		
							</div>
						</div>
						<!-- /검색 -->

					</div>
					<form id="deleteform">
					<input type="hidden" id="b_id" name="b_id" value="">
					<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
					<col width="10"><col width="50"><col width="50"><col width="200"><col width="50"><col width="40">
						<thead>
							<tr align="center">
								<th class="list_checkbox" align="center"><input type="checkbox" id='allCheck'>
								</th>
								<th>아이디</th>
								<th>접수자</th>
								<th>내용</th>
								<th>신고날짜</th>
								<th>누적횟수</th>
									</tr>
						</thead>
						<tbody>
							<c:if test="${empty list }">
								<tr align="center">
									<td colspan="9" align="center">검색결과가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${list }" var="list">
								<tr>
									<td align="center"><input type="checkbox" name="ckbox" id="ckbox" b_id="${list.b_id } "value="${list.seq }">					
									</td>
									<td>${list.b_id }</td>
									<td>${list.reporter }</td>
									<td><a href="#none" onclick="godetail(${list.b_seq})">${list.content }</a></td>
									<td>${list.rdate }</td>
									<td>${list.blackcount }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</form>
					
					<div class="col-sm-12 col-md-7">
						<div class="dataTables_paginate paging_simple_numbers"
							id="dataTable_paginate">
							<!-- 페이징 -->
	 						 <div id="paging_wrap">
								<jsp:include page="/WEB-INF/views/admin/used/bpaging.jsp"
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

	<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->


<script type="text/javascript">
	var list = [];

function godetail(seq){
	
	location.href='/used/useddetail?seq='+seq;
}


$("#admindel").click(function() {
	
	$("input:checkbox[name=ckbox]:checked").each(function(i) {
		list.push($(this).attr('b_id'));
	})
	
	$("#b_id").val(list);
	
	
	
	var lan  = $("input:checkbox[name=ckbox]:checked").length;
	
	if(lan == 0){
		alert("항목을 선택해주세요");
		return;
	
	} else {
		$("#deleteform").attr("action","/admin/used/userban")
		$("#deleteform").submit()
	}
});

$("#admincancel").click(function() {
	
	var lan  = $("input:checkbox[name=ckbox]:checked").length;
	
	if(lan == 0){
		alert("항목을 선택해주세요");
		return;
	
	} else {
		$("#deleteform").attr("action","/admin/used/userbancancel")
		$("#deleteform").submit()
	}
});


function goPage( pageNumber ) { /* pageNumber는 현재 페이지를 뜻한다 */
	$("#_pageNumber").val(pageNumber);
	
	$("#_frmFormSearch").attr("action","/admin/mem_blacklist").submit();
}

$("#_btnSearch").click(function() {

    var keyword = $("#keyword").val();
	var select = $("#select").val();
	
	location.href="/admin/mem_blacklist?keyword="+keyword+"&select="+select; 
});

$("#allCheck").click(function(){ // 만약 전체 선택 체크박스가 체크된상태일경우

	if($("#allCheck").prop("checked")) { // 해당화면에 전체 checkbox들을 체크해준다
		$("input[name=ckbox]").prop("checked",true); // 전체선택 체크박스가
																// 해제된 경우
		}
	else { // 해당화면에 모든 checkbox들의 체크를해제시킨다.
				$("input[name=ckbox]").prop("checked",false); 
		} 
	}) 


</script>

</body>
</html>