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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/payment/coupon_popup.js"></script>
</head>
<body>



<div class="payment_coupon_wrap">
	<div class="payment_coupon_get">
		<div class="payment_coupon_get_title">
			<ul>
				<li style="text-align: left;">보유 쿠폰 내역</li>
			</ul>
		</div>
		<table class="payment_coupon_tb">
			<tr>
				<th>쿠폰번호</th>
				<th>쿠폰이름</th>
				<!-- <th>쿠폰내용</th> -->
				<th>할인액(률)&nbsp;적립액(률)</th>
				<th>사용기간</th>
			</tr>
			<c:forEach items="${coupon_code }" var="c">
				<tr>
					<td>${c.coup_code }</td>
					<td>${c.title }</td>
					<%-- <td>${c.sub_title }</td> --%>
					<td><c:choose>
							<c:when test="${c.func_measure == '원' }">
								<fmt:formatNumber value="${c.func_num}" type="number" />${c.func_measure }
							</c:when>
							<c:otherwise>
								${c.func_num }${c.func_measure }
							</c:otherwise>
						</c:choose>
					</td>
					<td>${fn:substring(c.gdate,2,11) }~ ${fn:substring(c.expdate,2,11) }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="payment_coupon_used">
		<div class="payment_coupon_used_title">
			<ul>
				<li style="text-align: left;">사용 쿠폰 선택</li>
			</ul>
		</div>

		<table class="payment_coupon_tb">
			<tr>
				<th>쿠폰선택</th>
			</tr>
			<tr>
				<td>
					<select id="coupon_popup_select">
							<option func_measure="default">사용안함</option>
							<c:forEach begin="0" end="${fn:length(coupon_code) -1 }" varStatus="i">
								<option func="${coupon_code[i.index].func }"
									func_num="${coupon_code[i.index].func_num }"
									func_measure="${coupon_code[i.index].func_measure }"
									coup_code="${coupon_code[i.index].coup_code }">${coupon_code[i.index].coup_code}</option>
							</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<!-- 할인할 때 계산을 위해 부모창에서 가져온 데이터 -->
					<input type="hidden" id="product_price" value="${product_price }">
					<input type="hidden" id="disc_point" value="${disc_point }">
					<input type="button" id="coupon_popup_e_btn" value="확인">
					<input type="button" value="취소" id="coupon_popup_c_btn" onclick="self.close();">
				</td>
			</tr>
		</table>
	</div>
</div>



</body>
</html>