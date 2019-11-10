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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/companyadmin/com_admin_delivery.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/companyadmin/com_admin_payment.css">

</head>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">${market }의 배송내역</h1>
	<p class="mb-4">배송 준비 중인 내역</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">배송 준비 중인 내역</h6>
	    </div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="payment_success_wrap">
					<div class="payment_success_contents">
						<form id="delivery_frm">
							<table class="table table-bordered">
								<tr>
									<td>
									<input type="checkbox" id="allcheckid" class="allcheckid">
									</td>
									<td>주문번호</td>
									<td>주문한 사람 이름</td>
									<td>배송회사</td>
									<td>배송상태</td>
									<td>운송장번호</td>
									<td>배송시 요청사항</td>
								</tr>
								<c:forEach items="${deliverylist }" var="p">
									<tr>
										<td>
										<input type="checkbox" class="checkid" id="checkid" name="payment_code" value="${p.payment_code }">
											<input type="hidden" name="userid" value="${p.userid }">
											<input type="hidden" name="add_point" value="${p.add_point }">
										</td>
										<td>${fn:substring(p.payment_code,4,16) }</td>
										<td>${p.name }</td>
										<td>${p.delivery_company }</td>
										<td >${p.delivery_status }</td>
										<td>${p.delivery_post_code }</td>
										<td>${p.delivery_request }</td>
									</tr>
								</c:forEach>
							</table>
						</form>
					</div>
				</div>
			</div>
				<div>
					<button type="button" id="deliveryIngChangeBtn" class="deliveryIngChangeBtn">배송중으로 변경</button>
				</div>
		</div>
	</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->
</html>



