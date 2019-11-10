 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>content_main</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/event/eventlist.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/member/paging.css">
</head>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">EVENT</h1>
	<p class="mb-4">이벤트 관리</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">이벤트 목록</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="row">
					<div class="col-sm-12 col-md-6">
						<div class="dataTables_length" id="dataTable_length">
							<form action="" id="_frm" method="get">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
								<select style="width: 100px;" name="recordCountPerPage" aria-controls="dataTable" onchange="dataTable_length()"
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
						<div id="dataTable_filter" class="searchPosition dataTables_filter">

							<select class="custome-select border-0 pr-3 searchSelect" onchange="selectMem()" id="_select" name="s_category">
								<option selected value="">전체</option>
								<option value="01"
									<c:out value="${s_category == '01'? 'selected':'' }"/>>제목</option>
								<option value="02"
									<c:out value="${s_category == '02'? 'selected':'' }"/>>종류</option>
								<option value="03"
									<c:out value="${s_category == '03'? 'selected':'' }"/>>시작일</option>
								<option value="04"
									<c:out value="${s_category == '03'? 'selected':'' }"/>>종료일</option>
							</select> 
							<input type="search" id="_s_keyword" name="s_keyword" class="searchText form-control-sm" placeholder=""
								aria-controls="dataTable" style="width: 150px">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm" id="_btnSearch"></i>
							</button>
							<!-- hidden 을 통해서 값을 넘겨주기 -->
							<input type="hidden" name="pageNumber" id="_pageNumber" value="0">
							<input type="hidden" name="recordCountPerPage"
								id="_recordCountPerPage"
								value="${(empty recordCountPerPage)?0:recordCountPerPage }">
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
							<th class="sorting">번호</th>
							<!-- 1 -->
							<th class="sorting">제목<input type="hidden" name="sorting" id="_sorting" value="${sorting }"></th>
							<!-- 2 -->
							<th class="sorting">종류</th>
							<!-- 3 -->
							<th class="sorting">시작일</th>
							<!-- 4 -->
							<th class="sorting">종료일</th>
							<!-- 5 -->
							<th class="sorting">작성일</th>
							<!-- 6 -->
							
							<th>수정</th>
						</tr>
					</thead>

					<tbody>
						<c:if test="${empty eventlist }">
							<tr align="center">
								<td colspan="8" align="center">검색결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="event" items="${eventlist }" varStatus="vs">
							<tr align="center">
								<td class="list_checkbox">
									<input type="checkbox" name='checkseq' value="${event.seq }">
								</td>
								<td>${event.seq }</td>		 					
								<td>
								<a href="/event/eventdetail?seq=${event.seq }">${event.title }</a>
								</td>
								<td>${event.type }</td>
								<td>${event.sdate}</td>
								<td>${event.edate}</td>
								<td>${event.rdate}</td>
								<td>
									<input type="button" value="수정" class="updateBtn" onclick="updatebtn(${event.seq})">
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				</form>
				<div class="col-sm-12 col-md-7">
					<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
						<!-- 페이징 -->
						<div id="paging_wrap">
							<jsp:include page="/WEB-INF/views/admin/event/paging.jsp" flush="false">
								<jsp:param name="pageNumber" value="${pageNumber }" />
								<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
								<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
								<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
							</jsp:include>
						</div>
						<!-- 페이징끝 -->
					</div>
				</div>

				<div>
					<button type="button" id="eventwrite" class="eventBtn">글쓰기</button>
					<button type="button" id="eventdel" class="eventBtn">삭제</button>
				</div>

			</div>
			

		</div>
	</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->




<script type="text/javascript">
	function goPage(pageNumber) {

		$("#_pageNumber").val(pageNumber); // 들어오는 값을 가져옴 
		$("#_frm").attr("action", "/admin/event/eventlist").submit(); //

	}

	$("#_btnSearch").click(function() {
		$("#_frm").attr("action", "/admin/event/eventlist").submit(); 

	});
	$("#eventdel").click(function() {
		$("#_frm").attr("action", "/admin/event/eventdel").submit(); 

	});
</script>

<script type="text/javascript">
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

	function allchecks(e) {
		// 모두 체크
		var arr = document.getElementsByName("checkseq");
// 		alert(arr.length);
		for (i = 0; i < arr.length; i++) {
			arr[i].checked = e;
			
		}
		
	}
	
	
	// 글 작성
	$("#eventwrite").click(function() {
	  	$("#_frm").attr("action", "/admin/event/write").submit(); 

	});
	
	// 리스트 갯수 뿌리기
	function dataTable_length() {
		$("#_frm").attr("action", "/admin/event/eventlist").submit();
	}
	
	// 마우스 커서
	$(document).ready(function() {
		$('.sorting').mouseover(function() {
			$(this).css("cursor", "pointer");
		});
	});

	// sorting
	$(function() {
		$(".sorting").click(function() {
			var thNum = $(this).index();

			if (thNum == 1) {
				$("#_sorting").val("SEQ");
				$("#_frm").attr("action", "/admin/event/eventlist").submit();
			}
			if (thNum == 2) {
				$("#_sorting").val("TITLE");
				$("#_frm").attr("action", "/admin/event/eventlist").submit();
			}
			if (thNum == 3) {
				$("#_sorting").val("TYPE");
				$("#_frm").attr("action", "/admin/event/eventlist").submit();
			}
			if (thNum == 4) {
				$("#_sorting").val("SDATE");
				$("#_frm").attr("action", "/admin/event/eventlist").submit();
			}
			if (thNum == 5) {
				$("#_sorting").val("EDATE");
				$("#_frm").attr("action", "/admin/event/eventlist").submit();
			}
			if (thNum == 6) {
				$("#_sorting").val("RDATE");
				$("#_frm").attr("action", "/admin/event/eventlist").submit();
			}

		});
	});
	
	
	// 수정
	function updatebtn(e) {
		// seq 넘김
		location.href="eventupdate?seq="+e;
		
	}
		
</script>



</html>