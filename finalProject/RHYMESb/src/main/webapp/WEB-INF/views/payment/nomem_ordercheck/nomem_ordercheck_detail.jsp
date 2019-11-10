<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- ordercheck.js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/payment/nomem_ordercheck/nomem_ordercheck.js"></script>

</head>
<body>



	<div class="ordercheck_detail_wrap" style="margin-left: 300px;">

		<div class="ordercheck_detail_title">
			<b>주문내역/배송조회</b>
		</div>
		<div class="ordercheck_detail_information">
			${order_detail_list[0].send_name }님께서
			${fn:substring(order_detail_list[0].rdate,0,4) }년
			${fn:substring(order_detail_list[0].rdate,5,7) }월
			${fn:substring(order_detail_list[0].rdate,8,10) }일에 주문하신 내역입니다.
		</div>

		<div class="ordercheck_detail_send_wrap">
			<b class="ordercheck_detail_title">주문자정보</b>
			<table class="ordercheck_detail_tb">
				<tr>
					<th>주문자</th>
					<th>주문일자</th>
					<th>주문번호</th>
				</tr>
				<tr>
					<td>${order_detail_list[0].send_name }</td>
					<td>${order_detail_list[0].rdate }</td>
					<td>${fn:substring(order_detail_list[0].payment_code,4,16) }</td>
				</tr>
			</table>
		</div>

		<div class="ordercheck_detail_delivery_wrap">
			<b class="ordercheck_detail_title">배송지정보</b>
			<table class="ordercheck_detail_tb">
				<tr>
					<th>수취인</th>
					<th>연락처</th>
					<th>배송번호</th>
					<th>주소</th>
					<th>배송메세지</th>
				</tr>
				<tr>
					<td>${order_detail_list[0].name }</td>
					<td>${order_detail_list[0].receive_phone }</td>
					<td>${order_detail_list[0].delivery_post_code }</td>
					<td>${order_detail_list[0].receive_address }</td>
					<td>${order_detail_list[0].delivery_request }</td>
				</tr>
			</table>
		</div>

		<div class="ordercheck_detail_product_wrap">
			<b class="ordercheck_detail_title">주문상품정보</b>
			<table class="ordercheck_detail_tb">
				<col width="5%">
				<col width="20%">
				<col width="20%">
				<col width="10%">
				<col width="20%">
				<col width="10%">
				<col width="15%">
				<tr>
					<th>번호</th>
					<th>상품이미지</th>
					<th>주문상품정보</th>
					<th>수량</th>
					<th>사이즈</th>
					<th>색상</th>
					<th>가격</th>
				</tr>
				<c:forEach begin="0" end="${fn:length(order_detail_list) -1 }" step="1" varStatus="i">
					<tr>
						<td>${i.index + 1 }</td>
						<td><img alt="이미지없음" src="<%=request.getContextPath()%>/upload/store/${order_detail_list[i.index].photo1_file }" width="150" height="150"></td>
						<td>[${order_detail_list[i.index].p_name }]<br>${order_detail_list[i.index].p_title }</td>
						<td>${order_detail_list[i.index].ea }개</td>
						<td>${order_detail_list[i.index].size }</td>
						<td>${order_detail_list[i.index].p_color }</td>
						<td><fmt:formatNumber value="${order_detail_list[i.index].price }" />원</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="ordercheck_detail_payment_wrap">
			<b class="ordercheck_detail_title">결제정보</b>
			<table class="ordercheck_detail_tb">
				<tr>
					<th>결제방법</th>
					<th>주문상태</th>
					<th>결제금액</th>
					<!-- <th>배송조회</th> -->
				</tr>
				<tr>
					<td>${order_detail_list[0].payment_method }</td>
					<td><fmt:formatNumber value="${order_detail_list[0].totalprice }" />원</td>
					<td>${order_detail_list[0].payment_status }</td>
					<%-- <td><input type="button" id="ordercheck_delivery_btn" onclick="ordercheck_delivery(${order_detail_list[0].payment_code })" value="배송조회"></td> --%>
				</tr>
			</table>
		</div>

	</div>



</body>
</html>