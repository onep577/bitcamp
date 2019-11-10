<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<h6 class="m-0 font-weight-bold text-primary">상품문의 detail</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				
				<table style="width:100%;"class="table table-bordered">
				<col width="100"><col width="200"><col width="100"><col width="300">
				<tr>
					<th>제목</th>
					<td colspan="3">
						${pqna.title }
					</td>
				</tr>
				
				<tr>
					<th>작성자</th>
					<td colspan="3">
						${pqna.id }
					</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td colspan="3"> 
						${pqna.wdate }
					</td>
				</tr>
				<tr>
					<th>상품번호</th>
					<td> 
					${pqna.p_seq }
					<a href="/admin/company/stocklist?p_seq=${pqna.p_seq }"><input type="button" class="clickBtn3" value="상품조회" style="font-size: 14px;"> </a>
						
					</td>
					<th>상품이름</th>
					<td> 
						${pqna.p_name }
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
					<div style="white-space:pre-line;">
					${pqna.content }
					</div>
					</td>
				</tr>
				</table>
				
				<div>
						<form action="pqnaanswer" method="get">
						<input type="hidden" name="p_seq" value="${pqna.p_seq }"/> <!-- 주문번호 -->
								<input type="hidden" name="seq" value="${pqna.seq }">
								<c:if test="${0 eq pqna.feedback}">
								<input type="submit" class="clickBtn1" value="답변">
								</c:if>	
				
				<!-- 코어태그 추가하기 -->
						<button type="button" class="clickBtn2" onclick="PqnaUpdate('${pqna.seq }')">수정</button>
						<button type="button" class="clickBtn2" onclick="PqnaDelete('${pqna.seq }','${pqna.step }','${pqna.ref }')">삭제</button>
						</form>
				</div>


			</div>
		</div>
	</div>

</div>


</html>

<script type="text/javascript">

function PqnaDelete( seq ,step,ref ) {
	location.href = "pqnadelete?seq="+seq+"&step="+step+"&ref="+ref;
}
function PqnaUpdate( seq ) {
	location.href = "pqnaupdate?seq="+seq;
}

</script>   