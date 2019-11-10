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
<!-- java script -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/payment/payment.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/payment/mem_info.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/payment/delivery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/payment/account.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>



<div class="divfirst" align="left">
	<div class="divback">
		<h1>주문서</h1>
		<h6 style="padding: 10px 10px 10px 10px;">주문하실 상품명 및 수량을 정확하게 확인해 주세요</h6>
	</div>
	<br><br><br><br><br><br>



	<form id="payment_frm" name="payment_frm">

		<div class="divback">
			<h4>상품 정보</h4>
			<table class="payment_tb" id="payment_tb_product">
				<tr class="bottom_line">
					<td colspan="2" align="center" width="50%">상품 정보</td>
					<td width="20%" align="center">상품 금액</td>
				</tr>

				<c:forEach begin="0" end="${fn:length(basketList) -1 }" varStatus="i">
					<tr>
						<td rowspan="2" class="bottom_line"><img alt="이미지없음" src="<%=request.getContextPath()%>/upload/store/${basketList[i.index].photo1_file }" width="150" height="150"></td>
						<td width="50%" align="left">[${basketList[i.index].p_name }]${basketList[i.index].p_title }</td>
						<td rowspan="2" class="bottom_line" width="10%" align="center" id="one_total_price${i.index }">
						<fmt:formatNumber value="${basketList[i.index].p_price * basketList[i.index].quantity }" />원
							<input type="hidden" name="stock_seq" value="${basketList[i.index].stock_seq }">
							<input type="hidden" name="quantity" value="${basketList[i.index].quantity }">
							<input type="hidden" name="stock_quantity" value="${fn:length(basketList) }">
						</td>
					</tr>
					<tr class="bottom_line">
						<td align="left">사이즈 : ${basketList[i.index].size } / 색상 : ${basketList[i.index].p_color } / 수량 : ${basketList[i.index].quantity }개 /
						개당 <fmt:formatNumber value="${basketList[i.index].p_price }" />원</td>
					</tr>
				</c:forEach>

			</table>
		</div>
		<br><br><br><br><br><br>



		<div class="divback">
			<h4>주문자 정보</h4>
			<table class="payment_tb">
			<c:if test="${ empty p_mem }">
				<tr>
					<td>휴대폰 번호</td>
					<td><input type="text" id="to" placeholder="전화번호 입력">
						<!-- 인증번호 받을사람 휴대폰 번호 -->
						<input type="button" id="oneselfConfirmBtn" value="본인인증">&nbsp;비회원으로 구매를 원하시면, 본인인증이 필요합니다.<br>
						<input type="text" id="userNum" placeholder="인증번호 입력">
						<!-- 인증번호 입력창 -->
						<input type="button" id="enterBtn" value="확인">
						<b id="b_confirm"></b>
						<input type="hidden" name="text" id="text">
						<!-- 인증번호를 히든으로 저장해서 보낸다 -->
						<input type="hidden" id="text_confirm"></td>
				</tr>
				<tr>
					<td>보내는 분 *</td>
					<td><input type="text" size="26" id="send_name" name="send_name"></td>
				</tr>
				<tr>
					<td>휴대폰 *</td>
					<td><input type="text" size="5" id="send_phone1">&nbsp;&nbsp;
						<input type="text" size="5" id="send_phone2">&nbsp;&nbsp;
						<input type="text" size="5" id="send_phone3">
						<input type="hidden" name="send_phone" id="send_phone"></td>
				</tr>
				<tr>
					<td>이메일 *</td>
					<td><input type="text" id="send_email" name="send_email" size="26"></td>
				</tr>
				<tr>
					<td></td>
					<td>이메일을 통해 주문처리과정을 보내드립니다.<br>이메일 주소란에는 반드시 수신가능한 이메일 주소를 입력해 주세요.
					</td>
				</tr>
			</c:if>
			<c:if test="${ not empty p_mem }">
				<tr>
					<td>보내는 분 *</td>
					<td><input type="text" size="26" id="send_name" name="send_name" readonly="readonly" value="${p_mem.username }"></td>
				</tr>
				<tr>
					<td>휴대폰 *</td>
					<td><input type="text" size="5" id="send_phone1" readonly="readonly" value="${fn:substring(p_mem.phone,0,3) }">&nbsp;&nbsp;
						<input type="text" size="5" id="send_phone2" readonly="readonly" value="${fn:substring(p_mem.phone,3,7) }">&nbsp;&nbsp;
						<input type="text" size="5" id="send_phone3" readonly="readonly" value="${fn:substring(p_mem.phone,7,11) }">
						<input type="hidden" name="send_phone" id="send_phone"></td>
				</tr>
				<tr>
					<td>이메일 *</td>
					<td><input type="text" id="send_email" name="send_email" size="26" readonly="readonly" value="${p_mem.useremail }"></td>
				</tr>
				<tr>
					<td></td>
					<td>이메일을 통해 주문처리과정을 보내드립니다.
					</td>
				</tr>
			</c:if>				
			</table>
		</div>
		<br><br><br><br><br><br>



		<div class="divback">
			<h4>배송 정보</h4>
			<table class="payment_tb">
				<tr>
					<td>주소 *</td>
					<td>위(주문자) 정보와 같음 <input type="checkbox" id="oldaddress"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="text" size="20" id="sample6_postcode" name="receive_postnum" placeholder="우편번호" readonly="readonly">
						<input type="button" id="postcode_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" size="67" id="sample6_address" placeholder="지번주소" readonly="readonly"><br>
						<input type="text" size="30" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" size="30" id="sample6_extraAddress" placeholder="참고항목" readonly="readonly">
						<input type="hidden" name="receive_address" id="receive_address"></td>
				</tr>
				<tr>
					<td>수령인 이름 *</td>
					<td><input type="text" size="26" id="receive_name" name="receive_name"></td>
				</tr>
				<tr>
					<td>휴대폰 *</td>
					<td><input type="text" size="5" id="receive_phone1">&nbsp;&nbsp;
						<input type="text" size="5" id="receive_phone2">&nbsp;&nbsp;
						<input type="text" size="5" id="receive_phone3">
						<input type="hidden" name="receive_phone" id="receive_phone"></td>
				</tr>
				<tr>
					<td>배송 요청사항</td>
					<td><textarea id="receive_address_request" name="receive_address_request" rows="3" cols="70"></textarea><span id="request_span"></span>자/50자</td>
				</tr>
			</table>
		</div>
		<br><br><br><br><br><br>
		
		<input type="hidden" id="disc_coupon" name="disc_coupon" value="0" size="2">
		<input type="hidden" id="disc_point" name="disc_point" value="0" size="2">
		<input type="hidden" id="totalprice" name="totalprice" value="0" size="2">

		<!-- 로그인 했을때만 보이기 -->
		<div class="divback">
			<h4>쿠폰 적립금</h4>
			<table class="payment_tb">
				<col width="10"><col width="10"><col width="50"><col width="10"><col width="10">
				<col width="10"><col width="10"><col width="20"><col width="10">
				<tr>
					<td>상품금액</td>
					<td></td>
					<td>배송비</td>
					<td></td>
					<td>쿠폰 할인액</td>
					<td></td>
					<td>사용 포인트</td>
					<td></td>
					<td>결제 예정금액</td>
				</tr>
				<!-- result_price = 상품금액 + 배송비 - 사용 포인트 - 쿠폰 할인액  -->
				<tr>
					<td id="product_price" style="font-size: 30px;">${payment_param.product_price }</td>
					<td>
					<img alt="이미지없음" src="<%=request.getContextPath()%>/upload/payment/plus.png" width="40" height="40">
					</td>
					<td id="delivery_price" style="font-size: 30px;">${payment_param.delivery_price }</td>
					<td>
					<img alt="이미지없음" src="<%=request.getContextPath()%>/upload/payment/minus.png" width="40" height="40">
					</td>
					<!-- submit으로 controller에 보내는 쿠폰 할인액  -->
					<td id="_disc_coupon" style="font-size: 30px;">0</td>
					<td width="50">
					<img alt="이미지없음" src="<%=request.getContextPath()%>/upload/payment/minus.png" width="40" height="40">
					</td>
					<!-- submit으로 controller에 보내는 사용 포인트  -->
					<td id="_disc_point" style="font-size: 30px;">0</td>
					<td>
					<img alt="이미지없음" src="<%=request.getContextPath()%>/upload/payment/equals.png" width="40" height="40">
					</td>
					<td id="_totalprice" style="font-size: 30px;">0</td>
				</tr>

				<c:if test="${payment_param.coupon_count eq 0 }">
					<tr>
						<td rowspan="2">쿠폰 적용</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="8">(보유쿠폰 : 0 개)</td>
					</tr>
				</c:if>

				<c:if test="${payment_param.coupon_count ne 0 }">
					<tr>
						<td rowspan="2">쿠폰 적용</td>
						<td colspan="8">쿠폰 사용&nbsp;&nbsp;
							<input type="text" name="coupon_code" id="coupon_code" size="30" value="" readonly="readonly">&nbsp;&nbsp;
							<input type="button" id="coupon_btn" value="쿠폰선택">&nbsp;&nbsp;
							<span id="coupon_func"></span>
						</td>
					</tr>
					<tr>
						<td colspan="8">(보유쿠폰 : ${payment_param.coupon_count } 개) 중복할인 안됩니다
							<input type="hidden" id="point_amount" value="${payment_param.point_amount }">
						</td>
					</tr>
				</c:if>
				<tr>
					<td>적립금 적용</td>
					<c:if test="${payment_param.point_amount eq 0 }">
						<td colspan="8">사용 가능한 적립금이 없습니다</td>
					</c:if>
					<c:if test="${payment_param.point_amount ne 0 }">
						<td colspan="8">
							<input type="text" id="input_disc_point" onchange="price_change()" value="0" size="5">원 &nbsp;&nbsp;사용가능
							적립금 : <fmt:formatNumber value="${payment_param.point_amount }" />원
							&nbsp;&nbsp;(1,000원부터 사용가능합니다)</td>
					</c:if>
				</tr>
			</table>
		</div>
		<br><br><br><br><br><br>



		<div class="divback">
			<h4>결제 수단</h4>
			<table class="payment_tb">
				<tr style="background-color: #fafafa">
					<td>결제 수단 선택</td>
					<td>신용카드 <input type="radio" name="payment_method" value="card">&nbsp;&nbsp;&nbsp;&nbsp;
						무통장입금 <input type="radio" name="payment_method" value="vbank">&nbsp;&nbsp;&nbsp;&nbsp;
						카카오페이 <input type="radio" name="payment_method" value="kakaopay">&nbsp;&nbsp;&nbsp;&nbsp;
						실시간 계좌이체 <input type="radio" name="payment_method" value="trans">&nbsp;&nbsp;&nbsp;&nbsp;
						휴대요금 결제 <input type="radio" name="payment_method" value="phone">
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
				</tr>
			</table>
			<br>
		</div>

		<input type="button" id="paymentBtn" value="결제하기" onclick="paymens()"><br><br>





		<!-- submit으로 보낼 데이터 -->
		<input type="hidden" name="payment_status" id="payment_status">
		<input type="hidden" name="delivery_price" value="${payment_param.delivery_price }">
		<input type="hidden" name="add_point" id="add_point" value="0">
		<input type="hidden" name="basket_del" value="${payment_param.basket_del }">
		<input type="hidden" name="payment_code" id="payment_code">
		<input type="hidden" name="receipt_url" id="receipt_url">
		<input type="hidden" name="vbank_num" id="vbank_num">
		<input type="hidden" name="vbank_name" id="vbank_name">
		<input type="hidden" name="vbank_date" id="vbank_date">
		<input type="hidden" name="vbank_holder" id="vbank_holder">
		<input type="hidden" name="card_apply_num" id="card_apply_num">

		</form>
	</div>


</body>
</html>