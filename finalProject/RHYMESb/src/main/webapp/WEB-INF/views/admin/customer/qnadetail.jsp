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
	<h1 class="h3 mb-2 text-gray-800">고객센터</h1>
	<p class="mb-4">1:1문의</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">1:1문의 detail</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<table style="width:100%;"class="table table-bordered">
				<col width="100"><col width="200"><col width="100"><col width="300">
				
				<tr>
					<th rowspan="2">제목</th>
					<td colspan="3">${qna.category }</td>
				</tr>
				<tr>
					<td colspan="3">${qna.title }</td>
				</tr>
				
				<tr>
					<th>주문번호</th>
					<td>${qna.orderno }
					<a href="/admin/payment/detail?payment_code=${qna.orderno }">
					<c:if test="${'' ne qna.orderno }">
					<input type="button" class="clickBtn3" value="주문조회">
					</c:if>
					</a>
					</td>
				</tr>
				
				
				<tr>
					<th>작성자</th>
					<td colspan="3">${qna.id }</td>
				</tr>
				
				<tr>
					<th>작성일</th>
					<td>${qna.wdate }</td>
					
					<c:if test="${0 eq qna.step }">
					<th>답변상태</th>
					<td>
						<c:if test="${1 eq qna.feedback }">
						답변완료
						</c:if>
						<c:if test="${0 eq qna.feedback }">
						미답변
						</c:if>
					</td>
					</c:if>
					 
				</tr>
				<tr>
					<td colspan="4">
					<div style="white-space:pre-line;">
					<img alt="" src="/upload/customer/${qna.filename }" style="height: 30%">
					${qna.content }
					</div>
					</td>
				</tr>
				</table>
				<div>
				<form action="qnaanswer" method="get">
						<input type="hidden" name="seq" value="${qna.seq }">
						<c:if test="${0 eq qna.feedback}">
						<input type="submit" class="clickBtn1" value="답변">
						</c:if>
						<button type="button" class="clickBtn2" onclick="QnaUpdate('${qna.seq }')">수정</button>
						<button type="button" class="clickBtn2" onclick="QnaDelete('${qna.seq }','${qna.step }','${qna.ref }')">삭제</button>
						
				</form>
				</div>

			</div>
		</div>
	</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->




</html>

<script type="text/javascript">

function QnaDelete( seq ,step,ref ) {
	location.href = "qnadelete?seq="+seq+"&step="+step+"&ref="+ref;
}
function QnaUpdate( seq ) {
	location.href = "qnaupdate?seq="+seq;
}

</script>   