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
	<h1 class="h3 mb-2 text-gray-800">상품문의관리</h1>
	<p class="mb-4">상품문의</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">상품문의 list</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<div id="button.wrap">
					
				<form action="" name="frmForm1" id="_frmFormSearch" method="get">
				
				<input type="hidden" name="s_category" id="_s_category" value="${s_category}"> 
				<div id="button.wrap" style="float: right; margin-bottom: 10px;">
							<button type="button" class="clickBtn2" onclick="changebtn('')" <c:if test="${empty s_category}">id="_btnthis"</c:if>>전체보기</button>
							<button type="button" class="clickBtn2" onclick="changebtn('0')" <c:if test="${s_category eq '0'}">id="_btnthis"</c:if>>미답변</button>
							<button type="button" class="clickBtn2" onclick="changebtn('1')" <c:if test="${s_category eq '1'}">id="_btnthis"</c:if>>답변완료</button>
				</div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				
				<!--비밀글 -->
				<jsp:useBean id="spqna" class="com.rhymes.app.customer.util.PqnaSecret" scope="page"/>     
				<!-- 답변 -->
				<jsp:useBean id="uqna" class="com.rhymes.app.customer.util.PqnaArrow" scope="page"/>    
				 
				    
				<table class="table table-bordered" style="width:100%" >
				<colgroup>
					<col width="100"><col width="100"><col width="250"><col width="500"><col width="150"><col width="150">
				</colgroup>
				<thead>
				<tr>
					<th>번호</th><th>상품번호</th><th>상품명</th><th>제목</th><th>작성자</th><th>작성일</th>
				</tr>
				</thead>
				
				<tbody>
				<c:if test="${empty pqnalist }">
					<tr>
						<td colspan="4">문의가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="pqna" items="${pqnalist }" varStatus="vs">
				<tr class="_hover_tr" onclick="pqnadetail(${pqna.seq})" style="cursor: pointer;">
					<td>${vs.count }</td>
					<td>${pqna.p_seq }</td>
					<td>${pqna.p_name }</td>
					<td style="text-align: left;">
					<!-- 비밀글 이미지-->
					<jsp:setProperty property="secret" name="spqna" value="${pqna.secret }"/>
					<jsp:getProperty property="arrow" name="spqna"/> <!-- getSecret 호출 -->		
					<!-- 답변 이비지-->
					<jsp:setProperty property="depth" name="uqna" value="${pqna.depth }"/>
					<jsp:getProperty property="arrow" name="uqna"/> <!-- getArrow 호출 -->		
						
							${pqna.title }       
						
					</td>
					<td>${pqna.id }</td>
					<td>${fn:substring(pqna.wdate,0,10)}</td>
				</tr>
				</c:forEach>
				
			
				
				</tbody>
				</table>
			
			
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
				</form>
		
		</div>   

			</div>
		</div>
	</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->






</html>


<!-- 상품문의 -->
<script type="text/javascript">

function pqnadetail(seq){
	
	location.href = "pqnadetail?seq=" + seq;
}

function goPage(pageNumber) {
	
	$("#_pageNumber").val(pageNumber);  // 들어오는 값을 가져옴 
	$("#_frmFormSearch").attr("action", "/productqna/pqnalist").submit(); //
	
}

</script>  

<script type="text/javascript">

function goPage( pageNumber ) {
	$("#_pageNumber").val(pageNumber);  // 들어오는 값을 가져옴 
	$("#_frmFormSearch").attr("action", "pqnalist").submit(); //	
}


$("#_btnthis").css("background-color", "#66e0b4");
$("#_btnthis").css("color", "white");


function changebtn( s_category ) {
	$("#_s_category").val(s_category);
	$("#_frmFormSearch").attr("action", "pqnalist").submit(); //
}


</script>