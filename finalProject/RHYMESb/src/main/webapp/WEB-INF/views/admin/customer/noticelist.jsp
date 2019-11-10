<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content_main</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/customer/customerlist.css">


</head>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">고객센터</h1>
	<p class="mb-4">공지사항</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">공지사항 list</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<!-- @@@@ 여기서부터 작성 @@@@@ -->
					<div>
							<button type="button" class="clickBtn1" id="_btnWrite">공지사항쓰기</button>
					</div>
					
					<!-- 검색 -->
					<form action="" name="frmForm1" id="_frmFormSearch" method="GET">
					<div class="box_border" style="float: right; margin-bottom: 10px" >
					
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					
					
						
							<select name="s_category" class="custome-select border-1 pr-3 searchSelect">
								<option value="" selected="selected">선택</option>
							  <option value="title" <c:out value="${s_category == 'title'? 'selected':'' }"/>>제목</option>
						      <option value="content"<c:out value="${s_category == 'content'? 'selected':'' }"/>>내용</option>
						      <option value="writer"<c:out value="${s_category == 'writer'? 'selected':'' }"/>>작성자</option>
							</select>
						
							<input type="text"  name="s_keyword" value="${s_keyword }" class="searchText form-control-sm" >
						
							<span class="buttonsearch">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm" id="_btnSearch"></i>
							</button>
							</span>
				
					</div>	
					<!-- 검색 -->
					
					<table style="width:100%;"class="table table-bordered" >
					<colgroup>
						<col width="50"><col width="300"><col width="100"><col width="100"><col width="50">
					</colgroup>
					
					<thead>
					<tr>
						<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
					</tr>
					</thead>
					
					<tbody>
					<c:if test="${empty noticelist}">
						<tr>
							<td colspan="4">검색결과가 없습니다. 다시 검색하여 주세요.</td>
						</tr>
					</c:if>
					<c:forEach var="notice" items="${noticelist }" varStatus="vs">
					<tr class="">
						<td>${vs.count }</td>
						<td style="text-align: left;">
							<a href="noticedetail?seq=${notice.seq}">
								${notice.title }
							</a>
						</td>
						<td>${notice.id }</td>
						<td> 
							<font size="2">${fn:substring(notice.wdate,0,10)}</font>
						</td>
						<td>${notice.readcount }</td>
						
					</tr>
					</c:forEach>
					
				
					
					
					</tbody> 
					</table>
				

					<!-- 페이징 -->
					<div id="paging_wraps" align="center">  
						<jsp:include page="/WEB-INF/views/admin/customer/paging.jsp" flush="false">
							<jsp:param name="pageNumber" value="${pageNumber }"/>
							<jsp:param name="totalRecordCount" value="${totalRecordCount }"/>
							<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }"/>
							<jsp:param name="recordCountPerPage" value="${recordCountPerPage }"/>
						</jsp:include>
					</div>
					
					<!-- hidden 을 통해서 값을 넘겨주기 -->
					<input type="hidden" name="pageNumber" id="_pageNumber" value="0"> 
					<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
					</form>
					<!-- 페이징끝 --> 
					
				
				<!-- @@@@@ 여기까지 @@@@@ -->

			</div>
		</div>
	</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->






</html>



<script type="text/javascript">

$("#_btnWrite").click(function () { 
	location.href = "noticewrite";
});

</script>    

<script type="text/javascript">

function goPage( pageNumber ) {
	
	$("#_pageNumber").val(pageNumber);  // 들어오는 값을 가져옴 
	$("#_frmFormSearch").attr("action", "noticelist").submit(); //
	
}

$("#_btnSearch").click(function () {
	//alert("클릭");
	$("#_frmFormSearch").attr("action", "noticelist").submit(); //
});

</script>