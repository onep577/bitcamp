<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content_main</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/companyadmin/payment/payment.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/admin/member/paging.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/companyadmin/com_admin_vbank.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/companyadmin/com_admin_payment.css">

</head>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">${market }의무통장입금 관리</h1>
	<p class="mb-4">무통장입금 관리</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">무통장입금 관리</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="row">


					<div class="payment_success_wrap">
						<div class="payment_success_contents">
							<form id="vbank_frm">
								<table class="table table-bordered">
									<!-- 체크박스, 주문번호, 아이디, 이름, 결제상태, 총 결제금액, 주문일, 무통장 계좌번호, 무통장 예금주, 입금기한 -->
									<tr>
										<td>
										<input type="checkbox" id="allcheckid" class="allcheckid">
										</td>
										<td>주문번호</td>
										<td>회원아이디</td>
										<td>주문한사람 이름</td>
										<td>결제상태</td>
										<td>결제금액</td>
										<td>주문일</td>
										<td>계좌번호</td>
										<td>예금주</td>
										<td>입금기한</td>
									</tr>
									<c:forEach items="${vbanklist }" var="v">
										<tr>
											<td>
											<input type="checkbox" class="checkid" id="checkid" name="seq" value="${v.seq }">
											<input type="hidden" name="payment_code" value="${v.payment_code }">
											<input type="hidden" name="userid" value="${v.userid }">
											<input type="hidden" name="add_point" value="${v.add_point }">
											</td>
											<td>${fn:substring(v.payment_code,4,16) }</td>
											<c:if test="${not empty v.userid }">
												<td>${v.userid }</td>
											</c:if>
											<c:if test="${empty v.userid }">
												<td>비회원</td>
											</c:if>
											<td>${v.send_name }</td>
											<td>${v.payment_status }</td>
											<td><fmt:formatNumber value="${v.totalprice }" />원</td>
											<td>${v.rdate }</td>
											<td>${v.vbank_num }</td>
											<td>${v.send_name }</td>
											<td>${v.vbank_date }</td>
										</tr>
									</c:forEach>
								</table>
							</form>
						</div>
					</div>
				</div>
				<div>
					<button type="button" id="vbankBtn" class="vbankBtn">입금완료</button>
				</div>
			</div>
		</div>

	</div>
</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->
</html>



