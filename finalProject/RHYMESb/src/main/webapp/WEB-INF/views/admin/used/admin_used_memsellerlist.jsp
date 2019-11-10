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
		<h1 class="h3 mb-2 text-gray-800">개인판매 회원 관리</h1>
		<p class="mb-4">민수마켓</p>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">회원 목록</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<div class="row">
						<div class="col-sm-12 col-md-6">
						<button type="button" id="admindel" class="btn btn-primary">계정 잠금</button>
						<button type="button" id="admincancel" class="btn btn-primary">잠금 해제</button>	
							<div class="dataTables_length" id="dataTable_length">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
							</div>
						</div>
						<!-- 검색 -->
						<div class="col-sm-12 col-md-6">
							<div id="dataTable_filter"
								class="searchPosition dataTables_filter">
		
		<form id="_frmFormSearch">
			<select id="select" name="select" class="custome-select border-0 pr-3 searchSelect">
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
					<input type="hidden" id="s_id" name="s_id" value="">
					<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
					<col width="10"><col width="50"><col width="50"><col width="30"><col width="30"><col width="30"><%-- <col width="30"> --%><col width="30">
						<thead>
							<tr align="center">
								<th class="list_checkbox" align="center"><input type="checkbox" id='allCheck'>
								</th>
								<th>아이디</th>
								<th>가입일</th>
								<th>경고 횟수</th>
								<th>판매등록</th>
								<th>판매완료</th>
								<!-- <th>평균 판매율</th> -->
								<th>계정잠금</th>
								</tr>
						</thead>
						<tbody>
							<c:if test="${empty list }">
								<tr align="center">
									<td colspan="9" align="center">검색결과가 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach items="${list }" var="list">
								<c:set var="na" value="${ (list.scount / list.pcount) }"/> 

								<%
								Double str = (Double)pageContext.getAttribute("na");
								
								if(Double.isNaN(str) || Double.isInfinite(str)){
									str = 0.0;
								} else {
								
								}
								
								pageContext.setAttribute("str",str);
								%>
								
								<c:set var="str2" value="${pageScope.str }"/>
								
								<tr>
									<td align="center"><input type="checkbox" name="ckbox" id="ckbox" s_id="${list.s_id } "value="${list.seq }">					
									</td>
									<td>${list.s_id }</td>
									<td>${list.rdate }</td>
									<td>${list.blackcount }번</td>
									<td>${list.scount }개</td>
									<td>${list.pcount }개</td>
<%-- 									<td>${str2 }%</td> --%>
								<c:if test="${list.isAccountNonLock ne 'true'}">
									<td style="font-weight: bold; color: red;">${list.isAccountNonLock }</td>
								</c:if>
								<c:if test="${list.isAccountNonLock ne 'false'}">
									<td style="font-weight: bold; color: blue;">${list.isAccountNonLock }</td>
								</c:if>
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
								<jsp:include page="/WEB-INF/views/admin/used/spaging.jsp"
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


$("#admindel").click(function() {
	
	$("input:checkbox[name=ckbox]:checked").each(function(i) {
		list.push($(this).attr('s_id'));
	})
	
	$("#s_id").val(list);
	
	
	
	var lan  = $("input:checkbox[name=ckbox]:checked").length;
	
	if(lan == 0){
		alert("항목을 선택해주세요");
		return;
	
	} else {
		$("#deleteform").attr("action","/admin/used/userLock")
		$("#deleteform").submit()
	}
});

$("#admincancel").click(function() {
	
	$("input:checkbox[name=ckbox]:checked").each(function(i) {
		list.push($(this).attr('s_id'));
	})
	
	$("#s_id").val(list);
	
	var lan  = $("input:checkbox[name=ckbox]:checked").length;
	
	if(lan == 0){
		alert("항목을 선택해주세요");
		return;
	
	} else {
		$("#deleteform").attr("action","/admin/used/userUnLock")
		$("#deleteform").submit()
	}
});


function goPage( pageNumber ) { /* pageNumber는 현재 페이지를 뜻한다 */
	$("#_pageNumber").val(pageNumber);
	
	$("#_frmFormSearch").attr("action","/admin/memsellerlist").submit();
}

$("#_btnSearch").click(function() {

    var keyword = $("#keyword").val();
	var select = $("#select").val();
	
	location.href="/admin/memsellerlist?keyword="+keyword+"&select="+select; 
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