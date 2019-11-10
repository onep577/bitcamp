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
</head>
<body>

	<div class="paymentAf_wrap" align="center">
		<div class="paymentAf_title_wrap">
			<b class="paymentAf_delivery_title">결제방법</b>
		</div>
		<div class="paymentAf_payment_content">
			<table class="paymentAf_tb">
				<tr>
					<th>결제금액</th>
					<th>주문번호</th>
					<th>결제상태</th>
					<th>결제수단</th>
				</tr>
				<tr>
					<td><fmt:formatNumber value="${dto.totalprice }" />원</td>
					<td>${fn:substring(dto.payment_code,4,16) }</td>
					<td>${dto.payment_status }</td>
					<td>${dto.payment_method }</td>
				</tr>
			</table>
		</div><br><br>



		<div class="paymentAf_title_wrap">
			<b class="paymentAf_delivery_title">배송지 정보</b>
		</div>
		<div class="paymentAf_delivery_content">
			<table class="paymentAf_tb">
				<tr>
					<th>이름</th>
					<th>우편번호</th>
					<th>연락처</th>
					<th>주소</th>
					<th>주문시 요청사항</th>
				</tr>
				<tr>
					<td>${dto.receive_name }</td>
					<td>${dto.receive_postnum }</td>
					<td>${dto.receive_phone }</td>
					<td>${dto.receive_address }</td>
					<td>${dto.receive_address_request }</td>
				</tr>
			</table>
		</div><br><br>
		
		

		<div class="paymentAf_result" id="paymentAf_result_align">
			<b>
			${dto.send_name }님의 주문이 완료되었습니다.&nbsp;&nbsp;고객님의 주문번호는 ${fn:substring(dto.payment_code,4,16) }입니다.<br><br>			

			비회원 주문조회는 주문번호와 이름으로 조회가능합니다&nbsp;&nbsp;주문번호는 꼭!!! 기억해주세요 (입력하신 이메일에서 확인가능)<br>

			회원인 경우 제품 구입에 따른 적립금 <fmt:formatNumber value="${dto.add_point }" />원이 배송 완료 후 적립됩니다.<br><br>
			<c:if test="${dto.payment_method == '무통장입금' }">
				무통장 입금&nbsp;:&nbsp;${dtoAf.vbank_name }&nbsp;&nbsp;${dtoAf.vbank_num }<br>
				&nbsp;&nbsp;(예금주:${dtoAf.vbank_holder })&nbsp;&nbsp;입금자:${dto.send_name }<br>
				${dtoAf.vbank_date }까지 ${dto.totalprice }원 입금해주세요<br>
			</c:if>
			</b>
		</div>



		<div class="paymentAf_btn">
			<input type="button" id="paymentAf_main_btn" onclick="location.href='/main'" value="메인으로">
			<c:if test="${not empty dto.userid }">
				<input type="button" id="paymentAf_order_btn" onclick="location.href='/mypage/orderlog'" value="주문내역확인">
				<br>
			</c:if>
			<c:if test="${empty dto.userid }">
				<input type="button" id="paymentAf_order_btn" onclick="location.href='/ordercheck_nomembership_confirm_move'" value="주문내역확인">
				<br>
			</c:if>
			<%-- <a href="${dtoAf.receipt_url }">매출전표 확인하기</a> --%>
		</div>
	</div>



	<br>
	<br>



</body>
</html>


