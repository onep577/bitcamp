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

</head>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">${market }의 주문상세내역</h1>
	<p class="mb-4">
		<a href="/admin/company/payment/success">주문내역</a> > <a href="#">주문상세내역</a>
	</p>

	<!-- 상품 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">상품정보</h6>
		</div>

		<div class="card-body">
			<div class="table-responsive">
				<div class="payment_detail_wrap">
					<div class="payment_detail_contents">
						<table class="table table-bordered">
							<tr>
								<td>번호</td>
								<td>이미지</td>
								<td>상품 재고번호</td>
								<td>수량</td>
								<td>가격</td>
								<td>사이즈</td>
								<td>색상</td>
								<td>상품명</td>
								<td>업체명</td>
							</tr>
							<c:forEach begin="0" end="${fn:length(orderDetail) -1 }" step="1" varStatus="i">
								<tr>
									<td>${i.index +1 }</td>
									<td><img alt="이미지없음" src="<%=request.getContextPath()%>/upload/store/${orderDetail[i.index].photo1_file }" width="150" height="150"></td>
									<td>${orderDetail[i.index].stock_seq }</td>
									<td>${orderDetail[i.index].ea }</td>
									<td>${orderDetail[i.index].price }</td>
									<td>${orderDetail[i.index].size }</td>
									<td>${orderDetail[i.index].p_color }</td>
									<td>${orderDetail[i.index].p_name }</td>
									<td>${orderDetail[i.index].c_name }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- 주문한 사람, 받는 사람 정보 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">주문한사람, 받는사람 정보</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="payment_detail_wrap">
					<div class="payment_detail_contents">						
						<table class="table table-bordered">
							<tr>
								<td>아이디</td>
								<td>이름</td>
								<td>번호</td>
								<td>이메일</td>
								<td>받는사람 이름</td>
								<td>받는사람 번호</td>
								<td>주소</td>
								<td>주소 요청사항</td>
							</tr>
							<tr>
								<td>${orderDetail[0].userid }</td>
								<td>${orderDetail[0].send_name }</td>
								<td>${orderDetail[0].send_phone }</td>
								<td>${orderDetail[0].send_email }</td>
								<td>${orderDetail[0].receive_name }</td>
								<td>${orderDetail[0].receive_phone }</td>
								<td>${orderDetail[0].receive_postnum } ${orderDetail[0].receive_address }</td>
								<td>${orderDetail[0].delivery_request }</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- 결제정보 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">결제방식정보</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="payment_detail_wrap">
					<div class="payment_detail_contents">						
						<table class="table table-bordered">
							<tr>
								<td>주문번호</td>
								<td>결제상태</td>
								<td>결제수단</td>
								<c:if test="${orderDetail[0].payment_method == '무통장입금' }">
								<td>은행명</td>
								<td>계좌번호</td>
								<td>예금주</td>
								<td>입금기한</td>
								</c:if>
								<c:if test="${orderDetail[0].payment_method == '카드' }">
								<td>카드승인번호</td>
								</c:if>
								<td>주문일</td>
							</tr>
							<tr>
								<td>${fn:substring(orderDetail[0].payment_code,4,16) }</td>
								<td>${orderDetail[0].payment_status }</td>
								<td>${orderDetail[0].payment_method }</td>
								<c:if test="${orderDetail[0].payment_method == '무통장입금' }">
								<td>${orderDetail[0].vbank_name }</td>
								<td>${orderDetail[0].vbank_num }</td>
								<td>${orderDetail[0].send_name }</td>
								<td>${orderDetail[0].vbank_date }</td>
								</c:if>
								<c:if test="${orderDetail[0].payment_method == '카드' }">
								<td>${orderDetail[0].card_apply_num }</td>
								</c:if>
								<td>${orderDetail[0].rdate }</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- 쿠폰, 적립금, 배송비 정보 -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">결제금액정보</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="payment_detail_wrap">
					<div class="payment_detail_contents">
						<table class="table table-bordered">
							<tr>
								<td>쿠폰코드</td>
								<c:if test="${not empty orderDetail[0].coupon_code}">
								<td>쿠폰종류</td>
								</c:if>
								<td>쿠폰 차감액</td>
								<td>포인트 차감액</td>
								<td>추가 적립금</td>
								<td>배송비</td>
								<td>총 결제금액</td>
							</tr>
								<tr>
									<td>
									<c:if test="${empty orderDetail[0].coupon_code }">-</c:if>
									<c:if test="${not empty orderDetail[0].coupon_code }">${orderDetail[0].coupon_code }</c:if>
									</td>
									<c:if test="${not empty orderDetail[0].coupon_code}">
									<td>${orderDetail[0].func } ${orderDetail[0].func_num } ${orderDetail[0].func_measure }</td>
									</c:if>
									<td><fmt:formatNumber value="${orderDetail[0].disc_coupon }"/>원</td>
									<td><fmt:formatNumber value="${orderDetail[0].disc_point }"/>원</td>
									<td><fmt:formatNumber value="${orderDetail[0].add_point }"/>원</td>
									<td><fmt:formatNumber value="${orderDetail[0].delivery_price }"/>원</td>
									<td><fmt:formatNumber value="${orderDetail[0].totalprice }"/>원</td>
								</tr>
						</table>					
					</div>
				</div>
			</div>
		</div>
	</div>



</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->






</html>