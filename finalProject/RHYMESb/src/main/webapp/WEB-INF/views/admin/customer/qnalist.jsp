<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/customer/customerlist.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content_main</title>

</head>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">고객센터</h1>
	<p class="mb-4">1:1문의</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">1:1문의 list</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">


				<form action="qnalist" name="frmForm1" id="_frmFormSearch" method="GET">
				
				<input type="hidden" name="s_category" id="_s_category" value="${s_category}"> 
				<div id="button.wrap" style="float: right; margin-bottom: 10px;">
							<button type="button" class="clickBtn2" onclick="changebtn('')" <c:if test="${empty s_category}">id="_btnthis"</c:if>>전체보기</button>
							<button type="button" class="clickBtn2" onclick="changebtn('0')" <c:if test="${s_category eq '0'}">id="_btnthis"</c:if>>미답변</button>
							<button type="button" class="clickBtn2" onclick="changebtn('1')" <c:if test="${s_category eq '1'}">id="_btnthis"</c:if>>답변완료</button>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>        
				 
				<jsp:useBean id="uqna" class="com.rhymes.app.customer.util.QnaArrow" scope="page"/>    
				
				<table style="width:100%;"class="table table-bordered" >
				<colgroup>
					<col width="50"><col width="100"><col width="500"><col width="100"><col width="100">
				</colgroup>
				<thead>
				<tr>
					<th>번호</th><th>카테고리</th><th>제목</th><th>작성자</th><th>작성일</th>
				</tr>
				</thead>
				
				<tbody>
				<c:if test="${empty qnalist }">
					<tr>
						<td colspan="5">질문하신 글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="qna" items="${qnalist }" varStatus="vs">
				<tr class="_hover_tr">
					<td>${vs.count }</td>
					<td>${qna.category }</td>
					<td style="text-align: left; ">
					
					<jsp:setProperty property="depth" name="uqna" value="${qna.depth }"/>
					<jsp:getProperty property="arrow" name="uqna"/> <!-- getArrow 호출 -->
						<a href="qnadetail?seq=${qna.seq}">
							${qna.title}
						</a>
					</td>
					<td>${qna.id }</td>
					<td><font size="2">${fn:substring(qna.wdate,0,10)}</font></td>
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
					
				<!-- hidden 을 통해서 값을 넘겨주기 -->
				<input type="hidden" name="pageNumber" id="_pageNumber" value="0"> 
				<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
				</div>
				<!-- 페이징끝 --> 
				</form>	
				
				
				
				
			</div>
		</div>
	</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->






</html>

<script type="text/javascript">

function goPage( pageNumber ) {
	$("#_pageNumber").val(pageNumber);  // 들어오는 값을 가져옴 
	$("#_frmFormSearch").attr("action", "qnalist").submit(); //	
}


$("#_btnthis").css("background-color", "#66e0b4");
$("#_btnthis").css("color", "white");


function changebtn( s_category ) {
	$("#_s_category").val(s_category);
	$("#_frmFormSearch").attr("action", "qnalist").submit(); //
}


</script>